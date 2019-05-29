<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뷰페이지</title>
<style>
    #viewpage_alert{
        width: 100%;
        height: 100px;
        background-color: #ffd014;
        position: absolute;
        top: 0px;
        display: none;
        text-align: center;
        font-size: 22px;
        padding: 30px 0px 30px 0px;
        color: #6d3bff;
    }
    #like_full{
        position: absolute;
        display: none;
        right: 0px;
        top: 0px;
    }
    #like{
        z-index: 1;
    }
    .viewpage_content{
        width: 100%;
        height: 520px;
        background: url(../img/viewpage_background.jpg) no-repeat center center;
        background-size: cover;
    }
    #viewpage_icon{
        position: relative;
    }
    #viewpage_icon a:first-child{
        position: absolute;
        right: 80px;
        top: 450px;
    }
    #viewpage_icon a:last-child{
        position: absolute;
        right: 0px;
        top: 450px;
    }
    /*viewpage_icon Fin*/
    .viewpage_section{
        margin-top: 20px;
    }
    .viewpage_section h1{
        font-weight: bold;
    }
    .viewpage_section p{
        font-size: 22px;
        font-weight: 100;
    }
    .viewpage_section ul li{
        list-style: none;
        display: inline-block;
        margin: 6px 6px 6px 0;
        padding: 0 15px;
        border: 1px solid #e0e0e0;
        border-radius: 10px;
    }
    .viewpage_section ul li a{
        text-decoration: none;
        color: #656565;
        font-weight: 100;
        font-size: 16px;
    }
    /*.viewpage_section Fin*/
    .viewpage_detail{
        width: 1160px;
        margin-top: 30px;
        overflow: hidden;
    }
    .viewpage_right{
        width: 370px;
        background-color: white;
        border: 1px solid #6d3bff;
        position: absolute;
        right: 356px;
        top: 670px;
    }
    .viewpage_left{
       width: 775px;
       float: left;
    }
    .viewpage_textbox{
        margin-bottom: 45px;
    }
    .viewpage_textbox h2{
        padding: 50px 100px 0 0;
        font-size: 48px;
        line-height: 60px;
        font-weight: 100;
    }
    .viewpage_textbox h3{
        font-size: 18px;
        margin-top: 45px;
        padding-bottom: 16px;
        font-weight: bold;
    }
    .viewpage_textbox p{
        font-weight: 100;
        color: #656565;
    }
    .viewpage_textbox ul li{
        list-style: none;
        font-weight:100;
        
    }
    /*viewpage content Fin*/
    
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/common/header.jsp"/>  
    <section>
        <div id="viewpage_alert"><p></p></div>
        <div class="viewpage_content">
            <div class="section_content">
                <div id="viewpage_icon">
                    <a href="#"><img src="../img/share_icon.png"></a>
                    <a href="#"><img src="../img/like_icon.png" id="like">
                    <img src="../img/like_full_icon.png" id="like_full">
                    </a>
                </div>
            </div>
        </div>
        <!-- 상단 이미지 fin -->
        <div class="section_content">
        	<div class="section_position">
                <div class="viewpage_detail">
                    <div class="viewpage_section">
                        <h1>업타운 SKY 루프탑 파티공간</h1>
                        <p>도심 속 자유를 느끼는 우리만의 옥상 정원</p>
                        <ul>
                            <li><a href="#">#루프탑</a></li>
                            <li><a href="#">#파티</a></li>
                            <li><a href="#">#옥상</a></li>
                            <li><a href="#">#안암</a></li>
                            <li><a href="#">#동대문구</a></li>
                        </ul>
                     </div>
                     <!--viewpage_section Fin-->
                    <div class="viewpage_left">
                        <div class="viewpage_photo">
                            <a href="#"><img src="../img/viewpage_eximg.jpg" width="773px;"></a>
                        </div>
                        <div class="viewpage_textbox">
                            <h2>도심 속 자유를 느끼는 우리만의 옥상 정원</h2>
                            <h3>공간 소개</h3>

                            <p>UPTOWN SKY는 독립된 루프탑 파티 공간으로 남산타워를 감상할 수 있는
                            전망과 쾌적하고 아늑한 환경을 제공합니다.<br>
                            파란 하늘과 달, 별을 바라보며 소중한 분들과 특별한 시간을 만드세요.<br>
                            하늘 자연을 벗 삼아 오늘의 자유를 누리세요.<br><br>
                            네트워킹 모임, 소규모 파티, 특별한 이벤트에 적합합니다.<br>
                            은은한 조명과 함께 야외에서 색다른 경험을 하고 싶으신 분들께 추천합니다.<br><br>
                            모임을 더욱 특별하게 만드는 UPTOWN SKY에서<br> 소중한 사람들과 평생 잊지 못할 추억을 만들어 보세요.
                            </p>
                            <ul>
                                <li>
                                    <span>이용시간</span>
                                    <span>0~24시</span>
                                </li>
                                <li>
                                    <span>휴무일</span>
                                    <span>없음</span>
                                </li>
                            </ul>
                        </div>
                        <div class="viewpage_photo">
                            <a href="#"><img src="../img/viewpage_eximg2.jpg" width="773px;"></a>
                        </div>
                        <div class="viewpage_textbox">
                            <h2>도심 속 자유를 느끼는 우리만의 옥상 정원</h2>
                            <h3>공간 소개</h3>
                            <ul>
                                <li>
                                    <strong>1</strong>
                                    <span>건물 6층에 위치한 탁트인 루프탑 공간입니다.</span>
                                </li>
                                <li>
                                    <strong>2</strong>
                                    <span>캠핑 텐트와 감성 소품으로 꾸며진 아늑한 옥상 정원입니다.</span>
                                </li>
                                <li>
                                    <strong>3</strong>
                                    <span>캠핑 용품 대여 가능하며, 예약시 사전 요청주시기 바랍니다.</span>
                                </li>
                                <li>
                                    <strong>4</strong>
                                    <span>빔프로젝터와 대형스크린, 블루투스 스피커, 포인터 대여 가능합니다.</span>
                                </li>
                                <li>
                                    <strong>5</strong>
                                    <span>해당 건물 3층에 음료 및 간편식을 판매하는 스낵바가 있습니다.</span>
                                </li>
                                <li>
                                    <strong>6</strong>
                                    <span>주차 가능하나 공간이 협소하니 사전 문의 주시기 바랍니다.(1대당 2,000원/시간)</span>
                                </li>
                            </ul>
                        </div>
                        <div class="viewpage_photo">
                            <a href="#"><img src="../img/viewpage_eximg3.jpg" width="773px;"></a>
                        </div>
                        <div class="viewpage_textbox">
                            <h2>도심 속 자유를 느끼는 우리만의 옥상 정원</h2>
                            <h3>공간 소개</h3>
                            <ul>
                                <li>
                                    <strong>1</strong>
                                    <span>건물 6층에 위치한 탁트인 루프탑 공간입니다.</span>
                                </li>
                                <li>
                                    <strong>2</strong>
                                    <span>캠핑 텐트와 감성 소품으로 꾸며진 아늑한 옥상 정원입니다.</span>
                                </li>
                                <li>
                                    <strong>3</strong>
                                    <span>캠핑 용품 대여 가능하며, 예약시 사전 요청주시기 바랍니다.</span>
                                </li>
                                <li>
                                    <strong>4</strong>
                                    <span>빔프로젝터와 대형스크린, 블루투스 스피커, 포인터 대여 가능합니다.</span>
                                </li>
                                <li>
                                    <strong>5</strong>
                                    <span>해당 건물 3층에 음료 및 간편식을 판매하는 스낵바가 있습니다.</span>
                                </li>
                                <li>
                                    <strong>6</strong>
                                    <span>주차 가능하나 공간이 협소하니 사전 문의 주시기 바랍니다.(1대당 2,000원/시간)</span>
                                </li>
                            </ul>
                        </div>
                         <div class="viewpage_photo">
                            <a href="#"><img src="../img/viewpage_eximg4.jpg" width="773px;"></a>
                        </div>
                        <div class="viewpage_host">
                            <p>업타운 SKY 루프탑 파티공간</p>
                        </div>
                        <img src="#">
                        <div >
                            <h3>Q&amp;A</h3>
                        </div>
                        <div>
                            <p>등록된 질문이 아직 없습니다.</p>
                        </div>
                         <div class="viewpage_host">
                            <p>UPTOWN 업타운</p>
                        </div>
                        <article>
                            <h3>UPTOWN 업타운의 다른 공간</h3>
                            <div></div>
                            <h3>비슷한 공간</h3>
                            <div></div>
                        </article>
                    </div>
                     <div class="viewpage_right">
                        <span class="reservation_title">결제 예정 금액</span><br><br>
                        <div>예약날짜<span>??</span></div>
                        <div>예약시간<span>??</span></div>
                        <div>예약인원<span>명</span></div>
                        <div>￦<span>돈</span></div>
                        <button>결제하기</button>			
                    </div>
                </div>
            </div>
        </div>
    </section>
        <%-- 메뉴바 스크롤 따라오기 스크립트 --%>
        <script>
       $(document).ready(function() {
            var floatPosition = parseInt($(".viewpage_right").css('top'));
            $(window).scroll(function() {
                var scrollTop = $(window).scrollTop();
                var newPosition = scrollTop + floatPosition + "px";
                $(".viewpage_right").stop().animate({
                    "top" : newPosition
                }, 500);
            }).scroll();
        });   
        $(document).ready(function(){
           $("#like").click(function(){   
                    $("#viewpage_alert").slideDown(700);
                    $("#viewpage_alert").delay(1300);
                    $("#viewpage_alert").css("display","inline");
                    $("#viewpage_alert").delay(1300);
                    $("#viewpage_alert").slideUp(700); 
                    $("#like_full").css("display","inline");
                    $("#viewpage_alert p").html("내가 가고 싶은 공간에 등록되었습니다.");
        });
        $("#like_full").click(function(){
                    $("#viewpage_alert").slideDown(700);
                    $("#viewpage_alert").delay(1300);
                    $("#viewpage_alert").css("display","inline");
                    $("#viewpage_alert").delay(1300);
                    $("#viewpage_alert").slideUp(700); 
                    $("#like_full").css("display","none"); 
                    $("#viewpage_alert p").html("내가 가고 싶은 공간에서 제외되었습니다.");

        });
    });
        </script>
	
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>