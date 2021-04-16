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
            <li><a href="/orderContents">상품 관리</a></li>
            <li><a href="/productReview">상품 등록</a></li>
            <li class="select"><a href="">주문내역 관리</a></li>
            <li><a href="">1:1 문의</a></li>
            <li class="last"><a href="/myInfoModify">회원관리</a></li>
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
                <tr class="item">
                    <td class="number">00</td>
                    <td class="date">21-04-09</td>
                    <td class="pro_number">1666232</td>
                    <td class="product">녹차 쿠키</td>
                    <td class="user">김다빈</td>
                    <td class="delivery">배송완료</td>
                </tr>
                <tr class="hide">
                    <td colspan="6">
                        <div class="hide_content">
                            <img src="image/content3.jpg" alt="">
                            <table class="hide_p">
                                <tr>
                                    <td>상품이름</td>
                                    <td>녹차쿠키</td>
                                </tr>
                                <tr>
                                    <td>결제금액</td>
                                    <td>5,000원</td>
                                </tr>
                                <tr>
                                    <td>주문번호</td>
                                    <td>1666232</td>
                                </tr>
                            </table>
                            <div id="hide_save">
                                <select name="" id="hide_select">
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                                <button class="save tt" type="submit">저장</button>
                            </div>
                        </div>
                    </td>
                </tr>
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
    </div>
</div>
</body>
</html>
