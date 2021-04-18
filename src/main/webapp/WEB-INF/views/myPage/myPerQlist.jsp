<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 미나
  Date: 2021-04-14
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product_section.css">
    <link rel="stylesheet" href="css/notice.css">
    <title>product_section</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nerko+One&family=Noto+Sans+KR:wght@300;500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap');


        /* 폰트 위계 */

        /*font-family: 'Noto Sans KR', sans-serif;
        font-family: 'Montserrat', sans-serif; */


        *{
            padding: 0;
            margin: 0;
        }
        .tt{
            font-family: 'Noto Sans KR', sans-serif;
            color: rgb(60, 60, 60);
        }
        .st{
            font-family: 'Noto Sans KR', sans-serif;
            color: rgb(161, 161, 161);
        }
        button{
            border: 0;
            outline: 0;
        }

        /* ====고객후기 css==== */
        .customer_review{
            width: 1000px;
        }
        .customer_review table{
            width: 1000px;
            border-collapse: collapse;
        }
        .customer_review td{
            border-top: 1px solid rgb(161 , 161, 161);
            border-bottom: 1px solid rgb(161 , 161, 161);
            padding: 10px;
        }
        .customer_review .first{
            text-align: center;
        }
        .customer_review .number{
            width: 50px;
            text-align: center;
        }
        .customer_review .title{
            width: 550px;
        }
        .customer_review .writer{
            width: 100px;
            text-align: center;
        }
        .customer_review .date{
            width: 100px;
            text-align: center;
        }
        .customer_review .title #customer{
            width: 1000px;
            background-color: rgba(161, 161, 161, .1);
            display: none;
        }
        .customer_review .hide{
            display: none;
        }
        .customer_review .show{
            display: table-row;
        }
        .customer_review .item td{
            cursor: pointer;

        }
        /* ================================================== */
        .mycategory{
            width: 170px;
            position: absolute;
            /* top: 50px; */
            left: -200px;
        }
        .mycategory h3{
            font-size: 30px;
            font-weight: 400;
        }
        .mycategory ul{
            margin-top: 20px;
        }
        .mycategory li{
            list-style: none;
            border: 1px solid rgb(161, 161, 161);
            padding: 10px 20px;
            border-bottom: none;
        }
        .mycategory .last{
            border-bottom: 1px solid rgb(161, 161, 161);
        }
        .mycategory li a{
            text-decoration: none;
            font-family: 'Noto Sans KR', sans-serif;
            color: rgb(60, 60, 60);
            font-weight: 400;
        }
        /* ====content================= */
        .content{
            width: 1000px;
            height: auto;
            margin: 0 auto;
            position: relative;
        }
        /* =======oder-detail========= */
        .oder-detail{
            width: 1000px;
            margin-top: 50px;
        }
        .oder-detail h3{
            font-size: 20px;
            font-weight: 400;
            margin-top: 10px;
        }
        .oder-detail .top-status{
            margin-top: 35px;
        }

    </style>
</head>

<body>
<div class="content">
    <c:choose>
        <c:when test="${'admin' eq sessionScope.member.authority}">
        <div class="mycategory">
            <h3 class="tt">관리자메뉴</h3>
            <ul>
                <li><a href="/adminProduct">상품 관리</a></li>
                <li><a href="/productReview">상품 등록</a></li>
                <li><a href="/adminOrderHistory">주문내역 관리</a></li>
                <li><a href="">1:1 문의</a></li>
                <li class="last select"><a href="/adminUserInfo">회원관리</a></li>
            </ul>
        </div>
        </c:when>
        <c:when test="${'member' eq sessionScope.member.authority}">
        <div class="mycategory">
            <h3 class="tt">마이링링</h3>
            <ul>
                <li><a href="/orderContents">주문 내역</a></li>
                <li><a href="/productReview">상품 후기</a></li>
                <li><a href="">적립금</a></li>
                <li><a href="/listPerAsk">내 1:1 문의</a></li>
                <li class="last"><a href="/myInfoModify">개인 정보 수정</a></li>
            </ul>
        </div>
        </c:when>
    </c:choose>
    <div class="oder-detail">
        <h3 class="tt">1:1문의</h3>
        <div class="notice">
<%--            <h2 class="tt">${id}</h2>--%>
            <div class="notice_list">
                <table class="notice_table">
                    <tr>
                        <td class="first title tt">번호</td>
                        <td class="second title tt">제목</td>
                        <td class="third title tt">작성자</td>
                        <td class="fourth title tt">질문 유형</td>
                        <td class="fourth title tt">작성일</td>
                        <c:forEach var="list" items="${sessionScope.userList}">
                    <tr>
                        <td class="first tt">${list.idx}</td>
                        <td class="second tt"><a href="/replyPerAsk?idx=${list.idx}">${list.title}</a></td>
                        <td class="third tt">${list.id}</td>
                        <td class="third tt">${list.askType}</td>
                    <td class="fourth tt"><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    </c:forEach>
                    <tr>

                    </tr>
                </table>
            </div>
        </div>
    </div>


        <!-- 아코디언 js -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script type="text/javascript">
            $(function(){
                var article = (".recruit .show");
                $(".recruit .item  td").click(function() {
                    var myArticle =$(this).parents().next("tr");
                    if($(myArticle).hasClass('hide')) {
                        $(article).removeClass('show').addClass('hide');
                        $(myArticle).removeClass('hide').addClass('show');
                    }
                    else {
                        $(myArticle).addClass('hide').removeClass('show');
                    }
                });
            });
        </script>
</body>
</html>
