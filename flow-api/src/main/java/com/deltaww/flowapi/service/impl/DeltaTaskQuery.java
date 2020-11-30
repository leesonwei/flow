package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.entity.HistoryTaskInfo;
import com.deltaww.flowapi.entity.TaskHistoryEntity;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.extern.slf4j.Slf4j;
import org.flowable.app.api.repository.AppDefinition;
import org.flowable.app.api.repository.AppDefinitionQuery;
import org.flowable.cmmn.api.repository.CmmnDeployment;
import org.flowable.editor.language.json.converter.util.CollectionUtils;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.idm.api.User;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskInfo;
import org.flowable.task.api.TaskInfoQueryWrapper;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.model.UserRepresentation;
import org.flowable.ui.common.security.SecurityScope;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.common.service.exception.BadRequestException;
import org.flowable.ui.idm.service.UserService;
import org.flowable.ui.task.model.runtime.TaskRepresentation;
import org.flowable.ui.task.service.runtime.FlowableCommentService;
import org.flowable.ui.task.service.runtime.FlowableTaskQueryService;
import org.flowable.variable.api.history.HistoricVariableInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Primary
@Service("deltaTaskQuery")
public class DeltaTaskQuery extends FlowableTaskQueryService {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    protected FlowableCommentService commentService;
    @Autowired
    private UserService idmUserService;

    @Override
    public ResultListDataRepresentation listTasks(ObjectNode requestNode) {
        if (requestNode == null) {
            throw new BadRequestException("No request found");
        } else {
            SecurityScope currentUser = SecurityUtils.getAuthenticatedSecurityScope();
            JsonNode stateNode = requestNode.get("state");
            TaskInfoQueryWrapper taskInfoQueryWrapper = null;
            if (stateNode != null && "completed".equals(stateNode.asText())) {
                HistoricTaskInstanceQuery historicTaskInstanceQuery = this.historyService.createHistoricTaskInstanceQuery();
                historicTaskInstanceQuery.finished();
                taskInfoQueryWrapper = new TaskInfoQueryWrapper(historicTaskInstanceQuery);
            } else {
                taskInfoQueryWrapper = new TaskInfoQueryWrapper(this.taskService.createTaskQuery());
            }

            JsonNode appDefinitionKeyNode = requestNode.get("appDefinitionKey");
            if (appDefinitionKeyNode != null && !appDefinitionKeyNode.isNull()) {
                List<AppDefinition> appDefinitions = ((AppDefinitionQuery)this.appRepositoryService.createAppDefinitionQuery().appDefinitionKey(appDefinitionKeyNode.asText())).list();
                List<String> parentDeploymentIds = new ArrayList();
                Iterator var8 = appDefinitions.iterator();

                while(var8.hasNext()) {
                    AppDefinition appDefinition = (AppDefinition)var8.next();
                    parentDeploymentIds.add(appDefinition.getDeploymentId());
                }

                List<Deployment> deployments = this.repositoryService.createDeploymentQuery().parentDeploymentIds(parentDeploymentIds).list();
                List<String> deploymentIds = new ArrayList();
                Iterator var10 = deployments.iterator();

                while(var10.hasNext()) {
                    Deployment deployment = (Deployment)var10.next();
                    deploymentIds.add(deployment.getId());
                }

                List<CmmnDeployment> cmmnDeployments = this.cmmnRepositoryService.createDeploymentQuery().parentDeploymentIds(parentDeploymentIds).list();
                List<String> cmmnDeploymentIds = new ArrayList();
                Iterator var12 = cmmnDeployments.iterator();

                while(var12.hasNext()) {
                    CmmnDeployment deployment = (CmmnDeployment)var12.next();
                    cmmnDeploymentIds.add(deployment.getId());
                }

                taskInfoQueryWrapper.getTaskInfoQuery().or().deploymentIdIn(deploymentIds).cmmnDeploymentIdIn(cmmnDeploymentIds).taskCategory(appDefinitionKeyNode.asText()).endOr();
            }

            JsonNode processInstanceIdNode = requestNode.get("processInstanceId");
            if (processInstanceIdNode != null && !processInstanceIdNode.isNull()) {
                this.handleProcessInstanceFiltering(currentUser, taskInfoQueryWrapper, processInstanceIdNode);
            }

            JsonNode caseInstanceIdNode = requestNode.get("caseInstanceId");
            if (caseInstanceIdNode != null && !caseInstanceIdNode.isNull()) {
                this.handleCaseInstanceFiltering(currentUser, taskInfoQueryWrapper, caseInstanceIdNode);
            }

            JsonNode textNode = requestNode.get("text");
            if (textNode != null && !textNode.isNull()) {
                this.handleTextFiltering(taskInfoQueryWrapper, textNode);
            }

            JsonNode assignmentNode = requestNode.get("assignment");
            if (assignmentNode != null && !assignmentNode.isNull()) {
                this.handleAssignment(taskInfoQueryWrapper, assignmentNode, currentUser);
            }

            JsonNode processDefinitionNode = requestNode.get("processDefinitionId");
            if (processDefinitionNode != null && !processDefinitionNode.isNull()) {
                this.handleProcessDefinition(taskInfoQueryWrapper, processDefinitionNode);
            }

            JsonNode dueBeforeNode = requestNode.get("dueBefore");
            if (dueBeforeNode != null && !dueBeforeNode.isNull()) {
                this.handleDueBefore(taskInfoQueryWrapper, dueBeforeNode);
            }

            JsonNode dueAfterNode = requestNode.get("dueAfter");
            if (dueAfterNode != null && !dueAfterNode.isNull()) {
                this.handleDueAfter(taskInfoQueryWrapper, dueAfterNode);
            }

            JsonNode sortNode = requestNode.get("sort");
            if (sortNode != null) {
                this.handleSorting(taskInfoQueryWrapper, sortNode);
            }

            int page = 0;
            JsonNode pageNode = requestNode.get("page");
            if (pageNode != null && !pageNode.isNull()) {
                page = pageNode.asInt(0);
            }

            int size = 25;
            JsonNode sizeNode = requestNode.get("size");
            if (sizeNode != null && !sizeNode.isNull()) {
                size = sizeNode.asInt(25);
            }

            List<? extends TaskInfo> tasks = taskInfoQueryWrapper.getTaskInfoQuery().listPage(page * size, size);

            JsonNode includeProcessInstanceNode = requestNode.get("includeProcessInstance");
            Map<String, String> processInstancesNames = new HashMap();
            Map<String, String> caseInstancesNames = new HashMap();
            if (includeProcessInstanceNode != null) {
                this.handleIncludeProcessInstance(taskInfoQueryWrapper, includeProcessInstanceNode, tasks, processInstancesNames);
                this.handleIncludeCaseInstance(taskInfoQueryWrapper, includeProcessInstanceNode, tasks, caseInstancesNames);
            }

            ResultListDataRepresentation result = new ResultListDataRepresentation(this.convertTaskInfoList(tasks, processInstancesNames, caseInstancesNames));
            result.getData().forEach(x -> {
                if (x instanceof TaskRepresentation) {
                    TaskRepresentation task = (TaskRepresentation) x;
                    ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
                    if (processInstance == null) {
                        HistoricProcessInstance historicProcessInstance = processEngine.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
                        task.setProcessInstanceStartUserId(historicProcessInstance.getStartUserId());
                    } else {
                        task.setProcessInstanceStartUserId(processInstance.getStartUserId());
                    }
                }
            });
            if (page != 0 || tasks.size() == size) {
                Long totalCount = taskInfoQueryWrapper.getTaskInfoQuery().count();
                result.setTotal((long)totalCount.intValue());
                result.setStart(page * size);
            }

            return result;
        }

    }

    public List<HistoryTaskInfo> listHistoryTasks(ObjectNode requestNode){
        String processInstanceId = requestNode.get("processInstanceId").textValue();
        List<HistoryTaskInfo> historyTaskInfoList = new ArrayList<>();
        ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        handleStartForm(processInstance, historyTaskInfoList);
        ResultListDataRepresentation resultListDataRepresentation = this.listTasks(requestNode);
        List<Comment> commentsForProcessInstance = commentService.getCommentsForProcessInstance(processInstanceId);
        resultListDataRepresentation.getData().forEach(x -> {
            handleFollow(processInstance, (TaskRepresentation) x, commentsForProcessInstance, historyTaskInfoList);
        });
        List<HistoryTaskInfo> historyTaskInfos = historyTaskInfoList.stream().sorted(Comparator.comparing(HistoryTaskInfo::getEndDate).reversed()).collect(Collectors.toList());
        return historyTaskInfos;
    }

    private void handleStartForm(ProcessInstance processInstance, List<HistoryTaskInfo> historyTaskInfos){
        HistoryTaskInfo historyTaskInfo = new HistoryTaskInfo();
        historyTaskInfo.setEndDate(processInstance.getStartTime());
        String operationInfo = "%s started %s";
        User user = idmUserService.getUserInformation(processInstance.getStartUserId()).getUser();
        String userName = user.getFirstName() + " " + user.getLastName();
        if (SecurityUtils.getCurrentUserId().equals(processInstance.getStartUserId())) {
            userName = "您";
        }
        historyTaskInfo.setOperationInfo(String.format(operationInfo, userName, processInstance.getName()));
        historyTaskInfos.add(historyTaskInfo);
    }

    private void handleFollow(ProcessInstance processInstance, TaskRepresentation taskRepresentation, List<Comment> commentsForProcessInstance, List<HistoryTaskInfo> historyTaskInfos){
        UserRepresentation assignee = taskRepresentation.getAssignee();
        if (assignee == null) {
            return;
        }
        HistoryTaskInfo historyTaskInfo = new HistoryTaskInfo();
        historyTaskInfo.setEndDate(taskRepresentation.getEndDate());
        String userName = assignee.getFirstName() + " " + assignee.getLastName();
        if (assignee.getId().equals(SecurityUtils.getCurrentUserId())) {
            userName = "您";
        }
        String operationInfo = "%s %s %s " + processInstance.getName();
        HistoricVariableInstance historicVariableInstance = processEngine.getHistoryService().createHistoricVariableInstanceQuery().taskId(taskRepresentation.getId()).variableName(Constant.OUTCOME).singleResult();
        if (historicVariableInstance != null) {
            historyTaskInfo.setOperationInfo(String.format(operationInfo, userName, "<Strong>" + historicVariableInstance.getValue().toString().toUpperCase() + "</Strong>", SecurityUtils.getCurrentUserId().equals(processInstance.getStartUserId())? "您的" : ""));
        } else {
            historyTaskInfo.setOperationInfo(String.format(operationInfo, userName, "completed", SecurityUtils.getCurrentUserId().equals(processInstance.getStartUserId()) ? "您的" : ""));
        }
        List<Comment> comments = commentsForProcessInstance.stream().filter(x -> x.getTaskId().equals(taskRepresentation.getId())).collect(Collectors.toList());
        String commentInfo="Comment: %s";
        if (comments.size() > 0) {
            historyTaskInfo.setCommentInfo(String.format(commentInfo, comments.get(0).getFullMessage()));
        }
        historyTaskInfos.add(historyTaskInfo);
    }
}
