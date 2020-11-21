package com.deltaww.flowapi.listener;

import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.delegate.TaskListener;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.idm.api.User;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class AutoAssigneeListener implements TaskListener {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private DeltaUserService deltaUserService;

    @Override
    public void notify(DelegateTask delegateTask) {
        ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(delegateTask.getProcessInstanceId()).singleResult();
        String startUserId = processInstance.getStartUserId();
        User user = processEngine.getIdentityService().createUserQuery().userId(startUserId).singleResult();
        User manager = deltaUserService.getManager(user);
        delegateTask.setAssignee(manager.getId());
    }
}
