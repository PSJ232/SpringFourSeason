package com.itwillbs.dao;

import com.itwillbs.domain.MemberBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Inject
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.MemberMapper";


    @Override
    public void registMember(MemberBean memberBean) {
        sqlSession.insert(namespace + ".registMember", memberBean);
    }

    @Override
    public MemberBean userCheck(MemberBean memberBean) {
        return sqlSession.selectOne(namespace + ".userCheck", memberBean);
    }

}
