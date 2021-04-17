<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/joinjoin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        var selectAll = document.querySelector(".selectAllMembers");
        selectAll.addEventListener('click', function(){
            var objs = document.querySelectorAll(".memberChk");
            for (var i = 0; i < objs.length; i++) {
                objs[i].checked = selectAll.checked;
            };
        }, false);

        var objs = document.querySelectorAll(".memberChk");
        for(var i=0; i<objs.length ; i++){
            objs[i].addEventListener('click', function(){
                var selectAll = document.querySelector(".selectAllMembers");
                for (var j = 0; j < objs.length; j++) {
                    if (objs[j].checked === false) {
                        selectAll.checked = false;
                        return;
                    };
                };
                selectAll.checked = true;
            }, false);
        }
        //윈도우 팝업 (가운데정렬이 안먹힘...ㅠㅠ)
        var win;
        function winOpen(){
            win=window.open('약관동의.html','child','toolbar=no,width=400px,height=550px,top="+(screen.availHeight/2-100)+",left="+(screen.availWidth/2-100)+"');
        };
    </script>
    <title>RingRing : 회원가입</title>
</head>
<body>
    <div id="container">
        <div id="content">
            <div class="joinhead">
                <h2 class="tt">회원가입</h2>
            </div>
             <form method="post" id="authForm" action="/joinAction">
            <div class="status"></div>
            <table class="joinform">
                <tr>
                    <th class="tt">아이디</th>
                    <td>
                        <input type="text" id="id" name="id" value maxlength="16" label="아이디" placeholder="6자 이상의  영문과 숫자를 조합해주세요">
                        <button style="background-color: white" type="button" onclick="idCheck()" class="btn default">중복확인</button>
                    </td>
                </tr>
                <tr>
                    <th class="tt">비밀번호</th>
                    <td><input type="password" id="pw1" name="password" value maxlength="16" label="비밀번호" placeholder="비밀번호를 입력해주세요"></td>
                </tr>
                <tr>
                    <th class="tt">비밀번호 확인</th>
                    <td><input type="password" id="pw2" name="" value maxlength="16" label="비밀번호 확인" placeholder="비밀번호를 한번 더 입력해주세요">
                        <button style="background-color: white" type="button" class="btn default" onclick="match()">확인</button></td>
                </tr>
                <tr>
                    <th class="tt">이름</th>
                    <td><input type="text" id="name" name="name" value maxlength="16" label="이름" placeholder="이름을 입력해주세요"></td>
                </tr>
                <tr>
                    <th class="tt">이메일</th>
                    <td>
                        <input type="text" id="email" name="email" value maxlength="30" label="이메일" placeholder="예 : RingRing@dessert.com">
                        <a href="" class="btn default">중복확인</a>
                    </td>
                    
                </tr>
                <tr>
                    <th class="tt">휴대폰</th>
                    <td><input type="text" id="phone" name="phone" value maxlength="16" label="휴대폰" placeholder="숫자만 입력해주세요"></td>
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

                     function match(){
                         var pw1=document.getElementById('pw1').value;
                         var pw2=document.getElementById('pw2').value;

                         if(pw1.length<10){
                             alert("10글자 이상 입력해 주세요");
                             return false;
                         }
                         if(pw1!=pw2){
                             alert("비밀번호가 일치하지 않습니다");
                             return false;
                         }else{
                             alert("비밀번호가 일치합니다");
                             return true;
                         }
                     }

                 </script>

                 <div class="status under"></div>
                 <div class="checkbox_group">
                     <input class="form-check-input" type="checkbox" name="exampleRadios" id="check_all" value="option1">
                     <label class="form-check-label" for="check_all">
                         전체동의
                     </label><br><br>

                     <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                     <label class="form-check-label" for="exampleRadios1">
                         이용약관 동의 (필수)
                     </label>
                     <a href="#" class="btn_agreement">
                         <p class="st" onclick="winOpen();">약관보기</p>
                     </a><br><br>

                     <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios2" value="option2">
                     <label class="form-check-label" for="exampleRadios2" >
                         개인정보처리방침 (필수)
                     </label>
                     <a href="#" class="btn_agreement">
                         <p class="st" onclick="winOpen();">약관보기</p>
                     </a><br><br>

                     <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios3" value="option2">
                     <label class="form-check-label" for="exampleRadios2">
                         무료배송,할인 쿠폰 등 혜택/정보 수신 동의 (선택)
                     </label><br><br>

                     <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios4" value="option2">
                     <label class="form-check-label" for="exampleRadios2">
                         본인은 만 14세 이상입니다 (필수)
                     </label><br>
                 </div>
             </form>
            <div class="secondary">
                <button type="button" id="submit" disabled="disabled" class="btn btn_secondary tt" onclick="blank()">가입하기</button>
            </div>

            <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

            <script type="text/javascript" src="../static/js/bootstrap.js"></script>
            <script>
                //체크박스 전체선택
                $(".checkbox_group").on("click", "#check_all", function () {
                    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
                });

                // 체크박스 개별 선택
                $(".checkbox_group").on("click", ".form-check-input", function() {
                    var is_checked = true;

                    $(".checkbox_group .form-check-input").each(function(){
                        is_checked = is_checked && $(this).is(":checked");
                    });

                    $("#check_all").prop("checked", is_checked);
                });
                //아이디 중복확인에 들어가는 function(ajax)
                function idCheck(){
                    var memberId=$("#id").val();

                    if(memberId.search(/\s/)!=-1){
                        alert("아이디에는 공백이 들어갈 수 없습니다");
                    }else{
                        $.ajax({
                            async:true,
                            type:'POST',
                            data:memberId,
                            url:"/idCheck",
                            dataType:"json",
                            contentType:"application/json; charset=UTF-8",
                            success: function (count){
                                if(count>0){
                                    alert("해당 아이디는 존재합니다");
                                    $("#submit").attr("disabled","disabled");
                                    window.location.reload();
                                }else{
                                    alert("사용 가능한 아이디입니다");
                                    $("#submit").removeAttr("disabled");
                                }
                            },
                            error:function (error){
                                alert("아이디를 입력해주세요");
                            }
                        });
                    }
                }
                //회원가입 submit시 공란확인, 정규식 확인하는 function
                function blank(){
                    var CheckEmail=/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                    //특수문자,대문자하나이상,소문자하나 이상 숫자 포함 8~15자리 이내의 암호
                    var CheckPw=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;
                    //핸드폰 번호는 01(0,1,9) - 0~9숫자 3,4개 - 0~9 숫자 4개, 구분자는 있어도 없어도 가능
                    var CheckPhone=/^01([0|1|9])-?([0-9]{3,4})-?([0-9]{4})$/;


                    var pw=$('#pw1').val();
                    var email=$('#email').val();
                    var phone=$('#phone').val();

                    if(!CheckPw.test(pw)){
                        alert("비밀번호 입력을 확인해주세요")
                        return false;
                    }

                    if(!CheckPhone.test(phone)){
                        alert("핸드폰번호 입력양식을 확인해주세요")
                        return false;
                    }
                    if(!CheckEmail.test(email)){
                        alert("이메일 양식을 확인해주세요")
                        return false;
                    }

                    if($.trim($('#id').val())==""){
                        alert("아이디를 입력해주세요");
                        return false;
                    }
                    if($.trim($('#name').val())==""){
                        alert("이름을 입력해주세요");
                        return false;
                    }
                    if($.trim($('#phone').val())==""){
                        alert("핸드폰번호를 입력해주세요");
                        return false;
                    }

                    if(confirm("회원가입을 하시겠습니까?")){
                        alert("이메일 인증을 완료해주세요");
                        $("form").submit();
                    }

                }
            </script>
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

        </div>
    </div>
</body>
</html>
