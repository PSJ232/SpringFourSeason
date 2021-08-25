package com.itwillbs.domain;

public class AnniversaryBean {
    private int a_id; // 고유번호
    private String m_id; // 회원아이디 (참조키)
    private String a_date; // 기념일 날짜
    private String a_name; // 기념일 이름
    private int a_repeat; // 반복주기 0:없음, 1:매년, 100:100일마다

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getA_date() {
        return a_date;
    }

    public void setA_date(String a_date) {
        this.a_date = a_date;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public int getA_repeat() {
        return a_repeat;
    }

    public void setA_repeat(int a_repeat) {
        this.a_repeat = a_repeat;
    }

}
