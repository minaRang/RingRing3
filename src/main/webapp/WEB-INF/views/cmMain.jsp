<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%ArrayList<DTOGoods> list= (ArrayList<DTOGoods>) session.getAttribute("list");%>
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
<div id="banner">
    <div id="banner_inner">
        <div class="bs-slider">
            <div><a href="#"><img src="image/banner1.jpg" alt=""></a></div>
            <div><a href="#"><img src="image/banner2.jpg" alt=""></a></div>
            <div><a href="#"><img src="image/banner3.jpg" alt=""></a></div>
        </div>
    </div>
</div>
<div id="container">
    <div id="container_inner">
        <form method="post">
            <div class="newfood">
                <h2>NEW</h2>
                <ul class="new_list">
                    <c:forEach var="list" items="${list}" begin="0" end="7" step="1">
                        <li>
                            <a href="goodsDetail?idx=${list.idx}"><img src=${list.img}></a>
                            <h3 class="tt">${list.name}</h3>
                            <p class="tt">${list.price} 원</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </form>
    </div>
</div>
<div style="height: 200px"></div>
<span class="status"></span>
</body>
</html>