<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 확정</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_orderHistory.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/mypage_subscribe.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
String od_id = request.getParameter("od_id");
%>
</head>
<body>
<div class="mypage_confirmPurchase_all">

<h1 id="mypage_confirmPurchase_h1">구매 확정</h1>
<form action="ConfirmPurchasePro.od" method="post" >
<h3 id="mypage_confirmPurchase_h3">구매를 확정하시겠습니까?</h3>
	<input type="hidden" value="<%=od_id %>" name="od_id">
	<input id="mypage_orderHistory_btn" type="submit" value="구매 확정">
	<input id="mypage_confirmPurchase_cbtn" type="button" value="취소" onclick="javascript:window.close()">
</form>

</div>
</body>
</html>