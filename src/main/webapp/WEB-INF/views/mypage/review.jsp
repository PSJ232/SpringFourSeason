<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_review.css" rel="stylesheet">
<link href="css/mypage_class.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).on("change", ".file-input1", function(){
      
    $filename = $(this).val();
    var split_res = $filename.split('\\');
    var result = split_res[2];
    if($filename == "")
      $filename = "파일을 선택해주세요.";

    $(".filename").val(result);

  })
</script>
</head>
<body>
	<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	String m_id = (String) session.getAttribute("m_id");
	int od_id = Integer.parseInt(request.getParameter("od_id"));

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

	// 아이디 설정
	String mId[] = m_id.split("@");
	String a = mId[0].substring(0, 4);
	String editId = a + "***";
	%>
<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

	<!-- 본문 내용 -->
	
		<div class="mypage_Review_all">
		<h2 id="mypage_Review_h2">리뷰 작성</h2>
			<form action="ReviewInsertPro.rv" method="post" name="fr" enctype="multipart/form-data">
				<input type="hidden" name="od_id" value="<%=od_id%>"> 
				<label id="mypage_Review_title">작성자 : <input id="mypage_Review_list" id="mypage_Review_title"  type="text" name="r_writer" value="<%=m_id%>" readonly></label><br> 
				<label id="mypage_Review_title">제목 : &nbsp;&nbsp;&nbsp;<input id="mypage_Review_list" id="mypage_Review_title"  type="text" name="r_title"></label> <br>
				<label id="mypage_Review_title">내용 : <br>&nbsp;&nbsp;&nbsp;<textarea id="mypage_Review_list_t" rows="10" cols="20" name="r_content"></textarea></label> <br>
				<label id="mypage_Review_title">평점 : &nbsp;&nbsp;&nbsp;<select id="mypage_Review_list_s" name="r_rate">
					<option id="mypage_Review_option" value="5">★★★★★</option>
					<option id="mypage_Review_option" value="4">★★★★</option>
					<option id="mypage_Review_option" value="3">★★★</option>
					<option id="mypage_Review_option" value="2">★★</option>
					<option id="mypage_Review_option" value="1">★</option>
				</select></label><br> 
				
				<label id="mypage_Review_title">이미지 : <input id="mypage_Review_list_s" id="mypage_Review_title"  type="text" class="filename"></label>
				<label class="input-file-button" for="mypage_Review_li_inp" >사진첨부</label>
					<input id="mypage_Review_li_inp" type="file" name="r_img" class="file-input1">
	
				<input id="mypage_Review_smt" type="submit" value="작성하기">
			</form>

		</div>
	</div>





	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>