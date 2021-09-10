package com.itwillbs.service;

import com.itwillbs.dao.ClassDAO;
import com.itwillbs.domain.ClassBean;
import com.itwillbs.domain.ClassDetailBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {

    @Inject
    ClassDAO classDAO;

    @Override
    public ClassBean getDetailContent(int f_id) {
        ClassBean classBean  = classDAO.getDetailContent(f_id);
        return classBean;
    }

    @Override
    public List<ClassBean> getPlaceNFidList(String f_subject, String f_cdate) {
        return classDAO.getPlaceNFidList(f_subject, f_cdate);
    }

}
