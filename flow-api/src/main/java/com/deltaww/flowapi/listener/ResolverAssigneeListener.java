package com.deltaww.flowapi.listener;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.common.SpringUtils;
import com.deltaww.flowapi.service.DeltaUserService;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.engine.delegate.event.FlowableProcessStartedEvent;
import org.flowable.engine.impl.persistence.entity.ExecutionEntityImpl;
import org.flowable.idm.api.User;
import org.flowable.ui.common.security.SecurityUtils;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class ResolverAssigneeListener extends AbstractFlowableEngineEventListener {

    @Override
    protected void processStarted(FlowableProcessStartedEvent event){
        ExecutionEntityImpl entity = (ExecutionEntityImpl)event.getEntity();
        DeltaUserService deltaUserService = SpringUtils.getBean(DeltaUserService.class);
        Map<String, String> assignee = new HashMap<>();
        String assigneeVars = (String) event.getVariables().get(Constant.ASSIGNEE_LIST_VAR);
        String assigneeList = (String) event.getVariables().get(Constant.ASSIGNEE_LIST);
        if (assigneeVars != null) {
            //有設置流程變量
            List<String> stringList = Arrays.asList(assigneeVars.split(";"));
            if (assigneeList == null) {
                assignee = deltaUserService.getMesAssignee(stringList);
            } else {
                assignee = parseAssignee(stringList, assigneeList);
            }
            event.getVariables().putAll(assignee);
            ProcessEngine processEngine = SpringUtils.getBean(ProcessEngine.class);
            processEngine.getRuntimeService().setVariables(entity.getId(), event.getVariables());
        } else {
            //沒有設置流程變量
            event.getVariables().putAll(assignee);
            ProcessEngine processEngine = SpringUtils.getBean(ProcessEngine.class);
            processEngine.getRuntimeService().setVariables(entity.getId(), event.getVariables());
        }
    }
    
    private Map<String, String> parseAssignee(List<String> stringList, String assigneeList){
        Map<String, String> assignee = new HashMap<>();
        String[] split = assigneeList.split("\n");
        for (int i = 0; i < stringList.size(); i++) {
            if (i < split.length) {
                assignee.put(stringList.get(0).trim(), split[0].split(":")[1].trim());
            }
        }
        return assignee;
    }
}
