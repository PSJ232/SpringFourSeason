package com.itwillbs.service;

import com.itwillbs.domain.ClassBean;
import com.itwillbs.domain.ClassDetailBean;

import java.util.List;

public interface ClassService {
    ClassBean getDetailContent(int f_id);

    List<ClassBean> getPlaceNFidList(String f_subject, String f_cdate);

    ClassBean getMyClassInfo(int f_id);

    void cancleClass(int r_id);
}
