<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%ArrayList<DTOGoods> list= (ArrayList<DTOGoods>) session.getAttribute("list");
    String category=(String)session.getAttribute("category");
    String subCategory=(String)session.getAttribute("subCategory");
    ArrayList<String> subCategoryList=(ArrayList<String>) session.getAttribute("subCategoryList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product_list.css">
    <script>
        /* When the user clicks on the button,
        toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        // Close the dropdown if the user clicks outside of it
        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
    <title>RingRing</title>
</head>
<body>

<div class="status"></div>
<div id="product">
    <div id="product_inner">
        <h2>${category}</h2>
        <ul class="product_list tt">
            <c:forEach var="subCategoryList" items="${subCategoryList}">
            <li><a href="/productList?category=${category}&sub=${subCategoryList}">${subCategoryList}</a></li>
            </c:forEach>
        </ul>

        <ul class="select tt">
            <li class="select_first"><a href="/productList?category=${category}<c:if test="${not empty subCategory}">&sub=${subCategory}</c:if>">?????????</a></li>
            <li><a href="/productList?category=${category}<c:if test="${not empty subCategory}">&sub=${subCategory}</c:if> &range=stock">?????????</a></li>
            <li><a href="/productList?category=${category}<c:if test="${not empty subCategory}">&sub=${subCategory}</c:if>&range=price">?????? ?????????</a></li>
            <li><a href="/productList?category=${category}<c:if test="${not empty subCategory}">&sub=${subCategory}</c:if>&range=price&desc=y">?????? ?????????</a></li>
        </ul>

        <ul class="product_img">
            <c:forEach var="list" items="${list}">
            <li>
                <a href="goodsDetail?idx=${list.idx}"><img src="${list.img}"></a>
                <h3 class="tt">${list.name}</h3>
                <p class="tt">${list.price} ???</p>
            </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>