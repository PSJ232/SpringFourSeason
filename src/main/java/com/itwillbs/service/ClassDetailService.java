package com.itwillbs.service;

import com.itwillbs.domain.ClassDetailBean;
import com.itwillbs.domain.ReserveBean;

import java.util.HashMap;
import java.util.List;

public interface ClassDetailService {
    List<Integer> getTimeList(int f_id);

    Integer getMaxMum(int f_id);

    int getClassDetailId(HashMap paraMap);

    Integer getCurrentNum(int fd_id);

    int numCheck(int f_id);

    void insertReserv(ReserveBean rb);
}
