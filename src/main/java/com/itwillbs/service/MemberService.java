package com.itwillbs.service;

import com.itwillbs.domain.MemberBean;

import java.util.HashMap;

public interface MemberService {

    public void registMember(MemberBean memberBean);

    MemberBean userCheck(MemberBean memberBean);

    MemberBean selectMember(String m_id);

    void deleteMember(MemberBean memberBean);

    Integer getSubscribeCnt(String m_id);

    Integer getPurchaseCount(String m_id);

    Integer getMakingCount(String m_id);

    Integer getSendCount(String m_id);

    float getGradeDetail(int g_id);

    void usePoint(HashMap paraMap);
}
