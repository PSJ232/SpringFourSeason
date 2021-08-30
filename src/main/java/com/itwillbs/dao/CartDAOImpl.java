package com.itwillbs.dao;

import com.itwillbs.domain.CartBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDAOImpl implements CartDAO{

    @Inject
    SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.CartMapper";

    @Override
    public ArrayList<CartBean> getCart(String m_id) {
        List<CartBean> result = sqlSession.selectList(namespace+".getCartList", m_id);
        return (ArrayList<CartBean>)result;
    }

    @Override
    public CartBean getCart(int c_id) {
        return sqlSession.selectOne(namespace+".getCart", c_id);
    }

    @Override
    public void insertCart(CartBean cartBean) {
        sqlSession.insert(namespace+".insertCart", cartBean);
    }

    @Override
    public void updateCart(int c_id, int c_qty) {
        Map<String, Integer> paramMap = new HashMap<String, Integer>();
        paramMap.put("c_id", c_id);
        paramMap.put("c_qty", c_qty);
        sqlSession.update(namespace+".updateCart", paramMap);
    }

    @Override
    public void deleteItem(int c_id) {
        sqlSession.delete(namespace+".deleteItem", c_id);
    }

    @Override
    public void deleteLetter(int c_id, int c_letter) {
        Map<String, Integer> paramMap = new HashMap<String, Integer>();
        paramMap.put("c_id", c_id);
        paramMap.put("c_letter", c_letter);
        sqlSession.delete(namespace+".deleteCart", paramMap);
    }

}
