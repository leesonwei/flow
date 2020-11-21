package com.deltaww.flowapi.interceptor;

import com.deltaww.flowapi.service.DeltaUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AuthenticationInterceptor implements HandlerInterceptor {
    @Autowired
    private DeltaUserService deltaUserService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try{
            if (deltaUserService.getCurrentUser() == null) {
                response.sendRedirect("/");
                return false;
            }
        } catch (Exception ex){
            response.sendRedirect("/");
            return false;
        }
        return true;
    }
}
