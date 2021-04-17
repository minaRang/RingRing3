 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
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
     <li><a href="/adminProduct">상품 관리</a></li>
     <li class="select"><a href="/insertGoods">상품 등록</a></li>
     <li><a href="">주문내역 관리</a></li>
     <li><a href="">1:1 문의</a></li>
     <li class="last"><a href="/adminUserInfo">회원관리</a></li>
    </ul>
   </div>
  <div id="notice">
   <h3 class="tt">상품 등록하기</h3>
   <form action="/insertGoods" method="POST" name="notice" enctype="multipart/form-data">
    <div class="notice">
     <table class="tt">
      <tr>
       <td class="tit">상품명</td>
       <td class="sub">
        <input type="text" name="name" value maxlength="16" label="이름" placeholder="상품명을 입력해주세요">
       </td>
      </tr>

      <tr>
      <td class="tit">가격</td>
       <td class="sub">
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
       <td>
        <select name="category1" id="category1" onchange="doChange(this, 'category2')">
         <option>===</option>
         <option value="cookie">cookie</option>
         <option value="bread">bread</option>
         <option value="drink">drink</option>
         <option value="etc">Etc</option>
       </select>
      </tr>

      <tr>
       <td class="tit">소분류</td>
       <td>
        <select name="category2" id="category2">
         <option>===</option>
        </select>
       </td>
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
         <input type="file" name="file" class="custom-file-input" id="" aria-describedby="inputGroupFileAddon01">
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