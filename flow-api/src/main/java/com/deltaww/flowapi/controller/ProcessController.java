package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deltaflow")
public class ProcessController {

    @GetMapping("/tables")
    public String processIndex(){
        return Constant.THEMYLEAF_PREFIX + "/tables";
    }
}
