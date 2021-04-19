<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice_write.css">
    <link rel="stylesheet" href="css/goodInsert.css">
    <title>Document</title>
</head>
<body>
<form method="post" id="authForm" action="/reviewWrite" enctype="multipart/form-data">
    <input type="hidden" name="productIdx" label="제품인덱스" value="${sessionScope.productIdx}">
    <input type="hidden" name="id" label="아이디" value="${sessionScope.member.id}">
    <div class="content">
        <div id="notice">
            <h3 class="tt">후기쓰기</h3>
            <div class="notice">
            <table class="tt">
                <tr>
                    <td class="tit">제목</td>
                    <td class="sub">
                        <input type="text" name="title" value maxlength="16" label="제목" placeholder="제목을 입력해주세요">
                    </td>
                </tr>

                <tr>
                    <td class="tit">내용</td>
                    <td class="sub">
                        <input type="text" name="content" value maxlength="16" label="내용" placeholder="내용을 입력해주세요">
                    </td>
                </tr>

                <tr>
                    <td class="tit">이미지</td>
                    <!--파일 선택-->
                    <td>
                        <div class="custom-file">
                            <input type="file" name="file" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                            <label class="custom-file-label" for="inputGroupFile01"></label>
                        </div>
                    </td>
                </tr>
            </table>
            </div>
            <button class="enroll_btn" type="submit">등록하기</button>
    </div>
    </div>
</form>

</body>
</html>