package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.flowable.form.api.FormDefinition;
import org.flowable.form.api.FormModel;
import org.flowable.form.engine.FormEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/deltaflow")
public class FormController extends BaseController {
    @Qualifier("formEngine")
    @Autowired
    private FormEngine formEngine;

    @GetMapping("/forms")
    public ModelAndView processIndex(ModelAndView modelAndView){
        modelAndView.addObject("currentMenu", "表单中心");
        //获取表单列表
        String tableName = formEngine.getFormManagementService().getTableName(FormDefinition.class);
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms");
        return modelAndView;
    }

    @GetMapping("/forms/{formId}")
    public ModelAndView startWithForm(@PathVariable String formId, ModelAndView modelAndView){
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/form");
        return modelAndView;
    }
}
