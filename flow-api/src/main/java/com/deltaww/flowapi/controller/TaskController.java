package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.entity.CompleteFormEntity;
import com.deltaww.flowapi.entity.TaskHistoryEntity;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.repository.UuidIdGenerator;
import org.flowable.ui.common.security.SecurityScope;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.idm.service.UserService;
import org.flowable.ui.task.model.runtime.CommentRepresentation;
import org.flowable.ui.task.model.runtime.TaskRepresentation;
import org.flowable.ui.task.service.runtime.FlowableCommentService;
import org.flowable.ui.task.service.runtime.FlowableTaskFormService;
import org.flowable.ui.task.service.runtime.FlowableTaskQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/deltaflow")
public class TaskController extends BaseController {
    @Autowired
    private UserService idmUserService;
    @Autowired
    protected FlowableTaskQueryService taskQueryService;
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    protected FlowableCommentService commentService;
    @Autowired
    private TaskService taskService;
    @Autowired
    protected FlowableTaskFormService taskFormService;

    @RequestMapping(value = {"/tasks"})
    public ModelAndView userTask(ModelAndView modelAndView){
        modelAndView.setViewName(Constant.THEMYLEAF_PREFIX + "/tasks");
        /*ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode objectNode = objectMapper.createObjectNode();
        objectNode.put("sort", "created-desc");
        objectNode.put("page", 0);
        objectNode.put("size", 50);
        //objectNode.put("assignee", userService.getCurrentUser().getId());
        objectNode.put("state", "open");
        ResultListDataRepresentation resultListDataRepresentation = taskQueryService.listTasks(objectNode);
        modelAndView.addObject("processTaskList", resultListDataRepresentation.getData());*/
        return modelAndView;
    }

    @RequestMapping(value = {"/process/{processInstanceId}/history"})
    @ResponseBody
    public List<TaskHistoryEntity> historyTask(@PathVariable String processInstanceId){
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode objectNode = objectMapper.createObjectNode();
        objectNode.put("sort", "created-desc");
        objectNode.put("processInstanceId", processInstanceId);
        objectNode.put("state", "completed");
        List<TaskHistoryEntity> historyEntityList = new ArrayList<>();
        ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        handleStartForm(processInstance, historyEntityList);
        ResultListDataRepresentation resultListDataRepresentation = taskQueryService.listTasks(objectNode);
        List<Comment> commentsForProcessInstance = commentService.getCommentsForProcessInstance(processInstanceId);
        resultListDataRepresentation.getData().forEach(x -> {
            handleFollow((TaskRepresentation) x, commentsForProcessInstance, historyEntityList);
        });
        return historyEntityList;
    }

    private void handleStartForm(ProcessInstance processInstance, List<TaskHistoryEntity> historyEntityList){
        TaskHistoryEntity taskHistoryEntity = new TaskHistoryEntity();
        taskHistoryEntity.setUser(idmUserService.getUserInformation(processInstance.getStartUserId()));
        TaskRepresentation task = new TaskRepresentation();
        task.setCreated(processInstance.getStartTime());
        task.setName("Start");
        taskHistoryEntity.setTask(task);
        historyEntityList.add(taskHistoryEntity);
    }

    private void handleFollow(TaskRepresentation taskRepresentation, List<Comment> commentsForProcessInstance, List<TaskHistoryEntity> historyEntityList){
        TaskHistoryEntity taskHistoryEntity = new TaskHistoryEntity();
        taskHistoryEntity.setUser(idmUserService.getUserInformation(taskRepresentation.getAssignee().getId()));
        taskHistoryEntity.setTask(taskRepresentation);
        commentsForProcessInstance.forEach(x -> {
            if (x.getTaskId().equals(taskRepresentation.getId())) {
                taskHistoryEntity.setComment(x);
            }
        });
        historyEntityList.add(taskHistoryEntity);
    }

    @PostMapping(value = {"/process/task/reject"})
    @ResponseBody
    public String rejectProcessTask(CompleteFormEntity completeFormEntity){
        //modelAndView.setViewName("redirect:/oa/process/task");
        //todo 添加审批意见
        CommentRepresentation comment = new CommentRepresentation();
        comment.setMessage(completeFormEntity.getComment());
        comment.setCreated(new Date());
        SecurityScope currentUser = SecurityUtils.getAuthenticatedSecurityScope();
        comment.setCreatedBy(currentUser.getUserId());
        comment.setId(new UuidIdGenerator().generateId());
        commentService.addTaskComment(comment, completeFormEntity.getTaskId());
        List<String> executionIds = new ArrayList<>();
        List<HistoricTaskInstance> taskInstances = processEngine.getHistoryService()
                .createHistoricTaskInstanceQuery().processInstanceId(completeFormEntity.getProcessInstanceId()).orderByHistoricTaskInstanceStartTime().asc().list();
        List<Execution> executions = processEngine.getRuntimeService().createExecutionQuery().parentId(completeFormEntity.getProcessInstanceId()).list();
        executions.forEach(execution -> executionIds.add(execution.getId()));
        Map<String, Object> values = new HashMap<>();
        values.put("outcome" ,completeFormEntity.getOutcome());
        taskService.setVariablesLocal(completeFormEntity.getTaskId(), values);
        completeFormEntity.getValues().put("firstcommit", false);
        taskService.setVariables(completeFormEntity.getTaskId(), completeFormEntity.getValues());
        //todo 处理子流程,多实例流程
        processEngine.getRuntimeService().createChangeActivityStateBuilder()
                .moveExecutionsToSingleActivityId(executionIds, taskInstances.get(0).getTaskDefinitionKey())
                .changeState();
        return "success";
    }

    @PostMapping(value = {"/process/task/agree"})
    @ResponseBody
    public String agreeProcessTask(CompleteFormEntity completeFormEntity){
        if (!StringUtils.isEmpty(completeFormEntity.getComment())) {
            CommentRepresentation comment = new CommentRepresentation();
            comment.setMessage(completeFormEntity.getComment());
            comment.setCreated(new Date());
            SecurityScope currentUser = SecurityUtils.getAuthenticatedSecurityScope();
            comment.setCreatedBy(currentUser.getUserId());
            comment.setId(new UuidIdGenerator().generateId());
            commentService.addTaskComment(comment, completeFormEntity.getTaskId());
        }
        Map<String, Object> values = new HashMap<>();
        values.put("outcome" ,completeFormEntity.getOutcome());
        taskService.setVariablesLocal(completeFormEntity.getTaskId(), values);
        completeFormEntity.getValues().put("firstcommit", false);
        taskFormService.completeTaskForm(completeFormEntity.getTaskId(), completeFormEntity);
        return "success";
    }


}
