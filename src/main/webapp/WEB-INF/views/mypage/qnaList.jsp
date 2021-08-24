<%@page import="java.sql.Date"%>
<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 마이페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/mypage_qnaList.css"
	type="text/css" />
<script src="../script/jquery-3.6.0.js"></script>
<style type="text/css">
 #hidden { 
 	display: none; 
 } 
</style>
</head>
<body>
	<jsp:include page="../inc/header.jsp" ></jsp:include>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>
	
	<div class="qnaList_div">
		<article id="qnaList_article">
			<h3 class="qnaList_h3">
				<span class="qnaList_span">1:1 문의내역</span> &nbsp; <a
					href="QnaInsert.qna" class="qnaList_a">1:1 문의하기</a>
			</h3>
			<p class="qnaList_p">
				<span class="qnaList_span2"><br>· [1:1 문의 게시판]은 월~금 10:00~18:00
					운영됩니다.</span> <br>
				<span class="qnaList_span2">· 급한 문의는 1661-1031 (월~금
					10:00~18:00)로 문의 주세요.</span> <br>
				<span class="qnaList_span2">· 운영 시간 내에는 2시간 이내에 답변을 드리나, 문의가 많을
					때에는 다소 지연될 수 있습니다.</span>
			</p>
			<%
			ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>) request.getAttribute("qnaList");
			String m_id = (String) session.getAttribute("m_id");
			%>

			<%
			if (qnaList.isEmpty()) {
			%>
			<div class="qnaList_div4">
			<span class="qnaList_span8">
			문의 내역이 존재하지 않습니다.
			</span>
			</div>
			<%
 } else {
 %>
			<div class="qnaList_div2">
				<div class="qnaList_div3">
					<table border="1" class="qnaList_table">
						<thead>
							<tr>
								<th width="100px" class="qnaList_th"><span
									class="qnaList_span3">작성일</span>
								</th>
								<th width="200px" class="qnaList_th"><span
									class="qnaList_span3">제목</span>
								</th>
								<th width="100px" class="qnaList_th"><span
									class="qnaList_span3">상태</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < qnaList.size(); i++) {
								if (qnaList.get(i).getQ_re_lev() == 0) {
							%>
							<tr onclick="$('.css_test<%=qnaList.get(i).getQ_re_ref() %>').toggle()">
								<td class="qnaList_td"><span class="qnaList_span3"><%=qnaList.get(i).getQ_rdate()%></span></td>
								<td class="qnaList_td2"><span class="qnaList_span3"><%=qnaList.get(i).getQ_subject()%></span></td>
								<td class="qnaList_td"><span class="qnaList_span4">
										<%
										if (i < qnaList.size() - 1) {
											// 밑의 판별식으로는 마지막 문의글의 답글이 없는 경우 오류 발생(비교식이 접근 가능한 list의 범위를 넘기 때문)
											// 따라서 마지막 문의글의 답변이 없는 경우, 이를 별도로 구분하여 답변 게시 유무를 출력.
											if (qnaList.get(i).getQ_re_ref() == qnaList.get(i + 1).getQ_re_ref()) {
										%>
										답변 완료 <%
										} else {
										%> 답변 대기중 <%
										}
										} else if (i == qnaList.size() - 1) {
										%> 답변 대기중 <%
										}
										%>
								</span></td>
							</tr>
							<tr class="css_test<%=qnaList.get(i).getQ_re_ref() %>"  id="hidden" style="height:60px">
								<th class="qnaList_th"><span class="qnaList_span3">문의내용</span>
								</th>
								<td colspan="2" class="qnaList_td"><span class="qnaList_span3"><%=qnaList.get(i).getQ_content()%><br>
									<img src="./mypage/qnaUpload/<%=qnaList.get(i).getQ_img()%>" onerror="this.style.display='none'" alt='이미지 출력 오류' style="width: 200px; height: 230px; margin-top: 15px;"/></span></td>
							</tr>
						<%
							} else if (qnaList.get(i).getQ_re_lev() == 1) {
			 			%> 
							<tr class="css_test<%=qnaList.get(i).getQ_re_ref() %>"  id="hidden" style="height:60px">
								<th class="qnaList_th" style="height:250px">
								<span class="qnaList_span3">답변</span>
								</th>
								<td colspan="2" class="qnaList_td3" style="height:250px">
								<span class="qnaList_span7"><%=qnaList.get(i).getQ_subject()%></span>
								<span class="qnaList_span6"><small><%=qnaList.get(i).getQ_rdate()%></small></span><br>
								<span class="qnaList_span5"><%=qnaList.get(i).getQ_content()%></span>
								</td>
							</tr>

						<%
						} // elseif문
						} // for문
						} // else문
						%>
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</div>
</div>
	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>