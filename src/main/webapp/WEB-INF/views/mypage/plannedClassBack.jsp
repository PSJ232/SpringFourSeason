<%@page import="java.util.ArrayList"%>
<%@ page import="com.itwillbs.domain.MyClassBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:if test="${plannedClassList != null }">
	<c:forEach var="plannedClassList" items="${plannedClassList}">
		<tr>
		<td>${plannedClassList.reserv_date}</td>
		<td class="myclass_info_box">
			<div>
				<h4 onclick="location.href='<c:url value="/class/reservClassTime?f_id=${plannedClassList.f_id}"/>'">${plannedClassList.subject}</h4>
				<span class="myclass_place">${plannedClassList.place}</span>
			</div>
			<div>
				<span>${plannedClassList.class_date}</span>
				<span>${plannedClassList.time}시</span>
			</div>
			<span>인원: ${plannedClassList.num}명</span>
			<span>가격: ${plannedClassList.price}원</span>
		</td>
		<td>
			<button class="class_cancle_btn" onclick="location.href='<c:url value="/class/cancle?r_id=${plannedClassList.r_id}"/>'">클래스 취소</button>
		</td>
	</c:forEach>
</c:if>
