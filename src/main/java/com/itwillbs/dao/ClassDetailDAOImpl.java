package com.itwillbs.dao;

import com.itwillbs.domain.ClassDetailBean;
import com.itwillbs.domain.ReserveBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class ClassDetailDAOImpl implements ClassDetailDAO {

    @Inject
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.ClassDetailMapper";

    @Override
    public List<Integer> getTimeList(int f_id) {
        List<Integer> list = sqlSession.selectList(namespace + ".getTimeList", f_id);
        return list;
    }

    @Override
    public int getMaxMum(int f_id) {
        return sqlSession.selectOne(namespace + ".getMaxMum", f_id);
    }

    // 변수 이름 주의
    @Override
    public int getClassDetailId(HashMap paraMap) {
        return sqlSession.selectOne(namespace + ".getClassDetailId", paraMap);
    }

    @Override
    public Integer getCurrentNum(int fd_id) {
        return sqlSession.selectOne(namespace + ".getCurrentNum", fd_id);
    }

    @Override
    public int numCheck(int f_id) {
        return sqlSession.selectOne(namespace + ".numCheck", f_id);
    }

    @Override
    public void insertReserv(ReserveBean rb) {
       sqlSession.insert(namespace + ".insertReserv", rb);
    }
}
