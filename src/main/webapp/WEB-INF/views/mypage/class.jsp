<%@page import="vo.MyClassBean"%>
<%@page import="java.util.ArrayList"%>
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
<link href="css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="./css/mypage_class.css">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/style.css">
<script>
	$(document)
			.ready(
					function() {
						$
								.ajax(
										'plannedMyClass.me',
										{
											type : 'GET',
											success : function(rdata) {

												if (rdata.trim() != "") {
													$('#planned_myclass_list')
															.append(rdata);
												} else {
													$('#planned_myclass_list')
															.append(
																	'<tr class="planned_myclass_nothing">'
																			+ '<td colspan="3">'
																			+ '<p>등록된 클래스 정보가 존재하지 않습니다.</p>'
																			+ '<button onclick="href='+'#'+'" class="btn_wide btn_yellow">클래스 보러가기</button>'
																			+ '</td></tr>');
												}
											}
										});

						$
								.ajax(
										'pastMyClass.me',
										{
											type : 'GET',
											success : function(rdata) {
												if (rdata.trim() != "") {
													$('#past_myclass_list')
															.append(rdata);
												} else {
													$('#past_myclass_list')
															.append(
																	'<tr><td colspan="2">수강한 클래스 내역이 없습니다</td></tr>');
												}
											}
										});
					});
</script>
</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

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