package com.edwin.practive.springbootmvc01.modules.sys.web;

import com.edwin.practive.springbootmvc01.common.json.AjaxJson;
import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.core.web.BaseController;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import com.edwin.practive.springbootmvc01.modules.sys.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("account")
public class LoginController extends BaseController{

    @Autowired
    LoginService loginService;

    @RequestMapping("index")
    public String index(User user,HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
        User userT = (User) request.getSession().getAttribute("user");
        if(userT != null){
            modelMap.addAttribute("user",userT);
            return "modules/sys/index";
        }else{
            AjaxJson j = loginService.validataLogin(user.getAccount(),user.getPassword());
            if(j.isSuccess()){
                request.getSession().setAttribute("user",j.getBody().get("user"));
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

    @RequestMapping("hello")
    public String hello(ModelMap modelMap){
        return "modules/sys/hello";
    }


    @RequestMapping("register")
    public AjaxJson register(User user, ModelMap modelMap){
        AjaxJson j = new AjaxJson();
        return null;
    }

}
