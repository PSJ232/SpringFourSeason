package com.itwillbs.dao;


import com.itwillbs.domain.MemberBean;

public interface MemberDAO {
    public void registMember(MemberBean memberBean);

    public MemberBean userCheck(MemberBean memberBean);
}
