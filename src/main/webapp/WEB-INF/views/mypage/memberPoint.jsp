<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="./css/mypage_memberPoint.css"
	type="text/css" />
</head>
<body>

	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

	<%
	String m_id = (String) session.getAttribute("m_id");
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	ArrayList<ReviewBean> pbList = (ArrayList<ReviewBean>) request.getAttribute("pbList");
	String division = "";
	String record = "";
	%>


	
	<!-- 본문 내용 -->
	<article class="memberPoint_article">
		<h3 class="memberPoint_h3">
			<span class="memberPoint_span">포인트</span>
		</h3>
		<div class="memberPoint_div">
			<dl class="memberPoint_dl">
				<dt class="memberPoint_dt">현재 사용가능한 적립금</dt>
				<dd class="memberPoint_dd">1,000원</dd>
			</dl>
			<div class="memberPoint_div2">
				<div class="memberPoint_div3">
					<div class="memberPoint_div4">
						<h4 class="memberPoint_h4">포인트 이용내역</h4>
					</div>
					<div class="memberPoint_div5">
						<div class="memberPoint_div6">
							<table border="1" class="memberPoint_table">
								<caption class="memberPoint_caption"></caption>
								<colgroup>
									<col width="23%">
									<col width="23%">
									<col width="34%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th><span class="memberPoint_span2">날짜</span></th>
										<th><span class="memberPoint_span2">구분</span></th>
										<th><span class="memberPoint_span2">내역</span></th>
										<th><span class="memberPoint_span2">적립금</span></th>
									</tr>
								</thead>
								<%
								for (int i = 0; i < pbList.size(); i++) {
									
									if (pbList.get(i).getR_point() == 200) {
										division = "적립";
									} else if (pbList.get(i).getR_point() == 300) {
										division = "적립";
									} else {
										division = "사용";
									}

									if (pbList.get(i).getR_point() == 200) {
										record = "리뷰 작성(사진 미포함)";
									} else if (pbList.get(i).getR_point() == 300) {
										record = "리뷰 작성(사진 포함)";
									} else {
										record = "포인트 사용";
									}
									
									if(pbList.get(i).getR_point()==0) {%>
										
									<%} else {%>
										<tbody>
										<tr>
											<td><span><%=pbList.get(i).getR_rdate()%></span></td>
											<td><span class="memberPoint_span3"><%=division%></span></td>
											<td><span class="memberPoit_span4"><%=record%></span></td>
											<td><span><%=pbList.get(i).getR_point()%></span></td>
										</tr>
										</tbody>
									<%}%>
								<%
								}
								%>
								<tbody>
								<tr>
									<td><%=memberMypageDetail.getM_rdate()%></td>
									<td><span class="memberPoint_span3">적립</span></td>
									<td><span class="memberPoit_span4">회원 가입 감사 적립금</span></td>
									<td>1000</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>
	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>

