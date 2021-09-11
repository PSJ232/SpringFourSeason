<%@ page import="com.itwillbs.domain.ReserveBean" %>
<%@ page import="com.itwillbs.domain.ClassBean" %>
<%@ page import="com.itwillbs.domain.ClassDetailBean" %>
<%@ page import="com.itwillbs.domain.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	ReserveBean rb = (ReserveBean) request.getAttribute("reservBean");
	ClassBean cb = (ClassBean) request.getAttribute("fclass");
	ClassDetailBean cdb = (ClassDetailBean) request.getAttribute("fclass_detail");
	MemberBean mb = (MemberBean) request.getAttribute("member");
	int point_discount = (int) request.getAttribute("point_discount");
	float grade_discount = (float) request.getAttribute("grade_discount");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  	  var isSuccess;
  	  var IMP = window.IMP; // 생략해도 괜찮습니다.
  	  IMP.init("imp03490268"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	  
  	  // IMP.request_pay(param, callback) 호출
  	  IMP.request_pay({ // param
  	    pg: "html5_inicis", //결제플랫폼 네이버 카카오 등등
  	    pay_method: "<%=rb.getR_payment()%>", //결제수단 카드 고정
  	    merchant_uid: "<%=rb.getR_id()%>", //제품 id
  	    name: "<%=cb.getF_subject()%>", //제품명
  	    amount: 100, //가격
  	    buyer_email: "<%=mb.getM_id()%>", //구매자 이메일(=사계 아이디)
  	    buyer_name: "<%=mb.getM_name()%>", //구매자 이름
  	    buyer_tel: "<%=mb.getM_phone()%>", //구매자 전화번호

  	  }, function (rsp) { // callback
  	    if (rsp.success) {
  	    	//결제 완료시
  	    	 // jQuery로 HTTP 요청
  	    	var msg = '결제가 완료되었습니다.';
  	        msg += '고유ID : ' + rsp.imp_uid;
  	        msg += '상점 거래ID : ' + rsp.merchant_uid;
  	        msg += '결제 금액 : ' + rsp.paid_amount;
  	        msg += '카드 승인번호 : ' + rsp.apply_num;
  	        console.log(msg);
  	        isSuccess = true;
  	        location.href='./reservation/payment_info.jsp?name=<%=mb.getM_name()%>&reservBean=<%=rb%>';
  	    } else {
  	    	//결제 실패시 
  	    	//ReservMiddleCancle.ad
  	    	//
  	    	var msg = '';
  	        msg += rsp.error_msg;
  	      	location.href='Class.shop';
<%--   	        location.href='ReservMiddleCancle.od?imp_uid=<%=rb.getR_id()%>&merchant_uid=<%=rb.getF_id()%>'; --%>
  	    }
  	  alert(msg);
  	  });
  	  
  	  
  	});
  </script>
  <!-- 
거의 편지 수준이네여 보시고 삭제해주세요
	결제창에 넘어가기전에 ReservInsert.ad를 통해서 받은 값을 먼저 db에 저장하고 결제 페이지(현재페이지)로 넘어갑니다
	보안떄문에 아이엠포트에서 이런 방식을 추천하더라구요 하지만 저희는 아이엠포트에서 결제관련
	api를 받지 못하니까 그냥 패스하시고 결제 성공시에 payment 테이블에 저장하셔도 될것같습니다
	저는 이미 구현하고 그 사실을 알아서 결제 중간 취소시에 reservation 행 삭제하는 reserMiddleCancleAction을 만들었습니당
	 -->
</head>
<body>
</body>
</html>