<%--
  Created by IntelliJ IDEA.
  User: 안혜경
  Date: 2021-08-30
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        #btn_no {
            width: 193px;
            height: 52px;
            opacity: 0%;
            position: absolute;
            top: 106px;
            left: 257px;
        }
        #btn_yes {
            width: 193px;
            height: 52px;
            opacity: 0%;
            position: absolute;
            top: 106px;
            left: 54px;
        }

        button {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function go_cart(){
            window.opener.location = "/cart/cart";
            window.close();
        }
    </script>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<img src="/resources/img/cart_popup_img.png">
<button id="btn_yes" onclick="window.close()">쇼핑 계속하기</button>
<button id="btn_no" onclick="go_cart()">장바구니 이동</button>
</body>
</html>
