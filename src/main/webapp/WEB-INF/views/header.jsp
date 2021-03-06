<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <script src="js/main.js"></script>
    <title>RingRing Dessert</title>
</head>
<body>
 <div id="header">
        <div id="header_inner">
            <div class="usr_menu">
                <ul class="tt">
                <c:choose>
                	<c:when test="${sessionScope.userId==null}">
                    <li><a href="/join">회원가입</a></li>
                    <li><a href="/login">로그인</a></li>
                        <li><a href="/login">장바구니</a></li>
                    </c:when>
                    <c:when test="${'admin' eq sessionScope.member.authority}">
                    <li>안녕하세요 관리자님!</li>
                    <li><a href="/adminProduct">관리자 메뉴</a></li>
                    <li><a href="${path}/logout">로그아웃</a></li>
                     </c:when>
                    <c:otherwise>
                    <li>안녕하세요 ${sessionScope.userName}님!</li>
                        <li><a href="/orderContents">내정보 보기</a></li>
                    <li><a href="${path}/logout">로그아웃</a></li>
                        <li><a href="/cart">장바구니</a></li>
                    </c:otherwise>
                    </c:choose>
                    <li><a href="/noticeList?id=공지">고객센터</a></li>
                </ul>
            </div>
            <a href="/"><div class="logo">logo</div></a>
            <div class="gnbMenu">
                <ul class="gnb">
                    <li class="cookie"><a href="/productList?category=cookie">Cookie</a>
                        <div class="cookie_sub">
                            <a href="/productList?category=cookie&sub=butter">Butter</a>
                            <a href="/productList?category=cookie&sub=vegan">Vegan</a>
                            <a href="/productList?category=cookie&sub=pet">Pet</a>
                        </div>
                    </li>
                    <li class="bread"><a href="/productList?category=bread">Bread</a>
                        <div class="bread_sub">
                            <a href="/productList?category=bread&sub=bread">Bread</a>
                            <a href="/productList?category=bread&sub=cake">Cake</a>
                        </div>
                    </li>
                    <li class="drink"><a href="/productList?category=drink">Drink</a>
                        <div class="drink_sub">
                            <a href="/productList?category=drink&sub=juice">Juice</a>
                            <a href="/productList?category=drink&sub=alcohol">Alcohol</a>
                        </div>
                    </li>
                    <li class="etc"><a href="/productList?category=Etc">Etc</a></li>
                    <form method="post" action="/search">
                    <li class="search-container">
                        <input type="text" placeholder="Search" name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </li>
                    </form>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>