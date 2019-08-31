package com.edwin.practive.springbootmvc01.modules.sys.web;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.edwin.practive.springbootmvc01.core.web.BaseController;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Role;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.service.RoleService;
import com.edwin.practive.springbootmvc01.modules.sys.service.UserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 角色 Controller
 * @author Edwin
 */
@Controller
@RequestMapping("role")
public class RoleController extends BaseController{


    @Autowired
    RoleService roleService;
    @Autowired
    UserService userService;

    private final static String YES = "1";
    private final static String NO = "0";

    /**
     * 进入 默认查询一条数据
     * @param id
     * @return
     */
    @ModelAttribute
    public Role get(@RequestParam(required=false) String id) {
        Role entity = null;
        if (StringUtils.isNotBlank(id)){
            entity = roleService.get(id);
        }
        if (entity == null){
            entity = new Role();
        }
        return entity;
    }

    @RequestMapping("form")
    public String form(Role role,ModelMap map){
        map.addAttribute("Role",role);
        return "modules/sys/role/role_save";
    }



    @RequestMapping("list")
    public String list(ModelMap map){
         return "modules/sys/role/role_list";
    }

    @RequestMapping("data")
    @ResponseBody
    public Map<String, Object> data(Page page, Role role, ModelMap map){
        //简单分页
        Page pageInfo = roleService.findPage(page,role);
        return getBootstrapData(pageInfo);
    }

    /**
     * 分配菜单
     * @param role
     * @param map
     * @return
     */
    @RequestMapping("saveRoleMenu")
    @ResponseBody
    public AjaxJson saveRoleMenu(Role role, ModelMap map){
        AjaxJson j = new AjaxJson();
        roleService.roleMenuSave(role);
        return j;
    }

    @RequestMapping("treeDataForm")
    public String treeDataForm(String selectIdFlag, ModelMap map){
        map.addAttribute("selectIdFlag",selectIdFlag);
        return "modules/sys/role/role_tree_select";
    }

    @RequestMapping("treeData")
    @ResponseBody
    public List<Map<String, Object>> treeData(String selectIdFlag, Role role, ModelMap modelMap){
        List<Role> roles = roleService.findList(role);

        User user = userService.get(selectIdFlag);

        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (Role ro : roles) {

            Map<String, Object> map = Maps.newHashMap();
            map.put("id", ro.getId());

            map.put("parent", "#");
            /*Map<String, Object> state = Maps.newHashMap();
            state.put("opened", true);
            map.put("state", state);*/



            // 处理 角色菜单

            /*int count = 0;
            for (int i1 = 0; i1 < list.size(); i1++) {
                if (list.get(i1).getParentId().equals(e.getId())){
                    count ++;
                }
            }
            if(menuIds.contains(","+e.getId()+",")&& count == 0){
                Map<String, Object> state = Maps.newHashMap();
                state.put("selected", true);
                map.put("state", state);
            }*/


            // 选中
            if(null != user && !StringUtils.isEmpty(user.getRoleIds())){
                String[] selectIdsTemp = user.getRoleIds().split(",");
                List<String> selectIdsList = new ArrayList<>(Arrays.asList(selectIdsTemp));
                if(null != selectIdsList && selectIdsList.contains(ro.getId())){
                    Map<String, Object> state = Maps.newHashMap();
                    state.put("selected", true);
                    map.put("state", state);
                }
            }

            map.put("type", "role");
            map.put("text", ro.getName());
            map.put("name", ro.getName());

            mapList.add(map);
        }
        return mapList;

    }


    @PostMapping("save")
    @ResponseBody
    public AjaxJson save(Role role,ModelMap map){
        AjaxJson j = new AjaxJson();

        if(!StringUtils.isEmpty(role.getId()) && YES.equals(role.getIsSys())){
            j.setMsg("系统数据只有超级管理员可以修改！");
            j.setSuccess(false);
            return j;
        }

        roleService.save(role);
        j.setMsg("保存成功！");
        return j;
    }

    @RequestMapping("del")
    @ResponseBody
    public AjaxJson del(Role role,ModelMap map){
        AjaxJson j = new AjaxJson();
        roleService.remove(role);
        j.setMsg("删除成功！");
        return j;
    }

    @RequestMapping("delAll")
    @ResponseBody
    public AjaxJson delAll(@RequestBody List<Map<String,String>>  list, ModelMap map){
        AjaxJson j = new AjaxJson();
        String[] idArray = new String[list.size()];
        for(int i = 0; i<list.size(); i++){
            idArray[i] = list.get(i).get("id");
        }

        for(String id : idArray){

            Role role = roleService.get(id);
            if(YES.equals(role.getIsSys())){
                j.setMsg("系统数据只有超级管理员可以删除！");
                j.setSuccess(false);
                return j;
            }

            roleService.remove(role);
        }
        j.setMsg("删除成功");
        return j;
    }

}
