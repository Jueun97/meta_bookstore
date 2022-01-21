package com.meta.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
    @RequestMapping("login")
    public String loginForm() {
        return "member/login";
    }
    //스프링 시큐리티를 쓰기 때문에 post요청에 대한 URL을 만들지 않는다.

}
