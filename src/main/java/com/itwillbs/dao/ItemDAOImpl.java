package com.itwillbs.dao;

import com.itwillbs.domain.ItemBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class ItemDAOImpl implements ItemDAO{

    @Inject
    SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.ItemMapper";

    @Override
    public ItemBean getItem(int i_id) {
        return sqlSession.selectOne(namespace + ".getItem", i_id);
    }
}

//package dao;
//
//        import static db.JdbcUtil.close;
//
//        import java.sql.Connection;
//        import java.sql.PreparedStatement;
//        import java.sql.ResultSet;
//        import java.sql.SQLException;
//        import java.util.ArrayList;
//
//        import db.JdbcUtil;
//        import vo.ItemBean;
//
//public class ItemDAO {
//
//    private static ItemDAO instance;
//
//    private ItemDAO() {
//    }
//
//    public static ItemDAO getInstance() {
//        // 기존 BoardDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
//        if (instance == null) {
//            instance = new ItemDAO();
//        }
//
//        return instance;
//    }
//
//    // ----------------------------------------------------------------------------------
//    // 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
//    Connection con;// 멤버변수 Connection 타입 선언
//
//    public void setConnection(Connection con) {
//        this.con = con;
//    }
//
//    public ItemBean getItem(int i_id) { // 등록된 아이템에 대한 디테일 정보를 가져옴
//        System.out.println("ItemDAO - getItem()");
//
//        ItemBean itemDetail = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//
//        try {
//            String sql = "SELECT * FROM item WHERE i_id=?";
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, i_id);// 아이디=이메일
//            rs = pstmt.executeQuery();
//
//            if (rs.next()) {
//                itemDetail = new ItemBean();
//                itemDetail.setI_id(rs.getInt("i_id"));
//                itemDetail.setI_name(rs.getString("i_name"));
//                itemDetail.setI_desc(rs.getString("i_desc"));
//                itemDetail.setI_price(rs.getInt("i_price"));
//                itemDetail.setI_inven(rs.getInt("i_inven"));
//                itemDetail.setI_img(rs.getString("i_img"));
//                itemDetail.setI_subimg2(rs.getString("i_subimg2"));
//                itemDetail.setI_subimg3(rs.getString("i_subimg3"));
//                itemDetail.setI_subimg4(rs.getString("i_subimg4"));
//                itemDetail.setI_rdate(rs.getTimestamp("i_rdate"));
//                itemDetail.setI_discount(rs.getFloat("i_discount"));
//                itemDetail.setI_size(rs.getString("i_size"));
//                itemDetail.setI_dpstatus(rs.getString("i_dpstatus"));
//                itemDetail.setI_itemstatus(rs.getString("i_itemstatus"));
//                itemDetail.setI_detailpage(rs.getString("i_detailpage"));
//                itemDetail.setI_category(rs.getInt("i_category"));
//
//            }
//
//        } catch (SQLException e) {
//            System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
//        } finally {
//            JdbcUtil.close(rs);
//            JdbcUtil.close(pstmt);
//        }
//
//        return itemDetail;
//    }
//
//    // 상품목록 가져오기
//    public ArrayList<ItemBean> selectItemList() {
//        System.out.println("ItemDAO - selectItemList()");
//
//        ArrayList<ItemBean> itemList = null;
//        ItemBean ib = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//
//        // 최근 등록한 상품부터 내림차순으로 SELECT
//        try {
//            String sql = "SELECT * FROM item ORDER BY i_rdate DESC";
//            pstmt = con.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            itemList = new ArrayList<ItemBean>();
//
//            while (rs.next()) {
//                ib = new ItemBean();
//                ib.setI_id(rs.getInt("i_id"));
//                ib.setI_name(rs.getString("i_name"));
//                ib.setI_desc(rs.getString("i_desc"));
//                ib.setI_price(rs.getInt("i_price"));
//                ib.setI_inven(rs.getInt("i_inven"));
//                ib.setI_img(rs.getString("i_img"));
//                ib.setI_subimg2(rs.getString("i_subimg2"));
//                ib.setI_subimg3(rs.getString("i_subimg3"));
//                ib.setI_subimg4(rs.getString("i_subimg4"));
//                ib.setI_rdate(rs.getTimestamp("i_rdate"));
//                ib.setI_discount(rs.getFloat("i_discount"));
//                ib.setI_size(rs.getString("i_size"));
//                ib.setI_dpstatus(rs.getString("i_dpstatus"));
//                ib.setI_itemstatus(rs.getString("i_itemstatus"));
//                ib.setI_detailpage(rs.getString("i_detailpage"));
//                ib.setI_category(rs.getInt("i_category"));
//
//                itemList.add(ib);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rs);
//            close(pstmt);
//        }
//
//        return itemList;
//    }
//
//    // 오버로딩 - 정렬 매개변수 (꽃다발 당일배송 카테고리)
//    public ArrayList<ItemBean> selectItemList(int sort) {
//        System.out.println("ItemDAO - selectItemList(int sort)");
//
//        ArrayList<ItemBean> itemList = null;
//        ItemBean ib = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        // 1 추천순, 2 인기순, 3 신상품순
//        try {
//            String sql = "";
//            switch (sort) {
//                case 3:
//                    sql = "SELECT * FROM item ORDER BY i_rdate DESC";
//                    break;
//                case 2:
//                    sql = "SELECT *, sum(orders_detail.od_qty) selling "
//                            + "FROM item "
//                            + "LEFT JOIN orders_detail "
//                            + "ON item.i_id = orders_detail.i_id "
//                            + "GROUP BY i_name "
//                            + "ORDER BY selling DESC";
//                    break;
//                case 1:
//                    sql = "SELECT *, AVG(r_rate) rate "
//                            + "FROM item "
//                            + "LEFT JOIN orders_detail "
//                            + "ON item.i_id = orders_detail.i_id "
//                            + "LEFT JOIN review "
//                            + "ON orders_detail.od_id = review.od_id "
//                            + "GROUP BY i_name "
//                            + "ORDER BY rate DESC";
//            }
//
//            pstmt = con.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            itemList = new ArrayList<ItemBean>();
//
//            while (rs.next()) {
//                ib = new ItemBean();
//                ib.setI_id(rs.getInt("i_id"));
//                ib.setI_name(rs.getString("i_name"));
//                ib.setI_desc(rs.getString("i_desc"));
//                ib.setI_price(rs.getInt("i_price"));
//                ib.setI_inven(rs.getInt("i_inven"));
//                ib.setI_img(rs.getString("i_img"));
//                ib.setI_subimg2(rs.getString("i_subimg2"));
//                ib.setI_subimg3(rs.getString("i_subimg3"));
//                ib.setI_subimg4(rs.getString("i_subimg4"));
//                ib.setI_rdate(rs.getTimestamp("i_rdate"));
//                ib.setI_discount(rs.getFloat("i_discount"));
//                ib.setI_size(rs.getString("i_size"));
//                ib.setI_dpstatus(rs.getString("i_dpstatus"));
//                ib.setI_itemstatus(rs.getString("i_itemstatus"));
//                ib.setI_detailpage(rs.getString("i_detailpage"));
//                ib.setI_category(rs.getInt("i_category"));
//
//                itemList.add(ib);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rs);
//            close(pstmt);
//        }
//
//        return itemList;
//    }
//
//    // 상품등록 db작업 처리
//    public int insertItem(ItemBean ib) {
//        System.out.println("itemDAO - insertItem");
//        // db작업 처리된 행 수
//        int insertCount = 0;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        System.out.println("I_subimg4() "+ib.getI_subimg4());
//
//        try {
//            String sql = "INSERT INTO item VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, ib.getI_name());
//            pstmt.setString(2, ib.getI_desc());
//            pstmt.setInt(3, ib.getI_price());
//            pstmt.setInt(4, ib.getI_inven());
//            pstmt.setString(5, ib.getI_img());
//            pstmt.setString(6, ib.getI_subimg2());
//            pstmt.setString(7, ib.getI_subimg3());
//            pstmt.setString(8, ib.getI_subimg4());
//            pstmt.setTimestamp(9, ib.getI_rdate());
//            pstmt.setFloat(10, ib.getI_discount());
//            pstmt.setString(11, ib.getI_size());
//            pstmt.setString(12, ib.getI_dpstatus());
//            pstmt.setString(13, ib.getI_itemstatus());
//            pstmt.setString(14, ib.getI_detailpage());
//            pstmt.setInt(15, ib.getI_category());
//
//            insertCount = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("SQL 구문 오류발생 - " + e.getMessage());
//        } finally {
//            close(pstmt);
//        }
//
//        return insertCount;
//    }
//
//    public int updateItem(ItemBean ib) {
//        System.out.println("ItemDAO - updateItem()");
//        int updateCount = 0;
//        PreparedStatement pstmt = null;
//
//        try {
//            String sql = "UPDATE item SET i_name=?, i_desc=?, i_price=?, i_inven=?, i_img=?, i_subimg2=?,"
//                    + "i_subimg3=?, i_subimg4=?, i_discount=?, "
//                    + "i_size=?, i_dpstatus=?, i_itemstatus=?, i_detailpage=?, i_category=? WHERE i_id=?";
//
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, ib.getI_name());
//            pstmt.setString(2, ib.getI_desc());
//            pstmt.setInt(3, ib.getI_price());
//            pstmt.setInt(4, ib.getI_inven());
//            pstmt.setString(5, ib.getI_img());
//            pstmt.setString(6, ib.getI_subimg2());
//            pstmt.setString(7, ib.getI_subimg3());
//            pstmt.setString(8, ib.getI_subimg4());
//            pstmt.setFloat(9, ib.getI_discount());
//            pstmt.setString(10, ib.getI_size());
//            pstmt.setString(11, ib.getI_dpstatus());
//            pstmt.setString(12, ib.getI_itemstatus());
//            pstmt.setString(13, ib.getI_detailpage());
//            pstmt.setInt(14,  ib.getI_category());
//            pstmt.setInt(15, ib.getI_id());
//
//            updateCount = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return updateCount;
//    }
//
//    public int deleteItem(int i_id) {
//        System.out.println("ItemDAO - deleteItem()");
//
//        int deleteCount = 0;
//        PreparedStatement pstmt = null;
//
//        try {
//            String sql = "DELETE FROM item WHERE i_id=?";
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, i_id);
//            deleteCount = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return deleteCount;
//    }
//
//    public int updateInven(int i_id, int od_qty) {
//        System.out.println("ItemDAO - updateInven()");
//
//        int updateCount = 0;
//        PreparedStatement pstmt = null;
//
//        try {
//            String sql = "UPDATE item SET i_inven=i_inven-? WHERE i_id=?";
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, od_qty);
//            pstmt.setInt(2, i_id);
//            updateCount = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return updateCount;
//    }
//
//    public ArrayList<ItemBean> getItemRanking() {
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        ArrayList<ItemBean> rankingItems = new ArrayList<ItemBean>();
//        try {
//            String sql = "SELECT *, sum(orders_detail.od_qty) selling "
//                    + "FROM item "
//                    + "LEFT JOIN orders_detail "
//                    + "ON item.i_id = orders_detail.i_id "
//                    + "GROUP BY i_name "
//                    + "ORDER BY selling DESC LIMIT 5";
//            pstmt = con.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            while(rs.next()) {
//                ItemBean ib = new ItemBean();
//                ib = new ItemBean();
//                ib.setI_id(rs.getInt("i_id"));
//                ib.setI_name(rs.getString("i_name"));
//                ib.setI_desc(rs.getString("i_desc"));
//                ib.setI_price(rs.getInt("i_price"));
//                ib.setI_inven(rs.getInt("i_inven"));
//                ib.setI_img(rs.getString("i_img"));
//                ib.setI_subimg2(rs.getString("i_subimg2"));
//                ib.setI_subimg3(rs.getString("i_subimg3"));
//                ib.setI_subimg4(rs.getString("i_subimg4"));
//                ib.setI_rdate(rs.getTimestamp("i_rdate"));
//                ib.setI_discount(rs.getFloat("i_discount"));
//                ib.setI_size(rs.getString("i_size"));
//                ib.setI_dpstatus(rs.getString("i_dpstatus"));
//                ib.setI_itemstatus(rs.getString("i_itemstatus"));
//                ib.setI_detailpage(rs.getString("i_detailpage"));
//                ib.setI_category(rs.getInt("i_category"));
//                rankingItems.add(ib);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rs);
//            close(pstmt);
//        }
//        return rankingItems;
//    }
//
//    public ArrayList<ItemBean> getItemList(int i) {
//        System.out.println("ItemDAO - getItemList");
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
//
//        String sql = "SELECT * FROM Item where i_category = ?";
//        try {
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, i);
//            rs = pstmt.executeQuery();
//            while(rs.next()) {
//                ItemBean ib = new ItemBean();
//                ib.setI_id(rs.getInt("i_id"));
//                ib.setI_name(rs.getString("i_name"));
//                ib.setI_desc(rs.getString("i_desc"));
//                ib.setI_price(rs.getInt("i_price"));
//                ib.setI_img(rs.getString("i_img"));
//                ib.setI_discount(rs.getFloat("i_discount"));
//                ib.setI_size(rs.getString("i_size"));
//                itemList.add(ib);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rs);
//            close(pstmt);
//        }
//
//        return itemList;
//    }
//
//    public ArrayList<ItemBean> getItemListLimit6(int i) {
//        System.out.println("ItemDAO - getItemList");
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
//
//        String sql = "SELECT * FROM Item where i_category = ? limit 6";
//        try {
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, i);
//            rs = pstmt.executeQuery();
//            while(rs.next()) {
//                ItemBean ib = new ItemBean();
//                ib.setI_id(rs.getInt("i_id"));
//                ib.setI_name(rs.getString("i_name"));
//                ib.setI_desc(rs.getString("i_desc"));
//                ib.setI_price(rs.getInt("i_price"));
//                ib.setI_img(rs.getString("i_img"));
//                ib.setI_discount(rs.getFloat("i_discount"));
//                ib.setI_size(rs.getString("i_size"));
//                itemList.add(ib);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(rs);
//            close(pstmt);
//        }
//
//        return itemList;
//    }
//
//}

