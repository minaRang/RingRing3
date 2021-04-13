<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.dessert.ringring.domain.DTOBoard" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<DTOBoard> list= (List<DTOBoard>) session.getAttribute("list");
String id=(String)session.getAttribute("boardId");
int pageNum=(int) session.getAttribute("pageNum");%>
<% System.out.println(list);
    System.out.println(id);
    System.out.println(pageNum);%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--notice.jsp-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice.css">
    <link rel="stylesheet" href="css/my_review_list.css">
    <title>RingRing</title>
</head>

<body>

<div class="content">
        <div class="mycategory tt">
            <h3 class="tt">고객센터</h3>
            <ul>
                <li><a href="/noticeList?id=공지">공지사항</a></li>
                <li><a href="/noticeList?id=이벤트">이벤트</a></li>
                <li class="last"><a href="/noticeList?id=질문">자주묻는 질문</a></li>
            </ul>
        </div>
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
                <tr>
                    <td>
                        <%for(int i=1;i<=pageNum;i++){%>
                        <a href="/noticePage?button=<%=i%>"><%=i%></a>
                        <%}%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>