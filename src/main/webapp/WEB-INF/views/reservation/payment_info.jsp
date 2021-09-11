<%@page import="java.text.NumberFormat"%>
<%@ page import="com.itwillbs.domain.ReserveBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플라워클래스 예약</title>
<%
ReserveBean rb = (ReserveBean) request.getAttribute("rb");
String name = (String) request.getAttribute("name");
%>

	<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
	<link rel="stylesheet" href='<c:url value="/resources/css/payment_info.css" />'>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
   	<!-- header -->
   	<jsp:include page="../inc/header.jsp" ></jsp:include>

<div class="purchase_complete_container">
	<div class="inbox">
		<div class="checkout">
			<div class="checkout_title"><span title="name"><%=name%></span>님의 클래스 예약이 완료되었습니다.</div>
			<p class="checkout_desc">플로리스트의 정성으로, 사계 클래스를 준비하겠습니다.</p>
			<p class="checkout_order_num">주문번호: #<%=rb.getR_id() %></p>
				<%if(rb.getR_payment().equals("cash")){ %>
					<dl class="bank_info">		
						<dt class="th">
							입금계좌 안내
							<span class="span_th">다음 계좌로 입금해주시면 주문이 완료됩니다.</span>
						</dt>						
						<dd class="td">
							<div class="span_td"><b class="info_name">계좌번호</b> 기업은행 274-072066-01-041</div>
							<div class="span_td"><b class="info_name">예금주</b> (주)사계</div>
							<div class="span_td"><b class="info_name">입금금액</b> <%=NumberFormat.getInstance().format(rb.getR_amount()) %>원</div>
							<div class="span_td"><b class="info_name">보내시는분</b> <%=name%></div>
							<div class="span_td"><b class="info_name">입금기한</b> 주문 후 이틀 이내</div>
						</dd>
					</dl>
				<%} %>
		
			<p class="info_more">상세내역은 아래 주문내역조회에서 확인하실 수 있습니다.</p>
			
		</div>
		
		<div class="checkout_submit_box">
			<div class="submit_button">
				<div class="submit_row">
					<div class="submit_col">
						<button class="shop_continue" onclick="location.href='/'">쇼핑 계속하기</button>
					</div>
					
					<div class="submit_col">
						<button class="show_detail" onclick="location.href='<c:url value="/member/mypage/class"/>'">주문 내역 조회</button>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>