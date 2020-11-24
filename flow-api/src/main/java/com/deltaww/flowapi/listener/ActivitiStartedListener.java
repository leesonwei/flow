package com.deltaww.flowapi.listener;

import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ActivitiStartedListener extends AbstractFlowableEngineEventListener {
    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        log.info("ActivitiStartedListener: {}", event.getEntity());
    }
}
