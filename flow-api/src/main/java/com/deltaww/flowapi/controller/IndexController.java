package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.entity.DeltaPrivilige;
import org.flowable.ui.common.model.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("deltaflow")
public class IndexController extends BaseController {

    @GetMapping("/index")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.addObject("currentMenu", "首页");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/index");
        return modelAndView;
    }
}
