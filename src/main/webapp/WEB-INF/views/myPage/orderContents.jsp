<%@ page import="com.dessert.ringring.domain.DTOOrderSheet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% ArrayList<DTOOrderSheet> list= (ArrayList<DTOOrderSheet>) session.getAttribute("list");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/mypage_oderlist.css">
    <title>Document</title>
</head>
<body>
<div class="content">
        <div class="mycategory">
            <h3 class="tt">마이링링</h3>
            <ul>
                <li><a href="/orderContents">주문 내역</a></li>
                <li><a href="/productReview">상품 후기</a></li>
                <li><a href="">적립금</a></li>
                <li><a href="/listPerAsk">내 1:1 문의</a></li>
                <li class="last"><a href="/myInfoModify">개인 정보 수정</a></li>
            </ul>
        </div>
    <div class="oder-detail">
        <h3 class="tt">주문내역</h3>
        <div class="status top-status"></div>
        <!-- detail-box -->
        <c:forEach items="${list}" var="list">
        <c:set var="title" value="${list.countProduct-1}"/>
        <div id="detail">
            <h3 class="tt detail_neme"><a href="orderDetail?idx=${list.idx}">${list.thumnailName} 외 상품${title}개</a>
            </h3>
            <div class="status s_status"></div>
            <img src="${list.thumnail}" alt="">
            <div class="detail-iname">
                <table>
                    <tr>
                        <td>결제금액</td>
                        <td>${list.finalPrice}원</td>
                    </tr>
                    <tr>
                        <td>주문번호</td>
                        <td>${list.orderNum}</td>
                    </tr>
                    <tr>
                        <td>배송상태</td>
                        <td>${list.deliveryState}</td>
                    </tr>
                </table>
            </div>
            <div id="detail_btn">
            <button type="button" class="tt detail_btn"><a href="mypage-review_write.html">후기쓰기</a></button>
            <button type="button" class="tt detail_btn"><a href="/perAsk">1:1문의</a></button>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
</body>
</html>