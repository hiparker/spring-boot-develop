package com.edwin.practive.springbootmvc01.core.proxy;

import com.edwin.practive.springbootmvc01.common.utils.PropertiesUtil;
import com.edwin.practive.springbootmvc01.modules.sys.entity.User;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 拦截器
 * @author Edwin
 */
@Component
@WebFilter(urlPatterns = "/")
public class SystemFilter implements Filter{
    private static final String LOGIN_URI = "/account/login";
    private static final String[] IGNORE_URI = {"/account/login","/account/index"};
    private static List<String> file_ends;

    static{
        file_ends = new ArrayList<>();
        String endStr = PropertiesUtil.getConfig("webStaticFile");
        String[] ends = endStr.split(",");
        for (String end : ends) {
            file_ends.add(end);
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        String uri = request.getRequestURI();

        boolean flag = validataFileUri(uri);
        if(flag){
            filterChain.doFilter(request,response);
            return;
        }

        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            // 验证是否是 无序拦截URI
            boolean flagUri = validataUri(uri);
            if(flagUri){
                filterChain.doFilter(request,response);
                return;
            }else{
                // 重定向
                response.sendRedirect("/a/account/login");
                return;
            }
        }else{
            // 验证是否是 登录uri  如果是 则直接进入登录成功页面
            if(uri.endsWith(LOGIN_URI)){
                response.sendRedirect("/a/account/index");
                return;
            }
        }

        //放行
        filterChain.doFilter(request,response);
    }

    public boolean validataFileUri(String uri){
        for (String fileEnd : file_ends) {
            if(uri.endsWith(fileEnd)){
                return true;
            }
        }
        return false;
    }

    public boolean validataUri(String uri){
        for (String uriTemp : IGNORE_URI) {
            if(uri.endsWith(uriTemp)){
                return true;
            }
        }
        return false;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Smart.develop 启动");
    }


}
