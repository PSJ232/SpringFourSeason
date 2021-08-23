package com.itwillbs.controller;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
public class MemberController {

    @Inject
    MemberService memberService;

    @RequestMapping(value = "/member/join", method = RequestMethod.GET)
    public String join(){
        return "/member/join";
    }

    @RequestMapping(value = "/member/join", method = RequestMethod.POST)
    public String joinPro(MemberBean memberBean){
        memberService.registMember(memberBean);
        return "/member/login";
    }
}
