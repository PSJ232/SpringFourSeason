package com.itwillbs.service;

import com.itwillbs.dao.ItemDAO;
import com.itwillbs.domain.ItemBean;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class ItemServiceImpl implements ItemService{

    @Inject
    ItemDAO itemDAO;

    public ItemBean selectItem(int i_id) {
        return itemDAO.getItem(i_id);
    }
}
