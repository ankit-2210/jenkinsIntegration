package com.jenkins.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    @GetMapping
    public String HomeControllerHandler(){
        return "Jenkins microservices for integration.git integrate with jenkins via github ... CI/CD pipeline through Github Actions";
    }

}
