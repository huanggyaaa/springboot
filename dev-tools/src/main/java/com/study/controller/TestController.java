package com.study.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @desc: 热部署测试控制层
 *
 * @author: Guangyue Huang
 * @date: 2019/3/25 22:23
 **/
@RestController
public class TestController {

    @GetMapping("/test")
    public String test(){
        return "test222";
    }
}
