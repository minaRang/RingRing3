<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.dessert.ringring.domain.DTOCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%ArrayList<DTOCart> list= (ArrayList<DTOCart>) session.getAttribute("list");%>
<%
    System.out.println(list);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/shop-basket11.css">
</head>
<body>
<div class="content">
    <div class = "checkbox_group">

        <h2 class="tt">장바구니</h2>

        <div class="bst_top">
            <input class="" type="checkbox" name="exampleRadios" id="check_all" value="option1">
            <label class="form-check-label" for="check_all"> 전체선택</label>
            <p class="spc">I</p>
            <p class="del selectDelete_btn"><a href="#">선택삭제</a></p>
        </div>

        <div class="status"></div>
        <c:choose>
            <c:when test="${sessionScope.list.isEmpty()}">
                <img src="/image/none.png" style="width: 100%">
            </c:when>
            <c:otherwise>
        <c:set var="sum" value="0" />
        <c:forEach items="${list}" var="list">
            <div class="basket_product pro1">

                <!-- checkbox -->
                <div class="bst_checkbox pro_bst">
                    <input type="checkbox" class="chBox" name="chBox" id="cart1" value="option1" data-cartNum="${list.cartIdx}">
                </div>

                <!-- image -->
                <div class="bst_image pro_bst">
                    <img src="${list.dtoGoods.img}" style="width: 120px; height: 150px;">
                </div>

                <!-- name -->
                <div class="bst_name pro_bst">
                    <label class="form-check-label" for="cart1">
                        <p class="tt name">${list.dtoGoods.name}</p>
                        <p class="st price">${list.dtoGoods.price}원</p>
                    </label>
                </div>

                <!-- button -->
                <div class="bst_button pro_bst">
                    <button type="button" class="plus">
                        <i class="fa fa-plus-square-o"></i>
                    </button>
                    <input type="number" class="numBox" min="1" max="100" value=${list.amount} readonly="readonly"/>
                    <button type="button" class="minus">
                        <i class="fa fa-minus-square-o"></i>
                    </button>
                </div>
            </div>
            <c:set var="sum" value="${sum+(list.dtoGoods.price * list.amount)}"/>

        </c:forEach>
            </c:otherwise>
        </c:choose>

        <div class="status"></div>

        <script>
            $(".selectDelete_btn").click(function(){
                var confirm_val = confirm("정말 삭제하시겠습니까?");

                if(confirm_val) {
                    var checkArr = new Array();

                    // 체크된 체크박스의 갯수만큼 반복
                    $("input[class='chBox']:checked").each(function(){
                        checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
                    });

                    $.ajax({
                        url : "/deleteCart",
                        type : "post",
                        data : { chbox : checkArr },
                        success : function(result){

                            if(result == 1) {
                                location.href = "/cart";
                            } else {
                                alert("삭제 실패");
                            }
                        }
                    });
                }
            });
        </script>
    </div>
    <div class="bst-total">
        <table id="total">
            <tr>
                <td class="tt tit">상품금액</td>
                <td class="tt sub"> <fmt:formatNumber pattern="###,###,###" value="${sum}"/> 원</td>
            </tr>
            <tr>
                <td class="tt tit">상품할인금액</td>
                <td class="tt sub">0원</td>
            </tr>
            <tr>
                <td class="tt tit">배송비</td>
                <td class="tt sub">3000원</td>
            </tr>
        </table>
        <table id="last_total">
            <tr>
                <td class="tt tit">결제예정금액</td>
                <c:set var="sum" value="${sum+3000}"/>
                <td class="tt sub"> <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원</td>
            </tr>
        </table>
        <div class="total_btn">
            <button type="button" class="put_btn" onclick="check()">주문하기</button>
        </div>
    </div>
</div>

</body>

<!-- =====================js 실행 ======================== -->

<script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/bootstrap.js"></script>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script>

    //체크박스 전체선택
    $(".checkbox_group").on("click", "#check_all", function () {
        $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
    });

    // 체크박스 개별 선택
    $(".checkbox_group").on("click", ".form-check-input", function() {
        var is_checked = true;

        $(".checkbox_group .form-check-input").each(function(){
            is_checked = is_checked && $(this).is(":checked");
        });

        $("#check_all").prop("checked", is_checked);
    });
    //수량체크
    $(".plus").on("click",(function(){
        var num = $(".numBox").val();
        var plusNum = Number(num) + 1;

        if(plusNum >= 100) {
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
    function check(){
        if(${sessionScope.list.isEmpty()}){
            alert("상품을 담아주세요");
        }else{
            location.href="/orderForm";
        }

    }
</script>

</body>
</html>