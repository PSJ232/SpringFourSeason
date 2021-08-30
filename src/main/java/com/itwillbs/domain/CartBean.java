package com.itwillbs.domain;

import java.sql.Date;

public class CartBean {
    private int c_id; // 고유번호
    private int i_id; // 상품번호(참조키)
    private String m_id; // 회원아이디(참조키)
    private int c_qty; // 수량
    private Date c_rdate; // 장바구니담긴날(DB 시간 동기화)
    private int c_letter; // 편지선택 0:안함, 1:선택함
    private String c_delivery_date; // 배송요청일
    private int sub_option; // 정기구독 선택 옵션

    public int getC_letter() {
        return c_letter;
    }

    public void setC_letter(int c_letter) {
        this.c_letter = c_letter;
    }

    public String getC_delivery_date() {
        return c_delivery_date;
    }

    public void setC_delivery_date(String c_delivery_date) {
        this.c_delivery_date = c_delivery_date;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public int getC_qty() {
        return c_qty;
    }

    public void setC_qty(int c_qty) {
        this.c_qty = c_qty;
    }

    public Date getC_rdate() {
        return c_rdate;
    }

    public void setC_rdate(Date c_rdate) {
        this.c_rdate = c_rdate;
    }

    public int getSub_option() {
        return sub_option;
    }

    public void setSub_option(int sub_option) {
        this.sub_option = sub_option;
    }

}
