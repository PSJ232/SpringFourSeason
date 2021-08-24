<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/mypage.css" />' rel="stylesheet" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<%--<%--%>
<%--ArrayList<Integer> purchaseCount = (ArrayList<Integer>)request.getAttribute("purchaseCount"); --%>
<%--ArrayList<Integer> makingCount = (ArrayList<Integer>)request.getAttribute("makingCount"); --%>
<%--ArrayList<Integer> sendCount = (ArrayList<Integer>)request.getAttribute("sendCount"); --%>
<%--System.out.println("purchaseCount = " + purchaseCount.size());--%>
<%--System.out.println("makingCount = " + makingCount.size());--%>
<%--System.out.println("sendCount = " + sendCount.size());--%>
<%--%>--%>

<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>
		<!-- 본문 내용 -->
		<div id="mypage_order_delevery_box">
			<div class="mypage_center_c">
				<div class="mypage_center_i">
					<h4 class="mypage_center_subject">
						<span class="mypage_title_l">주문 / 배송 조회</span> <span
							class="mypage_title_r">(최근 1개월)</span>
					</h4>
		
		
					<div class="mypage_center_list">
						<dl class="mypage_center_dl">
							<dt class="mypage_center_dt">0</dt>
							<dd class="mypage_center_dd">
								결제대기 <a href=""> </a>
							</dd>
						</dl>
						<dl class="mypage_center_dl">
<%--							<dt class="mypage_center_dt"><%=purchaseCount.size() %></dt>--%>
							<dd class="mypage_center_dd">
								결제완료 <a href=""> </a>
							</dd>
						</dl>
						<dl class="mypage_center_dl">
<%--							<dt class="mypage_center_dt"><%=makingCount.size() %></dt>--%>
							<dd class="mypage_center_dd">
								상품준비중<a href=""></a>
							</dd>
						</dl>
						<dl class="mypage_center_dl">
<%--							<dt class="mypage_center_dt"><%=sendCount.size() %></dt>--%>
							<dd class="mypage_center_dd">
								발송완료<a href=""></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		
	
			<div class="mypage_main">
				<h3 class="mypage_main_subject">나의 주문내역</h3>
				<dl class="mypage_main_dl">
					<dt class="mypage_main_dt">Flower Subscriptions</dt>
					<dt class="mypage_main_dd_one">2주에 한번, 소중한 나를 위한 행복으로 채워보세요!</dt>
					<dt class="mypage_main_dd_two">꾸까 꽃 정기구독</dt>
					<dd class="mypage_main_dd_three">
						<input class="mypage_order_btn" type="button" value="보러가기">
					</dd>
				</dl>
			</div>
		</div>

	</div>
	
	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>