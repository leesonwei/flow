package com.deltaww.flowapi.listener;

import com.deltaww.flowapi.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import lombok.extern.slf4j.XSlf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.spring.boot.FlowableProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class SendEmailListener extends AbstractFlowableEngineEventListener {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private FlowableProperties flowableProperties;
    @Autowired
    private EmailService emailService;

    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        //todo 启动发送email流程, 使用flowable的邮件系统,太慢,待更新
        /*Map<String, Object> emailVar = new HashMap<>();
        emailVar.put("emailFrom", "delta@flowable.com");
        emailVar.put("emailTo", "delta@flowable.com");
        emailVar.put("cc", "flowable@delta.com");
        emailVar.put("emailSubject", "测试");
        emailVar.put("emailContent", "这是一个测试邮件");
        Authentication.setAuthenticatedUserId("admin");
        ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("send-email", emailVar);
        Authentication.setAuthenticatedUserId(null);*/
        emailService.sendEmail();
    }
}
