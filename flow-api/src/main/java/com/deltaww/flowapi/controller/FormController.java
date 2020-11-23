package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.common.FormState;
import com.deltaww.flowapi.service.FormUIService;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.form.api.FormDefinition;
import org.flowable.form.api.FormInfo;
import org.flowable.form.api.FormModel;
import org.flowable.form.engine.FormEngine;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.model.UserRepresentation;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.task.model.runtime.CreateProcessInstanceRepresentation;
import org.flowable.ui.task.model.runtime.ProcessDefinitionRepresentation;
import org.flowable.ui.task.model.runtime.ProcessInstanceRepresentation;
import org.flowable.ui.task.service.runtime.FlowableProcessDefinitionService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.search.SearchTerm;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

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
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    protected FlowableProcessInstanceService processInstanceService;

    /**
     * 这里只显示可编辑的form==process
     * @param modelAndView
     * @return
     */
    @GetMapping("/forms")
    public ModelAndView processIndex(ModelAndView modelAndView){
        ResultListDataRepresentation forms = processDefinitionService.getProcessDefinitions(true, null);
        List<ProcessDefinitionRepresentation> formsData = (List<ProcessDefinitionRepresentation>) forms.getData();
        Map<String, List<ProcessDefinitionRepresentation>> formsMap = new HashMap<>();
        formsData.forEach(x -> {
            List<ProcessDefinitionRepresentation> collect = formsData.stream().filter(y
                    -> y.getCategory().equals(x.getCategory()) && y.getHasStartForm()).collect(Collectors.toList());
            if (collect.size() > 0) {
                formsMap.put(x.getCategory(), collect);
            }
        });
        modelAndView.addObject("forms", formsMap);
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms");
        return modelAndView;
    }

    @GetMapping("/forms/{formId}")
    public ModelAndView getForm(ModelAndView modelAndView){
        modelAndView.addObject("currentMenu", "表单中心");

        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/form");
        return modelAndView;
    }

    @GetMapping("/forms/{formId}/start")
    public ModelAndView getStartForm(@PathVariable String formId, ModelAndView modelAndView){
        FormInfo processDefinitionStartForm = processDefinitionService.getProcessDefinitionStartForm(formId);
        String formUI = formUIService.renderForm(processDefinitionStartForm, FormState.START);
        modelAndView.addObject("form", processDefinitionStartForm);
        modelAndView.addObject("formUI", formUI.replace("${processDefinitionId}", formId));
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms-detail");
        return modelAndView;
    }

    @PostMapping("/forms/{formId}/start")
    public ModelAndView startWithForm(@PathVariable String formId, CreateProcessInstanceRepresentation create, ModelAndView modelAndView){
        modelAndView.setViewName("redirect:/deltaflow/forms/#audit");
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().processDefinitionId(formId).singleResult();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy MM dd");
        create.setName(processDefinition.getName() + "-" + simpleDateFormat.format(new Date()));
        create.getValues().put(Constant.FLOWABLE_SKIP_EXPRESSION_ENABLED, true);
        //Authentication.setAuthenticatedUserId(SecurityUtils.getCurrentUserId());
        ProcessInstanceRepresentation processInstanceRepresentation = processInstanceService.startNewProcessInstance(create);
        //Authentication.setAuthenticatedUserId(null);
        return modelAndView;
    }
}
