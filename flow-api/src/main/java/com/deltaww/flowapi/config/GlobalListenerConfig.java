package com.deltaww.flowapi.config;

import com.deltaww.flowapi.listener.SendEmailListener;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.common.engine.api.delegate.event.FlowableEventDispatcher;
import org.flowable.engine.ProcessEngineConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class GlobalListenerConfig {
    @Autowired
    private ProcessEngineConfiguration processEngineConfiguration;
    @Autowired
    private SendEmailListener sendEmailListener;

    @PostConstruct
    public void addListener(){
        FlowableEventDispatcher eventDispatcher = processEngineConfiguration.getEventDispatcher();
        eventDispatcher.addEventListener(sendEmailListener, FlowableEngineEventType.TASK_ASSIGNED);
    }
}
