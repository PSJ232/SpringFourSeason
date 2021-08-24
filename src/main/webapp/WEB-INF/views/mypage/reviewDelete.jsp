<%@page import="vo.MemberBean"%>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_review.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function button_click() {
	history.back();
}
</script>
</head>
<body>
<%
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail"); 
String m_id = (String)session.getAttribute("m_id");
int od_id = Integer.parseInt(request.getParameter("od_id"));

String realGrade = "";
switch(memberMypageDetail.getG_id()) {
	case 3: realGrade = "BLACK"; break;
	case 2: realGrade = "RED"; break;
	case 1: realGrade = "GREEN"; break;
	case 0: realGrade = "WHITE"; break;
}

%>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

 <!-- 본문 내용 -->
 <div class="mypage_reviewDelete_all">
 
 <form action="ReviewDeletePro.rv" method="post" name="fr">
해당 리뷰를 삭제하시겠습니까?
<input type="hidden" name="od_id" value="<%=od_id %>"><br>
<input id="mypage_reviewDelete_smt" type="submit" value="삭제">
<input id="mypage_reviewDelete_btn" type="button" value="취소" onclick="button_click();">
 </form>


 </div>
 
	</div>



	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>