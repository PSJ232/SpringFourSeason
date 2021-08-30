package com.itwillbs.service;

import com.itwillbs.dao.OrderDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.text.SimpleDateFormat;

@Service
public class IdMakerServiceImpl implements IdMakerService{

    @Inject
    OrderDAO orderDAO;

    @Override
    public int newId(String table, String colName) {
        System.out.println("IdMakerService - newId()");
        int newId = 0;
        SimpleDateFormat shortDate = new SimpleDateFormat("yyyyMMdd"); // 날짜 포멧 변경
        int now = Integer.parseInt(shortDate.format(System.currentTimeMillis())); // system날짜 기준
        int maxNum = orderDAO.makeId(table, colName);//20210101XX 패턴인지 판별
        if (maxNum / 2000000000 > 0) {//맞으면
            if(maxNum / 100 == now) { //최근 기록날짜가 오늘 날짜와 같은지 판별
                newId = maxNum + 1; // 같다면 추출한 최대숫자에 + 1
            } else {
                newId = (now * 100) + 1; // 다르다면 첫번째 번호이므로 001 부여
            }
        } else if (maxNum >= 0) { //20210101XX 패턴이 아니면 단순숫자증가패턴
            newId = maxNum + 1; //추출한 최대숫자에 + 1
        }
        System.out.println("생성된 id번호 : " + newId);

        return newId;
    }

    @Override
    public int newId(String table, String colName, int option) {
        System.out.println("IdMakerService - newId()");
        // option이 0이면 1부터 순차 번호 부여
        // option이 1이면 현재날짜 + 01부터 순차 번호 부여
        int newId = 0;

        SimpleDateFormat shortDate = new SimpleDateFormat("yyyyMMdd"); // 날짜 포멧 변경
        int now = Integer.parseInt(shortDate.format(System.currentTimeMillis())); // system날짜 기준

        int maxNum = orderDAO.makeId(table, colName);

        if(option == 1) {
            if(maxNum / 100 == now) { //최근 기록날짜가 오늘 날짜와 같은지 판별
                newId = maxNum + 1; // 같다면 추출한 최대숫자에 + 1
            } else {
                newId = (now * 100) + 1; // 다르다면 첫번째 번호이므로 001 부여
            }
        } else if(option == 0) { // 옵션이 0이면 추출한 최대숫자에 + 1만진행
            newId = maxNum + 1;
        }

        System.out.println("생성된 id번호 : " + newId);

        return newId;
    }
}
