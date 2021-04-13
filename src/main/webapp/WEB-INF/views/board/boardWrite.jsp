<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/notice_write.css">
    <title>Document</title>
</head>
<body>
    <div class="content">
        <div id="notice">
            <h3 class="tt">글쓰기</h3>
            <form action="/boardWrite" method="POST" name="notice" enctype="multipart/form-data">
            <div class="notice">
                <table class="tt">
                    <tr>
                        <td class="tit">제목</td>
                        <td class="sub title">
                            <select name="boardType" id="title_select">
                                <option value="공지">공지</option>
                                <option value="이벤트">이벤트</option>
                                <option value="질문">자주하는 질문</option>
                            </select>
                            <input type="text" name="title" placeholder="제목을 입력해주세요">
                        </td>
                    </tr>
                    <tr>
                        <td class="tit"> 이미지</td>
                        <td>
                            <!--파일 선택-->
                            <div class="custom-file">
                                <input type="file" name="file" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                                <label class="custom-file-label" for="inputGroupFile01"></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="tit">내용</td>
                        <td class="sub inquiries">
                            <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
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