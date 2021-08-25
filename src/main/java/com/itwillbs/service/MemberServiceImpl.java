package com.itwillbs.service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Date;
import java.text.SimpleDateFormat;

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
}
