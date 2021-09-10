package com.itwillbs.dao;

import com.itwillbs.domain.ClassBean;
import com.itwillbs.domain.ClassDetailBean;

import java.util.List;

public interface ClassDAO {

    ClassBean getDetailContent(int f_id);

    List<ClassBean> getPlaceNFidList(String f_subject, String f_cdate);

}
