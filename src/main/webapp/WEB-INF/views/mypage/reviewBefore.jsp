<%@page import="java.text.NumberFormat"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/mypage_reviewBefore.css">
<link rel="stylesheet" href="./css/utility.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			$('.tabs').find('li').removeClass('current_clicked');
			$(this).addClass('current_clicked');
			$("#"+tab_id).addClass('current');
		})
	})
</script>
<%
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
String m_id = (String) session.getAttribute("m_id");

ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>) request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>) request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>) request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>) request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>) request.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailArrayList");
ArrayList<Integer> deleteOdList = (ArrayList<Integer>) request.getAttribute("deleteOdList");

String realGrade = "";
switch (memberMypageDetail.getG_id()) {
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

request.setAttribute("memberMypageDetail", memberMypageDetail);
%>
</head>
<body>

	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


		<!-- 본문 내용 -->
		<section class="mypage_reviewBefore_all">

			<h2 id="mypage_reviewBefore_title">상품 리뷰</h2>

		
			<ul class="tabs">
				<li class="tab-link current_clicked" data-tab="tab-1">작성 가능한 후기</li>
				<li class="tab-link" data-tab="tab-2">내 리뷰</li>
			</ul>
			
			<div class="mypage_reviewBefore_main">
				<div id="tab-1" class="tab-content current">
					<table id="mypage_reviewBefore_table" >
						<colgroup>
							<col width="22%">
							<col width="58%">
							<col width="20%">
						</colgroup>
						<thead class="mypage_reviewBefore_head">
						<tr>
							<th><span>주문 일자</span></th>
							<th><span>상품 정보</span></th>
							<th><span>상태</span></th>
						</tr>
						</thead>
						
						<%
						if (nonOrderDetailArrayList.isEmpty()) {
						%>
						<tbody class="mypage_reviewBefore_can">
							<tr>
								<td colspan="3">
									<span>작성 가능한 후기가 존재하지 않습니다.</span> 
									<input class="btn_wide btn_yellow" type="button" onclick="location.href='Flowers.shop'" value="꽃다발 보러가기">
								</td>
							</tr>
						</tbody>
						<%
						} else {
						for (int i = 0; i < nonOrderArrayList.size(); i++) {
							int sumAmount = (nonOrderArrayList.get(i).getO_amount() + nonOrderArrayList.get(i).getO_point()
							+ nonOrderArrayList.get(i).getO_gdiscount() / 100) * 100;
						%>
						<tr id="mypage_reviewBefore_tr">
							<td id="mypage_reviewBefore_situation" ><%=nonOrderArrayList.get(i).getO_rdate()%>
							<a href="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><span><br>상세보기</span></a></td>
							
							<td id="mypage_reviewBefore_td">
							<dl>
								<dt id="mypage_reviewBefore_img"><img id="mypage_reviewBefore_img" src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img() %>"/></dt>
								<dt id="mypage_reviewBefore_span_one"><a href="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><%=nonItemArrayList.get(i).getI_name()%></a></dt>
								<dt id="mypage_reviewBefore_span_two">수령일 : <%=nonOrderDetailArrayList.get(i).getOd_delivery_date()%></dt>
								<dt id="mypage_reviewBefore_span_two"><%if(nonOrderDetailArrayList.get(i).getL_id()!=0){%>추가상품 : 편지 추가<%}%></dt>
								<dt id="mypage_reviewBefore_span_two">받는 분 : <%=nonOrderArrayList.get(i).getO_receiver()%></dt>
								<dt id="mypage_reviewBefore_span_one"><%=NumberFormat.getInstance().format((int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100)%>원
										/ <%=nonOrderDetailArrayList.get(i).getOd_qty()%>개</dt>
							</dl>
							</td>
							<td id="mypage_reviewBefore_situation"><a href="ReviewInsert.rv?od_id=<%=nonOrderDetailArrayList.get(i).getOd_id()%>">리뷰 작성</a></td>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>
				<div id="tab-2" class="tab-content">
					<table id="mypage_reviewBefore_table">
						<colgroup>
							<col width="22%">
							<col width="58%">
							<col width="20%">
						</colgroup>
						<thead class="mypage_reviewBefore_head">
							<tr>
								<th><span>주문 일자</span></th>
								<th><span>상품 정보</span></th>
								<th><span>상태</span></th>
							<tr>
						</thead>
						
					<%if (orderDetailArrayList.isEmpty()) { %>
					<tbody class="mypage_reviewBefore_can">
							<tr>
								<td colspan="3">
									<span id="mypage_reviewBefore_can" > 작성한 후기가 존재하지 않습니다.</span>
									<input class ="btn_wide btn_yellow" type="button" onclick="location.href='Flowers.shop'" value="꽃다발 보러가기">
								</td>
							</tr>
					</tbody>
					<%
					} else {
			
						for (int i = 0; i < orderArrayList.size(); i++) {
							int sumAmount = (orderArrayList.get(i).getO_amount() + orderArrayList.get(i).getO_point()
							+ orderArrayList.get(i).getO_gdiscount() / 100) * 100;
						%>
						<tr id="mypage_reviewBefore_tr">
							<td id="mypage_reviewBefore_situation"><%=orderArrayList.get(i).getO_rdate()%>
							<a href="OrderMypageDetail.od?o_id=<%=orderArrayList.get(i).getO_id()%>"><span><br>상세보기</span></a></td>
							
							<td id="mypage_reviewBefore_td">
							<dl>
								<dt id="mypage_reviewBefore_img"><img id="mypage_reviewBefore_img" src="./admin_layout/upload/<%=itemArrayList.get(i).getI_img() %>"/></dt>
								<dt id="mypage_reviewBefore_span_one"><a href="OrderMypageDetail.od?o_id=<%=orderArrayList.get(i).getO_id()%>"><%=itemArrayList.get(i).getI_name()%></a></dt>
								<dt id="mypage_reviewBefore_span_two">수령일 : <%=orderDetailArrayList.get(i).getOd_delivery_date()%></dt>
								<dt id="mypage_reviewBefore_span_two"><%if(orderDetailArrayList.get(i).getL_id()!=0){%>추가상품 : 편지 추가<%}%></dt>
								<dt id="mypage_reviewBefore_span_two">받는 분 : <%=orderArrayList.get(i).getO_receiver()%></dt>
								<dt id="mypage_reviewBefore_span_one"><%=NumberFormat.getInstance().format((int) (itemArrayList.get(i).getI_price() * itemArrayList.get(i).getI_discount() / 100) * 100)%>원
										/ <%=orderDetailArrayList.get(i).getOd_qty()%>개</dt></dl>
							</td>
							<!-- 				삭제된 리뷰와, 수정 및 삭제가 가능한 리뷰를 구분	   			 -->
							<%
							if (deleteOdList.contains(orderDetailArrayList.get(i).getOd_id())) {
							%>
							<td id="mypage_reviewBefore_t"><a href="ReviewUpdate.rv?od_id=<%=orderDetailArrayList.get(i).getOd_id()%>">리뷰 수정</a> | 
								<a href="ReviewDelete.rv?od_id=<%=orderDetailArrayList.get(i).getOd_id()%>">리뷰 삭제</a></td>
							<%
							} else {
							%>
							<td>삭제된 리뷰</td>
							<%
							}
							%>

						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</table>
				
				</div>
			</div>
		</section>
	</div>

	<!-- 푸터 들어가는곳 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>