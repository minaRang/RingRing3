<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dessert.ringring.domain.DTOReview" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%ArrayList<DTOReview> reviews= (ArrayList<DTOReview>) session.getAttribute("reviews");
    System.out.println(reviews);%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--notice.jsp-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice.css">
    <link rel="stylesheet" href="css/product_section.css">
    <title>RingRing</title>

    <script src="http://code.jquery.com/jquery-1.10.1.js"></script>
    <script>
        $(document).ready(function () {
            // $(".put_btn").click(function () {
            //  alert($(".put_btn").attr("text"));
            // });
            $(".plus").on("click",(function(){
                var num = $(".numBox").val();
                var plusNum = Number(num) + 1;

                if(plusNum >= ${goods.stock}+1) {
                    $(".numBox").val(num);
                } else {
                    $(".numBox").val(plusNum);
                }
            }));
            $(".minus").click(function(){
                var num = $(".numBox").val();
                var minusNum = Number(num) - 1;

                if(minusNum <= 1) {
                    $(".numBox").val(num);
                } else {
                    $(".numBox").val(minusNum);
                }
            });
        });
    </script>
</head>

<body>

<div class="content">
    <div class="notice">
        <div class="customer_review tt">
            <table class="tt recruit">
                <tr>
                    <td class="first title tt">번호</td>
                    <td class="second title tt">제목</td>
                    <td class="third title tt">작성자</td>
                    <td class="fourth title tt">작성일</td>
                </tr>
                <c:forEach var="reviews" items="${reviews}">
                    <tr class="item">
                        <td class="number">${reviews.idx}</td>
                        <td class="title">${reviews.title}</td>
                        <td class="writer">${reviews.id}</td>
                        <td class="date"><fmt:formatDate value="${reviews.date}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    <tr class="hide">
                        <td colspan="4">
                            <div class="hide_review">
                                <img src="${reviews.img}">
                                <p>${reviews.content}</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="five title tt" colspan="4">
                            <!-- 삭제하기 버튼 *나중에 권한에 따라 보이고 안보이고 설정해야함-->
                            <button type="button" class="notice_btn tt"><a href="/ReviewDelete?idx=${reviews.idx}">삭제</a></button>
                        </td>
                    </tr>

            </table>
            <button type="button" class="notice_btn tt"><a href="/ReviewWrite">글쓰기</a></button>
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
    </div>
</div>
</div>

</body>
</html>