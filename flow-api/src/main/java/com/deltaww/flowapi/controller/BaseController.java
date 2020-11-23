package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.entity.DeltaPriviligeEntity;
import com.deltaww.flowapi.service.DeltaPrivilligeService;
import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.ui.common.model.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BaseController {
    @Autowired
    private DeltaUserService userService;
    @Autowired
    private DeltaPrivilligeService deltaPrivilligeService;

    @ModelAttribute
    public ModelAndView setUser(){
        //获取当前用户
        ModelAndView modelAndView = new ModelAndView();
        UserRepresentation currentUser = userService.getCurrentUser();
        modelAndView.addObject("user", currentUser);
        //获取当前用户的菜单
        List<DeltaPriviligeEntity> userPrivilige = deltaPrivilligeService.getUserPrivilige(currentUser.getId());
        modelAndView.addObject("menus", userPrivilige.stream().filter(x -> x.getType() == 0).collect(Collectors.toList()));
        return modelAndView;
    }
}
