<%@ page import="com.itwillbs.domain.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	Integer subscribeCnt = (Integer) request.getAttribute("subscribeCnt");
	System.out.println("subscribeCnt = " + subscribeCnt);
	// 포인트 100 단위 , 표시 설정
	String point = String.format("%,d", memberBean.getM_point());
	// 등급 변환
	String realGrade = "";
	switch (memberBean.getG_id()) {
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
	<!-- 본문 메인 상단 -->
	<div class="mypage_all">
		<div class="mypage_top">
			<div class="mypage_banner">

				<h4 id="mypage_user_name">
					<strong><%=memberBean.getM_name()%> 님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div class="mypage_top_right_c">
					<div id="mypage_top_right_i">
						<dl class="mypage_top_dl">
							<dt class="mypage_top_dt">등급정보</dt>
							<dd class="mypage_top_dd">
								<%=realGrade%><a href="MemberMypageGradeDetail.me" id="grade">
								</a>
							</dd>
						</dl>
						<dl class="mypage_top_dl">
							<dt class="mypage_top_dt">포인트</dt>
							<dd class="mypage_top_dd">
								<%=point %><a href="MemberMypagePointDetail.me" id="point">
								</a>
							</dd>
						</dl>
						<dl class="mypage_top_dl">
							<dt class="mypage_top_dt">나의구독</dt>
							<dd class="mypage_top_dd">
								<%=subscribeCnt%> <a href="" id="myinfo"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>