package com.itwillbs.controller;

import com.itwillbs.domain.CartBean;
import com.itwillbs.domain.ItemBean;
import com.itwillbs.service.CartService;
import com.itwillbs.service.CartServiceImpl;
import com.itwillbs.service.IdMakerService;
import com.itwillbs.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Inject
    CartService cartService;
    @Inject
    ItemService itemService;
    @Inject
    IdMakerService idMakerService;

    @RequestMapping(value = "/cart")
    public String list(Model model, HttpServletRequest req){
        System.out.println("Cart list()");
        HttpSession session = req.getSession();
        String m_id = (String) session.getAttribute("m_id");
        ArrayList<CartBean> cartList = cartService.selectCart(m_id);

        ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
        // 장바구니에서 i_id를 꺼내서 , itemDetail을 가져와서 배열에 저장
        for (CartBean cb : cartList) {
            ItemBean itemBean = itemService.selectItem(cb.getI_id());
            itemList.add(itemBean);
        }

        model.addAttribute("cartList", cartList); //장바구니 리스트
        model.addAttribute("itemList", itemList);
        return "cart/cart";
    }

    @RequestMapping(value = "/insert")
    public void insert(CartBean cartBean, HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("CartInsertProAction");
        HttpSession session = req.getSession();
        String m_id = (String) session.getAttribute("m_id");

        int newId = idMakerService.newId("cart", "c_id"); // 번호생성(MAX+1)
        cartBean.setM_id(m_id);
        cartBean.setC_id(newId);
        cartService.putCart(cartBean);

        res.setContentType("text/html; charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<script>");
        out.println("window.open('/views/cart/cart_popup.jsp', 'cart', 'width=500, height=220, top=300, left=300');");
        out.println("history.back();");
        out.println("</script>");
    }

    @RequestMapping(value = "/update")
    public String update(HttpServletRequest req) {
        System.out.println("CartUpdate");

        int c_id = Integer.parseInt(req.getParameter("c_id")); // 장바구니 상품번호

        if (req.getParameter("letter") != null) { // 편지 삭제에 대한 요청인지 확인하고 맞으면 편지 업데이트
            int c_letter = Integer.parseInt(req.getParameter("letter"));

            cartService.modifyLetter(c_id, c_letter);

        } else { // 아니면 수량 변경에 대한 요청이므로 수량 업데이트

            int add = Integer.parseInt(req.getParameter("add")); // +1 또는 -1 수정

            CartBean cartBean = cartService.selectCart(c_id);

            int c_qty = cartBean.getC_qty();
            int i_id = cartBean.getI_id();

            ItemBean itemBean = itemService.selectItem(i_id);
            int i_inven = itemBean.getI_inven(); // 아이템 재고현황

            if (c_qty == 1 && add != -1) { // 수량이 1 일때 -1계산이 안되도록
                c_qty = c_qty + add;
            } else if (c_qty > 1 && c_qty <= i_inven) { // 1~재고까지 수정가능
                c_qty = c_qty + add;
            }

            cartService.modifyCart(c_id, c_qty);
        }
        return "redirect:cart/cart";
    }

    @RequestMapping(value = "/delete")
    public String delete(@RequestParam(value="c_id") int c_id){
        System.out.println("CartDeleteProAction");
        cartService.dropItem(c_id);
        return "redirect:cart/cart";
    }

    @RequestMapping(value = "/visitor")
    public String listVisitorCart(@RequestParam(value="i_id") int i_id, CartBean cartBean, Model model){
        System.out.println("VisitorCartViewAction");
        cartBean.setC_id(0);
        cartBean.setM_id("visitor");
        model.addAttribute("cartDetail", cartBean);
        ItemBean itemDetail = itemService.selectItem(i_id);
        model.addAttribute("itemDetail", itemDetail);
        return "cart/visitorCart";
    }


}
