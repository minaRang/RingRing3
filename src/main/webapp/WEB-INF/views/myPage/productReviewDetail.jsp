<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dessert.ringring.domain.DTOReview" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    DTOReview myReview=(DTOReview) session.getAttribute("myReview");
    System.out.println(myReview);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice_section.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <form method="post">
        <div class="notice_section">
            <div class="notice_view">
                <table class="notice_table tt">
                    <tr>
                        <td>제목</td>
                        <td>${myReview.title}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${myReview.id}</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td><fmt:formatDate value="${myReview.date}" type="both"/></td>
                    </tr>
                </table>
                <p class="notice_p tt">${myReview.content}</p>
                <img src="${myReview.img}">
            </div>

        </div>
    </form>

</div>
</body>
</html>