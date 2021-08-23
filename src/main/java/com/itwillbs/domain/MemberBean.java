package com.itwillbs.domain;

import java.sql.Date;

public class MemberBean {
    private String m_id; // 회원아이디(이메일)
    private String m_pass; // 비밀번호
    private String m_name; // 이름
    private String m_phone; // 전화번호
    private String m_birth; // 생년월일
    private int m_gender; // 성별
    private int g_id; // 등급 0~4
    private String m_agree; // 선택정보 동의여부 0:비동의, 1:동의
    private Date m_rdate; // 가입날짜 (DB시간 동기화)
    private Date m_drop; // 탈퇴날짜
    private int m_point; // 보유포인트

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getM_pass() {
        return m_pass;
    }

    public void setM_pass(String m_pass) {
        this.m_pass = m_pass;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_phone() {
        return m_phone;
    }

    public void setM_phone(String m_phone) {
        this.m_phone = m_phone;
    }

    public String getM_birth() {
        return m_birth;
    }

    public void setM_birth(String m_birth) {
        this.m_birth = m_birth;
    }

    public int getM_gender() {
        return m_gender;
    }

    public void setM_gender(int m_gender) {
        this.m_gender = m_gender;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getM_agree() {
        return m_agree;
    }

    public void setM_agree(String m_agree) {
        this.m_agree = m_agree;
    }

    public Date getM_rdate() {
        return m_rdate;
    }

    public void setM_rdate(Date m_rdate) {
        this.m_rdate = m_rdate;
    }

    public Date getM_drop() {
        return m_drop;
    }

    public void setM_drop(Date m_drop) {
        this.m_drop = m_drop;
    }

    public int getM_point() {
        return m_point;
    }

    public void setM_point(int m_point) {
        this.m_point = m_point;
    }
}
