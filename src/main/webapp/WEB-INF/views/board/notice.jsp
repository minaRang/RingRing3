<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.dessert.ringring.domain.DTOBoard" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%ArrayList<DTOBoard> list= (ArrayList<DTOBoard>) session.getAttribute("list");
String id=(String)session.getAttribute("boardId");%>
<% System.out.println(list);
    System.out.println(id);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--notice.jsp-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice.css">
    <title>RingRing</title>
</head>

<body>

<div class="content">
    <div class="notice">
        <h2 class="tt">${id}</h2>
        <div class="notice_list">
            <table class="notice_table">
                <tr>
                    <td class="first title tt">번호</td>
                    <td class="second title tt">제목</td>
                    <td class="third title tt">작성자</td>
                    <td class="fourth title tt">작성일</td>
                <c:forEach var="list" items="${list}">
                <tr>
                    <td class="first tt">${list.idx}</td>
                    <td class="second tt"><a href="/notice_section?idx=${list.idx}">${list.title}</a></td>
                    <td class="third tt">RingRing</td>
                    <td class="fourth tt"><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>

</body>
</html>