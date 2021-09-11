package com.itwillbs.service;

import com.itwillbs.dao.ClassDAO;
import com.itwillbs.dao.ClassDetailDAO;
import com.itwillbs.domain.ClassDetailBean;
import com.itwillbs.domain.ReserveBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ClassDetailServiceImpl implements ClassDetailService{

    @Inject
    ClassDetailDAO classDetailDAO;

    @Override
    public List<Integer> getTimeList(int f_id) {
        return classDetailDAO.getTimeList(f_id);
    }

    @Override
    public Integer getMaxMum(int f_id) {
        return classDetailDAO.getMaxMum(f_id);
    }

    // 변수이름 주의
    @Override
    public int getClassDetailId(HashMap paraMap) {
        return classDetailDAO.getClassDetailId(paraMap);
    }

    @Override
    public Integer getCurrentNum(int fd_id) {
        return classDetailDAO.getCurrentNum(fd_id);
    }

    @Override
    public int numCheck(int f_id) {
        return classDetailDAO.numCheck(f_id);
    }

    @Override
    public void insertReserv(ReserveBean rb) {
        classDetailDAO.insertReserv(rb);
    }

    @Override
    public List<ReserveBean> getReservList(String m_id) {
        return classDetailDAO.getReservList(m_id);
    }

    @Override
    public int getMyClassTime(int fd_id) {
        return classDetailDAO.getMyClassTime(fd_id);
    }

    @Override
    public ClassDetailBean getClassDetail(int fd_id) {
        return classDetailDAO.getClassDetail(fd_id);
    }
}
