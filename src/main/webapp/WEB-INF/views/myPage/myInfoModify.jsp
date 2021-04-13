<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/mypage_modifyinfo.css">
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
            <li class="last select"><a href="/myInfoModify">개인 정보 수정</a></li>
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
                    <input type="text" name="id" value="${sessionScope.member.id}" label="아이디" readonly>
                </td>
            </tr>
            <tr>
                <th class="tt">비밀번호</th>
                <td><input type="password" name="password" id="pw1" value maxlength="16" label="비밀번호" placeholder="비밀번호를 입력해주세요"></td>
            </tr>
            <tr>
                <th class="tt">비밀번호 확인</th>
                <td><input type="password" value maxlength="16" id="pw2" label="비밀번호 확인" placeholder="비밀번호를 한번 더 입력해주세요"></td>
            </tr>

            <tr>
                <th class="tt">이름</th>
                <td><input type="text" name="name" value="${sessionScope.member.name}" label="이름" readonly></td>
            </tr>
            <tr>
                <th class="tt">이메일</th>
                <td>
                    <input type="text" id="email" name="email" value="${sessionScope.member.email}" label="이메일" readonly>
                </td>

            </tr>
            <tr>
                <th class="tt">휴대폰</th>
                <td><input type="text" id="phone" name="phone" value="${sessionScope.member.phone}" maxlength="12" label="휴대폰" placeholder="숫자만 입력해주세요"></td>
            </tr>
            <tr>
                <th class="tt">주소</th>
                <!-- td 하나로 통일 -->
                <td>
                    <input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호" value="${sessionScope.member.address1}">

                    <button type="button" class="addressSearch" onclick="openZipSearch()">
                        <i class="fa fa-search"></i>주소검색
                    </button>
                    <br>

                    <input type="text" class="form-control" name="address2" id="address2" placeholder="주소" value="${sessionScope.member.address2}" >

                    <input type="text" class="form-control" name="address3" id="address3" placeholder="상세주소" value="${sessionScope.member.address3}">
        </table>
        <div class="secondary">
            <button type="submit" class="btn tt btn_secondary tt">수정하기</button>
        </div>
    </form>
    <div style="height: 100px"></div>
    <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

        function check(){
            var pw1 = document.getElementById('pw1').value;
            var pw2 = document.getElementById('pw2').value;
            var regEmail=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            var email= document.getElementById('email').value;

            if(!regEmail.test(email)){
                alert("이메일 양식을 확인해주세요")
                return false;
            }
            if(pw1.length<10){
                alert("10글자 이상 입력해주세요");
                return false;
            }
            if($('#phone').length!=12){
                alert("핸드폰 번호 입력을 확인해주세요");
                return false;
            }

            if(pw1!=pw2){
                alert("비밀번호가 일치하지 않습니다");
                return false;
            }
            if(pw1==pw2 && $('#phone').length==12){
                return true;
            }

        }
    </script>
</div>
</body>
</html>