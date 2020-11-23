package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.listener.SendEmailListener;
import com.deltaww.flowapi.service.DeltaPrivilligeService;
import com.deltaww.flowapi.service.GraghService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.common.engine.api.delegate.event.*;
import org.flowable.common.engine.impl.event.FlowableEngineEventImpl;
import org.flowable.common.engine.impl.event.FlowableEntityEventImpl;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.repository.Model;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.task.service.runtime.FlowableProcessDefinitionService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceQueryService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Nullable;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/deltaflow")
public class ProcessController extends BaseController {
    @Autowired
    private FlowableProcessDefinitionService processDefinitionService;
    @Autowired
    protected FlowableProcessInstanceQueryService processInstanceQueryService;
    @Autowired
    protected FlowableProcessInstanceService processInstanceService;
    @Autowired
    private GraghService graghService;
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private DeltaPrivilligeService deltaPrivilligeService;

    /**
     * 流程定义信息列表
     * @param modelAndView
     * @return
     */
    @GetMapping(value = {"/processes", "/processes/{latest}","/processes/{latest}/{appDefinitionKey}"})
    public ModelAndView processIndex(@Nullable @PathVariable Boolean latest, @Nullable @PathVariable String appDefinitionKey, ModelAndView modelAndView){
        ResultListDataRepresentation processDefinitions = processDefinitionService.getProcessDefinitions(latest, appDefinitionKey);
        modelAndView.addObject("processDefinitions", processDefinitions);
        modelAndView.addObject("currentMenu", "流程中心");
        modelAndView.addObject("latest", latest == null ? true : latest);
        modelAndView.addObject("buttons", deltaPrivilligeService.getUserButtonPrivilige(SecurityUtils.getCurrentUserId(), "2"));
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/process");
        return modelAndView;
    }

    @GetMapping(value = {"/process/editor/{processDefinitionId}"})
    public String editorFlow(@PathVariable String processDefinitionId, HttpServletRequest request){
        //todo 根据流程定义信息找到模型
        ProcessDefinition processDefinition = processEngine.getRepositoryService().createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        Model model = processEngine.getRepositoryService().createModelQuery().deploymentId(processDefinition.getId()).latestVersion().singleResult();
        return "redirect:" + request.getContextPath() + "/modeler/#/editor/" + model.getId();
    }

    /**
     * 流程实例图
     * @param instanceId
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = {"/process/instance/{id}/gragh"})
    @ResponseBody
    public String processInstanceImage(@PathVariable("id") String instanceId) throws JsonProcessingException {
        return graghService.createImageByInstanceId(instanceId);
    }

    /**
     * 流程定义图
     * @param definitionId
     * @return
     */
    @RequestMapping(value = {"/process/definition/{id}/gragh"})
    @ResponseBody
    public String processDefinitionImage(@PathVariable String definitionId){
        return graghService.createImageByDefinitionId(definitionId);
    }

}
