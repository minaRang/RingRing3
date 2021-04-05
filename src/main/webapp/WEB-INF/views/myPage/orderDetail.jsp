<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/mypage_oderlist_section.css">
    <title>Document</title>
</head>
<body>
<div class="content">
    <div class="mycategory">
        <h3 class="tt">마이링링</h3>
        <ul>
            <li><a href="/orderContents">주문 내역</a></li>
            <li><a href="/productReview">상품 후기</a></li>
            <li><a href="">적립금</a></li>
            <li><a href="">쿠폰</a></li>
            <li class="last"><a href="/myInfoModify">개인 정보 수정</a></li>
        </ul>
    </div>
    <!-- 주문내역 -->
    <h3 class="tt">주문 내역 상세</h3>
    <h3>주문번호 ${sessionScope.orderDetail.orderNum}</h3>
    <c:forEach var="list" items="${sessionScope.productList}">
    <div id="oderlist_section">
        <div class="oder_item tt">
            <div class="status"></div>
            <div id="item">
                <h4 class="tt">[${list.dtoGoods.category1} / ${list.dtoGoods.category2}] ${list.dtoGoods.name}</h4>
                <div class="item_se">
                    <img src="${list.dtoGoods.img}" alt="">
                    <div class="item_name">
                        <p>${list.dtoGoods.name}</p>
                        <p class="price_name">${list.price}원 ${list.amount}개 구매</p>
                    </div>
                    <p class="delivery">${sessionScope.orderDetail.deliveryState}</p>
                    <div class="item_btn">
                        <button class="review_btn tt"><a href="">후기쓰기</a></button>
                        <button class="basket_btn tt"><a href="">장바구니 담기</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    <!--상품 취소 버튼 -->
    <div id="cancel_btn">
        <button class="all_basket tt"><a href="">전체 상품 다시 담기</a></button>
        <button class="all_cancel tt"><a href="">전체 상품 주문 취소</a></button>
    </div>
    <!-- 배송조회 -->
    <div id="delivery_lookup">
        <h3 class="tt">배송조회</h3>
        <div class="status"></div>
        <div class="delivery_ing tt">
            <p>배송중 단계부터 배송상태 확인이 가능합니다.</p>
        </div>
    </div>
    <!-- 결제정보 -->
    <div id="payment_info">
        <h3 class="tt">결제 정보</h3>
        <div class="status"></div>
        <div class="pay_info">
            <table class="tt">
                <tr>
                    <td>총주문금액</td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${sessionScope.orderDetail.finalPrice}"/>원</td>
                </tr>
                <tr>
                    <td>상품할인</td>
                    <td>0원</td>
                </tr>
                <tr>
                    <td>쿠폰할인</td>
                    <td>0원</td>
                </tr>
                <tr>
                    <td>적립금 사용</td>
                    <td>0원</td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td>3000원</td>
                </tr>
                <tr>
                    <td>결제금액</td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${sessionScope.orderDetail.finalPrice}"/>원</td>
                </tr>
                <tr>
                    <td>적립금액</td>
                    <td>8원</td>
                </tr>
                <tr>
                    <td>결제방법</td>
                    <td>${sessionScope.orderDetail.payWith}</td>
                </tr>
            </table>
        </div>
    </div>
    <!-- 주문정보 -->
    <div id="oder_info">
        <h3 class="tt">주문 정보</h3>
        <div class="status"></div>
        <div class="od_info">
            <table class="tt">
                <tr>
                    <td>주문 번호</td>
                    <td>${sessionScope.orderDetail.orderNum}</td>
                </tr>
                <tr>
                    <td>주문하는 사람</td>
                    <td>${sessionScope.orderDetail.orderId}</td>
                </tr>
                <tr>
                    <td>받는 사람</td>
                    <td>${sessionScope.orderDetail.toName}</td>
                </tr>
                <tr>
                    <td>결제일시</td>
                    <td><fmt:formatDate value="${sessionScope.orderDetail.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>