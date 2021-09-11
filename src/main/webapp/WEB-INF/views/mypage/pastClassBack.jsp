<%@page import="java.util.ArrayList"%>
<%@ page import="com.itwillbs.domain.MyClassBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<MyClassBean> pastClassList = (ArrayList<MyClassBean>)request.getAttribute("pastClassList");
%>

<%
	if(pastClassList!=null){
		for(MyClassBean mcb: pastClassList){
			%>
			<tr>
				<td><%=mcb.getReserv_date() %></td>
				<td class="myclass_info_box">
					<div>
						<h4><%=mcb.getSubject() %></h4>
						<span class="myclass_place"><%=mcb.getPlace() %></span>
					</div>
					<div>
						<span><%=mcb.getClass_date() %></span>
						<span><%=mcb.getTime() %>시</span>
					</div>
					<span>인원: <%=mcb.getNum() %>명</span>
					<span>가격: <%=mcb.getPrice() %>원</span>
				</td>
			</tr>	
			<%
		}
	} else {

	}
%>
