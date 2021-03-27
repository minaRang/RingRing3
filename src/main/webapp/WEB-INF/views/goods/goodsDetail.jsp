<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
  <% DTOGoods goods= (DTOGoods) session.getAttribute("goods"); %>
        <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/product_section.css">
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
          <div class="goods_img"></div>
          <ul class="goods_information tt">
              <li class="goods_view">
                  <a href="" class="goods_view_information">상품설명</a>
              </li>
              <li class="goods_view" id="active">
                  <a href="" class="goods_view_information">상세정보</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">고객후기</a>
              </li>
          </ul>
          <div class="goods_img"></div>
          <ul class="goods_information tt">
              <li class="goods_view">
                  <a href="" class="goods_view_information">상품설명</a>
              </li>
              <li class="goods_view">
                  <a href="" class="goods_view_information">상세정보</a>
              </li>
              <li class="goods_view" id="active">
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
                  <tr class="item">
                      <td class="number">00</td>
                      <td class="title">크레이지카츠 먹고싶어요~</td>
                      <td class="writer">경이</td>
                      <td class="date">2021-03-26</td>
                  </tr>
                  <tr class="hide">
                      <td colspan="4">
                          <divc class="hide_review">
                              <h3>[미나하우스] 초희귀 케이크</h3>
                              <p>케이크 먹기전에 크레이지카츠 먹고싶어요.<br><br>연남동 키친숲 들려서 카레 먹고 아오이토리 가서 빵 산 다음에 합정역 크레이지카츠가서 카레퐁듀 조집시다.당신과함께하고싶소...♥<br><br>-괴도키드-</p>
          </div>
          </td>
          </tr>
          <tr class="item">
              <td class="number">00</td>
              <td class="title">크레이지카츠 먹고싶어요~</td>
              <td class="writer">경이</td>
              <td class="date">2021-03-26</td>
          </tr>
          <tr class="hide">
              <td colspan="4">
                  <divc class="hide_review">
                      <h3>[미나하우스] 초희귀 케이크</h3>
                      <p>케이크 먹기전에 크레이지카츠 먹고싶어요.<br><br>연남동 키친숲 들려서 카레 먹고 아오이토리 가서 빵 산 다음에 합정역 크레이지카츠가서 카레퐁듀 조집시다.당신과함께하고싶소...♥<br><br>-괴도키드-</p>
      </div>
      </td>
      </tr>
      <tr class="item">
          <td class="number">00</td>
          <td class="title">크레이지카츠 먹고싶어요~</td>
          <td class="writer">경이</td>
          <td class="date">2021-03-26</td>
      </tr>
      <tr class="hide">
          <td colspan="4">
              <divc class="hide_review">
                  <h3>[미나하우스] 초희귀 케이크</h3>
                  <p>케이크 먹기전에 크레이지카츠 먹고싶어요.<br><br>연남동 키친숲 들려서 카레 먹고 아오이토리 가서 빵 산 다음에 합정역 크레이지카츠가서 카레퐁듀 조집시다.당신과함께하고싶소...♥<br><br>-괴도키드-</p>
  </div>
     </td>
     </tr>
     <tr class="item">
         <td class="number">00</td>
         <td class="title">크레이지카츠 먹고싶어요~</td>
         <td class="writer">경이</td>
         <td class="date">2021-03-26</td>
     </tr>
     <tr class="hide">
         <td colspan="4">
             <divc class="hide_review">
                 <h3>[미나하우스] 초희귀 케이크</h3>
                 <p>케이크 먹기전에 크레이지카츠 먹고싶어요.<br><br>연남동 키친숲 들려서 카레 먹고 아오이토리 가서 빵 산 다음에 합정역 크레이지카츠가서 카레퐁듀 조집시다.당신과함께하고싶소...♥<br><br>-괴도키드-</p>
 </div>
 </td>
 </tr>

 <tr class="item">
     <td class="number">00</td>
     <td class="title">크레이지카츠 먹고싶어요~</td>
     <td class="writer">경이</td>
     <td class="date">2021-03-26</td>
 </tr>
 <tr class="hide">
     <td colspan="4">
         <div class="hide_review">
             <h3>[미나하우스] 초희귀 케이크</h3>
             <p>케이크 먹기전에 크레이지카츠 먹고싶어요.<br><br>연남동 키친숲 들려서 카레 먹고 아오이토리 가서 빵 산 다음에 합정역 크레이지카츠가서 카레퐁듀 조집시다.당신과함께하고싶소...♥<br><br>-괴도키드-</p>
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
 </div>
 </body>
 </html>
