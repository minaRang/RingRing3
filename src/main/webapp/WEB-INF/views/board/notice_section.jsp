<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dessert.ringring.domain.DTOBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%DTOBoard board=(DTOBoard) session.getAttribute("board");
String authority=(String) session.getAttribute("authority");
    System.out.println(board);
    System.out.println("권한은"+authority);
%>
<c:set var="authority" value="${authority}"></c:set>
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
            <h2 class="tt">공지사항</h2>

            <!-- 공지사항 내용 -->
            <div class="notice_view">
                <table class="notice_table tt">
                    <tr>
                        <td>제목</td>
                        <td>${board.title}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>RingRing</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td><fmt:formatDate value="${board.date}" type="both"/></td>
                    </tr>
                </table>
                <p class="notice_p tt">${board.content}</p>
                <img src="${board.img}">
            </div>

            <!-- 목록 되돌아가기 버튼 -->
            <button type="button" class="notice_btn tt"><a href="/noticeList?id=${board.boardType}">목록</a></button>
            <c:if test="${authority eq 'admin'}">
                <!-- 수정하기 버튼 -->
                <button type="button" class="notice_btn tt"><a href="/boardUpdate">수정</a></button>
                <!-- 삭제하기 버튼 -->
                <button type="button" class="notice_btn tt"><a href="/boardDelete?idx=${board.idx}&boardType=${board.boardType}">삭제</a></button>
            </c:if>
        </div>
    </form>

</div>
</body>
</html>