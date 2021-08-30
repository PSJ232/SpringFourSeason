<%@ page import="com.itwillbs.domain.ItemBean" %>
<%@ page import="com.itwillbs.domain.CartBean" %><%--
  Created by IntelliJ IDEA.
  User: 안혜경
  Date: 2021-08-30
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사계 | 장바구니</title>
    <link rel="stylesheet" href="/resources/css/cart.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

<!-- header -->
<jsp:include page="../inc/header.jsp"></jsp:include>
<!-- header -->

<c:set var="sub_option" value="1"/>
<c:set var="sub_content" value=""/>
<c:if test="${cartDetail.sub_option != null}">
    <c:set var="sub_option" value="${cartDetail.sub_option}"/>
    <c:choose>
        <c:when test="${sub_option == 2}">
            sub_content = "1개월구독권 x 2주";
        </c:when>
        <c:when test="${sub_option == 4}">
            sub_content = "2개월구독권 x 2주";
        </c:when>
        <c:when test="${sub_option == 12}">
            sub_content = "6개월구독권 x 2주";
        </c:when>
        <c:when test="${sub_option == 24}">
            sub_content = "12개월구독권 x 2주";
        </c:when>
    </c:choose>
</c:if>
<div class="cart_div">
    <div class="cart_header">
        <span>장바구니</span>
    </div>

    <form action="VisitorOrderNow.od" method="post">
        <div class="cart_div2">
            <div class="cart_div3">
                <div class="cart_div4">
                    <table border="1" class="cart_table">
                        <tr class="cart_tr1">
                            <td class="cart_td1">
                                <div class="cart_span1">상품정보</div></td>
                            <td class="cart_td2"><span class="cart_span">추가상품</span></td>
                            <td class="cart_td3"><span class="cart_span">합계금액</span></td>
                        </tr>
                        <c:choose>
                        <c:when test="${itemDetail != null}">
                            <%--상품(할인) 가격, 강제형변환으로 10원단위 절삭함--%>
                            <c:set var="i_price" value="${(itemDetail.i_price * itemDetail.i_discount / 100) * 100}"/>
                            <c:set var="letterPrice" value="0"/> <%--편지지 추가에 따른 추가요금--%>
                            <c:set var="letter" value=""/> <%--편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임(널스트링)--%>
                            <c:if test="${cartDetail.c_letter == 1}"> <%--편지지가 1이면 2500원 추가, 0이면 선택안함--%>
                                <c:set var="letterPrice" value="2500"/>
                                <c:set var="letter" value="편지 2,500원"/>
                            </c:if>
                            <%--각 상품에 대한 합계금액--%>
                            <c:set var="sumAmount">
                                <fmt:formatNumber value="${(i_price * cartDetail.c_qty * sub_option) + letterPrice}" type="Dou" pattern="###,###,###,###"/>
                            </c:set>
                            <%--각 상품에 대한 할인전 합계금액--%>
                            <c:set var="visitorAmount">
                                <fmt:formatNumber value="${(itemDetail.i_price * cartDetail.c_qty * sub_option) + letterPrice}" type="number" pattern="###,###,###,###"/>
                            </c:set>
                            <c:set var="visitor_price" value="${itemDetail.i_price}"/>
                        
                        <tr class="cart_tr2">
                            <td class="cart_td2">
                                <img src="./admin_layout/upload/${itemDetail.i_img}" class="cart_img2"><br>
                                <div class="cart_desc">
                                    <span class="cart_span4">${itemDetail.i_name}</span><br>
                                    <c:choose>
                                        <c:when test="${sub_option > 1}">
                                            첫 구독일 : ${cartDetail.c_delivery_date}<br>
                                            구독내용 : ${sub_content}<br>
                                            <fmt:formatNumber value="${i_price * cartDetail.c_qty * sub_option}" type="number" pattern="###,###,###,###"/>원<br>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="cart_span5">수령일 : ${cartDetail.c_delivery_date}</span><br>
                                            <%--<span class="cart_span6"><%=NumberFormat.getInstance().format(i_price * c_qty)%>원</span><br> --%>
                                            <span class="cart_span6"><fmt:formatNumber value="${visitor_price * cartDetail.c_qty}" type="number" pattern="###,###,###,###"/>원</span><br>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="cart_span23">${cartDetail.c_qty} 개</span><br>
                                </div>
                            </td>
                            <td class="cart_td3">
                                <span class="cart_span8">${letter}</span>
                            </td>
                            <td class="cart_td4">
                                <%-- <span class="cart_span9"><%=sumAmount%>원</span><br> --%>
                                <span class="cart_span9">${visitorAmount}원</span><br>
                                <span class="cart_span10">무료배송</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="cart_div5">
            <p class="cart_p">
                <strong class="cart_strong">구매 전 확인해주세요.</strong><br>
                <span class="cart_span11">- 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)</span><br>
                <span class="cart_span11">- [정기구독]상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.</span>
            </p>
            <p class="cart_p2">
		        <span class="cart_span12">
                    <span class="cart_span13">총 주문금액</span>
                    <span class="cart_span14">&nbsp;${visitorAmount}원</span>
                </span>
                <span class="cart_span15">+</span>
                <span class="cart_span12">
		 	        <span class="cart_span13">
		                배송비
		                <span class="cart_span16">0원</span>
		            </span>
		        </span>
                <span class="cart_span19">=</span>
                <span class="cart_span17">
		            <span class="cart_span18">총 결제 금액</span>
		            <span class="cart_span20">${visitorAmount}원</span>
		        </span>
            </p>
            <br>
            <c:if test="${itemDetail.i_discount != 1}">
                <span class="cart_span22">[회원가 ${sumAmount}원]</span>
            </c:if>
            <br>

            <input type="hidden" name="c_delivery_date" value="${cartDetail.c_delivery_date}">
            <input type="hidden" name="i_id" value="${itemDetail.i_id}">
            <input type="hidden" name="c_qty" value="${cartDetail.c_qty}">
            <input type="hidden" name="c_letter" value="${cartDetail.c_letter}">

            <div class="cart_div8">
                <div class="cart_div9">
                    <input type="button" class="cart_input5" value="회원가입" onclick="location.href='/member/join'"><br>
                </div>
            </div>

            <div class="cart_div10">
                <div class="cart_div11">
                    <input type="submit" class="cart_input7" value="할인없이 구매하기"><br>
                </div>
            </div>
            <p class="cart_p4">
                지금 회원가입 하시면 <b>1,000p</b> 바로 지급!
            </p>
        </div>
    </form>
    </c:when>

    <c:otherwise>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <!-- if문안에서 태그가 짤려서 추가 -->
    <p class="cart_p3">
        <span class="cart_span21">장바구니가 비어있습니다.<br>
        그 계절 가장 이쁜 꽃으로 행복을 채워보세요.
        </span><br>

        <input type="button" class="cart_input6" value="쇼핑하러 가기" onclick="location='./'">
    </p>

    </c:otherwise>
    </c:choose>>
</div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- footer -->
</body>
</html>
