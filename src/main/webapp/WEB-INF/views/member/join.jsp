<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 회원가입</title>
<link href='<c:url value="/resources/css/join.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
		
		function checkPhone(phone) {
			var regex = new RegExp(/\d{3}\d{3,4}\d{4}/);
			var element = document.getElementById('checkPhoneResult');
			if(document.formJoin.m_phone.value=="") {
				element.innerHTML = "- 전화번호를 입력해주세요."
				return;
			}
		      
		      if(regex.exec(phone)) {
		         element.innerHTML = '- 인증번호를 발송했습니다.'; //미구현부분
		         checkPhoneResult = true;
		      } else {
		         element.innerHTML = '- 형식에 맞지 않는 번호입니다.';
		         checkPhoneResult = false;
		      }    
		}
		
	$(document).ready(function() {
		$('#termCAll').click(function() {
	
			   if($("input:checkbox[id='termCAll']") .prop("checked")) {
			      $("input[type=checkbox]") .prop("checked" , true);
			      $('#question_box input[type="checkbox"]') .prop("checked" , false);
			   } else {  
			      $("input[type=checkbox]") .prop("checked", false);
			   }
		});
		
		$('#idCheckBtn').click(function(){
			var regex = new RegExp(/\S{2,}(@)\S{2,}(.)\S{2,}/); // 2자이상@2자이상.2자이상 조합이어야 이메일 형식으로 인정
			var testResult = regex.test($("#m_id").val());
			if ($("#m_id") == ""){
				$('#checkIdResult').html('- 이메일 (아이디)를 입력해 주세요.');
			} 
			if(testResult) {
				$.ajax({
					url : 'IdCheck.me',
					type : "post",
					datatype : "text",
					data:{m_id:$('#m_id').val()},
					success:function(rdata) {
						$('#checkIdResult').html(rdata);
					}
				});
			} else {
				$('#checkIdResult').html('- 이메일 형식으로 입력해주세요.');
				checkIdResult = false;
			}
		});
		
	});
	
	   function checkPassword(password) { // 패스워드 입력값 검증
		      var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		      var engUpperCaseRegex = /[A-Z]/;
		      var engLowerCaseRegex = /[a-z]/;
		      var digitRegex = /[0-9]/;
		      var specRegex = /[!@#$%]/;
		      
		      var element = document.getElementById('checkPasswordResult');
		      
		      if(lengthRegex.exec(password)) {
		         var safetyCount = 0;
		         if(engUpperCaseRegex.exec(password)) safetyCount++;
		         if(engLowerCaseRegex.exec(password)) safetyCount++;
		         if(digitRegex.exec(password)) safetyCount++;
		         if(specRegex.exec(password)) safetyCount++;
		         
		         switch (safetyCount) {
		            case 4: 
		               element.innerHTML = '안전';
		               element.style.color = 'green';
		               checkPasswordResult = true;
		               break;
		            case 3: 
		               element.innerHTML = '보통';
		               element.style.color = 'orange';
		               checkPasswordResult = true; 
		               break;
		            case 2: 
		               element.innerHTML = '위험';
		               element.style.color = 'red';
		               checkPasswordResult = true; 
		               break;
		            case 1: 
		               element.innerHTML = '사용불가';
		               element.style.color = 'black';
		               checkPasswordResult = false;
		               break;
		         }
		         
		      } else {
		         element.innerHTML = '- 8~16자리 영문자,숫자,특수문자 조합 필수!';
		         element.style.color = 'black';
		         checkPasswordResult = false; 
		      }
		      
		   }
	   
	   function checkPasswordConfirm(password) { // 패스워드 일치 확인
		      var element = document.getElementById('passwordConfirmResult');
		      
		      if(password == document.formJoin.m_pass.value) {
		         element.innerHTML = '- 패스워드 일치';
		         element.style.color = 'black';
		         checkPasswordConfirmResult = true; 
		      } else {
		         element.innerHTML = '- 패스워드 불일치';
		         checkPasswordConfirmResult = false; 
		      }
		      
		   }
	   
	   
	   function checkForm() {
		      if(checkIdResult && checkPasswordResult && checkPasswordConfirmResult) {
		         return true;
		      } else {
		         alert('입력 항목을 확인하세요!');
		         return false;
		      }
		   }
</script>
</head>
<body>
<div class="container">
   	<jsp:include page="../inc/header.jsp" flush="true" />
 	<!-- header -->
   	<div class="top_banner">
		<div class="page_title"><h2>회원가입</h2></div>
	</div>
	
	<div class="join_us_box">

		<div class="inbox">
			<div class="inner">	
		 
					<form action='<c:url value="/member/join" />' name=formJoin method="post" onsubmit="return checkForm()">
						<div class="join_info">						
							 <div class="row">
							 	<div class="join_name">이메일 (아이디)</div>
							 	<div class="join_input">
							 		<input type="email" name="m_id" id="m_id" class="textBox" placeholder="예)four@season.kr" required>
									<input type="button" id="idCheckBtn" class="btn" onclick="checkId(m_id.value)" value="중복확인">
									<span id="checkIdResult" class="checkMessage">&nbsp;</span><!-- 아이디 유효성 검사 -->
								</div>
							</div>
								
							 <div class="row">
							 	<div class="join_name">비밀번호</div>
							 	<div class="join_input">
							 		<input type="password" name="m_pass" class="textBox" placeholder="비밀번호를 입력해주세요." required onkeyup="checkPassword(this.value)">
							 		<span id="checkPasswordResult" class="checkMessage">&nbsp;</span>  
							 	</div>
							</div>
							
							 <div class="row">
							 	<div class="join_name">비밀번호확인</div>
							 	<div class="join_input">
							 		<input type="password" class="textBox" placeholder="비밀번호를 한 번 더 입력해주세요." required onkeyup="checkPasswordConfirm(this.value)">
							 		<span id="passwordConfirmResult" class="checkMessage">&nbsp;</span>
							 	</div>
							 </div>
							 
							<div class="row">
								<div class="join_name">이름</div>
								<div class="join_input">
								 <input type="text" name="m_name" class="textBox" placeholder="이름을 입력해주세요." required><br>
								 </div>
							</div>
							
							 <div class="row">
							 	<div class="join_name">휴대폰 본인인증</div>
							 	<div class="join_input"><input type="tel" name="m_phone" class="textBox" placeholder="' - '없이 숫자만 입력해주세요." required>
													   <input type="button" id="phoneCheckBtn" class="btn" onclick="checkPhone(m_phone.value)" value="인증번호 받기">
		 											   <span id="checkPhoneResult" class="checkMessage">&nbsp;</span><br>
	 							</div> <!-- 폰번호 유효성 검사 -->
	 						</div>
	 							
							<div class="row">
								<div class="join_name">&nbsp;</div>
								<div class="join_input"><input type="tel" class="textBox" placeholder="인증번호를 입력해주세요.">
								  										   <input type="button" class="btn" value="확인">
																		   <span id="checkIdfNumResult" class="checkMessage">&nbsp;</span><br>
								</div><!-- 인증번호 유효성 검사 -->
							</div>
								
							 <div class="row">
							 	<div class="join_name">생년월일</div>
							 	<div class="join_input"><input type="text" class="textbox_long" name="year" placeholder="년도) 1999" required>
													 					   <input type="text" class="textbox_short" name="month" placeholder="월" required>
													 					   <input type="text" class="textbox_short" name="day" placeholder="일" required><br><br>
								</div>
							</div>
							 <div class="row">
							 	<div class="join_name">성별</div>
							 	<div class="join_input">
							 		<input type="radio" id="gender1" class="radio_gender" name="m_gender" value="1" checked><label for="gender1" class="gender_label active">여성</label>
     	  	   						<input type="radio" id="gender0" class="radio_gender" name="m_gender" value="0"><label for="gender0" class="gender_label">남성</label>
								</div>
							</div>
							
						</div><!-- join_info  -->
					
										
					<div class="terms_box">
					
						<div class="terms_title">
							 <div class="row">
							 	<div class="join_name">이용약관 동의</div>
							 	<div class="join_input">&nbsp;</div>
							 </div>
						</div>
						<br>
						
						<div class="terms_list">
								<div class="agreement_list">
										<div class="agree_all"><label><input type="checkbox" id="termCAll"><span class="terms_txt">모두 동의합니다.</span></label></div>
										<div class="agree_part"><label><input type="checkbox"  id="termC1" required><span class="terms_txt">이용약관 동의</span></label><span class="textRed"> (필수)</span></div>
										<div class="agree_part"><label><input type="checkbox"  id="termC2" required><span class="terms_txt">개인정보 수집, 이용동의</span></label><span class="textRed"> (필수)</span></div>
										<div class="agree_part"><label><input type="checkbox"  id="termC3" required><span class="terms_txt">개인정보 이용 동의</span></label><span class="textRed"> (필수)</span></div>
										<div class="agree_part"><label><input type="checkbox" name="m_agree"  id="termC4" ><span class="terms_txt">이벤트, 혜택정보 수신 동의 (선택)</span></label></div><!-- 원래 name이 m_agree였음 -->
								</div>
						</div>
								
						<div class="terms_link">
							<span class="agree_terms">
								<span class="terms_conditions" onclick="window.open('./member/terms_conditions.jsp', '약관 및 개인정보', 'width=600, height=1000, top=0'); return false;">
								이용약관 보기</span> · 
								<span class="personal_info" onclick="window.open('./member/personal_info.jsp', '약관 및 개인정보', 'width=600, height=1000, top=0'); return false;">
								개인정보 처리방침 보기</span></span>
						</div>
								
						<div class="terms_submit">
								<div class="submit_button">
									<input type="submit" class="btn_submit" value="회원가입">
								</div>
						</div>							
					</div><!-- terms_box -->										
				</form>
					
				</div><!-- inner 닫 -->
			</div><!-- inbox 닫 -->
 		</div> <!-- join_us_box 닫기 -->		

	
	<jsp:include page="../inc/footer.jsp" ></jsp:include>
  </div> <!-- container 닫기 -->
	
	
</body>
<script type="text/javascript">
	// 성별 선택 색상 변경
	$(document).ready(function(){
		$('.gender_label').click(function(){
			$('.gender_label').removeClass('active');
			$(this).addClass('active');
		});
	
	});
</script>
</html>