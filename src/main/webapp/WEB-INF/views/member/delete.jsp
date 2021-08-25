<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 회원 탈퇴</title>
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/delete.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/mypage.css" />' rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	<div class="mypage_delete_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>
		
		<div class="mypage_delete_box">
			<div class="mypage_center_c">
				<div class="mypage_center_i">
					<span class="delete_notice_title"><h3>회원 탈퇴 안내</h3></span>
				</div>				
			</div>

		
			<div class="delete_box">			
				<div class="inbox">
					<div class="inner">
					
						<form action='<c:url value="/member/delete"/>' id="formDelete" method="post">
							<div class="delete_form_wrap">
							
									<div class="delete_notice">
										<span title="bold">${memberBean.m_name}</span> 고객님, <br>
										탈퇴를 원하신다니 마음이 아프네요.<br>
										
										지금 탈퇴하시면 고객님의 ${memberBean.m_point} 포인트는 자동 소멸됨을 알려드립니다.<br>
									</div>
				
									<div class="delete_title">
										<span class="sadly_bye">회원 탈퇴하기</span>
									</div>
					
									<div class="password_check">

										<div class="row">
											<div class="delete_name">비밀번호 확인(필수)</div>
											<div class="delete_input">
												<input type="password" class="textBox" name="m_pass" required>
											</div>										
										</div>

									<div class="row">
										<div class="delete_name">사계에 아쉬운 점<br>(선택)</div>
										<div class="delete_input">
											<input type="text" class="delete_reason">
										</div>
									</div>
									
								</div>
						
							<div class="delete_submit">
								<div class="member_delete">
									<input type="button" value="취소" class="btn_delete" onclick="history.back()">
									<input type="hidden" name="m_id" value="${memberBean.m_id}">
									<input type="submit" value="탈퇴" class="btn_delete">
								</div>
							</div>
					</div>
		
				</form>
				</div>
			
			</div><!-- inbox -->
		</div><!-- delete_box -->
			
	</div> <!-- mypage_delete_box -->	
		
</div><!-- mypage_delege_container -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>