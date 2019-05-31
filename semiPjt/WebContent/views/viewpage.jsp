<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="space.model.vo.Space"%>
    <%
    	Space s = (Space)request.getAttribute("s");
    	String[] holiday = (s.getS_holiday()).split(",");
    	String[] day = {"월","화","수","목","금","토","일"};
    	String[] img2 = s.getS_img2().split(",");
    	String[] kg = (s.getS_kategorie2()).split(",");
    	String[] kg2 = {"TV/프로젝터","인터넷/WIFI","복사/인쇄기","화이트보드","음향/마이크","취사시설","음식물반입가능","주류반입가능","샤워시설","주차","금연","반려동물 동반 가능","PC/노트북","의자/테이블","내부화장실","탈의실","테라스/루프탑","공용라운지","전신거울","바베큐시설","도어락"};
    %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<link rel="stylesheet" type="text/css" href="/css/viewpage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>뷰페이지</title>

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
                        <h1>${s.s_placeName }</h1>
                        <p>${s.s_placeIntroduce1 }</p>
                        <ul>
                    
                        <c:forTokens items="${s.s_placeTag }" delims="#" var="t">
                            <li>
                            	<a href="#">#${t}</a>
                            </li>
                         </c:forTokens>
              
                        </ul>
                     </div>
                     <!--viewpage_section Fin-->
                    <div class="viewpage_cover">
                    <div class="viewpage_left">
                        <div class="viewpage_photo">
                            <a href="#"><img src="/upload/space/${s.s_img1 }" width="773px;"></a>
                        </div>
                        <div class="viewpage_textbox">
                            <h2>${s.s_placeIntroduce1 }</h2>
                            <h3>공간 소개</h3>

                            <p style="padding: 10px 0px 70px 0px;"><%=s.getS_placeIntroduce2().replaceAll("\r\n", "<br>") %></p>
                            <h3>운영정보</h3>
                            <ul>
                                <li style="padding: 20px 0px 20px 0px;">
                                    <span style="font-size:16px">이용시간 :</span>
                                    <span style="margin-left:15px;">${s.s_start } ~ ${s.s_end }</span>
                                </li>
                                <li style="padding: 20px 0px 10px 0px;">
                                    <span style="font-size:16px">휴무일 :</span>
                                    <span style="margin-left:15px;">
                                    		<%if(holiday[0].equals("0")){ %>
                                    			휴무없음
                             				<%}else if(holiday[0].equals("1")){ %>
                             					공휴일 휴무
                             				<%}else if(holiday[0].equals("2")){ %>
                             					매주 
                             					<%for(int j = 1;j<holiday.length;j++){ %>
                             						<%if(holiday[j].equals("1")){ %>
                             							<%=day[j-1] %>요일.
                             						<%} %>
                             					<%} %>
                             					휴무
                             				<%}else{ %>
                             					<%=holiday[1] %> 월 <%=holiday[2] %> 일 휴무
                             				<%}%>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <div class="viewpage_photo">
                            <img src="/upload/space/<%=img2[0] %>" width="773px;" height="480px;">
                        </div>
                        <div class="viewpage_photo2">
                        	<div id="viewpage_photo2_l">
                                <img src="/upload/space/<%=img2[1] %>" width="384px;">
                        	</div>
                        	<div id="viewpage_photo2_r">
                                <img src="/upload/space/<%=img2[2] %>" width="383px;">
                        	</div>
                        </div>
                        <div class="viewpage_textbox">
                            <h3>편의시설</h3>
                            <ul>
                                <li style="padding:20px 0px 20px 0px; text-align:center">                               
                                    <%for(int i = 0; i<kg.length; i++) {%>
                                    	<%if(kg[i].equals("1")){ %>
                                    			<div class="viewpage_kategorie"><img src="/upload/space/kategorie2/<%=i+1 %>.jpg">
                                    				<p><%=kg2[i] %></p>
                                    			</div>
                                    	<%} %>
                                    <%} %>
                                </li>
                            </ul>
                        </div>
                        <div class="viewpage_textbox">
                            <h3>예약시 주의사항</h3>
                            <ul>
                              <c:forTokens items="${s.s_warning }" delims="," var="warning" varStatus="i" >
	                            <strong style="float:left; margin-right:15px;">${i.count }.</strong>
	                            <li style="margin: 10px 0px 10px 0px; font-size: 16px;">
	                            	${warning}
	                            </li>
                         	</c:forTokens>
                            </ul>
                        </div>
                        <div class="viewpage_photo">
                            <a href="#"><img src="../img/viewpage_eximg3.jpg" width="773px;"></a>
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
        </div>
    </section>
        <%-- 메뉴바 스크롤 따라오기 스크립트 --%>
        <script>
       $(document).ready(function() {
            var floatPosition = parseInt($(".viewpage_right").css('top'));
            $(window).scroll(function() {
                var scrollTop = $(window).scrollTop();
                console.log(scrollTop);
                if(scrollTop>500){
                	$(".viewpage_right").css("display","block");
                }else{
                	$(".viewpage_right").css("display","none");
                }
                if(scrollTop>500){
                	 var newPosition = scrollTop + floatPosition + "px";
                     $(".viewpage_right").stop().animate({
                         "top" : newPosition
                     }, 1000);
                }
            }).scroll();
           
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
           $(".viewpage_content").css("background","url(/upload/space/${s.s_img1})no-repeat center center");
           $(".viewpage_content").css("background-size","cover");
           
        });   

        </script>
	
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>