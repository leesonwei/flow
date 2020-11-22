package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.service.FormUIService;
import org.flowable.form.api.FormDefinition;
import org.flowable.form.api.FormInfo;
import org.flowable.form.api.FormModel;
import org.flowable.form.engine.FormEngine;
import org.flowable.ui.task.service.runtime.FlowableProcessDefinitionService;
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
    @Autowired
    private FlowableProcessDefinitionService processDefinitionService;
    @Autowired
    private FormUIService formUIService;

    /**
     * 这里只显示可编辑的form==process
     * @param modelAndView
     * @return
     */
    @GetMapping("/forms")
    public ModelAndView processIndex(ModelAndView modelAndView){
        modelAndView.addObject("currentMenu", "表单中心");
        //获取表单列表
        String tableName = formEngine.getFormManagementService().getTableName(FormDefinition.class);
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms");
        return modelAndView;
    }

    @GetMapping("/forms/{formId}/start")
    public ModelAndView getStartForm(@PathVariable String formId, ModelAndView modelAndView){
        FormInfo processDefinitionStartForm = processDefinitionService.getProcessDefinitionStartForm(formId);
        String formUI = formUIService.renderForm(processDefinitionStartForm);
        modelAndView.addObject("formUI", "formUI");
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/form");
        return modelAndView;
    }
}
