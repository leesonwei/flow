package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class EmailServiceImpl implements EmailService {
    @Override
    public String sendEmail() {
        log.info("sended email. ");
        return "";
    }
}
