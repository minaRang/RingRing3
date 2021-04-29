<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% DTOGoods goods=(DTOGoods) session.getAttribute("goods");
 System.out.println(goods);
%>

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="css/notice_write.css">
 <link rel="stylesheet" href="css/goodInsert.css">
 <link rel="stylesheet" href="css/mypage_oderlist.css">
 <link rel="stylesheet" href="css/product_admin.css">
 <script type="text/javascript">

  function doChange(srcE, targetId){
   var val = srcE.options[srcE.selectedIndex].value;
   var targetE = document.getElementById(targetId);
   removeAll(targetE);

   if(val == 'cookie'){
    addOption('butter', targetE);
    addOption('vegan', targetE);
    addOption('pet', targetE);
   }
   else if(val == 'bread'){
    addOption('bread', targetE);
    addOption('cake', targetE);
   }
   else if(val == 'drink'){
    addOption('juice', targetE);
    addOption('alcohol', targetE);
   }
  }

  function addOption(value, e){
   var o = new Option(value);
   try{
    e.add(o);
   }catch(ee){
    e.add(o, null);
   }
  }

  function removeAll(e){
   for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
    e.remove(1);
   }
  }
 </script>
</head>
<body>

<!--업데이트-->
<div class="content">
 <div class="admincategory">
  <h3 class="tt">관리자메뉴</h3>
  <ul>
   <li class="select"><a href="/adminProduct">상품 관리</a></li>
   <li><a href="/insertGoods">상품 등록</a></li>
   <li><a href="/adminOrderHistory">주문내역 관리</a></li>
   <li><a href="">1:1 문의</a></li>
   <li class="last"><a href="/adminUserInfo">회원관리</a></li>
  </ul>
 </div>
 <div id="notice">
  <h3 class="tt">상품 수정하기</h3>
  <form action="/modifyGoods" method="POST" name="notice" enctype="multipart/form-data">
   <input type="hidden" name="idx" value="${goods.idx}">
   <div class="notice">
    <table class="tt">
     <tr>
      <td class="tit">상품명</td>
      <td class="sub">
       <input type="text" name="name" value="${goods.name}" value maxlength="16" label="이름">
      </td>
     </tr>

     <tr>
      <td class="tit">가격</td>
      <td class="sub">
       <input type="text" name="price" value="${goods.price}" value maxlength="16" label="가격">
      </td>
     </tr>

     <tr>
      <td class="tit">중량</td>
      <td>
       <input type="text" name="weight" value="${goods.weight}" value maxlength="16" label="중량">
      </td>
     </tr>

     <tr>
      <td class="tit">재고</td>
      <td>
       <input type="text" name="stock" value="${goods.stock}" value maxlength="16" label="재고" ></td>
     </tr>

     <tr>
      <td class="tit">설명</td>
      <td><input type="text" name="detail" value="${goods.detail}" label="설명" ></td>
     </tr>

     <tr>
      <td class="tit">짧은설명</td>
      <td><input type="text" name="shortDetail" value="${goods.shortDetail}"  label="짧은설명" ></td>
     </tr>

     <tr>
      <td class="tit">대분류</td>
      <td>
       <select name="category1" id="category1" onchange="doChange(this, 'category2')">
        <option>===</option>
        <option value="cookie" <c:if test="${goods.category1 eq 'cookie'}">selected</c:if>>cookie</option>
        <option value="bread" <c:if test="${goods.category1 eq 'bread'}">selected</c:if>>bread</option>
        <option value="drink" <c:if test="${goods.category1 eq 'drink'}">selected</c:if>>drink</option>
        <option value="etc" <c:if test="${goods.category1 eq 'etc'}">selected</c:if>>Etc</option>
       </select>
     </tr>

     <tr>
      <td class="tit">소분류</td>
      <td>
       <select name="category2" id="category2">
        <option>===</option>
        <c:if test="${goods.category1 eq 'bread'}">
          <option value="bread" <c:if test="${goods.category2 eq 'bread'}">selected</c:if>>bread</option>
          <option value="cake" <c:if test="${goods.category2 eq 'cake'}">selected</c:if>>cake</option>
        </c:if>
        <c:if test="${goods.category1 eq 'cookie'}">
         <option value="bread" <c:if test="${goods.category2 eq 'butter'}">selected</c:if>>butter</option>
         <option value="vegan" <c:if test="${goods.category2 eq 'vegan'}">selected</c:if>>vegan</option>
         <option value="pet" <c:if test="${goods.category2 eq 'pet'}">selected</c:if>>pet</option>
        </c:if>
        <c:if test="${goods.category1 eq 'drink'}">
         <option value="jucie" <c:if test="${goods.category2 eq 'jucie'}">selected</c:if>>jucie</option>
         <option value="alcohol" <c:if test="${goods.category2 eq 'alcohol'}">selected</c:if>>alcohol</option>
        </c:if>
       </select>
      </td>
     </tr>


    </table>
   </div>
   <button class="enroll_btn" type="submit">등록하기</button>
  </form>
 </div>
</div>
</body>
</html>
