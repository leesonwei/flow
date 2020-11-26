package com.deltaww.flowapi.listener;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.common.SpringUtils;
import com.deltaww.flowapi.service.DeltaUserService;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.engine.delegate.event.FlowableActivityEvent;
import org.flowable.engine.delegate.event.FlowableProcessStartedEvent;
import org.flowable.engine.delegate.event.impl.FlowableProcessStartedEventImpl;
import org.flowable.engine.impl.persistence.entity.ExecutionEntityImpl;
import org.flowable.idm.api.User;
import org.flowable.ui.common.security.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Slf4j
@Component
public class ResolverManagerListener extends AbstractFlowableEngineEventListener {

    @Override
    protected void processStarted(FlowableProcessStartedEvent event){
        ExecutionEntityImpl entity = (ExecutionEntityImpl)event.getEntity();
        DeltaUserService deltaUserService = SpringUtils.getBean(DeltaUserService.class);
        User manager = deltaUserService.getManager(SecurityUtils.getCurrentUserId());
        event.getVariables().put(Constant.MANAGER, manager.getId());
        ProcessEngine processEngine = SpringUtils.getBean(ProcessEngine.class);
        processEngine.getRuntimeService().setVariables(entity.getId(), event.getVariables());
    }

}
