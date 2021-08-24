<%@page import="java.time.LocalDate"%>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/mypage_memberGrade.css" type="text/css" />
</head>
<body>

	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	String m_id = (String) session.getAttribute("m_id");

	String realGrade = "";
	switch (memberMypageDetail.getG_id()) {
	case 3:
		realGrade = "BLACK";
		break;
	case 2:
		realGrade = "RED";
		break;
	case 1:
		realGrade = "GREEN";
		break;
	case 0:
		realGrade = "WHITE";
		break;
	}

	%>
	<!-- 본문 내용 -->
	<div class="memberGrade_div6">
	<article class="memberGrade_article">
		<h3 class="memberGrade_title">
			<span class="memberGrade_span">회원등급</span>
		</h3>
		<div class="memberGrade_div">
			<div class="memberGrade_div_level">
				<dl class="memberGrade_dl">
					<dd class="memberGrade_dd">
						<strong class="memberGrade_strong"><%=realGrade%></strong>
					</dd>
					<dd class="memberGrade_dd2">
						<strong class="memberGrade_strong2"> <%=memberMypageDetail.getM_name()%>님의 <%=LocalDate.now().getMonthValue()%>월
							회원 등급은 <%=realGrade%>입니다.<br>
						</strong><span class="memberGrade_span2"> <%=LocalDate.now().getMonthValue() + 1%>월
							예상 등급은 <%=realGrade%>입니다.
						</span>
					</dd>
				</dl>
				<p class="memberGrade_p">
					<strong class="memberGrade_strong3">100,000원 추가 구매시,</strong> <span
						class="memberGrade_span3">GREEN등급으로 승급이 가능합니다 :)</span>

				</p>
				<p class="memberGrade_p2">
					<span class="memberGrade_span4"> ·최근 6개월간의 총 구매내역을 반영하여
						[발송완료] 기준으로 등급이 산정됩니다.</span><br> <span class="memberGrade_span4">·등급
						산정에 클래스 이용 내역은 반영되지 않습니다.</span><br> <span class="memberGrade_span4">·매월
						1일 새로운 등급이 부여됩니다.</span><br>
				</p>
			</div>
			<div class="memberGrade_div2">
				<div class="memberGrade_div3">
					<div class="memberGrade_div4">
						<h4 class="memberGrade_h4">등급별 혜택 안내</h4>
						<div class="memberGrade_div5">
							<table class="memberGrade_table">
								<caption class="memberGrade_caption"></caption>
								<colgroup>
									<col class="memberGrade_col" width="16%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
									<col class="memberGrade_col2" width="21%">
								</colgroup>
								<tbody>
									<tr>
										<th><span class="memberGrade_span8">회원등급</span></th>
										<td><span class="memberGrade_dt">WHITE</span></td>
										<td><span class="memberGrade_dt2">GREEN</span></td>
										<td><span class="memberGrade_dt3">RED</span></td>
										<td><span class="memberGrade_dt4">BLACK</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">등급 조건<br>(구매
												금액)
										</span></th>
										<td><span class="memberGrade_span8">회원 가입 시</span></td>
										<td><span class="memberGrade_span8">10만 원 이상</span></td>
										<td><span class="memberGrade_span8">40만 원 이상</span></td>
										<td><span class="memberGrade_span8">70만 원 이상</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">승급 시 혜택</span></th>
										<td><span class="memberGrade_span8">1,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">3,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">5,000포인트 적립</span></td>
										<td><span class="memberGrade_span8">10,000포인트 적립</span></td>
									</tr>
									<tr>
										<th><span class="memberGrade_span8">상시 혜택</span></th>
										<td><span class="memberGrade_span8"></span></td>
										<td><span class="memberGrade_span8">2% 상시 할인</span></td>
										<td><span class="memberGrade_span8">2% 상시 할인</span></td>
										<td><span class="memberGrade_span8">5% 상시 할인</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="memberGrade_div3">
				<div class="memberGrade_div4">
					<ol class="memberGrade_ol">
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt">WHITE</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">1,000포인트 적립</span> <span
										class="memberGrade_span6">회원 가입 시</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt2">GREEN</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">3,000포인트 적립</span> <span
										class="memberGrade_span7">2% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 10만 원 이상</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt3">RED</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">5,000포인트 적립</span> <span
										class="memberGrade_span7">2% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 40만 원 이상</span>
								</dd>
							</dl>
						</li>
						<li class="memberGrade_li">
							<dl class="memberGrade_dl2">
								<dt class="memberGrade_dt4">BLACK</dt>
								<dd class="memberGrade_dd3">
									<span class="memberGrade_span5">10,000포인트 적립</span> <span
										class="memberGrade_span7">5% 상시 할인</span> <span
										class="memberGrade_span6">구매금액 70만 원 이상</span>
								</dd>
							</dl>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</article>
	</div>
	</div>

	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>