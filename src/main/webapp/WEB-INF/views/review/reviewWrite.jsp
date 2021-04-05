<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/notice_section.css">
    <title>Document</title>
</head>
<body>
<form method="post" id="authForm" action="/ReviewWrite" enctype="multipart/form-data">
    <div class="status"></div>
    <table class="joinform">
        <tr>
            <td>
                <div class="input-group mb-1">
                    <!--이미지라는 글자-->
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">이미지</span>
                    </div>

                    <!--파일 선택-->
                    <div class="custom-file">
                        <input type="file" name="file" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                        <label class="custom-file-label" for="inputGroupFile01"></label>
                    </div>
                </div>

            </td>
        </tr>
        <tr>
            <th class="tt">아이디</th>
            <td>
                <input type="text" name="id" value maxlength="16" label="아이디" placeholder="아이디를 입력해주세요">
            </td>
        </tr>
        <tr>
            <th class="tt">제목</th>
            <td>
                <input type="text" name="title" value maxlength="16" label="제목" placeholder="제목을 입력해주세요">
            </td>
        </tr>

        <tr>
            <th class="tt">내용</th>
            <td><input type="text" name="content" value maxlength="16" label="내용" placeholder="내용을 입력해주세요"></td>
        </tr>

    </table>
    <div id="formSubmit">
        <button type="submit">등록하기</button>
    </div>
</form>

</body>
</html>