<%@ page import="com.dessert.ringring.domain.DTOBoard" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    DTOBoard board=(DTOBoard) session.getAttribute("board");
    System.out.println(board);
%>
<c:set var="authority" value="${authority}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/notice_write.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <div class="mycategory tt">
        <h3 class="tt">고객센터</h3>
        <ul>
            <li><a href="/noticeList?id=공지">공지사항</a></li>
            <li><a href="/noticeList?id=이벤트">이벤트</a></li>
            <li><a href="/noticeList?id=질문">자주묻는 질문</a></li>
            <c:if test="${authority eq 'admin'}">
                <li class="last select" ><a href="/boardWrite">글쓰기</a></li>
            </c:if>
        </ul>
    </div>
    <div id="notice">
        <h3 class="tt">글쓰기</h3>
        <form action="/boardUpdate" method="POST" name="notice" enctype="multipart/form-data">
            <input type="hidden" name="idx" value="${board.idx}">
            <div class="notice">
                <table class="tt">
                    <tr>
                        <td class="tit">제목</td>
                        <td class="sub title">
                            <select name="boardType" id="title_select">
                                <option value="공지"<c:if test="${board.boardType eq '공지'}"> selected</c:if>>공지</option>
                                <option value="이벤트"<c:if test="${board.boardType eq '이벤트'}"> selected</c:if>>이벤트</option>
                                <option value="질문"<c:if test="${board.boardType eq '질문'}"> selected</c:if>>자주하는 질문</option>
                            </select>
                            <input type="text" name="title" value="${board.title}">
                        </td>
                    </tr>
                    <tr>
                        <td class="tit">내용</td>
                        <td class="sub inquiries">
                            <textarea name="content" id="content" cols="30" rows="10">${board.content}</textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <button class="enroll_btn" type="submit">수정하기</button>
        </form>
    </div>
</div>
</body>
</html>