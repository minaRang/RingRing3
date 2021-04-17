 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 </head>
 <body>
 <form method="post" id="authForm" action="/replyPerAsk">
  <div class="status"></div>
  <table class="joinform">

<input type="hidden" name="idx" value="${sessionScope.getPerAsk.idx}">
   <tr>
    <th class="tt">id</th>
    <td>
     <input type="text"  value="${sessionScope.getPerAsk.id}" label="이름" readonly>
    </td>
   </tr>

   <tr>
    <th class="tt">title</th>
    <td><input type="text" readonly value="${sessionScope.getPerAsk.title}" ></td>
   </tr>


   <tr>
    <th class="tt">내용</th>
    <td><input type="text"  value="${sessionScope.getPerAsk.content}" readonly ></td>
   </tr>


   <tr>
    <th class="tt">질문유형</th>
    <td><input type="text" readonly value="${sessionScope.getPerAsk.askType}" ></td>
   </tr>

   <tr>
    <th class="tt">title</th>
    <td><input type="text" name="title" label="제목" readonly value="${sessionScope.getPerAsk.title}" ></td>
   </tr>
   <tr>

    <th class="tt">답변등록</th>
    <td><input type="text" id="reContent" name="reContent"></td>
   </tr>

  </table>
  <div id="formSubmit">
   <button type="submit">등록하기</button>
  </div>
 </form>

 </body>
 </html>