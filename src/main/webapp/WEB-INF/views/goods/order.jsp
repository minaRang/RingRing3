<%@ page import="com.dessert.ringring.domain.DTOMember" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% int sum= (int) session.getAttribute("sum");%>
<% DTOMember member= (DTOMember) session.getAttribute("member");%>
<% System.out.println(member);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/oderform.css">
    <title>RingRing</title>
</head>
<body>
<form method="post" action="/insertOrder">
    <div class="orderform">
        <h3 class="tt">주문자 정보</h3>
        <table class="Order_orderer">
            <tr>
                <input type="hidden" type="text" name="orderId" value="${member.id}">
                <th><h4 class="tt">이름</h4></th>
                <td>
                    <input type="text" name="name" label="이름" id="name" value="${member.name}">
                </td>
            </tr>
            <tr>
                <th><h4 class="tt">연락처</h4></th>
                <td>
                    <input type="text" name="orderPhone" id="phone" value="${member.phone}" readonly>
                </td>
            </tr>
        </table>
        <h3 class="tt">배송 정보</h3>
        <table class="Order_delivery">
            <tr>
                <th><h4 class="tt">이름</h4></th>
                <td>
                    <input type="text" name="toName" id="toName" value="${member.name}">
                </td>
            </tr>
            <tr>
                <th scope="row"><h4 class="tt">주소</h4></th>
                <td>
                    <input type="text" name="toAddress1" id="address_1" value="${member.address1}">
                    <button type="button" class="address_search tt" onclick="openZipSearch()">우편번호 검색</button>
                    <br>
                    <input type="text" name="toAddress2" id="address_2" value="${member.address2}">
                    <!-- input id address_3 추가 (상세주소용) -->
                    <input type="text" name="toAddress3" id="address_3" value="${member.address3}">
                </td>
            </tr>
            <tr>
                <th><h4 class="tt">휴대폰</h4></th>
                <td>
                    <input type="text" name="toPhone" id="number" value="${member.phone}">
                </td>
            </tr>
            <tr>
                <th><h4 class="tt">요청사항</h4></th>
                <td><input type="text" name="memo" id="request"></td>
            </tr>
        </table>
        <h3 class="tt">결제 금액 확인 및 결제 방법 선택</h3>
        <table class="Order_total">
            <tr>
                <th><h4 class="tt">총 상품 가격</h4></th>
                <td><fmt:formatNumber pattern="###,###,###" value="${sum}"/> 원</td>
            </tr>
            <tr>
                <th><h4 class="tt">배송비</h4></th>
                <td>3000원</td>
            </tr>
            <tr>
                <th><h4 class="tt">총 결제 금액</h4></th>
                <c:set var="finalPrice" value="${sum+3000}"/>
                <input type="hidden" name="finalPrice" value="${finalPrice}"/>
                <td><fmt:formatNumber pattern="###,###,###" value="${finalPrice}"/> 원</td>
            </tr>
            <tr>
                <th><h4 class="tt">일반결제</h4></th>
                <td>
                    <input type="checkbox" name="payWith" onclick="doOpenCheck(this)" value="무통장입금">무통장입금
                    <input type="checkbox" name="payWith" onclick="doOpenCheck(this)" value="카드결제">카드결제
                    <input type="checkbox" name="payWith" onclick="doOpenCheck(this)" value="계좌이체">계좌이체
                    <input type="checkbox" name="payWith" onclick="doOpenCheck(this)" value="가상계좌">가상계좌
                </td>
                <script>
                    function doOpenCheck(chk){
                        var obj = document.getElementsByName("payWith");
                        for(var i=0; i<obj.length; i++){
                            if(obj[i] != chk){
                                obj[i].checked = false;
                            }
                        }
                    }
                </script>
            </tr>
        </table>

        <script>
            function openZipSearch() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        $('[id=address_1]').val(data.zonecode); // 우편번호 (5자리)
                        $('[id=address_2]').val(data.address);
                        $('[id=address_3]').val(data.buildingName);
                    }
                }).open();
            }
        </script>
        <div id="formSubmit">
            <!-- onclick은 나중에 js 연결하는 코드! -->
            <button type="submin" class="oder_btn tt">주문하기</button>
        </div>
    </div>
</form>
</body>


</html>