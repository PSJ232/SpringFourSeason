package com.itwillbs.domain;

public class ClassDetailBean {
    private int fd_id;
    private int f_id;
    private String fd_date;
    private String fd_place;
    private int fd_time;
    private int fd_isSelected;

    public int getFd_id() {
        return fd_id;
    }

    public void setFd_id(int fd_id) {
        this.fd_id = fd_id;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public String getFd_date() {
        return fd_date;
    }

    public void setFd_date(String fd_date) {
        this.fd_date = fd_date;
    }

    public String getFd_place() {
        return fd_place;
    }

    public void setFd_place(String fd_place) {
        this.fd_place = fd_place;
    }

    public int getFd_time() {
        return fd_time;
    }

    public void setFd_time(int fd_time) {
        this.fd_time = fd_time;
    }

    public int getFd_isSelected() {
        return fd_isSelected;
    }

    public void setFd_isSelected(int fd_isSelected) {
        this.fd_isSelected = fd_isSelected;
    }
}
