<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 비회원 주문 조회</title>
<link rel="stylesheet" href="css/visitor_login.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
  	<!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
 	 <!-- header -->
 	 
 	 <div class="container">
 	<div class="visitorLogin_all">
	<h3 id="visitorLogin_title">비회원 구매 조회</h3>
	<form action="VisitorPage.me" method="post">
		<input id="visitorLogin_inp" type="text" name="o_sender" placeholder="주문자명"><br>
		<input id="visitorLogin_inp" type="number" name="o_id" placeholder="주문번호"><br>
		<input id="visitorLogin_smt" type="submit" value="확인하기">
	</form>
	<input id="visitorLogin_btn" type="button" value="회원으로 구매하셨나요?" onclick="location.href='MemberLogin.me'">
	</div>	
 	 </div>
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>