<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page import="com.dessert.ringring.domain.DTOReview" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
  <% DTOGoods goods= (DTOGoods) session.getAttribute("goods"); %>
     <% ArrayList<DTOReview> reviews = (ArrayList<DTOReview>) session.getAttribute("reviews");
         System.out.println("reviewPage:"+reviews);
     %>

     <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/product_section.css">
  <title>product_section</title>
 </head>
 <body>
 <div class="status"></div>
 <div id="product_section">
  <div class="section_inner">
   <div class="section_view">

    <form role="form" method="post" action="/addCart">
     <input type="hidden" name="productIdx" value="${goods.idx}" />
        <input type="hidden" name="price" value="${goods.price}" />
        <img src="${goods.img}" alt="">
    <div class="view_p">
     <h2>${goods.name}</h2>
     <p class="view_name">${goods.shortDetail}</p>
     <p class="view_price">${goods.price}원</p>
     <div class="view_info">
      <dl class="v_list fst">
       <dt class="tit">판매단위</dt>
       <dd class="desc">${goods.weight}</dd>
      </dl>
      <dl class="v_list">
       <dt class="tit">배송구분</dt>
       <dd class="desc">택배배송</dd>
      </dl>
      <dl class="v_list">
       <dt class="tit">알레르기정보</dt>
       <dd class="desc">견과류 함유</dd>
      </dl>
     </div>
    </div>
    <div class="cartPut">
     <div class="total">
      <button type="button" class="minus"><i class="fa fa-minus-square-o"></i></button>
      <input type="number" value="1" class="numBox" readonly="readonly" name="amount">
      <button type="button" class="plus"><i class="fa fa-plus-square-o"></i></button>
     </div>
     <div class="cart_btn">
      <button type="submit" class="put_btn">장바구니 담기</button>

 <%--      <script>--%>
<%--       $(".put_btn").click(function(){--%>

<%--        var productIdx = $("#productIdx").val();--%>
<%--        var amount = $(".numBox").val();--%>

<%--        var data = {--%>
<%--         productIdx : productIdx,--%>
<%--         amount : amount--%>
<%--        };--%>

      <%--  $.ajax({--%>
      <%--   url : "goods/goodsDetail/addCart",--%>
      <%--   type : "post",--%>
      <%--   data : data,--%>
      <%--   success : function(result){--%>

      <%--    if(result == 1) {--%>
      <%--     alert("카트 담기 성공");--%>
      <%--     $(".numBox").val("1");--%>
      <%--    } else {--%>
      <%--     alert("회원만 사용할 수 있습니다.")--%>
      <%--     $(".numBox").val("1");--%>
      <%--    }--%>
      <%--   },--%>
      <%--   error : function(){--%>
      <%--    alert("카트 담기 실패");--%>
      <%--   }--%>
      <%--  });--%>
      <%-- });--%>
      <%--</script>--%>
     </div>
    </div>
    </form>
   </div>
      <div class="section_relation">
          <ul class="goods_information tt">
              <li class="goods_view" id="active">
                  <a href="" class="goods_view_information">상품설명</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">상세정보</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">고객후기</a>
              </li>
          </ul>
          <div class=><img src="${goods.imgDetail}"></div>
          <ul class="goods_information tt">
              <li class="goods_view">
                  <a href="" class="goods_view_information">상품설명</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">상세정보</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">고객후기</a>
              </li>
          </ul>
          <div class="section_info tt">
              <table id="section">
                  <tr>
                      <td class="tit">제품명</td>
                      <td class="sub">녹차 쿠키</td>
                      <td class="tit">식품의 유형</td>
                      <td class="sub">과자</td>
                  </tr>
                  <tr>
                      <td class="tit">생산자 및 소재자</td>
                      <td class="sub">링링디저트</td>
                      <td class="tit">제조연원일,유통기한</td>
                      <td class="sub">제품 별도 라벨 표기 참조</td>
                  </tr>
                  <tr>
                      <td class="tit">포장 단위별 내용물의 용량</td>
                      <td class="sub">옵션 별 상이</td>
                      <td class="tit">원재료명 및 함량</td>
                      <td class="sub">상품설명 및 상품이미지 참조</td>
                  </tr>
                  <tr>
                      <td class="tit">영양성분</td>
                      <td class="sub">상품설명 및 상품이미지 참조</td>
                      <td class="tit">유전자변형 식품에 해당하는 경우의 표시</td>
                      <td class="sub">상품 설명 및 상품이미지 참조</td>
                  </tr>
                  <tr>
                      <td class="tit">소비자 안전을 위한 주의사항</td>
                      <td class="sub">상품설명 및 상품이미지 참조</td>
                      <td class="tit">소비자 상담관련 전화번호</td>
                      <td class="sub">링링디저트 고객센터 (0000-0000)</td>
                  </tr>
              </table>
          </div>
<!--             후기                 -->
          <ul class="goods_information tt">
              <li class="goods_view">
                  <a href="" class="goods_view_information">상품설명</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">상세정보</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">고객후기</a>
              </li>
          </ul>
          <div class="customer_review tt">
              <table class="tt recruit">
                  <tr>
                      <td class="first number">번호</td>
                      <td class="first title">제목</td>
                      <td class="first writer">작성자</td>
                      <td class="first date">작성일</td>
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
                              <c:if test="${reviews.id eq sessionScope.member.id}">
                              <p><a href="/ReviewUpdate?reviewIdx=${reviews.idx}">수정하기</a><a href="/ReviewDelete?reviewIdx=${reviews.idx}">삭제하기</a></p>
                              </c:if>
                          </div>
                        </td>
                      </tr>
                  </c:forEach>
              </table>
          </div>


          <!-- 아코디언 js -->
<%--          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>--%>
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
          </script>
 </div>
 </div>
 </div>
 </body>
 </html>
