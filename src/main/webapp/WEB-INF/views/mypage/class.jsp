<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/utility.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/mypage_class.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/mypage.css" />' rel="stylesheet" type="text/css">
<script>
	$(document).ready(function() {
		$.ajax('<c:url value="/class/mypage/planned"/>',
				{
				type : 'GET',
				success : function(rdata) {
					if (rdata.trim() != "") {
							$('#planned_myclass_list').append(rdata);
					} else {
							$('#planned_myclass_list').append(
									'<tr class="planned_myclass_nothing">'
										+ '<td colspan="3">'
										+ '<p>등록된 클래스 정보가 존재하지 않습니다.</p>'
										+ '<button onclick="location.href='+ './' +  'class="btn_wide btn_yellow">클래스 보러가기</button>'
										+ '</td></tr>');
					}
				}});

		$.ajax('<c:url value="/class/mypage/past"/>', {
				type : 'GET',
				success : function(rdata) {
					if (rdata.trim() != "") {
						$('#past_myclass_list').append(rdata);
					} else {
						$('#past_myclass_list').append(
								'<tr><td colspan="2">수강한 클래스 내역이 없습니다</td></tr>');
					}
				}
			});
	});
</script>
</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>

	<jsp:include page="/member/mypagebanner"></jsp:include>

	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

		<div id="myclass_container">
			<div class="myclass_layout_top">
				<h2 class="myclass_title">현재 수강(예정) 중인 클래스</h2>
				<div class="myclass_box">
					<table class="myclass_list_layout">
						<colgroup>
							<col width="22%">
							<col width="58%">
							<col width="20%">
						</colgroup>
						<thead class="myclass_list_head">
							<th><span>신청 일자</span></th>
							<th><span>클래스 정보</span></th>
							<th><span>상태</span></th>
						</thead>
						<tbody id="planned_myclass_list"></tbody>
					</table>
				</div>
			</div>
			<div class="myclass_layout_bottom">
				<div>
					<h2 class="myclass_title">지난 클래스</h2>
					<span class="myclass_toggle">&nbsp;</span>
				</div>
				<div class="myclass_box past_myclass">
					<table class="myclass_list_layout">
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<thead class="myclass_list_head2">
							<th><span>신청 일자</span></th>
							<th><span>클래스 정보</span></th>
						</thead>
						<tbody id="past_myclass_list"></tbody>
					</table>
				</div>
			</div>
		</div>

	</div>


	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>