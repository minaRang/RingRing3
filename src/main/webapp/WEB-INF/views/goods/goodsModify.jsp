<%@ page import="com.dessert.ringring.domain.DTOGoods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
</head>
<body>

<!--업데이트-->
<div class="content">
 <div id="notice">
  <h3 class="tt">상품 등록하기</h3>
  <form action="/insertGoods" method="POST" name="notice" enctype="multipart/form-data">
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
       <input type="text" name="weight" value="${goods.price}" value maxlength="16" label="중량">
      </td>
     </tr>

     <tr>
      <td class="tit">재고</td>
      <td>
       <input type="text" name="stock" value="${goods.stock}" value maxlength="16" label="재고" ></td>
     </tr>

     <tr>
      <td class="tit">설명</td>
      <td><input type="text" name="detail" value="${goods.detail}" value maxlength="16" label="설명" ></td>
     </tr>

     <tr>
      <td class="tit">짧은설명</td>
      <td><input type="text" name="shortDetail" value="${goods.short_detail}" value maxlength="16" label="짧은설명" ></td>
     </tr>

     <tr>
      <td class="tit">대분류</td>
      <td><input type="text" name="category1" value="${goods.category1}" value maxlength="16" label="대분류" ></td>
     </tr>

     <tr>
      <td class="tit">소분류</td>
      <td><input type="text" name="category2" value="${goods.category2}" value maxlength="16" label="소분류" ></td>
     </tr>

    </table>
   </div>
   <button class="enroll_btn" type="submit">등록하기</button>
  </form>
 </div>
</div>
</body>
</html>