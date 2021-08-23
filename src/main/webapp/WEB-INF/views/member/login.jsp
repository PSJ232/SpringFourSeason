<%@page import="vo.CartBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 로그인</title>
<%
CartBean cartDetail = (CartBean) request.getAttribute("cartDetail"); // 비회원주문을 위한 정보
String sub_option = (String)request.getAttribute("sub_option"); // 정기구독 옵션 정보
%>
<link href="css/login.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<link href="css/mypage.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
	 
</head>
	  
<body>

	<header>
  		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<div class="mypage_container">
	<div class="login_all">
	<h1 id="login">로그인</h1>
	<form action="MemberLoginPro.me" method="post">
		<input type="email" name="m_id" id="inp" placeholder="아이디(이메일)"><br>
		<input type="password" name="m_pass" id="inp" placeholder="비밀번호"><br>
		<input type="checkbox" id="checklogin" name="autoLogin">로그인 상태 유지<br>
		<input type="submit" value="로그인" class="loginbutton"><br>
		<a id="fin" href="MemberFindId.me">아이디 찾기</a> 
		<a id="fin" href="findPass.jsp">비밀번호 찾기</a><br>
		
		<p id="sns">SNS계정으로 간편 로그인</p> <br> 
		<a href="https://kukka.kr/account/social-login/facebook/"> <img id="log_img" src="img/facebook.png"></a>
		<a href="https://kukka.kr/account/social-login/naver/"> <img id="log_img" src="img/naver.png"></a> 
		<a href="https://kukka.kr/account/social-login/kakao/"> <img id="log_img" src="img/kakao.png"></a><br>
		<input type="button" value="회원가입" class="joinbutton" onclick="location.href='MemberJoin.me'"><br>
	</form>
		<%if(cartDetail!=null){ %>
		<form action="VisitorOrderNow.od" method="post">
			<input type="hidden" name="c_delivery_date" value="<%=cartDetail.getC_delivery_date()%>">
			<input type="hidden" name="i_id" value="<%=cartDetail.getI_id()%>">
			<input type="hidden" name="c_qty" value="<%=cartDetail.getC_qty()%>">
			<input type="hidden" name="c_letter" value="<%=cartDetail.getC_letter()%>">
			<%if(sub_option!=null){ %>
			<input type="hidden" name="sub_option" value="<%=sub_option%>">
			<%} %>
			<input class="loginsubmit" type="submit" value="할인 없이 비회원 구매"><br>
		</form>
		<%} %>
	<p id="now">
		지금 회원가입 하시면 <span id="p1">1,000p</span> 바로 지급!
	</p>
	<br>
	<p id="nonmember"><a href="VisitorLogin.me">비회원 주문 조회</a></p>
	</div>
	</div>

	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>