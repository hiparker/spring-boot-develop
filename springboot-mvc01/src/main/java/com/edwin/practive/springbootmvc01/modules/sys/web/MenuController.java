package com.edwin.practive.springbootmvc01.modules.sys.web;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.edwin.practive.springbootmvc01.core.persistence.Page;
import com.edwin.practive.springbootmvc01.core.web.BaseController;
import com.edwin.practive.springbootmvc01.modules.sys.entity.Menu;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.service.MenuService;
import com.edwin.practive.springbootmvc01.modules.sys.service.UserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Menu Controller
 * @author Edwin
 */
@Controller
@RequestMapping("menu")
public class MenuController extends BaseController{


    @Autowired
    MenuService menuService;

    /**
     * 进入 默认查询一条数据
     * @param id
     * @return
     */
    @ModelAttribute
    public Menu get(@RequestParam(required=false) String id) {
        Menu entity = null;
        if (StringUtils.isNotBlank(id)){
            entity = menuService.get(id);
        }
        if (entity == null){
            entity = new Menu();
        }
        return entity;
    }

    @RequestMapping("form")
    public String form(Menu menu,String flag,ModelMap map){
        menu.setParent(menuService.getMenuMap(menu.getParentId()));

        if("add".equals(flag)){
            Menu parent = menu;
            menu = new Menu();
            menu.setParent(parent);
            menu.setParentId(parent.getId());
        }

        map.addAttribute("menu",menu);
        return "modules/sys/menu/menu_save";
    }

    @RequestMapping("treeDataForm")
    public String treeDataForm(Menu menu,ModelMap map){
        map.addAttribute("menu",menu);
        return "modules/sys/menu/menu_tree_select";
    }

    @RequestMapping("treeData")
    @ResponseBody
    public List<Map<String, Object>> treeData(Menu menu,ModelMap modelMap){
        List<Menu> menus = menuService.findListAll();
        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (Menu me : menus) {
            // 获取父节点元素
            me.setParent(menuService.getMenuMap(me.getParentId()));

            Map<String, Object> map = Maps.newHashMap();
            map.put("id", me.getId());
            if("0".equals(me.getParentId())){
                map.put("parent", "#");
                Map<String, Object> state = Maps.newHashMap();
                state.put("opened", true);
                map.put("state", state);

            }else{
                /*if(i == 0){
                    map.put("parent", "#");
                }else{
                    map.put("parent", e.getParentId());
                }*/
                map.put("parent", me.getParentId());
            }

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

            if(StringUtils.isNotBlank(me.getIcon())){
                map.put("icon", me.getIcon());
            }
            if("2".equals(me.getType())){
                map.put("type", "btn");
            }else if("1".equals(me.getType())){
                map.put("type", "menu");
            }else{
                map.put("type", "menu");
            }
            map.put("text", me.getName());
            map.put("name", me.getName());

            mapList.add(map);
        }
        return mapList;

    }


    @RequestMapping("list")
    public String list(ModelMap map){
         return "modules/sys/menu/menu_list";
    }

    @RequestMapping("data")
    @ResponseBody
    public List<Menu> data(Menu menu, ModelMap map){
        return menuService.findListAll();
    }



    @PostMapping("save")
    @ResponseBody
    public AjaxJson save(Menu menu,ModelMap map){
        AjaxJson j = new AjaxJson();
        menuService.save(menu);
        j.setMsg("保存成功！");
        return j;
    }

    @RequestMapping("del")
    @ResponseBody
    public AjaxJson del(Menu menu,ModelMap map){
        AjaxJson j = new AjaxJson();
        menuService.remove(menu);
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
            menuService.remove(id);
        }
        j.setMsg("删除成功");
        return j;
    }

}
