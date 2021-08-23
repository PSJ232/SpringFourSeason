<%@page import="vo.AnniversaryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 기념일 등록하기</title>
<link rel="stylesheet" href="css/anniversary.css" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
<%if (request.getAttribute("annDetail") == null) {%>
	<div class="anniversary_container">
		<div class="page_title">
			<span class="title">기념일 등록하기</span>
		</div>	
		
		<div class="ann_content_box">
			<div class="inbox">
				<div class="inner">
					<form action="MemberAnnInsertPro.me" class="formAnniversary" method="post">
						<div class="ann_form">
						
							<div class="row">
								<div class="ann_name">기념일<span class="textStar">*</span></div>
							    <div class="ann_input">
							    	<input type="date" class="textBox" name="a_date" placeholder="날짜를 선택해주세요." required><!-- (클릭하면 달력뜨도록 가능?) -->
							    </div>
							</div>
							
							<div class="row">
								<div class="ann_name">기념일 이름<span class="textStar">*</span></div>
								<div class="ann_input">
									<input type="text" class="textBox"name="a_name" placeholder="기념일 명을 입력해주세요." required>
								</div>
							</div>
							
							<div class="row">
								<div class="ann_name">반복 주기<span class="textStar">*</span></div>
								<div class="ann_input">
									<select name="a_repeat" size="1"  class="ann_select"  required>
										<option value="0" selected>주기를 선택해주세요.</option>
										<option value="1">매년</option>
										<option value="100">100일마다</option>
									</select>
								</div>
							</div>
							
							<div class="ann_submit_row">						
								<div class="ann_submit_area">
									<input type="submit" class="btn_submit" value="등록하기">
								</div>	
							</div>
							
						</div>
					</form>
				</div> <!--  inner -->
			</div> <!--  inbox -->	
		</div>	<!-- content_box -->
	</div> <!-- container -->
	
					
<%} else {
AnniversaryBean annDetail = (AnniversaryBean) request.getAttribute("annDetail");
%>
	<div class="anniversary_container">	
		<div class="page_title">
			<span class="title">기념일 수정하기</span>
		</div>	
		
		<div class="ann_content_box">
			<div class="inbox">
				<div class="inner">
					<form action="MemberAnnUpdatePro.me" class="formAnniversary" method="post">
						<div class="ann_form">
						
							<div class="row">
								<div class="ann_name">기념일<span class="textStar">*</span></div> 
								<div class="ann_input">
									<input type="date" class="textBox" name="a_date" value="<%=annDetail.getA_date()%>" required>
								</div>
							</div>
							
							<div class="row">
								<div class="ann_name">기념일 이름<span class="textStar">*</span></div>
								<div class="ann_input">
									<input type="text" class="textBox" name="a_name" value="<%=annDetail.getA_name()%>" required>
								</div>
							</div>
							
							<div class="row">
								<div class="ann_name">반복 주기<span class="textStar">*</span></div>
								<div class="ann_input">						
									<select name="a_repeat" size="1" class="ann_select">								
										<option value="0" <%if(annDetail.getA_repeat()==0){%>selected<%}%>>주기를 선택해주세요.</option>
										<option value="1" <%if(annDetail.getA_repeat()==1){%>selected<%}%>>매년</option>
										<option value="100" <%if(annDetail.getA_repeat()==100){%>selected<%}%>>100일마다</option>
									</select>								
								</div>
							</div>
							
							<div class="ann_submit_row">						
								<div class="ann_submit_area">
									<input type="hidden" name="a_id" value="<%=annDetail.getA_id()%>">							
									<input type="submit" class="btn_submit" value="수정하기">
								</div>
							</div>
							
						</div> <!-- ann-form -->
					</form>
				</div><!-- inner -->
			</div><!-- inbox-->
		</div><!-- container -->			
	</div>
<%
}
%>

</body>
</html>