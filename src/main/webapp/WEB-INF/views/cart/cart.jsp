<%--
  Created by IntelliJ IDEA.
  User: 안혜경
  Date: 2021-08-26
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>사계 | 장바구니</title>
    <link rel="stylesheet" href="/resources/css/cart.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script type="text/javascript">
        function qtyUpdate(c_id, i_inven, c_qty){ // 버튼을 누르면 증감 수행, 재고수량보다 많이 담을 경우 더 이상 담을 수 없다고 정보 표시함
            if(i_inven > c_qty) {
                document.getElementById('cartNotice'+c_id).innerHTML = "";
                location.href="CartUpdatePro.cr?c_id="+c_id+"&add=1";
            } else {
                document.getElementById('cartNotice'+c_id).innerHTML = "- 해당 상품의 <span class='cartNotice_red'>최대 구매 가능한 수량은 " + i_inven + "개</span> 입니다.";
            }
        }


        function emptyCart() { // 선택된 상품이 없으면 sumbit 안됨
            if(!$('.cart_input2').prop('checked')){
                alert('선택된 상품이 없습니다');
                return false;
            }
        }

        $(document).ready(function() {
            //장바구니 체크기능 및 금액부분
            var cart_totalAmount = Number($('.cart_span20').attr('data-tap'));
            $('#cart_check_all').click(function() {
                if($("input:checkbox[id='cart_check_all']") .prop("checked")) {
                    $("input[type=checkbox]").prop("checked" , true);
                    $(".cart_span20").text($('.cart_span20').attr('data-tap').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원');
                    $(".cart_span14").text($('.cart_span20').attr('data-tap').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원');
                    cart_totalAmount = Number($('.cart_span20').attr('data-tap'));
                } else {
                    $("input[type=checkbox]").prop("checked", false);
                    $(".cart_span20").text('0원');
                    $(".cart_span14").text('0원');
                    cart_totalAmount = 0;
                }
            });
            //장바구니 체크기능 및 금액부분
            $('.cart_input2').click(function() {
                if($(this).prop("checked")) {
                    var id_name = $(this).attr('id');
                    $(this).attr('name', id_name);

                    cart_totalAmount += Number($(this).attr('data-tab'));
                } else {
                    $(this).attr('name', '');
                    $("input:checkbox[id='cart_check_all']") .prop('checked', false);
                    cart_totalAmount -= Number($(this).attr('data-tab'));
                }
                $(".cart_span20").text(cart_totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원');
                $(".cart_span14").text(cart_totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원');
            });

        });
    </script>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/header.jsp"/>
<!-- header -->


<div class="cart_div">
    <div class="cart_header">
        <span>장바구니</span>
    </div>
    <form action="OrderCart.od" method="post" onsubmit="return emptyCart()">
        <div class="cart_div2">
            <div class="cart_div3">
                <div class="cart_div4">
                    <table class="cart_table">
                        <tr class="cart_tr1">
                            <td class="cart_td1"><input type="checkbox" id="cart_check_all" class="cart_input" data-tab="0" checked><div class="cart_span1">상품정보</div></td>
                            <td class="cart_td2"><span class="cart_span">추가상품</span></td>
                            <td class="cart_td3"><span class="cart_span">합계금액</span></td>
                        </tr>

                        <c:choose>
                            <c:when test="${cartList.size() != 0}">
                                <c:set var="totalAmount" value="0"/>
                                <c:set var="i"/>
                                <c:forEach var="cartItem" items="${cartList}" varStatus="i" begin="0" step="1">
                                    <c:set var="i_price" value="(int) (${itemList[i].i_price} * ${itemList[i].i_discount} / 100) * 100"/>

                                    <c:set var="letterPrice" value="0"/> <%--편지지 추가에 따른 추가요금--%>
                                    <c:set var="letter" value=""/> <%--편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임(널스트링)--%>
                                    <c:if test="${cartItem.c_letter == 1}"> <%--편지지가 1이면 2500원 추가, 0이면 선택안함--%>
                                        ${letterPrice} = 2500;
                                        ${letter} = "편지 2,500원";
                                    </c:if>
                                    <c:set var="sumAmount" value="${i_price} * ${cartItem.c_qty} + ${letterPrice}"/>

                                    <c:set var="sub_content"  value=""/>
                                    <c:choose>
                                        <c:when test="${cartItem.sub_option == 2}">
                                            ${sub_content} = "1개월구독권 x 2주";
                                        </c:when>
                                        <c:when test="${cartItem.sub_option == 4}">
                                            ${sub_content} = "2개월구독권 x 2주";
                                        </c:when>
                                        <c:when test="${cartItem.sub_option == 12}">
                                            ${sub_content} = "6개월구독권 x 2주";
                                        </c:when>
                                        <c:when test="${cartItem.sub_option == 24}">
                                            ${sub_content} = "12개월구독권 x 2주";
                                        </c:when>
                                    </c:choose>
                                    <c:if test="${cartItem.sub_option != null}">
                                        ${i_price} = ${i_price} * ${cartItem.sub_option};
                                        ${sumAmount} = ${i_price} * ${cartItem.c_qty} + ${letterPrice};
                                    </c:if>

                                    ${totalAmount} += ${sumAmount}; <%--각 상품에 대한 합계금액을 누적한 총 합계금액--%>

                                    <tr class="cart_tr2">
                                        <td class="cart_td2">
                                            <input type="checkbox" class="cart_input2" id="c_id${i}" name="c_id${i}>" value="${cartItem.c_id}" data-tab="${sumAmount}" checked>
                                            <img src="./admin_layout/upload/${itemList[i].i_img}" class="cart_img"><br>
                                            <div class="cart_desc">
                                                <span class="cart_span4">${itemList[i].i_name}</span>
                                                <input type="button" class="cart_input3" value="x" onclick="location.href='CartDeletePro.cr?c_id=${cartItem.c_id}'"><br>
                                                <c:choose>
                                                    <c:when test="${itemList[i].i_category == 3}">
                                                        첫 구독일 : ${cartItem.c_delivery_date}<br>
                                                        구독내용 : ${sub_content}<br>
                                                        <fmt:formatNumber value="${itemList[i].i_price * cartItem.c_qty}" type="number" pattern="###,###,###,###"/>원<br>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="cart_span5">수령일 : ${cartItem.c_delivery_date}</span><br>
                                                        <span class="cart_span6"><fmt:formatNumber value="${itemList[i].i_price * cartItem.c_qty}" type="number" pattern="###,###,###,###"/>원</span><br>
                                                    </c:otherwise>
                                                </c:choose>
                                                <input type="button" class="cart_input4" value="-" onclick="location.href='CartUpdatePro.cr?c_id=${cartItem.c_id}&add=-1'">
                                                <span class="cart_span7">${cartItem.c_qty}</span>
                                                <input type="button" class="cart_input4" value="+" onclick="qtyUpdate(${cartItem.c_id}, ${itemList[i].i_inven}, ${cartItem.c_qty})"><br>
                                                <span id="cartNotice${cartItem.c_id}"></span>
                                            </div>
                                        </td>
                                        <td class="cart_td3">
                                            <span class="cart_span8">${letter}</span>
                                            <c:if test="${cartItem.c_letter == 1}">
                                                <input type="button" class="cart_input3" value="x" onclick="location.href='CartUpdatePro.cr?c_id=${cartItem.c_id}&letter=0'">
                                            </c:if>
                                        </td>
                                        <td class="cart_td4">
                                            <span class="cart_span9"><fmt:formatNumber value="${sumAmount}" type="number" pattern="###,###,###,###"/>원</span><br>
                                            <span class="cart_span10">무료배송</span>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="cart_div5">
                        <p class="cart_p">
                            <strong class="cart_strong">구매 전 확인해주세요.</strong><br>
                            <span class="cart_span11">- 구매 금액 합산이 30,000원 이상일 경우, 배송비는	무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)</span><br>
                            <span class="cart_span11">- [정기구독]상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.</span>
                        </p>
                        <p class="cart_p2">
                                <span class="cart_span12">
                                    <span class="cart_span13">총 주문금액</span>&nbsp;
                                    <span class="cart_span14"><fmt:formatNumber value="${totalAmount}" type="number" pattern="###,###,###,###"/>원</span>
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
                                    <span class="cart_span18">총 결제금액</span>
                                    <span class="cart_span20" data-tap="${totalAmount}"><fmt:formatNumber value="${totalAmount}" type="number" pattern="###,###,###,###"/>원</span>
                                </span>
                        </p><br>
                        <input type="hidden" name="iNum" value="${i}">
                        <div class="cart_div6">
                            <div class="cart_div7">
                                <input type="submit" class="cart_input5" value="구매하기">
                            </div>
                        </div>
                    </div>
                </form>
                            </c:when>
                            <c:otherwise>
                                </table></div></div></div></form> <!-- if문안에서 태그가 짤려서 추가 -->
                                <p class="cart_p3">
                                            <span class="cart_span21">장바구니가 비어있습니다. <br> 그 계절 가장 이쁜
                                                꽃으로 행복을 채워보세요.<br>
                                            </span> <input type="button" class="cart_input6" value="쇼핑하러 가기" onclick="location='./'">
                                </p>
                            </c:otherwise>
                        </c:choose>
</div>

<!-- footer -->
<jsp:include page="../inc/footer.jsp"/>
<!-- footer -->
</body>
</html>