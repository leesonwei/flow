package com.deltaww.flowapi.listener;

import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.spring.boot.FlowableProperties;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

@Slf4j
@Component
public class EntityInitListener extends AbstractFlowableEngineEventListener {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private FlowableProperties flowableProperties;

    @Override
    protected void entityInitialized(FlowableEngineEntityEvent event){
        TaskEntity entity = (TaskEntity) event.getEntity();
        entity.setDueDate(Date.from(LocalDateTime.now().plusDays(5).toInstant(ZoneOffset.UTC)));
        processEngine.getTaskService().saveTask(entity);
    }
}
