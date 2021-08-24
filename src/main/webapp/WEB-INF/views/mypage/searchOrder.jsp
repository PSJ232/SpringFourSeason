<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setOrder(o_id) {
		opener.document.qnaForm.qna_insert_order_td.value = o_id;
		window.close();
	}
</script>
</head>
<body>
	<h3>주문 상품을 선택해주세요.</h3>
	<%
	ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
	ArrayList<OrderBean> orderList = (ArrayList<OrderBean>) request.getAttribute("orderList");
	ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailList");
	%>

	<%
	if (orderList.isEmpty()) {
	%>
	고객님의 주문 내역이 존재하지 않습니다.
	<%
	} else {
	%>
	<form name="searchOrder">
		<table border="1">
			<tr>
				<td>주문일자</td>
				<td>상품 내역</td>
				<td></td>
			</tr>
			<%
			String o_rdate = "";
			String i_name = "";
			int o_id = 0;
			for (OrderBean ob : orderList) {

				int i = 0;
				while (ob.getO_id() != orderDetailList.get(i).getO_id()) {
					i++;
				}
				int j = 0;
				while (orderDetailList.get(i).getI_id() != itemList.get(j).getI_id()) {
					j++;
				}
				i_name = itemList.get(j).getI_name();
				o_rdate = ob.getO_rdate().toString();
				o_id = ob.getO_id();
			%>
			<tr>
				<td><%=o_rdate%></td>
				<td><%=i_name%> 외</td>
				<td><input type="button" value="선택"
					onclick="setOrder(<%=o_id%>)"></td>
			</tr>
			<%
			}
			%>
		</table>
	</form>
	<%
	}
	%>

</body>
</html>