<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	
	<div class="find">
	<h1>아이디 찾기</h1>
	<p id="joinnumber">가입하실 때 입력하셨던<br> 
	전화번호를 입력해주세요.</p>
	<form action="MemberFindIdResult.me" method="post">
		<select name="phone1" id="phone">
			<option>010</option>
			<option>011</option>
			<option>016</option>
			<option>017</option>
			<option>018</option>
			<option>019</option>
		</select> - <input type="text" name="phone2" id="phone"> - <input type="text" name="phone3" id="phone"> <br>
			<input class="loginbutton" type="submit" value="확인">
	</form>
	<div class="find_class">
	<p id="call">- 확인이 되지 않으시면 kukka 고객센터로 연락주세요.<br>
	(1661-1031, 평일 AM10시-PM6시 / 점심시간 PM1시-2시 제외)<br>
	로 연락주세요.</p>
	</div>
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>