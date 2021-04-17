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
    <link rel="stylesheet" href="css/my_review_list.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <div class="mycategory tt">
        <h3 class="tt">고객센터</h3>
        <ul>
            <li <%if (board.getBoardType().equals("공지"))%>class="select"<%%>><a href="/noticeList?id=공지">공지사항</a></li>
            <li <%if(board.getBoardType().equals("이벤트"))%>class="select"<%%>><a href="/noticeList?id=이벤트">이벤트</a></li>
            <li class="<c:if test="${authority ne 'admin'}">last</c:if><%if(board.getBoardType().equals("질문"))%> select<%%>" ><a href="/noticeList?id=질문">자주묻는 질문</a></li>
            <c:if test="${authority eq 'admin'}">
                <li class="last" ><a href="/boardWrite">글쓰기</a></li>
            </c:if>
        </ul>
    </div>
    <form method="post">
        <div class="notice_section">
            <h2 class="tt">${board.boardType}</h2>

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
            <div style="text-align: center;">
            <button type="button" class="notice_btn tt"><a href="/noticeList?id=${board.boardType}">목록</a></button>
            <c:if test="${authority eq 'admin'}">
                <!-- 수정하기 버튼 -->
                <button type="button" class="notice_btn tt"><a href="/boardUpdate?boardIdx=${board.idx}">수정</a></button>
                <!-- 삭제하기 버튼 -->
                <button type="button" class="notice_btn tt"><a href="/boardDelete?idx=${board.idx}&boardType=${board.boardType}">삭제</a></button>
            </c:if>
            </div>
        </div>
    </form>

</div>
</body>
</html>