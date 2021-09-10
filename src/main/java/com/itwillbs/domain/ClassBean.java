package com.itwillbs.domain;

public class ClassBean {
	private int f_id;
	private String f_subject;
	private String f_place;
	private String f_desc;
	private int f_price;
	private int f_maxmem;
	private int f_curmem;

	private String f_main_img;
	private String f_sub_img1;
	private String f_sub_img2;
	private String f_sub_img3;

	private String f_rdate;
	// 클래스를 db에 insert한 날짜
	private String f_cdate;
	// class가 시작하는 날짜
	private int f_readcount;
	private String f_sub_desc;
	private String f_desc_img;
	private String f_thumbnail;

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_subject() {
		return f_subject;
	}

	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}

	public String getF_place() {
		return f_place;
	}

	public void setF_place(String f_place) {
		this.f_place = f_place;
	}

	public String getF_desc() {
		return f_desc;
	}

	public void setF_desc(String f_desc) {
		this.f_desc = f_desc;
	}

	public int getF_price() {
		return f_price;
	}

	public void setF_price(int f_price) {
		this.f_price = f_price;
	}

	public int getF_maxmem() {
		return f_maxmem;
	}

	public void setF_maxmem(int f_maxmem) {
		this.f_maxmem = f_maxmem;
	}

	public int getF_curmem() {
		return f_curmem;
	}

	public void setF_curmem(int f_curmem) {
		this.f_curmem = f_curmem;
	}

	public String getF_main_img() {
		return f_main_img;
	}

	public void setF_main_img(String f_main_img) {
		this.f_main_img = f_main_img;
	}

	public String getF_sub_img1() {
		return f_sub_img1;
	}

	public void setF_sub_img1(String f_sub_img1) {
		this.f_sub_img1 = f_sub_img1;
	}

	public String getF_sub_img2() {
		return f_sub_img2;
	}

	public void setF_sub_img2(String f_sub_img2) {
		this.f_sub_img2 = f_sub_img2;
	}

	public String getF_sub_img3() {
		return f_sub_img3;
	}

	public void setF_sub_img3(String f_sub_img3) {
		this.f_sub_img3 = f_sub_img3;
	}

	public String getF_rdate() {
		return f_rdate;
	}

	public void setF_rdate(String f_rdate) {
		this.f_rdate = f_rdate;
	}

	public String getF_cdate() {
		return f_cdate;
	}

	public void setF_cdate(String f_cdate) {
		this.f_cdate = f_cdate;
	}

	public int getF_readcount() {
		return f_readcount;
	}

	public void setF_readcount(int f_readcount) {
		this.f_readcount = f_readcount;
	}

	public String getF_sub_desc() {
		return f_sub_desc;
	}

	public void setF_sub_desc(String f_sub_desc) {
		this.f_sub_desc = f_sub_desc;
	}

	public String getF_desc_img() {
		return f_desc_img;
	}

	public void setF_desc_img(String f_desc_img) {
		this.f_desc_img = f_desc_img;
	}

	public String getF_thumbnail() {
		return f_thumbnail;
	}

	public void setF_thumbnail(String f_thumbnail) {
		this.f_thumbnail = f_thumbnail;
	}
}
