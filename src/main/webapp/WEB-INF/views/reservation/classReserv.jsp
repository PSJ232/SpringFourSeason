<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="com.itwillbs.domain.ClassBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${classBean.f_subject}</title>
    <link href='<c:url value="/resources/css/style.css" />' rel="stylesheet" type="text/css">
    <link href='<c:url value="/resources/css/classReserv.css" />' rel="stylesheet" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>

<%
//	ClassBean cb = (ClassBean) request.getAttribute("cb");
//	DecimalFormat dc = new DecimalFormat("###,###,###,###");
//	String class_price = dc.format(cb.getClass_price());
%>

<body>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" ></jsp:include>
	<!-- header -->
	
	<div id="container"><!-- 전체 -->
		<div class="shop_class_layout"><!-- 예약 정보 입력 레이아웃-->
			<div class="category_product_image shop_class_layout_top">
				<div class="shop_class_mainImg thumnail_main">
					<img src="/resources/admin_layout/upload/${classBean.f_main_img}">
				</div>
				<div class="shop_class_subImg_box">
					<div class="change_img active shop_class_subImg">
						<img src="/resources/admin_layout/upload/${classBean.f_main_img}">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="/resources/admin_layout/upload/${classBean.f_sub_img1}">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="/resources/admin_layout/upload/${classBean.f_sub_img2}">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="/resources/admin_layout/upload/${classBean.f_sub_img3}">
					</div>
				</div>
			</div>
			<div class="shop_class_layout_bottom"><!-- 예약정보 입력 칸 -->
				<form action="<c:url value="/reservation/Insert" />" method="post" name="reservForm" onsubmit="return check()">
					<div>
						<div class="shop_class_infobox1">
							<p class="shop_class_desc">${classBean.f_sub_desc}</p>
							<h2 class="shop_class_name">${classBean.f_subject}</h2>
							<p class="shop_class_price">${class_price}원</p>
						</div>
						<div class="shop_class_infobox2">
							<p>${classBean.f_place}점,</p>
							<p>원데이 클래스</p>
						</div>
						<div class="shop_class_infobox3">
							<span class="shop_class_label">지점</span>
							<ul id="classPlace"></ul>
						</div>
						
						<div class="shop_class_time_box">
							<label class="shop_class_label">수강 시간</label>
							<select name="fd_time" id="classReservNum" class="shop_class_time_input" onchange="timeSelect()">
								<option value="">시간을 선택하세요</option>
							</select>
						</div>
						<div class="shop_class_num_box">
							<label class="shop_class_label">수강 인원</label>
							<span>
								<input class="shop_class_btn class_minus_btn" type="button" value="-" onclick="ctlNum(-1,${classBean.f_price})"></input>
								<input class="shop_class_num" name="r_num" type="text" id="r_num" min="1" value="1" readonly>
								<input class="shop_class_btn"  type="button" value="+" onclick="ctlNum(1,${classBean.f_price})"></input>
							</span>
							<p id="shop_class_num_info"></p>
						</div>
						<div class="shop_class_price_box">
							<div>수강금액</div>
							<div class="total_fee">${class_price}원</div>
						</div>
						<div class="shop_class_total_price">
							<span>총 수강금액</span>
							<span class="total_fee">${class_price} 원</span>
						</div>
					</div>
					<input type="hidden" name="class_price" id="class_price" value="${classBean.f_price}">
					<input type="hidden" name="fc_date" id="date" value="${classBean.f_cdate}">
					<input type="hidden" name="f_id" id="f_id" value="${classBean.f_id}">
					<input type="hidden" name="fd_place" id="place" value="${classBean.f_place}">
					<input type="hidden" name="subject" id="subject" value="${classBean.f_subject}">
					<input type="submit" value="신청하기" class="shop_class_submit_btn">
				</form>
			</div>
		</div>
		<div id="class_detail_page">
		<!-- 상품상세 시작 -->
		<div class="category_product_description">
			<!-- 중간 3버튼 네비게이션   -->
			<ul class="middle_nav">
				<li class="middle_li li_desc active" onclick="location.href='#desc_image'">상품안내</li>
				<li class="middle_li li_review" onclick="location.href='#review_list'">리뷰</li>
				<li class="middle_li li_deli_info" onclick="location.href='#delivery_info'">수강안내</li>
			</ul>
			<div id="desc_image" class="desc_image">
				<img src="/resources/admin_layout/upload/${classBean.f_desc_img}">
			</div>
		</div>
		<!-- 리뷰 시작 -->
		<div id="review_list">
			<div class="review_top">
				<div class="review_title">
				리뷰
					<b class="point_event">리뷰 작성 시 200P 적립 (사진 등록 시 300P)</b>
				</div>
				<div class="review_write_btn">
					<a href="ReviewInsertForm.rv" class="btn_a">리뷰 쓰기</a>
				</div>
			</div>
			<div class="review_inbox">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">
						<button type="button" class="btn best_reviews">
							<span>CLASS 베스트 리뷰</span>
						</button>
					</li>
					<li class="tab-link" data-tab="tab-2">
						<button type="button" class="btn common_reviews">
							<span>이 상품의 리뷰</span>
						</button>
					</li>
				</ul>
				<div class="row">
					<div id="tab-1" class="tab-content current">
						<!-- 베스트 리뷰 jsp파일  -->
						<jsp:include page="../inc/best_review_class.jsp"></jsp:include>
					</div>
					<div id="tab-2" class="tab-content">
					<!-- 일반 리뷰 -->
					</div>
				</div>
			</div>
		</div>
		<div id="delivery_info">
			<div class="delivery_info_tit_tab is_open">
				<div class="intab">
					<button type="button" class="opener" data-type="information">
						<span class="deli_title">수강안내</span>&nbsp;&nbsp;&nbsp;
						<span class="icon_arrow"><img src="/resources/img/arrow_icon1.png" width="20px"></span>
						<span class="icon_arrow" style="display: none"><img src="/resources/img/arrow_icon2.png" width="20px"></span>
					</button>
				</div>
			</div>
			<div class="inner">
				<div id="info_html">
				
					<h3>1. 수강 안내</h3>
	
					<p>[신청 확인] ‘MY PAGE’에서 확인할 수 있습니다.</p>
					
					<p>[문자 안내] 매 수업 시작 전에 카카오톡 알림톡으로 수강 안내를 드립니다.</p>
					
					<p>[불참 안내] 수업에 참석하지 못하신 경우, 재료를 픽업하실 수 있습니다. (수업일 기준으로 2일 내 가능, 택배 및 보강 불가)</p>
					
					<p>[수업 준비물] 공용 앞치마와 공용 꽃가위는 수업시간에 기본으로 제공됩니다.</p>
					
					<p>[재료비] 재료비가 모두 포함된 금액입니다.</p>
					
					<p>[연령 안내] 꽃가위 등&nbsp;날카로운 집기를 사용하여&nbsp;안전상 만 13세 이상부터 수강을 추천드립니다.</p>
					
					<h3>&nbsp;</h3>
					
					<h3>2. 장소 안내</h3>
					
					<p>[수강 장소] 꾸까 송파점 : 서울 송파구 충민로 66 가든파이브라이프&nbsp;NC송파점 패션관 1층 (02-2157-5150)</p>
					
					<p>[주차 안내] 가급적 대중교통을 이용해 주시고 자가용을 이용하실 경우에는 NC송파점&nbsp;주차장을 이용해주시기 바랍니다.</p>
					
					<h3>&nbsp;</h3>
					
					<h3>3. 결제 안내</h3>
					
					<p>[선착순 마감] 결제 및 입금 완료 순으로 마감됩니다.</p>
					
					<p>[무통장 입금] 6시간 이내에 입금 완료되지 않으면 자동 취소됩니다.</p>
					
					<h3>&nbsp;</h3>
					
					<h3>4. 취소 및 환불 정책</h3>
					
					<p>수업 재료 및 클래스 대기자 손실 방지로 인해 클래스 취소 시 환불이 불가할 수 있습니다.</p>
					
					<p>&nbsp;</p>
					
					<p>[정규 클래스] : 취미 클래스, 플로리스트 클래스 등 2회 이상 진행되는 클래스</p>
					
					<p><strong>-</strong>최초 수강 4일 전 : 100% 환불</p>
					
					<p><strong>-</strong>최초 수강 3일 전 ~ 수강 당일 : 클래스 1회 정가 제외한 금액 환불 (재료 픽업 가능)</p>
					
					<p><strong>-</strong>수강 개시 후</p>
					
					<p>1] 다음 수업일 4일 전 : 총 결제 금액에서 ‘수강 횟수 X 클래스 1회 정가’를 제외한 금액 환불</p>
					
					<p>2] 다음 수업일 3일 전 ~ 당일 : 총 결제 금액에서 ‘(수강 횟수+1) X 클래스 1회 정가’를 제외한 금액 환불 (재료 픽업 가능)</p>
					
					<p><br>
					[원데이 클래스] : 1회 진행되는 클래스</p>
					
					<p><strong>-</strong>수업 4일 전 : 100% 환불</p>
					
					<p><strong>-</strong>수업 3일 전 ~ 수업 당일 NO-SHOW : 클래스 변경, 취소 및 환불 불가 (재료 픽업 가능)</p>
					
					<p>&nbsp;</p>
					
					<p><strong>*</strong>수강 신청시 환불 규정에 동의한 것으로 간주됩니다. 신중하게 스케줄 확인 부탁드립니다.</p>
					
				</div>
			</div>
		</div>
	</div> <!-- container 끝 -->
		
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 중간 네비게이션 sticky 기능에 필요 코드  -->
	<div class="sticky">
		<ul class="middle_nav">
			<li class="middle_li li_desc active" onclick="location.href='#desc_image'">상품안내</li>
			<li class="middle_li li_review" onclick="location.href='#review_list'">리뷰</li>
			<li class="middle_li li_deli_info" onclick="location.href='#delivery_info'">수강안내</li>
		</ul>
	</div>

	
	
</body>
<script>
function ctlNum(num, price){
	
	var availNum = Number($('#classReservNum option:selected').text());
	var currentNum = document.getElementById('r_num').value;
	
	if(currentNum>=availNum){
		if(num==1){
			document.getElementById('shop_class_num_info').innerText = "예약인원을 초과하였습니다";
			return;
		} else {
			document.getElementById('r_num').value = Number(currentNum) - 1;
			document.getElementById('shop_class_num_info').innerText = "";
		}
		
	} else if(currentNum == 1){
		if(num==1){
			document.getElementById('r_num').value = Number(currentNum) + 1;
		} 
	} else if(currentNum == 5){
		document.getElementById('shop_class_num_info').innerText = '최대 5명까지 예약할 수 있습니다';
			if(num!=1) {
			document.getElementById('shop_class_num_info').innerText = '';
			document.getElementById('r_num').value = Number(currentNum) - 1;
		}
	} else if(currentNum > 1 && currentNum < 5){
		if(num==1){
			document.getElementById('r_num').value = Number(currentNum) + 1;
		} else {
			document.getElementById('r_num').value = Number(currentNum) - 1;
		}
	} 

	var elements = document.querySelectorAll('.total_fee');
	for(var i=elements.length; i--;){
		elements[i].textContent = (Number(price)*document.getElementById('r_num').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원';
	}

}

	function check(){
		if(document.reservForm.fd_time.value==''){
			alert('선택되지 않은 옵션이 있습니다');
			return false;
		}
	}
	
	function timeSelect(){
		document.getElementById('r_num').value = 1;
		document.getElementById('shop_class_num_info').innerText ='';
	}
	$(document).ready(function(){
		// 중간 네비게이션 바 선택
		$('.middle_li').click(function(){
			if($(this).hasClass('li_desc')){
				$('.middle_li').removeClass('active');
				$('.li_desc').addClass('active');
			}
			if($(this).hasClass('li_review')){
				$('.middle_li').removeClass('active');
				$('.li_review').addClass('active');
			}
			if($(this).hasClass('li_deli_info')){
				$('.middle_li').removeClass('active');
				$('.li_deli_info').addClass('active');
			}
		});
		
		// 중간 네비게이션 바 하단에 보이기
		$(document).scroll(function(){
			var point = $(this).scrollTop();
			if(point > $(".middle_nav").offset().top){
				$('.sticky').addClass('visible');
			} else {
				$('.sticky').removeClass('visible');
			}
			
			if(point+700 > $(".desc_image").offset().top){
				$('.middle_li').removeClass('active');
				$('.li_desc').addClass('active');
			}
			
			if(point+700 > $("#review_list").offset().top){
				$('.middle_li').removeClass('active');
				$('.li_review').addClass('active');
			}
			
			if(point+700 > $("#delivery_info").offset().top){
				$('.middle_li').removeClass('active');
				$('.li_deli_info').addClass('active');
			}
			
		});
		
		// 배송안내 내용 보이기
		$('.intab .opener').click(function(){
			$('#info_html').toggle();
			$('.icon_arrow').toggle();
			
		});
		
		// 리뷰 탭 변경기능
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		
		
	});
</script>
	<script>
		$(document).ready(function(){
	        // $.ajax('ReservClassPlace.od', {
	        $.ajax('<c:url value="/class/reservClassPlace"/>', {
	            type : 'GET',
				dataType : "JSON",
	            data: {
	                'f_subject': $('#subject').val(),
	                'f_cdate': $('#date').val()
	             },
	            success:function(rdata){
	            	let str = JSON.stringify(rdata);
	            	for(var i=0 ; i<rdata.length ; i++){
						var path = "/reservation/classReserve?f_id="+rdata[i].f_id;
						<%--$('#classPlace').append('<li><a class="placebtn_id" href='<c:url value="/reservation/classReserve?f_id=id" />'> place </a></li>');--%>
						$('#classPlace').append('<li><a class="placebtn_'+rdata[i].f_id+'" href=ClassReserv.od?f_id='+rdata[i].f_id+'>'+rdata[i].f_place+'</a></li>');
					}
	            	$('.placebtn_'+$('#f_id').val()).addClass('shop_class_btn_yellow');
	            }
	        }); 
	        
	        // $.ajax('ReservClassTime.od', {
	        $.ajax('<c:url value="/class/reservClassTime"/>', {
	            type : 'GET',
	            data: { 'f_id': $('#f_id').val() },
	            datatype: 'json',
	            success:function(rdata){
					$.each(rdata, function(i, value){
						console.log("i: " + i + ", value: " + value);
		                 	$.ajax('/class/reservClassMember', {
	                		type: 'POST',
	                		data: {
	                			'fc_date': $('#date').val(),
	                			'f_place': $('#place').val(),
	                			'fd_time': value+":00:00",
	                			'f_id': $('#f_id').val()
	                		},
	                		success:function(data){
	                			$('#classReservNum').append('<option value='+value+':00:00  label="'+value+'시 | '+data+'명 가능">'+data+'</option>');
	                		},
	                		async: false
	                	});   
					});
	            },
	            async: false
	        }); 
	        
			// 이미지 전환
			$('.change_img').click(function(){
				$('.change_img').removeClass('active');
				$(this).addClass('active');
				var imgUrl = $(this).find('img').attr('src')
			 	$('.thumnail_main img').attr('src', imgUrl);
			});
			
			$('.shop_class_price').val().toLocaleString();
			$('.total_fee');
			
			//장소 버튼 색 변경
			
		});
	</script>
</html>