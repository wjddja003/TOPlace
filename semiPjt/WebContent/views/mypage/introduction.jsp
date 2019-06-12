<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="/css/introduction.css">

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="intro_content">
            <div class="section_content">
                <div id="intro_icon">
                    <p>다양한 모임공간이 필요할때</p>
                    <div id="intro_img"><img src="../../img/logo.png" width="250px;" height="130px;"></div>
                    <div id="intro_btn">
                  <button onclick="searchBtn()">공간 찾아보기</button></div>
                </div>
            </div>
        </div>
        <div class="section_content">
                <div class="intro_detail">
                    <div class="intro_section">
                        <h1>모임공간을 시간단위로 예약하세요.</h1>
                        <p>다양한 유형의 공간들이 투플레이스를 통해 공유되고 있습니다.</p>
                    </div>
                </div>
                <div class="intro_info">
                    <img src="../../img/main_background.jpg">
                </div>
            <ul class="intro_list">
                    <li class="intro1">
                        <img src="../../img/icon3.png">
                        <h3 class="tit">간편한 공간예약</h3>
                        <p class="desc">시간, 일 단위로 공간을 예약해보세요.<br>검색부터 예약, 결제까지 한 번에 가능합니다.</p>
                    </li>
                    <li class="intro2">
                        <img src="../../img/icon1.png">
                        <h3 class="tit">맞춤형 공간추천</h3>
                        <p class="desc">시즌별로 공간을 추천해드려요.<br>매주 새로운 테마공간을 소개합니다.</p>
                    </li>
                    <li class="intro3">
                        <img src="../../img/icon2.png">
                        <h3 class="tit">다양한 모임장소</h3>
                        <p class="desc">10가지 유형의 다양한 공간을 만나보세요.<br>새로운 라이프스타일을 경험할 수 있습니다.</p>
                    </li>
                </ul>
            <div class="link_area">
                <div class="inner_width">
                    스터디룸, 세미나실, 파티룸, 연습실까지! <br>
                    <strong class="txt_primary">우리에게 꼭 맞는 모임장소가 필요할 땐,</strong><br>
                    스페이스클라우드에서 공간을 예약해보세요.
                    <div class="intro_btns">
                        <span><a href="/" class="btn_rounded_line" >공간 찾아보기</a></span>
                        <span><a href="http://localhost/insertSpaceCheck" class="btn_rounded_line">내 공간 등록하기</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>