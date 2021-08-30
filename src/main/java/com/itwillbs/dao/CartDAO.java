package com.itwillbs.dao;

import com.itwillbs.domain.CartBean;

import java.util.ArrayList;

public interface CartDAO {

    public ArrayList<CartBean> getCart(String m_id);

    public CartBean getCart(int c_id);

    public void insertCart(CartBean cartBean);

    public void deleteLetter(int c_id, int c_letter);

    public void updateCart(int c_id, int c_qty);

    public void deleteItem(int c_id);
}
