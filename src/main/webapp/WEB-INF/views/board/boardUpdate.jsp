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
<form method="post" action="/boardUpdate">
    <div class="status"></div>
    <table class="joinform">
        <tr>
            <th class="tt">이름</th>
            <td>
                <input type="text" name="title" value maxlength="16" label="제목을 입력해주세요">
            </td>
        </tr>

        <tr>
            <th class="tt">내용</th>
            <td><input type="text" name="content" value maxlength="16" label="내용" placeholder="내용을 입력해주세요"></td>
        </tr>

        <tr>
            <th class="tt">게시판 분류</th>
            <td><input type="text" name="boardType" value maxlength="16" label="분류" placeholder="게시판 분류를 입력해주세요"></td>
        </tr>
    </table>
    <div id="formSubmit">
        <button type="submit">등록하기</button>
    </div>
</form>
</body>
</html>