package com.itwillbs.service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class MemberServiceImpl implements MemberService{

    @Inject
    MemberDAO memberDAO;

    @Override
    public void registMember(MemberBean memberBean) {
        memberDAO.registMember(memberBean);
    }

    @Override
    public MemberBean userCheck(MemberBean memberBean) {
        return memberDAO.userCheck(memberBean);
    }

    @Override
    public MemberBean selectMember(String m_id) {
        return memberDAO.selectMember(m_id);
    }

    @Override
    public void deleteMember(MemberBean memberBean) {
        memberDAO.deleteMember(memberBean);
    }

    @Override
    public Integer getSubscribeCnt(String m_id) {
        return memberDAO.getSubscribeCnt(m_id);
    }

    @Override
    public Integer getPurchaseCount(String m_id) {
        return memberDAO.getPurchaseCount(m_id);
    }

    @Override
    public Integer getMakingCount(String m_id) {
        return memberDAO.getMakingCount(m_id);
    }

    @Override
    public Integer getSendCount(String m_id) {
        return memberDAO.getSendCount(m_id);
    }
}
