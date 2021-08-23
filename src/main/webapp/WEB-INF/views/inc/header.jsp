<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Advent+Pro:wght@100;200&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Tinos:ital@1&display=swap" rel="stylesheet">
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	
<script>
	$(document).ready(function() {
		//상대적인 좌표 값을 반환, .offset()가 반환 하는 객체는 left와 top 속성을 제공
		//top 속성을 이용해서 메뉴의 수직 위치를 구함
		var menu_offset = $('.main_menu').offset();
		//스크롤 바를 스크롤할 때 매개변수로 전달된 함수를 실행시킴
		$(window).scroll(function() {
			//문서의 스크롤바 위치와 메뉴의 수직 위치를 비교해서
			//문서의 스크롤바 위치가 메뉴의 수직 위치보다 크면(위치로 표현하면 아래)
			if ($(document).scrollTop() > menu_offset.top) {
				//메뉴에 menu-fixed 클래스를 추가해서 메뉴를 고정시킴
				$('.main_menu').addClass('menu_fixed');
			} else {
				//메뉴에서 menu-fized 클래스를 제거해서 메뉴를 수직으로 이동할 수 있도록 처리함
				$('.main_menu').removeClass('menu_fixed');
			}
		});
	});
</script>
<%
String m_id = (String) session.getAttribute("m_id");

// 자동로그인을 위한 쿠키확인작업
String cookie_check = request.getHeader("Cookie");
if (cookie_check != null) {
	if (m_id == null) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("m_id")) {
				m_id = cookie.getValue();
				session.setAttribute("m_id", m_id);
			}
		}
	}
}

String moveMypage = "";
if(m_id == null) {
	moveMypage = "MemberLogin.me";
} else {
	moveMypage = "MypageOrderStatus.me";
}
%>
</head>
<body>
	<header id="container">
		<div>
			<!--광고-->
		</div>
		<div class="nav_service_area">
			<%
			if (m_id == null) {
			%>
				<a class="nav_service_item" href='<c:url value="/member/login" />'>로그인</a>
				<i class="nav_service_bar"></i>
				<a class="nav_service_item"	href='<c:url value="/member/join" />'>회원가입<span class="color_blue fontweight_600">(1000포인트 지급!)</span></a>
				<i class="nav_service_bar"></i>
				<a class="nav_service_item fontweight_600">기업제휴</a>
			<%
			} else { 
				if (m_id.equals("admin@admin.com")) {
			%>
					<a href="DashBoard.ad">관리자페이지</a>
					<i class="nav_service_bar"></i>
				<%
				}
				%>
				<a class="nav_service_item"	href='<c:url value="/member/logout" />'>로그아웃</a>
				<i class="nav_service_bar"></i>
				<a class="nav_service_item fontweight_600">기업제휴</a>
			<%
			}
			%>
		</div>
		<div>

			<nav class="main_menu">
				<div class="nav_bar_logo">
					<a href="FourSeason.shop"><span class="logo_small_black">Four Seasons</span></a>
				</div>
				<ul class="nav_bar_list">
					<li class="item"><a href="Subscription.shop">꽃 정기구독</a></li>
					<li class="item"><a href="Flowers.shop">꽃다발</a></li>
					<li class="item"><a href="Quick.shop">당일배송</a></li>
					<li class="item"><a href="Class.shop">플라워클래스</a></li>
				</ul>
				<div class="nav_bar_icon">
					<a href=<%=moveMypage %>><img src='<c:url value="/resources/img/profile.png" />' alt="go to mypage" class="nav_icon"></a>
					<a href="Cart.cr"><img src='<c:url value="/resources/img/bag.png" />' alt="shopping cart" class="nav_icon"></a>
				</div>
			</nav>
		</div>
	</header>
</body>
</html>