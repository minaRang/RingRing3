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
<form method="post" id="authForm" action="/boardWrite" enctype="multipart/form-data">
    <!--method = 전송 방식, action = 전송 목적지, enctype=입력받은 데이터를 어떻게 철할 것인가?
    현재 입력한 것은 파일이나 이미지를 서버로 전송할 경우 사용하는 방식이다. 이거 안하면 경로명만 전송된다.-->
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

                <!--뭔가 경로를...-->
                <!--<%=request.getRealPath("/")%>
                <script>
                    $("#file").change(function(){
                        if(this.files&&this.files[0]){
                            var reader=new FileReader;
                            reader.onload=function (data){
                                $(".select_img img").attr("src",data.target.result).width(400);
                            }
                            reader.readAsDataURL(this.files[0]);
                        }
                    });
                </script>-->
                <!--여기까지가 이미지, 파일선택, 그 옆에 파일 경로 뜨는 것 까지인가?-->


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

        <tr>
            <th class="tt">분류</th>
            <td><input type="text" name="boardType" value maxlength="16" label="분류" plaeholder="게시판 분류를 입력해주세요"></td>
        </tr>

    </table>
    <div id="formSubmit">
        <button type="submit">등록하기</button>
    </div>
</form>

</body>
</html>