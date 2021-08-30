package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;
@Repository
public class OrderDAOImpl implements OrderDAO{
    @Inject
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.OrderMapper";

    @Override
    public int makeId(String table, String colName) {
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("table", table);
        paramMap.put("colName", colName);
        return sqlSession.selectOne(namespace + ".makeId", paramMap);
    }
}
