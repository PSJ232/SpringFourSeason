<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_left_div">
		<section class="mypage_left_section">
			<div id="mypage_left_menu_top">
				<h2 class="mypage_left_title">나의 사계</h2>
				<ul class="mypage_menu_list">
					<li class="mypage_list"><a class="mypage_list_a"
						href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="MypageSubscribe.od">나의 정기구독</a></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="MyClass.me">클래스 수강내역</a></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="ReviewInsertForm.rv">상품 리뷰</a><span class="point_up">리뷰 작성 시 200P 적립</span></li>
				</ul>
			</div>

			<div id="mypage_left_menu_bottom">
				<h2 class="mypage_left_title">개인정보 관리</h2>
				<ul class="mypage_menu_list">
					<li class="mypage_list"><a class="mypage_list_a"
						href='<c:url value="/member/update"/>'>개인정보 수정</a><span class="anniversary">기념일을 등록해보세요!</span></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="MemberMypageGradeDetail.me">회원등급</a></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="MemberMypagePointDetail.me">포인트</a></li>
					<li class="mypage_list"><a class="mypage_list_a" href="QnaList.qna">1:1
							문의내역</a></li>
					<li class="mypage_list"><a class="mypage_list_a"
						href="Faq.me">자주묻는질문</a></li>
				</ul>
			</div>
		</section>
	</div>


</body>
</html>