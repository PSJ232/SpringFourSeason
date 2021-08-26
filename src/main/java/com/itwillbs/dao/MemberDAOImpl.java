package com.itwillbs.dao;

import com.itwillbs.domain.AnniversaryBean;
import com.itwillbs.domain.MemberBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

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

    @Override
    public MemberBean selectMember(String m_id) {
        return sqlSession.selectOne(namespace + ".selectMember", m_id);
    }

    @Override
    public void registAnn(AnniversaryBean anniversaryBean) {
        sqlSession.insert(namespace + ".registAnn", anniversaryBean);
    }

    @Override
    public List<AnniversaryBean> selectAnnList(String m_id) {
        return sqlSession.selectList(namespace + ".selectAnnList", m_id);
    }

    @Override
    public AnniversaryBean getAnn(int a_id) {
        return sqlSession.selectOne(namespace + ".getAnn", a_id);
    }

    @Override
    public void updateAnn(AnniversaryBean anniversaryBean) {
        sqlSession.update(namespace + ".updateAnn", anniversaryBean);
    }

    @Override
    public void deleteAnn(String a_id) {
        sqlSession.delete(namespace + ".deleteAnn", a_id);
    }

    @Override
    public void deleteMember(MemberBean memberBean) {
        sqlSession.delete(namespace + ".deleteMember", memberBean);
    }

    @Override
    public Integer getSubscribeCnt(String m_id) {
        return sqlSession.selectOne(namespace + ".getSubscribeCnt", m_id);
    }

    @Override
    public Integer getPurchaseCount(String m_id) {
        return sqlSession.selectOne(namespace + ".getPurchaseCount", m_id);
    }

    @Override
    public Integer getMakingCount(String m_id) {
        return sqlSession.selectOne(namespace + ".getMakingCount", m_id);
    }

    @Override
    public Integer getSendCount(String m_id) {
        return sqlSession.selectOne(namespace + ".getSendCount", m_id);
    }

}
