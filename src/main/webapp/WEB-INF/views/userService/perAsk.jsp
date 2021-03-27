 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/question.css">
  <title>Document</title>
 </head>
 <body>
 <div class="content">
  <div class="mycategory">
   <h3 class="tt">마이링링</h3>
   <ul>
    <li><a href="/orderContents">주문 내역</a></li>
    <li><a href="">상품 후기</a></li>
    <li><a href="">적립금</a></li>
    <li><a href="">쿠폰</a></li>
    <li class="last"><a href="/myInfoModify">개인 정보 수정</a></li>
   </ul>
  </div>
  <div id="question">
   <h3 class="tt">1:1 문의</h3>
   <form action="/perAsk" method="POST" name="question" enctype="multipart/form-data">
    <div class="question">
     <table class="tt">
      <tr>
       <td class="tit">제목</td>
       <td class="sub title"><input type="text" name="title"></td>
      </tr>
      <tr>
       <td class="tit">질문유형</td>
       <td class="sub title" style="padding: 10px">
        <p>홈페이지 이용<input type="radio" name="askType" value="홈페이지 이용"></p>
        <p>배송<input type="radio" name="askType" value="배송"></p>
        <p>상품<input type="radio" name="askType" value="상품"></p>
        <p>기타<input type="radio" name="askType" value="기타"></p>
       </td>
      </tr>

      <tr>
       <td class="tit">첨부파일</td>
       <td class="sub title"><input type="file" name="file"></td>
      </tr>
      <tr>
       <td class="tit">이메일</td>
       <td class="sub email"><input type="text"></td>
      </tr>
      <tr>
       <td class="tit">핸드폰</td>
       <td class="sub sms"><input type="text"></td>
      </tr>
      <tr>
       <td class="tit">내용</td>
       <td class="sub inquiries">
        <p style="padding: 10px">
         1:1 문의 작성 전 확인해주세요<br><br>
         현재 문의량이 많아 답변이 지연되고 있습니다. 문의 남겨 주시면 2일 이내 순차적으로 답변 드리겠습니다.<br><br>
         <strong>반품 / 환불</strong><br>
         - 제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<br><br>
         <strong>주문취소</strong><br>
         - 배송 단계별로 주문취소 방법이 상이합니다.<br>
         [입금확인] 단계 : [마이링링 > 주문내역 상세페이지] 에서 직접 취소 가능<br>
         [입금확인] 이후 단계 : 고객행복센터로 문의<br><br>
         - 생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.<br>
         - 비회원은 모바일 App 또는 모바일 웹사이트에서 [마이링링 > 비회원 주문 조회 페이지] 에서 취소가 가능합니다.<br>
         - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.<br>
         - 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소후 재구매 해주세요.<br><br>
        </p>
        <textarea style="margin-bottom: 50px" name="content" id="inquiries" cols="30" rows="10"></textarea>
       </td>
      </tr>
     </table>
    </div>
    <button type="submit" class="enroll_btn">등록하기</button>
   </form>
  </div>


 </div>
 </body>
 </html>