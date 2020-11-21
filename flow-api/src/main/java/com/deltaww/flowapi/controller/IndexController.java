package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("deltaflow")
public class IndexController extends BaseController {

    @GetMapping("/index")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/index");
        modelAndView.addObject("currentMenu", "首页");
        return modelAndView;
    }
}
