package com.itwillbs.controller;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MemberController {

    @Inject
    MemberService memberService;

    @RequestMapping(value = "/member/join", method = RequestMethod.GET)
    public String join(){
        return "/member/join";
    }

    @RequestMapping(value = "/member/join", method = RequestMethod.POST)
    public String joinPro(MemberBean memberBean, HttpServletRequest request){
        String m_birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
        memberBean.setM_birth(m_birth);
        memberService.registMember(memberBean);
        return "redirect:/member/login";
    }

    @RequestMapping(value = "/member/login", method = RequestMethod.GET)
    public String login(){
        return "/member/login";
    }
}
