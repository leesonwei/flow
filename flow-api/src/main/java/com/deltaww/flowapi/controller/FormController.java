package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/deltaflow")
public class FormController extends BaseController {
    @GetMapping("/forms")
    public ModelAndView processIndex(ModelAndView modelAndView){
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms");
        return modelAndView;
    }
}
