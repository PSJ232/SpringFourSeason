package com.itwillbs.dao;

import com.itwillbs.domain.ClassDetailBean;
import com.itwillbs.domain.ReserveBean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ClassDetailDAO {
    List<Integer> getTimeList(int f_id);

    int getMaxMum(int f_id);

    int getClassDetailId(HashMap paraMap);

    Integer getCurrentNum(int fd_id);

    int numCheck(int f_id);

    void insertReserv(ReserveBean rb);

    List<ReserveBean> getReservList(String m_id);

    int getMyClassTime(int fd_id);

    ClassDetailBean getClassDetail(int fd_id);
}
