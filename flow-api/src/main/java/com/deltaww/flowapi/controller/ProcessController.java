package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.service.GraghService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.flowable.ui.task.service.runtime.FlowableProcessDefinitionService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceQueryService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    /**
     * 流程定义信息列表
     * @param modelAndView
     * @return
     */
    @GetMapping("/processes")
    public ModelAndView processIndex(ModelAndView modelAndView){
        //todo 是否获取最新版本
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/process");
        return modelAndView;
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
