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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=33qm1u5uje&submodules=geocoder"> //네이버 지도 스크립트
	</script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<script type="text/javascript" src="/css/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/viewpage.css">
<link rel="stylesheet" type="text/css" href="/css/slick.css"/>
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
                                <li style="padding:50px 0px 20px 0px; text-align:center; overflow:hidden;">                               
                                    <%for(int i = 0; i<kg.length; i++) {%>
                                    	<%if(kg[i].equals("1")){ %>
                                    			<div class="viewpage_kategorie"><img src="/upload/space/kategorie2/<%=i+1 %>.png" width="50px;">
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
<!--                          <div class="viewpage_photo"> -->
<!--                             <a href="#"><img src="../img/viewpage_eximg4.jpg" width="773px;"></a> -->
<!--                         </div> -->
                        <div class=".single-item-rtl" width="773px;">
						  <div><img src="../img/viewpage_eximg4.jpg"></div>
						  <div><img src="../img/viewpage_eximg3.jpg"></div>
						  <div><img src="../img/viewpage_eximg2.jpg"></div>
						</div>
                        <div class="viewpage_host_info">
                            <div class="viewpage_host_addr">
                                <div class="viewpage_host_first">
                                    <h3 style="font-weight:bold;">${s.s_placeName}</h3>
                                    <p id="viewpage_first_p">${s.addrNum} ${s.address}</p>
                                    <p>${s.s_placeWeb}</p>
                                </div>
                                <div class="viewpage_host_icon">
                                    <div class="viewpage_host_icon_l">
                                        <a href="#" tel="010-1234-5678" style="text-decoration: none;">
                                            <span style="line-height:45px;"><img src="../img/call_icon.png">전화걸기</span>
                                        </a>
                                    </div>
                                    <div class="viewpage_host_icon_r">
                                        <a href="https://map.naver.com/" style="text-decoration: none;">
                                            <span style="line-height:45px;"><img src="../img/way_icon.png">길찾기</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div>				
				                <div id="map" style="width:773px;  height:640px;"></div>            
                            </div>
                        </div>
                        <div class="viewpage_qna">
                            <div class="viewpage_qna_header">
                            <h4>Q&amp;A 0개</h4>
                            <a href="#" style="text-decoration: none;"><span>질문작성하기</span></a>
                            </div>
                            <div class="viewpage_qnaview">
                                <p>등록된 질문이 없습니다.</p>
                            </div>
                        </div>
                         <div class="viewpage_hostpage">
                            <div class="host_area">
							<div class="pf_left"><img src="../img/logo.png"></div>
							<div class="pf_right">
								<strong class="pf_host">HOST</strong><br> <span class="pf_name">(주)투플레이스</span>
								<p class="pf_txt">서울시 서초구 방배동 815-20 B1 80평 스튜디오</p>
							</div>
                            <a href="#" class="hostbtn" style="text-decoration: none;">
							<span class="btn_inner">
								호스트 페이지로 이동 →
							</span>
						</a>
						</div>
                        </div>
                        <div class="viewpage_review_header">
						<h4 class="h_intro">
							이용 후기 <strong class="txt_primary">0개</strong>
							<span class="dot"></span>
							평균 평점 <strong class="txt_primary">0.0</strong>
						</h4>
					</div>
                    <div class="viewpage_review">
                        <ul>
                            <li class="rlist ">   
                                <div class="rbox_mine"> 
                                    <span class="pf_img">프로필</span> 
                                    <strong class="guest_name">아이디</strong> 
                                    <p class="p_review">공간도 엄청 넓고, 포토존이 많아서 예쁜사진 많이남겼어요 ㅠㅠ 브라이덜샤워로 이용하기 정말 좋은 곳이었습니다~!! 그리고 오픈한지 얼마 안되서 그런지 장소도 소품도 아주 깨끗해요!!ㅎㅎ 삼각대, 충전기, 블루투스 스피커까지 없는게 없었습니다!! 그리고 호스트님이 정말 친절하셔용  번창하세요!!~!</p>
                                    <div class="space_list swiper_list photo_review"> 
                                        <div class="flex_wrap column3 fluid">      
                                            <article class="box_space">    
                                                <div class="inner">     
                                                    <a href="#" class="_review_img_link" target="_blank">
                                                        <div class="img_box">
                                                            <span><img src="../img/ex1.jpg" width="210px" height="210px"></span>
                                                           
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </article>
                                            <article class="box_space">
                                                <div class="inner">
                                                    <a href="#" class="_review_img_link" target="_blank" >
                                                        <div class="img_box">
                                                            <span><img src="../img/ex2.jpg" width="210px" height="210px"></span>
                                                            
                                                        </div>
                                                    </a>
                                                </div>
                                            </article>
                                            <article class="box_space">
                                                <div class="inner">
                                                    <a href="#">
                                                        <div class="img_box">
                                                            <span><img src="../img/ex3.jpg" width="210px" height="210px"></span>
                                                          
                                                        </div>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                    <div class="rbox_info_base">
                                        <span class="time_info">2019.06.13. 09:39:06</span>
                                    </div>
                                    <span class="rate_area">
                                        <span class="blind">평점</span>
                                        <span class="rate active">
                                            <em class="sp_icon ico_star_off">★</em>
                                        </span>
                                        <span class="rate active">
                                            <em class="sp_icon ico_star_off">★</em>
                                        </span>
                                        <span class="rate active">
                                            <em class="sp_icon ico_star_off">★</em>
                                        </span>
                                        <span class="rate active">
                                            <em class="sp_icon ico_star_off">★</em>
                                        </span>
                                        <span class="rate active">
                                            <em class="sp_icon ico_star_off">★</em>
                                        </span>
                                    </span>
                                </div>
                            </li>
                        </ul>
                        <div class="viewpage_qna">
                            <div class="viewpage_qna_header">
                            <h4>비슷한 공간</h4>
                            </div>
                            <div class="viewpage_qnaview">
                                <p>비슷한 공간이 없습니다.</p>
                            </div>
                        </div>
                    </div> 
                     <div>
                        <div class="viewpage_right">
                            <div class="viewpage_right_header">
                                <h3 class="viewpage_title">세부공간 선택</h3>
                                <span>필수선택</span>
                            </div>
                            <div id="viewpage_right_content">
                                <p>예약을 하시려면 호스트의 승인이 필요합니다.<br>
                                승인 후에 온라인 결제가 가능합니다!
                                </p>
                            
                            </div>
                            <div class="viewpage_right_list">
                                <div class="viewpage_right_list2">
                                    <ul>
                                        <li class="viewpage_list_none" style="padding:22px 0px 21px;">
                                            <input type="radio" checked> 한남동 <span>￦20,000<small style="color:#949494;">/시간</small></span>
                                        </li>
                                        <li class="viewpage_list_none" style="padding:15px 0px 15px; height:140px;">
                                            <img src="../img/ex1.jpg" width="110px" height="110px" id="viewpage_right_img">
                                            <p style="float:right;">${s.s_placeIntroduce1}</p>
                                        </li>
                                        <li style="clear: both;" class="viewpage_right_c"><span style="color:#656565; float:left;">· 공간유형</span> <p>회의실 세미나실 파티룸</p></li>
                                        <li class="viewpage_right_c"><span style="color:#656565; float:left;">· 예약시간</span><p>${s.s_start } ~ ${s.s_end }</p></li>
                                        <li class="viewpage_right_c"><span style="color:#656565; float:left;" >· 예약인원</span> <p>${s.s_people}</p></li>
                                    </ul>
                                    <div class="viewpage_right_icon">
                                         <%for(int i = 0; i<kg.length; i++) {%>
                                    	<%if(kg[i].equals("1")){ %>
                                    			<div class="viewpage_right_kategorie"><img src="/upload/space/kategorie2/<%=i+1 %>.png" width="30px;">
                                    				<p style="font-size:14px;"><%=kg2[i] %></p>
                                    			</div>
                                    	<%} %>
                                    <%} %>
                                    </div>
                                </div>
                            </div>
                            <button><a href="/selectOneReservation?S_no=2">결제하기</a></button>			
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
                if(scrollTop>300){
                	$(".viewpage_right").css("display","block");
                }else{
                	$(".viewpage_right").css("display","none");
                }
                if(scrollTop>300){
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

       $('.single-item-rtl').slick({
         rtl: true
       });

        </script>
        <script>
	window.onload = function () { 
		var x;
		var y;
		naver.maps.Service.geocode({
	        address: "${s.address}"
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	        var result = response.result, // 검색 결과의 컨테이너
	            items = result.items; // 검색 결과의 배열       
				x = items[1].point.x; // x 좌표
				y = items[1].point.y; // y 좌표
			console.log(x);
			console.log(y)
	    
	        // do Something
	        //37.533807,126.896772
			var map = new naver.maps.Map('map',{  //학원기준
				center : new naver.maps.LatLng(y,x),        //center 중심점 설정
				zoom : 10, 
				zoomControl : true,  //좌측 줌 왓다리 갓다리 해주는 줌 컨트롤
				zoomControlOptions:{
					position : naver.maps.Position.TOP_RIGHT,       //줌컨트롤의 위치
					style : naver.maps.ZoomControlStyle.SMALL  		//스타일 + - 만 나오는게 지도에대한 설정이었다 이말이야
				}
			});
			
			var marker = new naver.maps.Marker({ 
				position : new naver.maps.LatLng(y,x), //마커
				map : map
				
			});     
	    });		
		};
</script>	
	
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>