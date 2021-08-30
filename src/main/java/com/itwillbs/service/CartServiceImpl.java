package com.itwillbs.service;

import com.itwillbs.dao.CartDAO;
import com.itwillbs.domain.CartBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;

@Service
public class CartServiceImpl implements CartService{

    @Inject
    CartDAO cartDAO;

    @Override
    public ArrayList<CartBean> selectCart(String m_id) {
        System.out.println("CartService - selectCart()");
        return cartDAO.getCart(m_id);
    }

    @Override
    public CartBean selectCart(int c_id) {
        return cartDAO.getCart(c_id);
    }

    @Override
    public void putCart(CartBean cartBean) {
        cartDAO.insertCart(cartBean);
    }

    @Override
    public void modifyLetter(int c_id, int c_letter) {
        cartDAO.deleteLetter(c_id, c_letter);
    }

    @Override
    public void modifyCart(int c_id, int c_qty) {
        cartDAO.updateCart(c_id, c_qty);
    }

    @Override
    public void dropItem(int c_id) {cartDAO.deleteItem(c_id);}
}
