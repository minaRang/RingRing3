<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product_list.css">
    <title>RingRing</title>
</head>
<body>

<div class="status"></div>
<div id="product" style=" margin-bottom: 100px">
    <div id="product_inner">
        <div style="height: 100px"></div>
        <ul class="product_img">
            <c:forEach var="list" items="${sessionScope.list}">
                <li>
                    <a href="goodsDetail?idx=${list.idx}"><img src="${list.img}"></a>
                    <h3 class="tt">${list.name}</h3>
                    <p class="tt">${list.price} 원</p>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>