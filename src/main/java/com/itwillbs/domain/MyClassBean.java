package com.itwillbs.domain;

public class MyClassBean {
	private int r_id;
	private int f_id;
	private String subject;
	private String place;
	private int price;
	private String class_date; //클래스 수강일
	private String img;
	private int time;
	private int num; // 예약한 인원
	private String reserv_date; //클래스 예약일
	
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getClass_date() {
		return class_date;
	}
	public void setClass_date(String class_date) {
		this.class_date = class_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
}
