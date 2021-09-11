package com.itwillbs.controller;

import com.google.gson.Gson;
import com.itwillbs.domain.*;
import com.itwillbs.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ClassController {

    @Inject
    ClassService classService;

    @Inject
    ClassDetailService classDetailService;

    @Inject
    MemberService memberService;

    @Inject
    IdMakerService idMakerService;

    // ClassReserv.od
    @RequestMapping(value = "/reservation/classReserve", method = RequestMethod.GET)
    public String classReserve(Model model, HttpServletRequest request) {
        int f_id = Integer.parseInt(request.getParameter("f_id"));
        ClassBean classBean = classService.getDetailContent(f_id);
        model.addAttribute("classBean", classBean);

        // 가격 형태 처리하여 전달
        DecimalFormat dc = new DecimalFormat("###,###,###,###");
        String class_price = dc.format(classBean.getF_price());
        model.addAttribute("class_price", class_price);
        return "/reservation/classReserv";
    }

    // ReservClassPlace.od
    @ResponseBody
    @RequestMapping(value = "/class/reservClassPlace", method = RequestMethod.GET)
    public List<ClassBean> reservClassPlace(HttpServletResponse response, HttpServletRequest request) {
        String f_subject = request.getParameter("f_subject");
        String f_cdate = request.getParameter("f_cdate");

//        1. 전달 받은 f_subject로 f_place, f_id들 받아서 배열로 저장 후 전달
        List<ClassBean> placeList = classService.getPlaceNFidList(f_subject, f_cdate);

        return placeList;
    }

    // 수강 시간 조회
    // ReservClassTime.od
    @ResponseBody
    @RequestMapping(value = "/class/reservClassTime", method = RequestMethod.GET)
    public List<Integer> reservClassTime(HttpServletResponse response, HttpServletRequest request) {
        int f_id = Integer.parseInt(request.getParameter("f_id"));

        List<Integer> timeList = classDetailService.getTimeList(f_id);

        return timeList;
    }

    // ReservClassTime.od
    @ResponseBody
    @RequestMapping(value = "/class/reservClassMember", method = RequestMethod.POST)
    public int reservClassMember(HttpServletResponse response, HttpServletRequest request) {
        int f_maxmem = 0;
        int fd_id = 0;
        int currentNum = 0;
        int remainNum = 0;

        String fc_date = request.getParameter("fc_date");
        String f_place = request.getParameter("f_place");
        String fd_time = request.getParameter("fd_time").trim();
        int f_id = Integer.parseInt(request.getParameter("f_id"));

        //한강의 수강가능 인원수
        f_maxmem = classDetailService.getMaxMum(f_id);
        System.out.println("f_maxMem : " + f_maxmem);

        //f_id 구하기
        HashMap paraMap = new HashMap();
        paraMap.put("fc_date", fc_date);
        paraMap.put("f_place", f_place);
        paraMap.put("fd_time", fd_time);

        System.out.println("fc_date : " + fc_date);
        System.out.println("f_place : " + f_place);
        System.out.println("fd_time : " + fd_time);
        fd_id = classDetailService.getClassDetailId(paraMap);
        System.out.println("fd_id : " + fd_id);

        //수강중인 인원
        if (classDetailService.getCurrentNum(fd_id) == null) {
            currentNum = 0;
        } else {
            currentNum = classDetailService.getCurrentNum(fd_id);
        }

        remainNum = f_maxmem - currentNum;
        System.out.println("-----------------------------");
        System.out.println("f_maxmem : " + f_maxmem);
        System.out.println("fd_id : " + fd_id);
        System.out.println("currentNum : " + currentNum);
        System.out.println("remainNum : " + remainNum);

        return remainNum;
    }

    // ReservInsert.od
    @RequestMapping(value = "/reservation/Insert", method = RequestMethod.POST)
    public String ReserveInsert(HttpServletRequest request, HttpServletResponse response) throws ParseException {

        //수강인원 가져오기
        int r_num = Integer.parseInt(request.getParameter("r_num"));

        //회원정보 가져오기
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");
        System.out.println("m_id!: " + m_id);

        try {
            MemberBean mb;
            float g_discount;
            mb = memberService.selectMember(m_id);

            // 회원 등급 가져오기
            int g_id = mb.getG_id();
            g_discount = memberService.getGradeDetail(g_id);
            System.out.println("g_discount : " + g_discount);
            request.setAttribute("member", mb);
            request.setAttribute("grade", g_discount);
        } catch (NullPointerException e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            out.print("<script>");
            out.print("alert('로그인시 수강신청이 가능합니다\\n로그인 페이지로 이동합니다');");
            out.print("</script>");
            return "redirect:/member/login";
        }

        //classDetail 정보
        int f_id = Integer.parseInt(request.getParameter("f_id"));
        String fc_date = request.getParameter("fc_date");
        String fd_place = request.getParameter("fd_place");
        String fd_time = request.getParameter("fd_time");
        HashMap paraMap = new HashMap();
        paraMap.put("fc_date", fc_date);
        paraMap.put("f_place", fd_place);
        paraMap.put("fd_time", fd_time);

        System.out.println("fd_time: " + fd_time);
        int fd_id = classDetailService.getClassDetailId(paraMap);

        ClassDetailBean cdb = new ClassDetailBean();
        cdb.setF_id(f_id);
        cdb.setFd_date(fc_date);
        cdb.setFd_place(fd_place);
        cdb.setFd_id(fd_id);
        // 타임은 따로
        System.out.println("fc_date" + fc_date);

        // 클래스 정보 가져오기
        ClassBean cb = classService.getDetailContent(f_id);

        // 요일 구하기
        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
        Date date = simpleDate.parse(fc_date);
        System.out.println(date);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        String startDate = null;
        switch (calendar.get(Calendar.DAY_OF_WEEK)) {
            case 1:
                startDate = "일";
                break;
            case 2:
                startDate = "월";
                break;
            case 3:
                startDate = "화";
                break;
            case 4:
                startDate = "수";
                break;
            case 5:
                startDate = "목";
                break;
            case 6:
                startDate = "금";
                break;
            case 7:
                startDate = "토";
                break;
        }


        if (cb != null && cdb != null) {
            request.setAttribute("r_num", r_num);
            request.setAttribute("fclass", cb);
            request.setAttribute("fclass_detail", cdb);
            request.setAttribute("startDate", startDate);
            request.setAttribute("fd_time", fd_time);

            return "/reservation/reservInsert";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.print("<script>");
            out.print("alert('결제페이지 로딩에 실패했습니다');");
            out.print("history.back();");
            out.print("</script>");
            return null;
        }
    }

    @RequestMapping(value="/reservation/InsertPro", method=RequestMethod.POST)
    public String ReserveInsertPro(HttpServletRequest request, HttpServletResponse response) {
        ReserveBean rb = new ReserveBean();
        HttpSession session = request.getSession();
        String m_id = (String)session.getAttribute("m_id");
        String r_payment = request.getParameter("r_payment");

        rb.setF_id(Integer.parseInt(request.getParameter("f_id")));
        rb.setM_id(m_id);
        rb.setR_payment(r_payment);
        rb.setR_confirm(1);
        rb.setFd_id(Integer.parseInt(request.getParameter("fd_id")));
        rb.setR_num(Integer.parseInt(request.getParameter("r_num")));
        rb.setR_amount(Integer.parseInt(request.getParameter("total_fee")));

        //회원 이름
        MemberBean mb = memberService.selectMember(m_id);
        String name = mb.getM_name();

        //예약 id생성
        int r_id = idMakerService.newId("reservation", "r_id", 1);
        rb.setR_id(r_id);

        //최종 인원 확인
        boolean isFull = false;
        int r_num = Integer.parseInt(request.getParameter("r_num"));
        int reservNum = classDetailService.numCheck(Integer.parseInt(request.getParameter("f_id")));
        int reservMaxNum = classDetailService.getMaxMum(r_num);
        if(r_num+reservNum > reservMaxNum) {
            isFull = true;
        }

        System.out.println("reservation 아이디 :"+r_id);
        System.out.println("isFull: " + isFull);

        classDetailService.insertReserv(rb);

        // 등급할인 금액
        float grade_discount = Float.parseFloat(request.getParameter("grade_discount"));

        // 사용 포인트
        int point_discount;
        if(request.getParameter("point_discount").equals("")) {
            point_discount = 0;
        } else {
            point_discount = Integer.parseInt(request.getParameter("point_discount"));
            //포인트 차감
            HashMap paraMap = new HashMap();
            paraMap.put("m_id", m_id);
            paraMap.put("point_discount", point_discount);
            memberService.usePoint(paraMap);
        }

        request.setAttribute("rb", rb);
        request.setAttribute("name", name);
        request.setAttribute("grade_discount", grade_discount);
        request.setAttribute("point_discount", point_discount);

        if(r_payment.equals("card")) {
            // 결제 페이지로 이동 ("RservPay.od")
            return "redirect:/reservation/pay";
        } else if(r_payment.equals("cash")) {
            // 결제 완료 페이지로 이동
            return "/reservation/payment_info";
        }

        return null;
    }

    @RequestMapping(value="/class/mypage/planned", method = RequestMethod.GET)
    public String ReservList(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id"); //request.getParameter("m_id");

        List<ReserveBean> reservList = classDetailService.getReservList(m_id);
        List<MyClassBean> plannedClassList = new ArrayList<MyClassBean>();
        List<MyClassBean> pastClassList = new ArrayList<MyClassBean>();

        for(ReserveBean rb: reservList) {
            //클래스 정보 가져오기
            ClassBean cb = classService.getMyClassInfo(rb.getF_id());
            //클래스 날짜 가져오기
            int fd_time = classDetailService.getMyClassTime(rb.getFd_id());

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date ClassDay = null;
            Date today = null;

            //현재 날짜 구하기
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH)+1;
            int day = cal.get(Calendar.DAY_OF_MONTH);

            System.out.println("cb.getF_cdate() : " + cb.getF_cdate());
            try {
                ClassDay = dateFormat.parse(cb.getF_cdate());
                today = dateFormat.parse(year+"-"+month+"-"+day);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            //날짜 비교
            int compare = ClassDay.compareTo(today);
            System.out.println("compare : " + compare);

            MyClassBean mcb = new MyClassBean();
            mcb.setF_id(rb.getF_id());
            mcb.setR_id(rb.getR_id());
            mcb.setSubject(cb.getF_subject());
            mcb.setPlace(cb.getF_place());
            mcb.setPrice(cb.getF_price());
            mcb.setClass_date(cb.getF_cdate());
            mcb.setImg(cb.getF_main_img());
            mcb.setTime(fd_time);
            mcb.setNum(rb.getR_num());
            mcb.setReserv_date(rb.getR_date());

            //클래스 수강일이 오늘이거나, 오늘 이후이면
            if(compare>=0) {
                plannedClassList.add(mcb);
                model.addAttribute("plannedClassList", plannedClassList);
            }

        }
        return "/mypage/plannedClassBack";

    }

    @RequestMapping(value="/class/mypage/past", method = RequestMethod.GET)
    public String PastMyClassListAction(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id"); //request.getParameter("m_id");

        List<ReserveBean> reservList = classDetailService.getReservList(m_id);
        List<MyClassBean> plannedClassList = new ArrayList<MyClassBean>();
        List<MyClassBean> pastClassList = new ArrayList<MyClassBean>();

        for(ReserveBean rb: reservList) {
            //클래스 정보 가져오기
            ClassBean cb = classService.getMyClassInfo(rb.getF_id());
            //클래스 날짜 가져오기
            int fd_time = classDetailService.getMyClassTime(rb.getFd_id());

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date ClassDay = null;
            Date today = null;

            //현재 날짜 구하기
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH)+1;
            int day = cal.get(Calendar.DAY_OF_MONTH);

            System.out.println("cb.getF_cdate() : " + cb.getF_cdate());
            try {
                ClassDay = dateFormat.parse(cb.getF_cdate());
                today = dateFormat.parse(year+"-"+month+"-"+day);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            //날짜 비교
            int compare = ClassDay.compareTo(today);
            System.out.println("compare : " + compare);

            MyClassBean mcb = new MyClassBean();
            mcb.setF_id(rb.getF_id());
            mcb.setR_id(rb.getR_id());
            mcb.setSubject(cb.getF_subject());
            mcb.setPlace(cb.getF_place());
            mcb.setPrice(cb.getF_price());
            mcb.setClass_date(cb.getF_cdate());
            mcb.setImg(cb.getF_main_img());
            mcb.setTime(fd_time);
            mcb.setNum(rb.getR_num());
            mcb.setReserv_date(rb.getR_date());

            //클래스 수강일이 지났다면
            if(compare<0) {
                pastClassList.add(mcb);
                request.setAttribute("pastClassList", pastClassList);
            }

        }
        return "/mypage/pastClassBack";

    }

    @RequestMapping(value="/class/cancle", method = RequestMethod.GET)
    public String CancleClass(HttpServletRequest request, HttpServletResponse response) {
        boolean isCancleSuccess = false;
        int r_id = Integer.parseInt(request.getParameter("r_id"));
        System.out.println("r_id - "+ r_id);

        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");
        System.out.println("m_id - "+ m_id);

        classService.cancleClass(r_id);

        return "/reservation/cancle_info";
    }


    @RequestMapping(value="/reservation/pay", method = RequestMethod.GET)
    public String ReservPay(HttpServletRequest request) {
        ReserveBean rb = (ReserveBean) request.getAttribute("reservBean");
        System.out.println("!!!!!!!!r" + rb.getR_id());

        //클래스 정보 가져오기
        ClassBean cb = classService.getMyClassInfo(rb.getF_id());

        //클래스 디테일 가져오기(장소, 날짜, 시간)
        ClassDetailBean cdb = classDetailService.getClassDetail(rb.getFd_id());

        MemberBean mb = memberService.selectMember(rb.getM_id());

        if (cb != null && cdb != null && mb != null) {
            request.setAttribute("reservBean", rb);
            request.setAttribute("fclass", cb);
            request.setAttribute("fclass_detail", cdb);
            request.setAttribute("member", mb);
        }
        return "/reservation/reservPay";
    }

}








