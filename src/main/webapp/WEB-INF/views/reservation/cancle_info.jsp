<%@page import="java.text.NumberFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
	<link href='<c:url value="/resources/css/payment_info.css" />' rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
   	<!-- header -->
   	<jsp:include page="../inc/header.jsp" ></jsp:include>

<div class="purchase_complete_container">
	<div class="inbox">
		<div class="checkout">
			<div class="checkout_title">클래스 예약이 정상적으로 취소되었습니다.</div>
			<p class="checkout_desc">더좋은 클래스로 찾아오겠습니다 감사합니다</p>
		</div>
		
		<div class="checkout_submit_box">
			<div class="submit_button">
				<div class="submit_row">
					<div class="submit_col">
						<button class="shop_continue" onclick="location.href='./'">쇼핑 계속하기</button>
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