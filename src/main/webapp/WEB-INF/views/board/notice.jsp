<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.dessert.ringring.domain.DTOBoard" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<DTOBoard> list= (List<DTOBoard>) session.getAttribute("list");
String id=(String)session.getAttribute("boardId");
int pageNum=(int) session.getAttribute("pageNum");
int now=(int)session.getAttribute("now");
%>
<c:set var="authority" value="${authority}"></c:set>
<% System.out.println(list);
    System.out.println(id);
    System.out.println(pageNum);
    System.out.println(now);%>

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
                <li <%if(id.equals("공지"))%>class="select"<%%>><a href="/noticeList?id=공지">공지사항</a></li>
                <li <%if(id.equals("이벤트"))%>class="select"<%%>><a href="/noticeList?id=이벤트">이벤트</a></li>
                <li class="<c:if test="${authority ne 'admin'}">last</c:if><%if(id.equals("질문"))%> select<%%>" ><a href="/noticeList?id=질문">자주묻는 질문</a></li>
                <c:if test="${authority eq 'admin'}">
                    <li class="last" ><a href="/boardWrite">글쓰기</a></li>
                </c:if>
            </ul>

        </div>
    <div class="notice">
        <h2 class="tt"><%=id%></h2>
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
        <div class="page">
            <%for(int i=1;i<=pageNum;i++){
                System.out.println(i);
                if (i==now){%>
            <a style="color:#df404a" href="/noticePage?button=<%=i%>"><%=i%></a>
            <%;} else {%><a href="/noticePage?button=<%=i%>"><%=i%></a><%;}}%>
        </div>
    </div>
</div>

</body>
</html>