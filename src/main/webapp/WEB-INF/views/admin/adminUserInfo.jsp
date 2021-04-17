<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/userModify.css">
    <!-- <link rel="stylesheet" href="css/product_section.css"> -->
    <title>product_section</title>
</head>

<body>
<div class="content">
    <!--mycategory class이름 변경 => admincategory 그외 h3 랑 li 이름 조금씩 변경   -->
    <div class="admincategory">
        <h3 class="tt">관리자메뉴</h3>
        <ul>
            <li><a href="/adminProduct">상품 관리</a></li>
            <li><a href="/productReview">상품 등록</a></li>
            <li><a href="/adminOrderHistory">주문내역 관리</a></li>
            <li><a href="">1:1 문의</a></li>
            <li class="last select"><a href="/adminUserInfo">회원관리</a></li>
        </ul>
    </div>
    <div class="oder-detail">
        <!-- h3 고객정보에서 회원관리로 이름 바꿨어용 -->
        <h3 class="tt">회원관리</h3>
        <div class="status top-status"></div>
        <div class="customer_review tt">
            <table class="tt recruit">
                <tr>
                    <td class="first number">idx</td>
                    <td class="first number">회원아이디</td>
                    <td class="first title">가입날짜</td>
                    <td class="first writer">회원등급</td>
                    <td class="first date">활동여부</td>
                </tr>
                <c:forEach var="list" items="${sessionScope.memberList}">
                    <tr class="item">
                        <td class="number">${list.idx}</td>
                        <td class="number">${list.id}</td>
                        <td class="title"><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></td>
                        <td class="writer">Gold</td>
                        <td class="date">${list.isEnable}</td>
                    </tr>
                    <tr class="hide">
                        <!--colspan=4 에서 5 로 변경  -->
                        <td colspan="5">
                            <div class="hide_review">
                                <!--br 추가 (줄간격)  -->
                                <p>이름 : ${list.name}</p><br>
                                <p>주소 : ${list.address1} ${list.address2} ${list.address3}</p><br>
                                <p>이메일 : ${list.email}</p><br>
                                <form>
                                    <p>활동 중지
                                        <select style="margin: 10px;" name="isEnable" id="title_select">
                                            <option value="Y">Y</option>
                                            <option value="N">N</option>
                                        </select><button type="submit" style="margin-left: 5px; padding: 3px; color: white;border-radius: 3px; background-color:rgb(228, 90, 90);"> 변경하기 </button></p></form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
