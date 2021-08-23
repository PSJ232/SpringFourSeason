<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 로그인</title>
<link href="css/login.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet"></head>
</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>

<div class="find">
	<h1>비밀번호 찾기</h1>
	<p id="joinnumber">ID(이메일주소)를 입력하시면,<br>
	   해당 메일로 비밀번호 재설정 링크가 발송됩니다.</p>
	   
	   <input id="inp" type="text" placeholder="이메일(예시:kukka@kukk.kr)"><br>
	   <input class="loginbutton" type="submit" value="확인">
	
	   <p id="call">- 유효한 메일 계정이 아니거나, 해당 메일 계정이 휴먼상태일 경<br>
	   		우 메일 수신이 어려울 수 있습니다.</p>

	   <p id="call">- kukka 메일을[수신차단] 하셨을 경우 메일 수신이 어려울 수 있<br>
	   	 습니다.</p>

	   <p id="call">- 확인이 되지 않으시면 kukka 고객센터로 연락주세요.<br>
         (1661-1031, 평일 AM10시-PM6시 / 점심시간 PM1시-2시 제외)<br>
         로 연락주세요.</p>
  </div>       
         
    <footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>