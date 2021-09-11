package com.itwillbs.controller;

import com.itwillbs.domain.AnniversaryBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.service.MemberAnniversaryService;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class MemberController {

    @Inject
    MemberService memberService;

    @Inject
    MemberAnniversaryService memberAnniversaryService;

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

    @RequestMapping(value = "/member/update", method = RequestMethod.GET)
    public String update(Model model, HttpSession session, HttpServletRequest request){
        String m_id = (String) session.getAttribute("m_id");
        MemberBean memberBean = memberService.selectMember(m_id);
        List<AnniversaryBean> annList = memberAnniversaryService.selectAnnList(m_id);
        model.addAttribute("memberBean", memberBean);
        request.setAttribute("annList", annList);
        return "/member/update";
    }

    @RequestMapping(value = "/member/delete", method = RequestMethod.GET)
    public String delete(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        MemberBean memberBean = memberService.selectMember((String)session.getAttribute("m_id"));
        model.addAttribute("memberBean", memberBean);
        return "/member/delete";
    }

    @RequestMapping(value = "/member/delete", method = RequestMethod.POST)
    public String deletePro(HttpServletRequest request, HttpServletResponse response, MemberBean memberBean){
        memberService.deleteMember(memberBean);
        HttpSession session = request.getSession();
        session.invalidate();// 로그아웃처리

        // 자동로그인 해제
        Cookie cookieId = new Cookie("m_id", null);
        cookieId.setMaxAge(0); // 쿠키삭제(엎어쓰기)
        response.addCookie(cookieId);
        System.out.println("쿠키삭제!!!");
        return "redirect:/member/login";
    }

    @RequestMapping(value = "/member/anniversary/insert", method = RequestMethod.GET)
    public String annInsert(){

        return "/member/anniversary";
    }

    @RequestMapping(value = "/member/anniversary/insert", method = RequestMethod.POST)
    public void annInsertPro(HttpServletRequest request, HttpServletResponse response, AnniversaryBean anniversaryBean) throws IOException {
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");
        anniversaryBean.setM_id(m_id);
        anniversaryBean.setA_id(2);
        memberAnniversaryService.registAnn(anniversaryBean);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("opener.location.reload();");
        out.println("window.close();");
        out.println("</script>");
    }

    @RequestMapping(value = "/member/anniversary/update", method = RequestMethod.GET)
    public String annUpdate(HttpServletRequest request, Model model){
        int a_id = Integer.parseInt(request.getParameter("a_id"));
        AnniversaryBean annDetail = memberAnniversaryService.getAnn(a_id);
        model.addAttribute("annDetail", annDetail);
        return "/member/anniversary";
    }

    @RequestMapping(value = "/member/anniversary/update", method = RequestMethod.POST)
    public void annUpdatePro(AnniversaryBean anniversaryBean, HttpServletResponse response) throws IOException {
        memberAnniversaryService.updateAnn(anniversaryBean);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("opener.location.reload();");
        out.println("window.close();");
        out.println("</script>");
    }

    @RequestMapping(value = "/member/anniversary/delete", method = RequestMethod.GET)
    public String annDelete(HttpServletRequest request){
        String a_id = request.getParameter("a_id");
        memberAnniversaryService.deleteAnn(a_id);
        return "redirect:/member/update";
    }

    @RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
    public String mypage(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");
        Integer purchaseCount = memberService.getPurchaseCount(m_id);
        Integer makingCount = memberService.getMakingCount(m_id);
        Integer sendCount = memberService.getSendCount(m_id);

        model.addAttribute("purchaseCount", purchaseCount);
        model.addAttribute("makingCount", makingCount);
        model.addAttribute("sendCount", sendCount);

        return "/mypage/mypage";
    }

    @RequestMapping(value = "/member/mypagebanner", method = RequestMethod.GET)
    public String mypageBanner(HttpServletRequest request){

        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");

        MemberBean memberBean = memberService.selectMember(m_id);
        Integer subscribeCnt = memberService.getSubscribeCnt(m_id);
        request.setAttribute("memberBean", memberBean);
        if(subscribeCnt == null){
            subscribeCnt = 0;
        }
        request.setAttribute("subscribeCnt", subscribeCnt);
        return "/inc/mypagebanner";
    }

    @RequestMapping(value="/member/mypage/class", method = RequestMethod.GET)
    public String mypageClass(HttpServletRequest request) {
        System.out.println("member/mypage/class");
        return "/mypage/class";
    }
}
