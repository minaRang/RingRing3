<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/notice_write.css">
    <link rel="stylesheet" href="css/goodInsert.css">
    <link rel="stylesheet" href="css/mypage_oderlist.css">
    <link rel="stylesheet" href="css/product_admin.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <div class="admincategory">
        <h3 class="tt">관리자메뉴</h3>
        <ul>
            <li class="select"><a href="/adminProduct">상품 관리</a></li>
            <li><a href="/insertGoods">상품 등록</a></li>
            <li><a href="">주문내역 관리</a></li>
            <li><a href="/boardWrite">고객센터 관리</a></li>
            <li><a href="">1:1 문의</a></li>
            <li class="last"><a href="/adminUserInfo">회원관리</a></li>
        </ul>
    </div>
    <div class="oder-detail">
        <h3 class="tt">상품관리</h3>
        <div class="status top-status"></div>
        <!-- detail-box -->
        <c:forEach items="${sessionScope.goodsList}" var="list">
        <div id="detail">
            <h3 class="tt detail_neme"><a style="text-decoration: none" href="adminProductDetail?idx=${list.idx}">${list.name}</a>
                    ${list.category1}-${list.category2}
            </h3>
            <div class="status s_status"></div>
            <img src="${list.img}" alt="">
            <div class="detail-iname">
                <table>
                    <tr>
                        <td>상품판매액</td>
                        <td>2100214100원</td>
                    </tr>
                    <tr>
                        <td>재고수량</td>
                        <td>${list.stock}</td>
                    </tr>
                    <tr>
                        <td>판매여부</td>
                        <td>판매중</td>
                    </tr>
                </table>
            </div>
            <button type="button" class="tt detail_btn"><a href="/modifyGoods?idx=${list.idx}">상품정보수정</a></button>
        </div>
        </c:forEach>
    </div>
</div>
</body>
</html>