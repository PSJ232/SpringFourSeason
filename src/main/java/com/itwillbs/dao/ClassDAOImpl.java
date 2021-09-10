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

}


//import java.util.*;
//        import org.json.simple.*;
//public class ConvertListToJSONArrayTest {
//    public static void main(String[] args) {
//        List<String> list = new ArrayList<String>();
//        list.add("India");
//        list.add("Australia");
//        list.add("England");
//        list.add("South Africa");
//        list.add("West Indies");
//        list.add("Newzealand");
//        // this method converts a list to JSON Array
//        String jsonStr = JSONArray.toJSONString(list);
//        System.out.println(jsonStr);
//    }
//}
