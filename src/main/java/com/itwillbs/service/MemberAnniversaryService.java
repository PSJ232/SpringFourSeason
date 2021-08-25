package com.itwillbs.service;

import com.itwillbs.domain.AnniversaryBean;

import java.util.List;

public interface MemberAnniversaryService {
    void registAnn(AnniversaryBean anniversaryBean);

    public List<AnniversaryBean> selectAnnList(String m_id);

    AnniversaryBean getAnn(int a_id);

    void updateAnn(AnniversaryBean anniversaryBean);

    void deleteAnn(String a_id);
}
