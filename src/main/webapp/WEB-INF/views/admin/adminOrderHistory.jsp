<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 미나
  Date: 2021-04-16
  Time: 오후 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/oder_history.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <div class="admincategory">
        <h3 class="tt">관리자메뉴</h3>
        <ul>
            <li><a href="/adminProduct">상품 관리</a></li>
            <li><a href="/insertGoods">상품 등록</a></li>
            <li class="select"><a href="/adminOrderHistory">주문내역 관리</a></li>
            <li><a href="/listPerAsk">1:1 문의</a></li>
            <li class="last"><a href="/adminUserInfo">회원관리</a></li>
        </ul>
    </div>
    <div id="oder_history">
        <h3 class="tt">주문내역 관리</h3>
        <div class="status"></div>
        <div class="oder_history">
            <!-- div menu 추가 -->
            <div id="history_menu">
                <ul class="history_menu tt">
                    <li>전체 보기</li>
                    <li>주문 확인 전</li>
                    <li>주문 확인</li>
                    <li>배송 준비 중</li>
                    <li>배송 중</li>
                    <li>배송 완료</li>
                </ul>
            </div>
                <table class="tt recruit">
                <tr>
                    <td class="first number">번호</td>
                    <td class="first date">주문일시</td>
                    <td class="first pro_number">주문번호</td>
                    <td class="first product">주문상품</td>
                    <td class="first user">주문자</td>
                    <td class="first delivery">배송상태</td>
                </tr>
                    <c:forEach items="${orderList}" var="list" varStatus="status">
                    <input type="hidden" name="orderId" value="${list.orderId}"/>
                    <input type="hidden" name="orderNum" value="${list.orderNum}"/>
                <tr class="item">
                    <td class="number">${list.idx}</td>
                    <td class="date"><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></td>
                    <td class="pro_number">${list.orderNum}</td>
                    <td class="product">${list.thumnailName}외 ${list.countProduct}개</td>
                    <td class="user" >${list.orderId}</td>
                    <td class="delivery" id="deliveryState">${list.deliveryState}</td>
                </tr>
                <tr class="hide">
                    <td colspan="6">
                        <div class="hide_content">
                            <img src="${list.thumnail}" alt="">
                            <table class="hide_p">
                                <tr>
                                    <td>상품이름</td>
                                    <td>${list.thumnailName}외 ${list.countProduct}개</td>
                                </tr>
                                <tr>
                                    <td>결제금액</td>
                                    <td>${list.finalPrice}</td>
                                </tr>
                                <tr>
                                    <td>주문번호</td>
                                    <td>${list.orderNum}</td>
                                </tr>
                                <tr>
                                    <td>받는이</td>
                                    <td>${list.toName}</td>
                                </tr>
                                <tr>
                                    <td>결제수단</td>
                                    <td>${list.payWith}</td>
                                </tr>
                                <tr>
                                    <td>주문메세지</td>
                                    <td>${list.memo}</td>
                                </tr>
                            </table>
                            <div id="hide_save">
                                <select name="select" id="hide_select">
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>s
                                </select>
                                <button class="save tt" type="button" onclick="dd(${status.index})">저장</button>
                            </div>
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
            function dd(number){
                var orderNumLength=$("input[name=orderNum]").length;
                var orderIdLength=$("input[name=orderId]").length;
                var deliverLength=$("select[name=select]").length;
                var orderNumArr=new Array(orderNumLength);
                for(var i=0;i<orderNumLength;i++){
                    orderNumArr[i]=$("input[name=orderNum]").eq(i).val();
                }
                var orderIdArr=new Array(orderNumLength);
                for(var i=0;i<orderIdLength;i++){
                    orderIdArr[i]=$("input[name=orderId]").eq(i).val();
                }
                var deliveryArr=new Array(deliverLength);
                for(var i=0;i<deliverLength;i++){
                    deliveryArr[i]=$("select[name=select]").eq(i).val();
                }
                var delivery=deliveryArr[number];
                var orderId=orderIdArr[number];
                var orderNum=orderNumArr[number];


                var stateData={"orderId":orderId,"delivery":delivery,"orderNum":orderNum};
                $.ajax({
                    async:true,
                    type:'POST',
                    traditional:true,
                    data:JSON.stringify(stateData),
                    url:"/deliveryState",
                    dataType:"json",
                    contentType:"application/json; charset=UTF-8",
                    success: function (orderSheet){
                        if(count=0){
                            alert("변경실패, 재시도 해주세요");
                        }else{
                            alert("변경되었습니다");
                            window.location.reload(true);
                        }
                    },
                    error:function (error){
                        alert("통신오류, 재시도 해주세요");
                    }
                });
            }
        </script>
    </div>
</div>
</body>
</html>
