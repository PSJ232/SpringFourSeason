package com.itwillbs.dao;

import com.itwillbs.domain.ClassBean;
import com.itwillbs.domain.ClassDetailBean;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ClassDAOImpl implements ClassDAO {

    @Inject
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.ClassMapper";

    @Override
    public ClassBean getDetailContent(int f_id) {
        ClassBean classBean =  sqlSession.selectOne(namespace + ".getDetailContent", f_id);
        return classBean;
    }

    @Override
    public List<ClassBean> getPlaceNFidList(String f_subject, String f_cdate) {
        HashMap<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("f_subject", f_subject);
        paramMap.put("f_cdate", f_cdate);
        List<ClassBean> list = sqlSession.selectList(namespace + ".getPlaceNFidList", paramMap);
        return list;
    }

    @Override
    public ClassBean getMyClassInfo(int f_id) {
        return sqlSession.selectOne(namespace + ".getMyClassInfo", f_id);
    }

    @Override
    public void cancleClass(int r_id) {
        sqlSession.delete(namespace + ".cancleClass", r_id);
    }
}



