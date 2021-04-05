<%@ page import="com.dessert.ringring.domain.DTOMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% DTOMember member= (DTOMember) session.getAttribute("member");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/mypage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <title>RingRing : 회원정보수정</title>
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
        <div class="joinhead">
            <h2 class="tt">회원정보수정</h2>
        </div>
        <form method="post" id="authForm" action="/myInfoModify">
            <div class="status"></div>
            <table class="joinform">
                <tr>
                    <th class="tt">아이디</th>
                    <td>
                        <input type="text" name="id" value="${member.id}" label="아이디" readonly>
                    </td>
                </tr>
                <tr>
                    <th class="tt">비밀번호</th>
                    <td><input type="text" name="password" value maxlength="16" label="비밀번호" placeholder="비밀번호를 입력해주세요"></td>
                </tr>
                <tr>
                    <th class="tt">비밀번호 확인</th>
                    <td><input type="text" name="" value maxlength="16" label="비밀번호 확인" placeholder="비밀번호를 한번 더 입력해주세요"></td>
                </tr>
                <tr>
                    <th class="tt">이름</th>
                    <td><input type="text" name="name" value="${member.name}" label="이름" readonly></td>
                </tr>
                <tr>
                    <th class="tt">이메일</th>
                    <td>
                        <input type="text" name="email" value="${member.email}" label="이메일" readonly>
                    </td>

                </tr>
                <tr>
                    <th class="tt">휴대폰</th>
                    <td><input type="text" name="phone" value="${member.phone}" maxlength="16" label="휴대폰" placeholder="숫자만 입력해주세요"></td>
                </tr>

                <tr>
                    <th class="tt">주소</th>
                    <!-- td 하나로 통일 -->
                    <td>
                        <input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호">

                        <button type="button" class="addressSearch" onclick="openZipSearch()">
                            <i class="fa fa-search"></i>주소검색
                        </button>
                        <br>

                        <input type="text" class="form-control" name="address2" id="address2" placeholder="주소" >

                        <input type="text" class="form-control" name="address3" id="address3" placeholder="상세주소">
                    </td>
                </tr>

            </table>
            <script>
                function openZipSearch() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            $('[id=address1]').val(data.zonecode); // 우편번호 (5자리)
                            $('[id=address2]').val(data.address);
                            $('[id=address3]').val(data.buildingName);
                        }
                    }).open();
                }
            </script>
            <div class="secondary">
                <button type="submit" class="btn btn_secondary tt">수정하기</button>
            </div>
        </form>

        <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</div>
</body>
</html>
