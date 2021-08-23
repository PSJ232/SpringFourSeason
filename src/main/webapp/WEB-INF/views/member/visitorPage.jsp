<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 비회원 주문 조회</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_orderHistoryDetail.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/mypage_subscribe.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
OrderBean order = (OrderBean) request.getAttribute("visitorOrder");
OrderDetailBean orderDetail = (OrderDetailBean) request.getAttribute("orderDetail");
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String od_invoice = orderDetail.getOd_invoice();
String status = "주문접수";
if(!od_invoice.equals("주문접수") && orderDetail.getOd_confirm()==1) {
	status = "배송완료<br>" + od_invoice;
} else if(!od_invoice.equals("주문접수")){
	status = "배송중<br>" + od_invoice;
}

String[] address = order.getO_address().split("&");

int o_payment = order.getO_payment();
String payment = "";
switch (o_payment) {
case 0:
	payment = "무통장입금";
	break;
case 1:
	payment = "신용카드";
	break;
}
%>
</head>
<body>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


		<!-- 본문 내용 -->
<div class="mypage_orderHistoryDetail_all">
<h1 id="mypage_orderHistoryDetail_tltle">비회원 주문 상세 정보</h1>
<dl id="mypage_orderHistoryDetail_dl">
	<dt id="mypage_orderHistoryDetail_tltle_h3">주문내역상세</dt>
	<dd id="mypage_orderHistoryDetail_dd">#<%=order.getO_id() %></dd>
	</dl>
	<table class="mypage_orderHistoryDetail_table_t" >
		<tr>
			<td id="mypage_orderHistoryDetail_table_td_s" >배송일</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >상품명</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >가격</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >배송비</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >상태</td>
		</tr>
		<tr>
			<td><%=orderDetail.getOd_delivery_date() %></td>
			<td><%=itemDetail.getI_name() %></td>
			<td><%=NumberFormat.getInstance().format(order.getO_amount()) %></td>
			<td>0 원</td>
			<td><%=status %></td>
		</tr>
	</table>
	<div id="mypage_orderHistoryDetail_del_div">
	<h3 id="mypage_orderHistoryDetail_tltle_del_h3" >배송지정보<br>
	<dl id="mypage_orderHistoryDetail_del_dl">
		<dt id="mypage_orderHistoryDetail_del_dt">수령인이름 <%=order.getO_receiver() %><br></dt>
	<dt id="mypage_orderHistoryDetail_del_dt">주소 <%=address[0]+" "+address[1]+" "+address[2] %><br></dt>
	<dt id="mypage_orderHistoryDetail_del_dt">연락처 <%=order.getO_phone() %><br></dt>
	
	</dl>
	편지정보-비회원<br>
	상품명 <%=itemDetail.getI_name() %>
	<textarea rows="10" cols="20"><%=orderDetail.getOd_message() %></textarea><br>
	
	<h3 id="mypage_orderHistoryDetail_tltle_h3">결제정보</h3><br>
	<span id="mypage_orderHistoryDetail_del_span_l">상품 합계</span> <span id="mypage_orderHistoryDetail_del_span_r"> <%=NumberFormat.getInstance().format(order.getO_amount()) %>원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">배송비</span> <span id="mypage_orderHistoryDetail_del_span_r"> 0원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">쿠폰 할인</span> <span id="mypage_orderHistoryDetail_del_span_r"> -0원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">총 결제금액</span> <span id="mypage_orderHistoryDetail_del_span_r"> <%=NumberFormat.getInstance().format(order.getO_amount()) %>원</span><br> 
	
	결제방법:<%=payment %><br>
	결제일시:<%=sdf.format(order.getO_rdate2())%><br>
	
	*현금 영수증 발행은 1:1문의를 이용 부탁드립니다.<br>
	
	<input type="button" value="홈으로 돌아가기" onclick="location.href='./'">
	
</div>
</div>
	
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>