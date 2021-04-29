<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/question_section.css">
    <title>Document</title>
</head>
<body>
    <div class="content">
        <div class="notice_section">
            <h2 class="tt">1:1문의</h2>
            <div class="notice_view">
                <table class="notice_table tt">
                    <tr>
                        <td>제목</td>
                        <td>${sessionScope.getPerAsk.title}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${sessionScope.getPerAsk.id}</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td><fmt:formatDate value="${sessionScope.getPerAsk.date}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </table>
                <p class="notice_p tt">${sessionScope.getPerAsk.img} ${sessionScope.getPerAsk.content}</p>
            </div>
            <c:if test="${'Y' eq sessionScope.getPerAsk.doAnswer}">
            <div class="answer">
                <h3 class="tt"><i class="fa fa-check-square-o"></i>RingRing 님의 답변</h3>
                <p class="tt">${sessionScope.getPerAsk.reContent}</p>
                <p>작성일 : ${sessionScope.getPerAsk.reDate}</p>
                <div class="status"></div>
            </div>
            </c:if>
            <!-- 목록 되돌아가기 버튼 -->
            <button type="button" class="notice_btn tt"><a href="/listPerAsk" style="color: white">목록</a></button>
        </div>
        <c:if test="${'Y' ne sessionScope.getPerAsk.doAnswer and 'admin' eq sessionScope.member.authority}">
        <div class="comment tt">
            <div class="status"></div>
            <table>
                <tr>
                    <td class="firsttd">답변쓰기</td>
                    <form method="post" action="/replyPerAsk">
                    <td>
                        <input type="hidden" name="idx" value="${sessionScope.getPerAsk.idx}">
                        <textarea name="reContent" id="comment" cols="30" rows="10"></textarea>
                    </td>
                    <td><button type="submit" class="tt">등록</button></td>
                    </form>
                </tr>
            </table>
            <div class="status"></div>
        </div>
        </c:if>
    </div>
</body>
</html>