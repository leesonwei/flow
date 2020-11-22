package com.deltaww.flowapi.listener;

import lombok.extern.slf4j.Slf4j;
import lombok.extern.slf4j.XSlf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class SendEmailListener extends AbstractFlowableEngineEventListener {

    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        //todo 启动发送email流程
        log.info("send email sucess");
    }
}
