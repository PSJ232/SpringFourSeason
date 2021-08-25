package com.itwillbs.service;

import com.itwillbs.domain.MemberBean;

public interface MemberService {

    public void registMember(MemberBean memberBean);

    MemberBean userCheck(MemberBean memberBean);

    MemberBean selectMember(String m_id);

    void deleteMember(MemberBean memberBean);
}
