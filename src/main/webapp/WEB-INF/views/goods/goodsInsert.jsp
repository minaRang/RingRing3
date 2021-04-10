 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
  <link rel="stylesheet" href="css/notice_write.css">
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
       <td class="sub title">
        <input type="text" name="name" value maxlength="16" label="이름" placeholder="상품명을 입력해주세요">
       </td>
      </tr>

      <tr>
      <td class="tit">가격</td>
       <td>
        <input type="text" name="price" value maxlength="16" label="가격" placeholder="상품명을 입력해주세요">
       </td>
      </tr>

      <tr>
       <td class="tit">중량</td>
       <td>
        <input type="text" name="weight" value maxlength="16" label="중량" placeholder="중량을 입력해주세요">
       </td>
      </tr>

      <tr>
       <td class="tit">재고</td>
       <td>
        <input type="text" name="stock" value maxlength="16" label="재고" placeholder="숫자 입력해주세요"></td>
      </tr>

      <tr>
       <td class="tit">설명</td>
       <td><input type="text" name="detail" value maxlength="16" label="설명" placeholder="설명 입력해주세요"></td>
      </tr>

      <tr>
       <td class="tit">짧은설명</td>
       <td><input type="text" name="shortDetail" value maxlength="16" label="짧은설명" plaeholder="짧은설명 입력해주세요"></td>
      </tr>

      <tr>
       <td class="tit">대분류</td>
       <td><input type="text" name="category1" value maxlength="16" label="대분류" plaeholder="대분류 입력해주세요"></td>
      </tr>

      <tr>
       <td class="tit">소분류</td>
       <td><input type="text" name="category2" value maxlength="16" label="소분류" plaeholder="소분류 입력해주세요"></td>
      </tr>

      <tr>
       <td class="tit">대표 이미지</td>
       <td>
        <!--파일 선택-->
        <div class="custom-file">
         <input type="file" name="file" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
         <label class="custom-file" for="inputGroupFile01"></label>
        </div>
       </td>
      </tr>

      <tr>
       <td class="tit">상세 이미지</td>
       <td>
        <!--파일 선택-->
        <div class="custom-file">
         <input type="file" class="custom-file-input" id="" aria-describedby="inputGroupFileAddon01">
         <label class="custom-file" for="inputGroupFile01"></label>
        </div>
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