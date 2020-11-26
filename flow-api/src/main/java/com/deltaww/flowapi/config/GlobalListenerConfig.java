package com.deltaww.flowapi.config;

import com.deltaww.flowapi.listener.ActivitiStartedListener;
import com.deltaww.flowapi.listener.DueDayListener;
import com.deltaww.flowapi.listener.ResolveAssigneeListener;
import com.deltaww.flowapi.listener.SendEmailListener;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.common.engine.api.delegate.event.FlowableEventDispatcher;
import org.flowable.engine.ProcessEngineConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class GlobalListenerConfig {
    @Autowired
    private ProcessEngineConfiguration processEngineConfiguration;
    @Autowired
    private SendEmailListener sendEmailListener;
    @Autowired
    private DueDayListener dueDayListener;
    @Autowired
    private ActivitiStartedListener activitiStartedListener;


    @Bean
    public FlowableEventDispatcher addListener(){
        FlowableEventDispatcher eventDispatcher = processEngineConfiguration.getEventDispatcher();
        eventDispatcher.addEventListener(sendEmailListener, FlowableEngineEventType.TASK_CREATED);
        eventDispatcher.addEventListener(dueDayListener, FlowableEngineEventType.TASK_CREATED);
        return eventDispatcher;
    }
}
