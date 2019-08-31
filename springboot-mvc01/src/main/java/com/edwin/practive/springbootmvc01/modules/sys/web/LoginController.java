package com.edwin.practive.springbootmvc01.modules.sys.web;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.core.web.BaseController;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Menu;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Role;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.service.LoginService;
import com.edwin.practive.springbootmvc01.modules.sys.service.MenuService;
import com.edwin.practive.springbootmvc01.modules.sys.service.RoleService;
import com.edwin.practive.springbootmvc01.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("account")
public class LoginController extends BaseController{

    @Autowired
    LoginService loginService;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;




    @RequestMapping("index")
    public String index(User user,HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
        User userT = (User) request.getSession().getAttribute("user");
        if(userT != null){
            modelMap.addAttribute("user",userT);
            return "modules/sys/index";
        }else{
            AjaxJson j = loginService.validataLogin(user.getAccount(),user.getPassword());
            if(j.isSuccess()){

                User userSession = (User)j.getBody().get("user");

                // 激活缓存菜单
                menuService.findListAll();

                // 树级权限
                Menu tree;

                // 超级管理员
                if("0".equals(userSession.getId())){
                    userSession.setAdmin(true);
                }

                // 如果是超级管理员 则获得所有权限
                if(userSession.isAdmin()){
                    tree = menuService.getMenuTrees(menuService.findListAll());
                    userSession.setMenus(menuService.findListAll());
                }else{
                    // 设置权限
                    Set<Menu> auth = new HashSet<>();
                    if(!StringUtils.isEmpty(userSession.getRoleIds())){
                        String[] roleIds = userSession.getRoleIds().split(",");
                        for (String roleId : roleIds) {
                            String[] menuIds = roleService.getRoleMenu(new Role(roleId));
                            for (String menuId : menuIds) {
                                auth.add(menuService.getMenuMap(menuId));
                            }
                        }
                    }

                    // 创建一个KEY（id） 的权限MAP 用于后续快速匹配 避免几何循环
                    Map<String,Menu> menuMap = new HashMap<>();
                    for (Menu menu : auth) {
                        if(menu != null){
                            menuMap.put(menu.getId(),menu);
                        }
                    }

                    // 复制一个新的菜单集合 循环set 判断其父节点是否存在 不存在的话 就去取一个父节点添加进去
                    List<Menu> authCopy = new ArrayList<>(auth);
                    for (Menu menu : auth) {
                        if(null == menuMap.get(menu.getParentId())){
                            Menu parM = menuService.getMenuMap(menu.getParentId());
                            if(parM != null){
                                authCopy.add(menuService.getMenuMap(menu.getParentId()));
                            }
                        }
                    }
                    // 去重
                    authCopy = removeDuplicate(authCopy);
                    tree = menuService.getMenuTrees(authCopy);
                    userSession.setMenus(authCopy);
                }

                // 将权限 放入到用户 缓存里
                userSession.setMenu(tree);
                // 将所有菜单加入缓存
                userSession.setMenuAll(menuService.findListAll());

                request.getSession().setAttribute("user",userSession);
                modelMap.addAttribute("user",userSession);
                return "modules/sys/index";
            }else{
                modelMap.addAttribute("result",j);
                return "modules/sys/login/login";
            }
        }
    }


    @RequestMapping("unlogin")
    public String unlogin(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
        request.getSession().removeAttribute("user");
        AjaxJson j = new AjaxJson();
        modelMap.addAttribute("result",j);
        return "modules/sys/login/login";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request,ModelMap modelMap){
        AjaxJson j = new AjaxJson();
        modelMap.addAttribute("result",j);
        return "modules/sys/login/login";
    }

    @RequestMapping("getAuth")
    @ResponseBody
    public AjaxJson getAuth(HttpServletRequest request,ModelMap modelMap){
        AjaxJson j = new AjaxJson();
        User userT = (User) request.getSession().getAttribute("user");
        LinkedHashMap<String, Object> body = new LinkedHashMap<String, Object>();
        body.put("param",userT.getMenu());
        j.setBody(body);
        return j;
    }

    @RequestMapping("hello")
    public String hello(ModelMap modelMap){
        return "modules/sys/hello";
    }


    @RequestMapping("register")
    public AjaxJson register(User user, ModelMap modelMap){
        AjaxJson j = new AjaxJson();
        return null;
    }

    // 权限去重
    public List<Menu> removeDuplicate(List<Menu> list)  {
        for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {
            for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {
                if  (list.get(j).getId().equals(list.get(i).getId()))  {
                    list.remove(j);
                }
            }
        }
        return list;
    }

}
