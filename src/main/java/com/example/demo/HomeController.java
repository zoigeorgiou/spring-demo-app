package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    private static final String APP_VERSION = "1.5";

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("appVersion", APP_VERSION);
        return "home";
    }
} 
