<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_orderHistoryDetail.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/mypage_subscribe.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<%
String m_id = (String) session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
OrderBean orderBean = (OrderBean) request.getAttribute("orderBean");
ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailList");
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");

// 주소 분리(우편번호, 도로명, 분류)
String[] address = orderBean.getO_address().split("&");

// 편지지 구매 이력을 기반으로 추가 상품 금액 도출
// 	int addPrice = 0;
// 	for(int i =0; i<orderDetailList.size(); i++) {
// 		if(orderDetailList.get(i).getL_id()!=0) {
// 			addPrice += 2500;
// 		} else {}
// 	}

// 왜인지 모르겠지만,꾸까는 단품(한종류)으로 여러개를 시키면 편지지는 중복계산되지않고 1개만 계산함
// 아마도 같은 배송지이고 같은 날자이기때문에 1개만 추가되는 것 같음
// 또한 정기구독의 경우도 마찬가지로 최초결제시 2500원 1회만 포함됨
// 그래서 위와같이 계산하면 표시되는 금액에 오류가 있으므로, 조금 번거롭지만 아래 처럼 코드를 수정함
int sumPrice = 0;
for (int i = 0; i < orderDetailList.size(); i++) {
	int i_id = orderDetailList.get(i).getI_id();
	int od_qty = orderDetailList.get(i).getOd_qty();

	for (int j = 0; j < itemList.size(); j++) {
		if (itemList.get(j).getI_id() == i_id) {
	int i_price = itemList.get(j).getI_price();
	float i_discount = itemList.get(j).getI_discount();
	int price = (int) (i_price * i_discount / 100) * 100 * od_qty;
	sumPrice += price;
		}
	}
}
int o_gdiscount = orderBean.getO_gdiscount();
int addPrice = orderBean.getO_amount() - sumPrice;

// 결제수단 구분
// 0:계좌이체, 1:신용카드, 2:카카오페이, 3:네이버페이 (미정)
String paymentMethod = "";
switch (orderBean.getO_payment()) {
case 0:
	paymentMethod = "계좌이체";
	break;
case 1:
	paymentMethod = "신용카드";
	break;
}

// 결제 일자 설정
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

// 휴대전화 형식으로 설정
String FormatPhone = "";
if(orderBean.getO_phone().length()==11) {
	FormatPhone = orderBean.getO_phone().substring(0, 3) + "-" + orderBean.getO_phone().substring(3, 7) + "-" +
		orderBean.getO_phone().substring(7, 11);
} else {
	FormatPhone = orderBean.getO_phone();
}
%>
<body>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


		<!-- 본문 내용 -->
<div class="mypage_orderHistoryDetail_all">
		<h1 id="mypage_orderHistoryDetail_tltle">주문 상세 정보</h1>
<%-- 		<h2 id="mypage_orderHistoryDetail_tltle_h2">i_category : <%=itemList.get(0).getI_category()%></h2> --%>
		<dl id="mypage_orderHistoryDetail_dl">
		<dt id="mypage_orderHistoryDetail_tltle_h3">주문내역 상세</dt>
		<dd id="mypage_orderHistoryDetail_dd">주문번호 : <%=orderBean.getO_id()%></dd>
		</dl><br>
		<span id="mypage_orderHistoryDetail_span">
		<%if(orderDetailList.get(0).getOd_invoice().equals("주문접수")) {
			%><input id="mypage_orderHistoryDetail_btn" type="button" value="주문 취소하기" 
				onclick="location.href='OrderCancel.od?o_id=<%=orderBean.getO_id()%>&i_category=<%=itemList.get(0).getI_category()%>'"><%
		} else {}%>
		</span>
		<table class="mypage_orderHistoryDetail_table_t" >
						
						<tr>
							<td id="mypage_orderHistoryDetail_table_td_s" >주문 일자</td>
							<td id="mypage_orderHistoryDetail_table_td_b">상품 정보</td>
							<td id="mypage_orderHistoryDetail_table_td_s">상태</td>
						</tr>

			<%for (int i = 0; i < itemList.size(); i++) {
				String editSum = String.format("%,d", (int) (itemList.get(i).getI_price() * itemList.get(i).getI_discount() / 100) * 100);
			%>
			<tr id="mypage_orderHistoryDetail_tr">

				<%if (i == 0) {%>
				<td id="mypage_orderHistoryDetail_td" rowspan=<%=itemList.size()%>><%=orderBean.getO_rdate()%></td>
				<%
				} else {
				}
				%>
				<td >
			<dl id="mypage_orderHistoryDetail_td">
				<dt id="mypage_orderHistoryDetail_span_one">상품 명 : <%=itemList.get(i).getI_name()%></dt>
				<dt id="mypage_orderHistoryDetail_span_two">수령일 : <%=orderDetailList.get(i).getOd_delivery_date()%></dt>
				<dt id="mypage_orderHistoryDetail_span_two">받는 분 : <%=orderBean.getO_receiver()%></dt>
				<dt id="mypage_orderHistoryDetail_span_one">가격 : <%=editSum%> / <%=orderDetailList.get(i).getOd_qty()%>개</dt>
				</dl>
				</td>

				<%
				if (i == 0) {
					if (orderDetailList.get(i).getOd_confirm() == 2) {
							%><td id="mypage_orderHistoryDetail_situation" rowspan=<%=itemList.size()%>>주문 취소</td><%
						} else if (orderDetailList.get(i).getOd_confirm() == 1) {
							%><td id="mypage_orderHistoryDetail_situation" rowspan=<%=itemList.size()%>>배송 완료</td><%
						} else if (!orderDetailList.get(i).getOd_invoice().equals("주문접수")) {
							%><td id="mypage_orderHistoryDetail_situation" rowspan=<%=itemList.size()%>>배송중</td><%
						} else if (orderDetailList.get(i).getOd_invoice().equals("주문접수")) {
							%><td id="mypage_orderHistoryDetail_situation" rowspan=<%=itemList.size()%>>주문 접수</td><%
						}
				} else {}%>
			</tr>
			<%
			}
			%>
		</table>	
		<div id="mypage_orderHistoryDetail_del_div">
		<h3 id="mypage_orderHistoryDetail_tltle_del_h3" >배송정보</h3><br>
		<dl id="mypage_orderHistoryDetail_del_dl">
		<dt id="mypage_orderHistoryDetail_del_dt"> <%=orderBean.getO_receiver()%>, <%=FormatPhone %> (보내는 사람:<%=orderBean.getO_sender()%>)</dt>
		<dd id="mypage_orderHistoryDetail_del_dd">[<%=address[0]%>] <%=address[1]%>, <%=address[2]%></dd>
		</dl>
		</div>


		<h3 id="mypage_orderHistoryDetail_tltle_h3">결제 정보</h3><br>
		<table class="mypage_orderHistoryDetail_table_b" >
			<tr id="mypage_orderHistoryDetail_del_tr">
				<td id="mypage_orderHistoryDetail_del_td">주문 금액<br> <%=String.format("%,d", orderBean.getO_amount()) %></td>
				<td id="mypage_orderHistoryDetail_del_td">할인 금액<br> <%= String.format("%,d", orderBean.getO_point() + orderBean.getO_gdiscount())%></td>
				<td id="mypage_orderHistoryDetail_del_td">최종 결제 금액<br> <span id="mypage_orderHistoryDetail_del_td_span"><%= String.format("%,d", orderBean.getO_amount() + orderBean.getO_point() + orderBean.getO_gdiscount())%>원</span></td>
			</tr>

			<tr id="mypage_orderHistoryDetail_del_tr_b">
				<td>
				<span id="mypage_orderHistoryDetail_del_span_l">총 상품 금액 </span> <span id="mypage_orderHistoryDetail_del_span_r"><%= String.format("%,d", orderBean.getO_amount())%>원</span><br> 
				<span id="mypage_orderHistoryDetail_del_span_l">상품 금액</span> <span id="mypage_orderHistoryDetail_del_span_r"><%= String.format("%,d", orderBean.getO_amount() - addPrice)%>원</span><br>
				<span id="mypage_orderHistoryDetail_del_span_l">	추가 상품</span><span id="mypage_orderHistoryDetail_del_span_r"><%= String.format("%,d", addPrice)%>원</span><br> 
				<span id="mypage_orderHistoryDetail_del_span_l">	배송비</span> <span id="mypage_orderHistoryDetail_del_span_r">0원</span>
				</td>
				<td id="mypage_orderHistoryDetail_del_tr_b">포인트 할인 <span id="mypage_orderHistoryDetail_del_span_r"><%=String.format("%,d", orderBean.getO_point())%></span><br> 
				등급 할인 <span id="mypage_orderHistoryDetail_del_span_r"><%=String.format("%,d", orderBean.getO_gdiscount())%></span></td>
				<td id="mypage_orderHistoryDetail_del_tr_b">결제 방법 <span id="mypage_orderHistoryDetail_del_span_r"><%=paymentMethod%></span><br> 
				결제 일자 <span id="mypage_orderHistoryDetail_del_span_r"><%=simpleDateFormat.format(orderBean.getO_rdate2())%></span></td>
			</tr>
		</table>
		<p id="mypage_orderHistoryDetail_p">* 현금영수증 발행은 1:1 문의를 이용 부탁드립니다.</p>
	</div>
	</div>


	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>