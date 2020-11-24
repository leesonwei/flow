package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.entity.TaskHistoryEntity;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.flowable.app.api.repository.AppDefinition;
import org.flowable.app.api.repository.AppDefinitionQuery;
import org.flowable.cmmn.api.repository.CmmnDeployment;
import org.flowable.editor.language.json.converter.util.CollectionUtils;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.task.api.TaskInfo;
import org.flowable.task.api.TaskInfoQueryWrapper;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.security.SecurityScope;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.common.service.exception.BadRequestException;
import org.flowable.ui.idm.service.UserService;
import org.flowable.ui.task.model.runtime.TaskRepresentation;
import org.flowable.ui.task.service.runtime.FlowableCommentService;
import org.flowable.ui.task.service.runtime.FlowableTaskQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.*;

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

    public List<TaskHistoryEntity> listHistoryTasks(ObjectNode requestNode){
        String processInstanceId = requestNode.get("processInstanceId").textValue();
        List<TaskHistoryEntity> historyEntityList = new ArrayList<>();
        ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        handleStartForm(processInstance, historyEntityList);
        ResultListDataRepresentation resultListDataRepresentation = this.listTasks(requestNode);
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
}
