package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.common.FormState;
import com.deltaww.flowapi.common.SpringUtils;
import com.deltaww.flowapi.entity.TaskHistoryEntity;
import com.deltaww.flowapi.listener.ResolveAssigneeListener;
import com.deltaww.flowapi.service.DeltaPrivilligeService;
import com.deltaww.flowapi.service.DeltaUserService;
import com.deltaww.flowapi.service.FormUIService;
import com.deltaww.flowapi.service.impl.DeltaTaskQuery;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.form.api.FormDefinition;
import org.flowable.form.api.FormInfo;
import org.flowable.form.api.FormModel;
import org.flowable.form.engine.FormEngine;
import org.flowable.idm.api.User;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.model.UserRepresentation;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.task.model.runtime.CreateProcessInstanceRepresentation;
import org.flowable.ui.task.model.runtime.ProcessDefinitionRepresentation;
import org.flowable.ui.task.model.runtime.ProcessInstanceRepresentation;
import org.flowable.ui.task.model.runtime.TaskRepresentation;
import org.flowable.ui.task.service.runtime.FlowableProcessDefinitionService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceQueryService;
import org.flowable.ui.task.service.runtime.FlowableProcessInstanceService;
import org.flowable.ui.task.service.runtime.FlowableTaskFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.search.SearchTerm;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
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
    @Autowired
    protected FlowableProcessInstanceQueryService processInstanceQueryService;
    @Autowired
    private DeltaPrivilligeService deltaPrivilligeService;
    @Autowired
    private DeltaUserService deltaUserService;
    @Qualifier("deltaTaskQuery")
    @Autowired
    protected DeltaTaskQuery deltaTaskQuery;
    @Autowired
    protected FlowableTaskFormService taskFormService;

    /**
     * 这里只显示可编辑的form==process
     * @param modelAndView
     * @return
     */
    @GetMapping("/forms")
    public ModelAndView processIndex(ModelAndView modelAndView){

        Map<String, List<ProcessDefinitionRepresentation>> formsMap = getForms();
        modelAndView.addObject("forms", formsMap);
        modelAndView.addObject("runningProcessInstances", getRunningProcessInstance());
        modelAndView.addObject("doneProcessInstances", getDoneProcessInstance());
        modelAndView.addObject("buttons", deltaPrivilligeService.getUserButtonPrivilige(SecurityUtils.getCurrentUserId(), "3"));
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms");
        return modelAndView;
    }

    /**
     * 获取流程表单列表
     * @return
     */
    private Map<String, List<ProcessDefinitionRepresentation>> getForms(){
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
        return formsMap;
    }

    /**
     * 获取审核中流程实例信息
     * @return
     */
    private ResultListDataRepresentation getRunningProcessInstance(){
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode objectNode = objectMapper.createObjectNode();
        objectNode.put("sort", "created-desc");
        objectNode.put("page", 0);
        objectNode.put("size", 20);
        objectNode.put("state", "running");
        ResultListDataRepresentation processInstances = processInstanceQueryService.getProcessInstances(objectNode);
        return filterSelfData(processInstances);
    }

    /**
     * 获取已完成流程实例信息
     * @return
     */
    private ResultListDataRepresentation getDoneProcessInstance(){
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode objectNode = objectMapper.createObjectNode();
        objectNode.put("sort", "created-desc");
        objectNode.put("page", 0);
        objectNode.put("size", 20);
        objectNode.put("state", "completed");
        ResultListDataRepresentation processInstances = processInstanceQueryService.getProcessInstances(objectNode);
        return filterSelfData(processInstances);
    }

    private ResultListDataRepresentation filterSelfData(ResultListDataRepresentation processInstances){
        List<ProcessInstanceRepresentation> data = (List<ProcessInstanceRepresentation>) processInstances.getData();
        List<ProcessInstanceRepresentation> collect = data.stream().filter(x -> x.getStartedBy().getId().equals(SecurityUtils.getCurrentUserId())).collect(Collectors.toList());
        processInstances.setData(collect);
        return processInstances;
    }


    @GetMapping("/forms/{formId}/start")
    public ModelAndView getStartForm(@PathVariable String formId, ModelAndView modelAndView){
        FormInfo processDefinitionStartForm = processDefinitionService.getProcessDefinitionStartForm(formId);
        String formUI = formUIService.renderForm(processDefinitionStartForm, FormState.START);
        modelAndView.addObject("form", processDefinitionStartForm);
        modelAndView.addObject("formUI", formUI.replace("${processDefinitionId}", formId)
                .replace("${action}", "/deltaflow/forms/" + formId + "/start"));
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
        create.getValues().put(Constant.SKIP_EXPRESSION, true);
        create.getValues().put(Constant.INITIATOR, SecurityUtils.getCurrentUserId());
        ProcessInstanceRepresentation processInstanceRepresentation = processInstanceService.startNewProcessInstance(create);
        log.info("process started: {}", processInstanceRepresentation);
        return modelAndView;
    }

    @GetMapping("/forms/{formId}/{taskId}/audit")
    public ModelAndView auditForm(@PathVariable String formId, @PathVariable String taskId, ModelAndView modelAndView){
        FormInfo taskForm = taskFormService.getTaskForm(taskId);
        String formUI = formUIService.renderForm(taskForm, FormState.AUDIT);
        modelAndView.addObject("form", taskForm);
        modelAndView.addObject("formUI", formUI.replace("${processInstanceId}", formId)
                .replace("${taskId}", taskId)
                .replace("${action}", "/deltaflow/task/{outcome}}"));
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms-detail");
        return modelAndView;
    }

    @GetMapping("/forms/{formId}/{taskId}/check")
    public ModelAndView checkForm(@PathVariable String formId, @PathVariable String taskId, ModelAndView modelAndView){
        FormInfo taskForm = taskFormService.getTaskForm(taskId);
        String formUI = formUIService.renderForm(taskForm, FormState.COMFIRM);
        modelAndView.addObject("form", taskForm);
        modelAndView.addObject("formUI", formUI.replace("${processInstanceId}", formId)
                .replace("${taskId}", taskId)
                .replace("${action}", "/deltaflow/task/complete"));
        modelAndView.addObject("currentMenu", "表单中心");
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/forms-detail");
        return modelAndView;
    }

    @GetMapping(value = {"/forms/{formId}/history"})
    public List<TaskHistoryEntity> historyTask(@PathVariable String processInstanceId){
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode objectNode = objectMapper.createObjectNode();
        objectNode.put("sort", "created-desc");
        objectNode.put("processInstanceId", processInstanceId);
        objectNode.put("state", "completed");
        return deltaTaskQuery.listHistoryTasks(objectNode);
    }


}
