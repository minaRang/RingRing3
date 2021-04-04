<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/mypage_point.css">
    <title>RingRing</title>
</head>
<body>
<div class="content">
    <div class="mycategory tt">
        <h3 class="tt">마이링링</h3>
        <ul>
            <li><a href="mypage_oderlist.html">주문 내역</a></li>
            <li><a href="">상품 후기</a></li>
            <li class="select"><a href="">적립금</a></li>
            <li><a href="mypage-question-list.html">1:1 문의</a></li>
            <li class="last"><a href="">개인 정보 수정</a></li>
        </ul>
    </div>
    <div id="point">
        <h3 class="tt">적립금</h3>
        <div class="status"></div>
        <div class="point tt">
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
            <dl>
                <dt class="tit"><i class="fa fa-check"></i>500P 적립</dt>
                <dd class="sub"><i class="fa fa-caret-right"></i>리뷰 등록으로 500P 가 적립 되었습니다. (2021.04.02)</dd>
            </dl>
        </div>
        <div class="status"></div>
    </div>
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
        acodian.click('.tit');
    </script>
</div>
</body>
</html>