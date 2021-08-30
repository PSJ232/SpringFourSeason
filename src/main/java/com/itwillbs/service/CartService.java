package com.itwillbs.service;

import com.itwillbs.domain.CartBean;

import java.util.ArrayList;

public interface CartService {

    public ArrayList<CartBean> selectCart(String m_id);

    public CartBean selectCart(int c_id);

    public void putCart(CartBean cartBean);

    public void modifyLetter(int c_id, int c_letter);

    public void modifyCart(int c_id, int c_qty);

    public void dropItem(int c_id);
}
