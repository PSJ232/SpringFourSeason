package com.itwillbs.domain;

import java.sql.Timestamp;

public class ItemBean {
    private int i_id;
    private String i_name;
    private String i_desc;
    private int i_price;
    private int i_inven;
    private String i_img;
    private String i_subimg2;
    private String i_subimg3;
    private String i_subimg4;
    private Timestamp i_rdate;
    private float i_discount;
    private String i_size;
    private String i_dpstatus;
    private String i_itemstatus;
    private String i_detailpage;
    private int i_category; // 0, 1 일반상품, 2 당일배송, 3 정기구독, 4,5,6,7,8,...

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }

    public String getI_desc() {
        return i_desc;
    }

    public void setI_desc(String i_desc) {
        this.i_desc = i_desc;
    }

    public int getI_price() {
        return i_price;
    }

    public void setI_price(int i_price) {
        this.i_price = i_price;
    }

    public int getI_inven() {
        return i_inven;
    }

    public void setI_inven(int i_inven) {
        this.i_inven = i_inven;
    }

    public String getI_img() {
        return i_img;
    }

    public void setI_img(String i_img) {
        this.i_img = i_img;
    }

    public String getI_subimg2() {
        return i_subimg2;
    }

    public void setI_subimg2(String i_subimg2) {
        this.i_subimg2 = i_subimg2;
    }

    public String getI_subimg3() {
        return i_subimg3;
    }

    public void setI_subimg3(String i_subimg3) {
        this.i_subimg3 = i_subimg3;
    }

    public String getI_subimg4() {
        return i_subimg4;
    }

    public void setI_subimg4(String i_subimg4) {
        this.i_subimg4 = i_subimg4;
    }

    public Timestamp getI_rdate() {
        return i_rdate;
    }

    public void setI_rdate(Timestamp i_rdate) {
        this.i_rdate = i_rdate;
    }

    public float getI_discount() {
        return i_discount;
    }

    public void setI_discount(float i_discount) {
        this.i_discount = i_discount;
    }

    public String getI_size() {
        return i_size;
    }

    public void setI_size(String i_size) {
        this.i_size = i_size;
    }

    public String getI_dpstatus() {
        return i_dpstatus;
    }

    public void setI_dpstatus(String i_dpstatus) {
        this.i_dpstatus = i_dpstatus;
    }

    public String getI_itemstatus() {
        return i_itemstatus;
    }

    public void setI_itemstatus(String i_itemstatus) {
        this.i_itemstatus = i_itemstatus;
    }

    public String getI_detailpage() {
        return i_detailpage;
    }

    public void setI_detailpage(String i_detailpage) {
        this.i_detailpage = i_detailpage;
    }

    public int getI_category() {
        return i_category;
    }

    public void setI_category(int i_category) {
        this.i_category = i_category;
    }

}
