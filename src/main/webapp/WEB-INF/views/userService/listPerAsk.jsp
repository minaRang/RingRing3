<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RingRing</title>
</head>

<style>
* {
margin: 0;
padding: 0;
}

dt, dd {
padding: 10px;
}

dt {
background-color: #cfc;
margin-bottom: 5px;
}

dt span {
display: inline-block;
width: 5px;
height: 5px;
background-color: black;
vertical-align: middle;
margin-right: 10px;
}

dt.on span {
background-color: red;
}

dd {
background-color: tan;
margin-bottom: 5px;
display: none;
}

</style>
<body>
        <ul class="product_img">
            <c:forEach var="list" items="${sessionScope.list}">
                <li>
                    <a href="replyPerAsk?idx=${list.idx}">"${list.title}"></a>
                    <p>--------------------------------------------------------</p>
                </li>
            </c:forEach>
        </ul>

        <dl>
            <dt><span></span>연어먹고싶다</dt>
            <dd>연어모양 과자 만들어주세요</dd>
        </dl>

        <script>
            var acodian = {

                click: function(target) {
                    var _self = this,
                        $target = $(target);
                    $target.on('click', function() {
                        var $this = $(this);
                        if ($this.next('dd').css('display') == 'none') {
                            $('dd').slideUp();
                            _self.onremove($target);

                            $this.addClass('on');
                            $this.next().slideDown();
                        } else {
                            $('dd').slideUp();
                            _self.onremove($target);

                        }
                    });
                },
                onremove: function($target) {
                    $target.removeClass('on');
                }

            };
            acodian.click('dt');

        </script>
</body>
</html>