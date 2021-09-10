<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwillbs.domain.MemberBean"%>
<%@ page import="com.itwillbs.domain.ClassBean" %>
<%@ page import="com.itwillbs.domain.ClassDetailBean" %>

<% 
int r_num = (int) request.getAttribute("r_num");
MemberBean mb = (MemberBean) request.getAttribute("member");
ClassBean fclass = (ClassBean) request.getAttribute("fclass");
ClassDetailBean fclassDetail = (ClassDetailBean)request.getAttribute("fclass_detail");
String startDate = (String) request.getAttribute("startDate");
String fd_time = (String) request.getAttribute("fd_time");

float grade = (float) request.getAttribute("grade");
DecimalFormat dc = new DecimalFormat("###,###,###,###");
String class_price = dc.format(fclass.getF_price()*r_num);
String gradeApplyPrice = dc.format(fclass.getF_price()*r_num*grade);
int gradeDiscount = (int)(fclass.getF_price()-(grade*fclass.getF_price()));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	플라워클래스 예약</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/utility.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/reservpay.css" />'>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" ></jsp:include>
	<!-- header -->

	<div id="container">
		<form action="/reservation/InsertPro" method="post" name="reservForm" onsubmit="return checkValue()">
			<h1 class="rpay_title">오프라인 주문</h1>
			<div class="rpay_container">				
				<div class="rpay_confirm_box">
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">수강 내용 확인</span>
					</h5>
					<div class="rpay_content">
						<div class="rpay_content_left">
							<img alt="class exmaple image" src="/resources/admin_layout/upload/<%=fclass.getF_main_img()%>">
						
						</div>
						<div class="rpay_content_right">
							<div class="rpay_subcontent_left">
								<span class="rpay_class_name">[<%=fclassDetail.getFd_place()%>]<%=fclass.getF_subject() %></span><br>
								<span>수강시작일 : <%=startDate %>요일, <%=fclassDetail.getFd_date() %>, <%=fd_time%></span><br>
								<span>지점 : <%=fclassDetail.getFd_place()%>점</span><br>
								<span>수강인원 : <%=r_num %>명</span><!-- 요건 따로 값 저장하기 -->
							</div>
							<div class="rpay_subcontent_right">
								<span><%=class_price%></span><span>원</span> <!-- 인원에 따른 가격 계산 -->
								<input type="hidden" id="fee" value="<%=fclass.getF_price()*r_num%>">
							</div>
						</div>
					</div>
				</div>
				
				<div class="rpay_content_box">
					<!-- m_id로  m_name, m_phone가져오기-->
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">신청인 정보</span>
					</h5>
					<ul>
						<li class="rpay_subtitle_layout">
							<label class="rpay_label">이름</label>
							<input class="rpay_input_long" type="text" value="<%=mb.getM_name()%>" readonly>
						</li>
						<li class="rpay_subtitle_layout">
							<label class="rpay_label">연락처</label>
							<input class="rpay_input_long" type="text" value="<%=mb.getM_phone()%>" readonly>
						</li>
					</ul>
				</div>
				
				
				<div class="rpay_content_box">
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">쿠폰 / 포인트</span>
					</h5>
					<div class="rpay_point_content">
						<label class="rpay_label">포인트</label>
						<!-- point 테이블에서 m_id가지고 조회  -->
						<!-- js로 가진 포인트보다 더 많은 경우
								사용가능한 포인트는 000입니다 알리기
								더 적거나 같은 경우(사용가능한 경우) 
								최종 결제금액의 포인트 할인에 값 전달-->
						
						<div class="rpay_price_right">
							<input class="rpay_input_mid" type="text" id="use_point" name="use_point" placeholder="0" value="" oninput="colorChange()">
							<input class="rpay_mid_btn" type="button" id="pointApplybtn" value="적용"> 
							<div>
								<span>- 사용가능 포인트 : </span><span id="avail_point"><%=mb.getM_point()%></span>
								<input type="checkbox" id="pointAll" value="<%=mb.getM_point()%>">
								<span>전액사용</span>
							</div>
						</div>

					</div>
				</div>
				
				<div class="rpay_content_box">
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">최종 결제 금액</span>
					</h5>
					<div>
						<div class="rpoay_discount_confirm">
							<span>포인트 할인</span>
							<span id="use_point2"> - 0원</span>
						</div>
						
						<div class="rpoay_discount_confirm">
							<span>등급 할인</span>
							<span> - <%=gradeDiscount%>원</span>
						</div>										
					</div>
					<div class="rpoay_total_price_box">
					<!-- 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이상일 때
							3만원
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이하일 때 
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격 표시 할지 의논필요-->
						<div>
							<span>총 결제 금액(예약금)</span>
						</div>
						<div><span id="total_fee_print"><%=gradeApplyPrice%></span><span>원</span></div>
					</div>
				</div>
				
				
				<div class="rpay_content_box">
					<h5 class="rpay_paymethod_subtitles">
						<span class="rpay_subtitle">결제 수단</span>
					</h5>
					<table class="rpay_paymethod">
						<tr>
							<td><button type="button" id="rpay_cash" class="rpay_btn" onclick="btnclick('cash')">현금</button></td>
							<td><button type="button" id="rpay_card" class="rpay_btn" onclick="btnclick('card')">카드</button></td>
						</tr>
					</table>
				</div>
				<!-- r_date service 페이지에서 생성 -->
				<!-- r_id 생성 -->
				<div>
					<!-- 처음에 등급 할인이 적용된 가격 설정, gradeApplyPrice와 동일-->
					<input type="hidden" id="total_fee" name="total_fee" value="<%=(int)(fclass.getF_price()*r_num*grade)%>">
					<!-- 등급할인 금액 -->
					<input type="hidden" id="grade_discount" name="grade_discount" value="<%=gradeDiscount%>">
					<!-- 포인트 할인금액 -->
					<input type="hidden" id="r_payment" name="r_payment" value="">
					<input type="hidden" id="point_discount" name="point_discount" value="">
					<input type="hidden" id="m_id" value="<%=mb.getM_id()%>">
					<input type="hidden" name="f_id" value="<%=fclass.getF_id()%>">
					<input type="hidden" value="<%=r_num%>">
					<input type="hidden" name="fd_id" value="<%=fclassDetail.getFd_id()%>">
					<input type="hidden" name="r_num" value="<%=r_num%>">
					<div class="rpay_btn_box">
						<input type="submit" class="btn_wide btn_yellow" value="결제하기">
					</div>
				</div> 
			</div>	
		</form>
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			var grade_discount = $('#grade_discount').val();//등급 할인 금액
			$('#use_point').val(0);
			
			//포인트 전부 사용 체크박스 클릭
			$('#pointAll').change(function(){
				if($('#pointAll').is(':checked')){
	 				$('#use_point').val($('#pointAll').val());
	 				$('.rpay_mid_btn').addClass('rpay_mid_btn_yellow');
				}
			});
			
			//포인트 적용 버튼 클릭시
			$('#pointApplybtn').click(function(){
				let use_point = $('#use_point').val();//사용할 포인트
				let avail_point = Number($('#avail_point').text().toString());//사용가능한 포인트
				let grade_apply_fee = $('#total_fee').val();//등급할인이 적용된(포인트 적용 안된 가격)
				$('#pointAll').prop('checked', false);

				if(parseInt(use_point) > avail_point) {
					alert('사용가능한 포인트는 '+avail_point+'입니다');
					return;
				} else if (parseInt(use_point) > grade_apply_fee){
					alert('use_point-'+use_point+ 'grade_apply_fee - '+grade_apply_fee+' 포인트가 금액을 초과하였습니다');
					$('#use_point').val(0);
					return;
				}else {
					let fee = $('#fee').val(); //fee 인원에 따른 계산
					if(use_point.trim()!=""){
						$('#use_point2').html('- '+use_point+'원'); 
						$('#point_discount').val(use_point);
						$('#total_fee').val((parseInt(fee) - (parseInt(grade_discount) + parseInt(use_point))));
						$('#total_fee_print').html((parseInt(fee) - (parseInt(grade_discount) + parseInt(use_point))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						$('#use_point').val('');
						$('.rpay_mid_btn').removeClass('rpay_mid_btn_yellow');
						
					}
				}
			});

		});
		
		//결제 수단
		function btnclick(paymethod){
			if(paymethod=='card'){
				$('#rpay_cash').removeClass('clicked');
				$('#rpay_card').addClass('clicked');
			} else {
				$('#rpay_card').removeClass('clicked');
				$('#rpay_cash').addClass('clicked');
			}
			
			$('#r_payment').val(paymethod);
		}
		
		//포인트 적용 색 변환
		function colorChange(){
			$('.rpay_mid_btn').addClass('rpay_mid_btn_yellow');
			
		}
		
		function checkValue(){
			if($('#r_payment').val()==''){
				alert('선택되지 않은 옵션이 있습니다');
				return false;
			}
		}
	</script>
</body>
</html>