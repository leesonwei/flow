package com.deltaww.flowapi.config;

import com.deltaww.flowapi.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private AuthenticationInterceptor authenticationInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //todo deltaflow的路径添加到springsecurity
        registry.addInterceptor(authenticationInterceptor).addPathPatterns("/deltaflow");
    }
}
