package com.itwillbs.service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.AnniversaryBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class MemberAnniversaryServiceImpl implements MemberAnniversaryService{
    @Inject
    MemberDAO memberDAO;

    @Override
    public void registAnn(AnniversaryBean anniversaryBean) {
        memberDAO.registAnn(anniversaryBean);
    }

    @Override
    public List<AnniversaryBean> selectAnnList(String m_id) {
        return memberDAO.selectAnnList(m_id);
    }

    @Override
    public AnniversaryBean getAnn(int a_id) {
        return memberDAO.getAnn(a_id);
    }

    @Override
    public void updateAnn(AnniversaryBean anniversaryBean) {
        memberDAO.updateAnn(anniversaryBean);
    }

    @Override
    public void deleteAnn(String a_id) {
        memberDAO.deleteAnn(a_id);
    }
}
