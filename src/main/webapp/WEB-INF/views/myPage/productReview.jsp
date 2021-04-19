<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dessert.ringring.domain.DTOReview" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%ArrayList<DTOReview> myReviews= (ArrayList<DTOReview>) session.getAttribute("myReviews");
    System.out.println("myreview="+myReviews);%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/my_review_list.css">
    <title>RingRing</title>
</head>
<body>
<div class="content">
    <div class="mycategory tt">
        <h3 class="tt">마이링링</h3>
        <ul>
            <li><a href="/orderContents">주문 내역</a></li>
            <li><a href="/productReview">상품 후기</a></li>
            <li><a href="/point">적립금</a></li>
            <li><a href="/listPerAsk">내 1:1 문의</a></li>
            <li class="last"><a href="/myInfoModify">개인 정보 수정</a></li>
        </ul>
    </div>
    <div class="review">
        <h3 class="tt">상품 후기</h3>
        <div class="review_list">
            <table class="review_table">
                <tr>
                    <td class="first title tt">번호</td>
                    <td class="second title tt">제목</td>
                    <td class="third title tt">작성자</td>
                    <td class="fourth title tt">작성일</td>
                </tr>
                <c:forEach var="myReviews" items="${myReviews}">
                <tr>
                    <td class="first tt">${myReviews.idx}</td>
                    <td class="second tt"><a href="/productReviewDetail?idx=${myReviews.idx}">${myReviews.title}</a></td>
                    <td class="third tt">${myReviews.id}</td>
                    <td class="fourth tt"><fmt:formatDate value="${myReviews.date}" pattern="yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>