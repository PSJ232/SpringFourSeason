package com.itwillbs.controller;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

    @RequestMapping(value = "/member/login", method = RequestMethod.POST)
    public String loginPro(MemberBean memberBean, HttpServletRequest request, HttpServletResponse response, Model model){
        String autoLogin = request.getParameter("autoLogin");
        MemberBean memberBean1 = memberService.userCheck(memberBean);
        if(memberBean1 != null){
            HttpSession session = request.getSession();
            session.setAttribute("m_id", memberBean1.getM_id());

            if(autoLogin != null) { // 자동로그인이 체크 되어있으면 쿠키에 저장
                Cookie cookieId = new Cookie("m_id", memberBean1.getM_id());
                cookieId.setMaxAge(60*60*24*30); // 30일간 쿠키 보관
                response.addCookie(cookieId);
                System.out.println("쿠키생성!!!");
            }

            return "redirect:/";
        }else {
            model.addAttribute("msg","로그인 실패!");
            return "/member/msg";
        }
    }

    @RequestMapping(value = "/member/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,HttpServletResponse response){
        Cookie cookieId = new Cookie("m_id", null);
        cookieId.setMaxAge(0);
        response.addCookie(cookieId);
        System.out.println("쿠키삭제");

        HttpSession session = request.getSession();
        session.invalidate();

        return "redirect:/";
    }


}
