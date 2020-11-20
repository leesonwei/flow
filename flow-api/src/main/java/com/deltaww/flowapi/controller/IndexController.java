package com.deltaww.flowapi.controller;

import com.deltaww.flowapi.common.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("deltaflow")
public class IndexController {

    @GetMapping("/index")
    public String index(){
        return Constant.THEMYLEAF_PREFIX + "/index";
    }

    @GetMapping("/{page}/view")
    public String index(@PathVariable String page){
        return Constant.THEMYLEAF_PREFIX + "/" + page;
    }
}
