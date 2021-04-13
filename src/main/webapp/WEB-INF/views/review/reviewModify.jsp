<%@ page import="com.dessert.ringring.domain.DTOReview" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%DTOReview review=(DTOReview) session.getAttribute("review");
    System.out.println(review);%>
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
<form method="post" id="authForm" action="/ReviewUpdate" enctype="multipart/form-data">
    <input type="hidden" name="idx" label="리뷰인덱스" value="${review.idx}">
    <div class="content">
        <div id="notice">
            <h3 class="tt">후기 수정하기</h3>
            <div class="notice">
                <table class="tt">
                    <tr>
                        <td class="tit">제목</td>
                        <td class="sub">
                            <input type="text" name="title" label="제목" value="${review.title}" maxlength="16" >
                        </td>
                    </tr>

                    <tr>
                        <td class="tit">내용</td>
                        <td class="sub">
                            <input type="text" name="content" value="${review.content}" maxlength="16" label="내용" placeholder="내용을 입력해주세요">
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
            <button class="enroll_btn" type="submit">수정하기</button>
        </div>
    </div>
</form>

</body>
</html>