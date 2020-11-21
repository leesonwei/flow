package com.deltaww.flowapi.listener;

import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.springframework.stereotype.Component;

@Component
public class SendEmailListener extends AbstractFlowableEngineEventListener {

    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        //todo 启动发送email流程

    }
}
