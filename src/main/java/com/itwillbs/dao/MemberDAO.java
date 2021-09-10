package com.itwillbs.dao;


import com.itwillbs.domain.AnniversaryBean;
import com.itwillbs.domain.MemberBean;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
    public void registMember(MemberBean memberBean);

    public MemberBean userCheck(MemberBean memberBean);

    MemberBean selectMember(String m_id);

    void registAnn(AnniversaryBean anniversaryBean);

    public List<AnniversaryBean> selectAnnList(String m_id);

    AnniversaryBean getAnn(int a_id);

    void updateAnn(AnniversaryBean anniversaryBean);

    void deleteAnn(String a_id);

    void deleteMember(MemberBean memberBean);

    Integer getSubscribeCnt(String m_id);

    Integer getPurchaseCount(String m_id);

    Integer getMakingCount(String m_id);

    Integer getSendCount(String m_id);

    float getGradeDetail(int g_id);

    void usePoint(HashMap paraMap);
}
