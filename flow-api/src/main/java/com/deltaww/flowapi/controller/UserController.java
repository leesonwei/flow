package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.RuntimeService;
import org.flowable.form.api.FormRepositoryService;
import org.flowable.form.engine.FormEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deltaflow")
public class UserController {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;

    @GetMapping("/login")
    public String getLoginPage(){
        RuntimeService runtimeService = processEngine.getRuntimeService();
        return Constant.THEMYLEAF_PREFIX + "/login";
    }

}
