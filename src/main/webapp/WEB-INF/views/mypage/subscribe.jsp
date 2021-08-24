<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/mypage_subscribe.css">
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
// 멤버 정보
String m_id = (String)session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail");
ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>)request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>)request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>)request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>)request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("orderDetailArrayList");
// 출력되는 행의 컬럼번호 받아오기(해당 행에만 <td rowspan="">부여)
// 주문내역의 o_id에 따른 번호 리스트
String o_id = "";
ArrayList<Integer> nonCol = new ArrayList<Integer>();
for(int i =0; i<nonOrderArrayList.size(); i++) {
	if(!o_id.equals((nonOrderArrayList.get(i).getO_id()+""))) {
		nonCol.add(i);} 
	else {}
	if(i==nonOrderArrayList.size()-1) {nonCol.add(i+1);	}
	o_id = nonOrderArrayList.get(i).getO_id() + "";
}
// 취소내역의 o_id에 따른 컬럼 번호 리스트
o_id = "";
ArrayList<Integer> col = new ArrayList<Integer>();
for(int i =0; i<orderArrayList.size(); i++) {
	if(!o_id.equals((orderArrayList.get(i).getO_id()+""))) {
		col.add(i);}
	else {}
	if(i==orderArrayList.size()-1) {col.add(i+1);}
	o_id = orderArrayList.get(i).getO_id() + "";
}
%>
<script type="text/javascript">
	function confirmPurchase(od_id){
		window.open("ConfirmPurchase.od?od_id="+od_id, "구매확정", "width=400, height=400, left=500, top=100");
	}
</script>
</head>
<body>

	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>
<!-- 본문 내용 -->
	<section id="mysubscribe_container">
		<h2 class="my_title">나의 정기구독</h2>
	
		<!--   -------------------------------------------------- -->
		<ul class="tabs">
			<li class="tab-link current_clicked" data-tab="tab-1">주문/배송내역</li>
			<li class="tab-link" data-tab="tab-2">취소/환불내역</li>
		</ul>
		<!--   -------------------------------------------------- -->
		
		<div class="mysubscribe_layout">
			<div id="tab-1" class="tab-content current">
				<table class="mysubscribe_list_layout">
					<colgroup>
						<col width="22%">
						<col width="58%">
						<col width="20%">
					</colgroup>
					<thead class="mysubscribe_head">
					<tr>
						<th><span>첫 구독일</span></th>
						<th><span>상품 정보</span></th>
						<th><span>상태</span></th>
					</tr>
					</thead>
	
				<%
					if(nonOrderDetailArrayList.isEmpty()) {
						%>
						<tbody class="mysubscribe_order_none">
							<tr>
								<td colspan="3">
									<span>구독내역이 존재하지 않습니다</span>
									<input class ="btn_wide btn_yellow" type="button" onclick="location.href='Subscription.shop'" value="구독 상품 보러가기">
								</td>
							</tr>
						</tbody>
						<%
					} else {
						int count = 0;
						for(int i=0; i<nonOrderArrayList.size(); i++) {
							String invoiceNo = nonOrderDetailArrayList.get(i).getOd_invoice();
							%>
								<tr id="mysubscribe_order_tr">
									<%
									if(nonCol.contains(i)) {
										%><td id="mysubscribe_order_situation" rowspan="<%=nonCol.get(count+1)-nonCol.get(count) %>"><%=nonOrderArrayList.get(i).getO_rdate() %>
										<a href="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><span><br>상세보기</span></a></td>
									<% count++;
									} else {}%>
									<td id="mysubscribe_order_td">
									<dl>
									<dt id="mysubscribe_order_img"><img id="mysubscribe_order_img" src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img() %>"/></dt>
									<dt id="mysubscribe_order_span_one"><a href ="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><%=nonItemArrayList.get(i).getI_name() %></a></dt>
									<dt id="mysubscribe_order_span_two">수령일 : <%=nonOrderDetailArrayList.get(i).getOd_delivery_date() %></dt>
									<dt id="mysubscribe_order_span_two"><%if(nonOrderDetailArrayList.get(i).getL_id()!=0){%>추가상품 : 편지 추가<%}%></dt>
									<dt id="mysubscribe_order_span_two">받는 분 : <%=nonOrderArrayList.get(i).getO_receiver() %></dt>
									<dt id="mysubscribe_order_span_one"><%=NumberFormat.getInstance().format((int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100)%>원
										/ <%=nonOrderDetailArrayList.get(i).getOd_qty()%>개</dt>
									</dl>
									</td>
									<%if (nonOrderDetailArrayList.get(i).getOd_confirm() == 1) {%>
									<td id="mysubscribe_order_situation">배송 완료</td>
									<%} else if (!nonOrderDetailArrayList.get(i).getOd_invoice().equals("주문접수")) {%>
									<td id="mysubscribe_order_situation"><%=invoiceNo %>
										<input id="mysubscribe_order_btn" type="button" onclick="confirmPurchase(<%=nonOrderDetailArrayList.get(i).getOd_id() %>)" value="구매확정">
									</td>
									<%} else if (invoiceNo.equals("주문접수")) {%>
									<td id="mysubscribe_order_situation">주문접수</td>
									<%}
									%>
								</tr>
							<%
						}
					}
					%>
				</table>
			</div>
	 		
			<div id="tab-2" class="tab-content">
				<table class="mysubscribe_list_layout">
					<colgroup>
						<col width="22%">
						<col width="58%">
						<col width="20%">
					</colgroup>
					<thead class="mysubscribe_head">
						<tr>
							<th><span>첫 구독일</span></th>
							<th><span>상품 정보</span></th>
							<th><span>상태</span></th>
						</tr>
					</thead>
	
					<%
					if(orderDetailArrayList.isEmpty()) {
						%>
						<tbody class="mysubscribe_order_none">
							<tr>
								<td colspan="3">
									<span>취소/환불한 구독내역이 존재하지 않습니다.</span>
									<input class ="btn_wide btn_yellow" type="button" onclick="location.href='Subscription.shop'" value="구독 상품 보러가기">
								</td>
							</tr>
						</tbody>
						<%
					} else {
						int ccount = 0;
						for(int i=0; i<orderArrayList.size(); i++) {
							String invoiceNo = orderDetailArrayList.get(i).getOd_invoice();
						%>
	
							<tr id="mysubscribe_order_tr">
								<%
								if(col.contains(i)) {
									%><td id="mysubscribe_order_situation" rowspan="<%=col.get(ccount+1)-col.get(ccount) %>"><%=orderArrayList.get(i).getO_rdate() %>
									<a href="OrderMypageDetail.od?o_id=<%=orderArrayList.get(i).getO_id()%>"><span><br>상세보기</span></a></td>
								<%
								} else {}
								%>
								<td id="mysubscribe_order_td">
								<dl>
								<dt id="mysubscribe_order_img"><img id="mysubscribe_order_img" src="./admin_layout/upload/<%=itemArrayList.get(i).getI_img() %>"/></dt>
									<dt id="mysubscribe_order_span_one"><a href ="OrderMypageDetail.od?o_id=<%=orderArrayList.get(i).getO_id() %>"><%=itemArrayList.get(i).getI_name() %></a></dt>
									<dt id="mysubscribe_order_span_two">수령일 : <%=orderDetailArrayList.get(i).getOd_delivery_date() %></dt>
									<dt id="mysubscribe_order_span_two"><%if(orderDetailArrayList.get(i).getL_id()!=0){%>추가상품 : 편지 추가<%}%></dt>
									<dt id="mysubscribe_order_span_two"> 받는 분 : <%=orderArrayList.get(i).getO_receiver() %></dt>
									<dt id="mysubscribe_order_span_one"><%=NumberFormat.getInstance().format((int) (itemArrayList.get(i).getI_price() * itemArrayList.get(i).getI_discount() / 100) * 100)%>원
										/ <%=orderDetailArrayList.get(i).getOd_qty()%>개</dt>
								</dl>
								</td>
								<%
								if(col.contains(i)) {
									%>
									<td id="mysubscribe_order_situation" rowspan="<%=col.get(ccount+1)-col.get(ccount) %>">주문 취소</td>
									<%
									ccount++;
								} else {}
								%>
							</tr>
							<%
						}
					}
					%>
				</table>
			</div>
		</div>
	</section>
</div>
 
 
 
<!-- 푸터 들어가는곳 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- 푸터 들어가는곳 -->
</body>
</html>