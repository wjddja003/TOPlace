<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="space.model.vo.Space"%>
    
    <%
    	Space s = (Space)request.getAttribute("s");
    	String[] holiday = (s.getS_holiday()).split(",");
    	String[] day = {"월","화","수","목","금","토","일"};
    	String[] img2 = s.getS_img2().split(",");
    	String[] kg = (s.getS_kategorie2()).split(",");
    	String[] kg2 = {"TV/프로젝터","인터넷/WIFI","복사/인쇄기","화이트보드","음향/마이크","취사시설","음식물반입가능","주류반입가능","샤워시설","주차","금연","반려동물 동반 가능","PC/노트북","의자/테이블","내부화장실","탈의실","테라스/루프탑","공용라운지","전신거울","바베큐시설","도어락"};
    	String[] place1 = (s.getS_kategorie1()).split(",");
    	String[] kg1 = {"회의실","세미나실","다목적홀","작업실","레저시설","파티룸","공연장","연습실","카페","스터디룸","엠티장소","루프탑"};
    %>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=33qm1u5uje&submodules=geocoder"> //네이버 지도 스크립트
	</script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/viewpage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>뷰페이지</title>
<style type="text/css">
.star_rating {font-size:0; letter-spacing:0px;}
.star_rating span{
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating span:first-child {margin-left:0;}
.star_rating span.on{
	color:#f69b02;
}
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
                        <h1>${s.s_placeName }</h1>
                        <p>${s.s_placeIntroduce1 }</p>
                        <ul>
                    
                        <c:forTokens items="${s.s_placeTag }" delims="#" var="t">
                            <li>
                            	<a href="#">#${t}</a>
                            </li>
                         </c:forTokens>
              			
                        </ul>
                        <!-- 마커 -->
                        <div id="declare_outline" style="position:relative;">
                        <c:if test="${sessionScope.User != null}">
                        	<div id="declare">
                        		<img src="../img/icon_declare.png" height="23px" width="23px;" style="margin-bottom: 5px;">
                        	 	<img src="../img/icon_declare2.png" height="23px" width="23px;" style="margin-bottom: 5px;">
                        	 	신고
                        	</div>
                        </c:if>
                        <div id="declare_content">
                        	<div id="declare_header">신고하기</div>
                        	<form id="declare_form">
                        		<button type="button" class="declare_type">공간 정보 허위 신고</button>
                        		<button type="button" class="declare_type">불친절한 호스트</button>
                        		<button type="button" class="declare_type">환불규정 미준수</button>
                        		<br><br>
                        		<input type="hidden" name="S_no" value="${s.s_no }">
                        		<input type="hidden" name="S_placeName" value="${s.s_placeName }">
                        		<input id="declareType" type="hidden" name="declareType">
                        		신고자 : <input class="declare_name" type="text" name="userName" value="${sessionScope.User.userName }" readonly="readonly"><br><br>
                        		신고내용 : <input class="declare_name" type="text" name="declareContent" size="40" placeholder="신고내용을 간단히 작성해주세요."><br><br>
                        		<button type="button" class="declareBtn" id="declareBtn">신고하기</button>
                        		<button type="button" class="declareBtn" id="noneBtn">취소</button>
                        	</form>
                        </div>
                        </div>
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
                                <img src="/upload/space/<%=img2[1] %>" width="384px;" height="255px;">
                        	</div>
                        	<div id="viewpage_photo2_r">
                                <img src="/upload/space/<%=img2[2] %>" width="383px;" height="255px;">
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
                          <div id="slider-wrap">
				          <ul id="slider">
				          <c:forTokens items="${s.s_img2 }" delims="," var="sliderimg"> 
				             <li data-color="#1abc9c">				                          
									<img src="/upload/space/${sliderimg}">
				             </li>	   
				           </c:forTokens>          		             
				          </ul>
				          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
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
                                        <a href="https://map.naver.com/" style="text-decoration: none;" target="_blank">
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
                            <h4>Q&amp;A <strong class="txt_primary">${qna.totalCount}개</strong></h4>
                            <c:if test="${s.s_hostNum != host.hostNo}">
                            <a style="text-decoration: none; color:#fff;" id="viewQna"><span>질문작성하기</span></a>
                            </c:if>
                            </div>
                            <div class="viewpage_qnaview">
                                <div>
                                    <ul class="review_list" id="qna_list">
                                     <c:if test="${qna.totalCount == 0}">                                                
                                                	<p class="review_none">등록된 질문이 없습니다.</p>
                                    </c:if>
                                    <c:forEach var="q" items="${qna.list}">   
                                    	<c:if test="${q.qaCommentRef == ''}">   	
                                        <li class="rlist" style="padding-top:30px;">  
                                        <div class="rbox_mine">  
                                                 <span class="pf_img"><img src="../img/user1.png" width="100px;" height="100px;"></span> 
                                                <div class="rbox_name">
                                                <strong class="guest_name" style="font-size:22px;">${q.qaCommentWriter}</strong>
                                                <p class="p_review" style=" word-break:break-all">${q.qaCommentContent}</p>
                                                </div>
                                                <div class="rbox_info_base">  
                                                    <span class="time_info">${q.qaCommentDate}</span> 
                                                </div>
                                        </div>
                                        
                                          
										<div style="text-align: right;">
                                    	<c:if test="${sessionScope.User.userId == q.qaCommentWriter}">
                                    	<a style="text-decoration:none; color:#f69b02; border-color:#f69b02;" class="qaupdate btn btn-outline-primary btn-sm"><span>수정</span></a>
                                    	<button class="btn btn-outline-primary btn-sm" style="color:#f69b02; border-color:#f69b02;"><a href="/qaViewpageDelete?S_no=${s.s_no }&qaCommentNo=${q.qaCommentNo }" style="color:#f69b02;">삭제</a></button>
                                    	</c:if>
                                    	<input type="hidden" class="qaNo" value="${q.qaCommentNo}">
                                    	<c:if test="${s.s_hostNum == host.hostNo}">
                                    		<button type="button" class="viewQnaComment btn btn-outline-primary btn-sm" style="color:#f69b02; border-color:#f69b02;">답글달기</button>
                                    	</c:if>
                                    	</div>
                                        </li>
                                        </c:if>
                                        <c:forEach var="qq" items="${qna.list}">
                                          <c:if test="${q.qaCommentNo == qq.qaCommentRef}">
                                            <div class="rbox_reply" style="margin-top:30px;">
                                            <c:if test="${empty host.hostFile}">                                            	
                                            	<span class="pf_img"><img src="../img/logo.png" width="100px;" height="50px;"></span>
                                            </c:if>
                                            <c:if test="${not empty host.hostFile }">
                                            	<span class="pf_img"><img src="/upload/hostProfile/${host.hostFile}"></span>
                                            	</c:if> 
                                                <p class="p_tit_reply">
                                                    <em>${qq.qaCommentWriter}</em>님의 댓글
                                                </p>
                                                <p class="p_review" style=" word-break:break-all">
                                                	   ${qq.qaCommentContent}
                                                </p>
                                                <div class="rbox_info_base">
                                                    <p class="time_info">${qq.qaCommentDate}</p>
                                                </div>
                                            </div>
                                            <div style="text-align: right;">
                                    	<c:if test="${sessionScope.User.userId == qq.qaCommentWriter}">
                                    	<a style="text-decoration:none; color:#f69b02; border-color:#f69b02;" class="qaupdate btn btn-outline-primary btn-sm"><span>수정</span></a>
                                    	<button class="btn btn-outline-primary btn-sm" style="color:#f69b02; border-color:#f69b02;"><a href="/qaViewpageDelete?S_no=${s.s_no }&qaCommentNo=${qq.qaCommentNo }" style="color:#f69b02;">삭제</a></button>
                                    	</c:if>
                                    	<input type="hidden" class="qaNo" value="${qq.qaCommentNo}">      
                                    	</div>
                                           </c:if>
                                        </c:forEach> 
                                        </c:forEach>
                                    </ul>
                                </div>
                                 <div class="pageNavi_qa">${qna.pageNavi}</div>
                            </div>
            
                        </div>
                         <div class="viewpage_hostpage">
                            <div class="host_area">
							<div class="pf_left"><img src="../img/logo.png"></div>
							<div class="pf_right">
								<strong class="pf_host">HOST</strong><br> <span class="pf_name">${s.s_placeName}</span>
								<p class="pf_txt">${s.address}</p>
							</div>							
						</a>
						</div>
                        </div>
                        <div class="viewpage_review_header">
						<h4 class="h_intro"><!--?s_no=${s.s_no }  -->
							이용 후기 <strong class="txt_primary">${pd.totalCount}개</strong>
							<span class="dot"></span>
							평균 평점 <strong class="txt_primary">${pd.totalStar}</strong>
						</h4>
						<c:if test="${not empty res}">
		               		<a class="btn btn-outline-primary btn-sm" href="/reviewWrite?S_no=${s.s_no }" style="color:#f69b02; border-color:#f69b02; float:right;">리뷰등록</a>
		                </c:if>
					</div>
                    <div class="viewpage_review">
                     <c:if test="${pd.totalCount == 0}">                                                
                       	<p class="review_none">등록된 리뷰가 없습니다.</p>
                          </c:if>
                        <ul>
                         <c:forEach items="${pd.list}" var="rc">
                            <li class="rlist">   
       
                                <div class="rbox_mine" style="padding-top:30px;"> 
                                    <span class="pf_img"><img src="../img/user1.png" width="100px;" height="100px;"></span> 
                                    <strong class="guest_name">${rc.reviewWriter}</strong> 
<%--                                     <p class="p_review"><span>제목 : </span>${rc.reviewTitle }</p> --%>
                                    <p class="p_review" style=" word-break:break-all">${rc.reviewContent }</p>
                                    <c:if test="${not empty rc.filename }">
                                    <div class="space_list swiper_list photo_review"> 
                                        <div class="flex_wrap column3 fluid">      
                                            <article class="box_space">    
                                                <div class="inner">     
                                                    <a href="#" class="_review_img_link">
                                                        <div class="img_box">
                                                            <span><img src="/upload/review/${rc.filename }" width="100%" height="100%"></span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                    </c:if> 
                                    <div class="rbox_info_base">
                                        <span class="time_info">${rc.reviewDate }</span>
                                    </div>
                                    <span class="rate_area">
                                        <span class="blind">평점</span>
	                                       <p class="star_rating">
												<c:forEach  begin="1" end='${rc.reviewStar}'>
													<span class="on">★</span>
												</c:forEach>
												<c:forEach  begin="${rc.reviewStar}" end='4'>
													<span>★</span>
												</c:forEach>
						    			   </p>
                                    </span>
                                    <div style="text-align: right;">
                                    	<c:if test="${sessionScope.User.userId == rc.reviewWriter}">
                                    	<button class="btn btn-outline-primary btn-sm"  style="color:#f69b02; border-color:#f69b02; text-decoration: none;"><a href="/reviewUpdateEnd?reviewNo=${rc.reviewNo }" style="color:#f69b02;">수정</a></button>
                                    	<button class="btn btn-outline-primary btn-sm"  style="color:#f69b02; border-color:#f69b02; text-decoration: none;" ><a href="/reviewDelete?S_no=${s.s_no }&reviewNo=${rc.reviewNo}" style="color:#f69b02;">삭제</a></button>
                                    	</c:if>
                                    </div>                                                                              
                                </div>
                            </li>
                            </c:forEach>
                            <div class="pageNavi">${pd.pageNavi}</div>
                        </ul>
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
                                            <input type="radio" checked> ${s.s_placeName } <span>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /><small style="color:#949494;">/시간</small></span>
                                        </li>
                                        <li class="viewpage_list_none" style="padding:15px 0px 15px; height:140px;">
                                            <img src="../img/ex1.jpg" width="110px" height="110px" id="viewpage_right_img">
                                            <p>${s.s_placeIntroduce1}</p>
                                        </li>
                                        <li style="clear: both;" class="viewpage_right_c"><span style="color:#656565; float:left;">· 공간유형</span>
                                                                               
                                         <%for(int i = 0; i<place1.length; i++) {%>
                                    	<%if(place1[i].equals("1")){ %>                                    
                                    				<p><%=kg1[i] %></p>
                                    			
	                                    	<%} %>
	                                    <%} %>
                                 		 </li>
                                        <li class="viewpage_right_c"><span style="color:#656565; float:left;">· 예약시간</span><p>${s.s_start } ~ ${s.s_end }</p></li>
                                        <li class="viewpage_right_c"><span style="color:#656565; float:left;" >· 예약인원</span> <p>${s.s_people}</p></li>
                                    </ul>
                                    <div class="viewpage_right_icon">
                                        <%  int count = 0;
                                        	for(int i = 0; i<kg.length; i++) {
	                                    		if(kg[i].equals("1")){ 
	                                    			count++;
	                                    			if(count<=3){
	                                    		%>
	                                    			<div class="viewpage_right_kategorie"><img src="/upload/space/kategorie2/<%=i+1 %>.png" width="30px;">
	                                    				<p style="font-size:14px;"><%=kg2[i] %></p>
	                                    			</div>
	                                    		  <%}
	                                    		} 
                                    		}%>
                                    	<%if(count > 3 ){ %>
                                    	<div class="viewpage_right_kategorie">
                                    		<p style="font-size:14px;">+ <%=count-3%> </p>
                                    	</div>
                                    	<%} %>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${not empty sessionScope.User}">	
                                  
                             		<button onclick="reservationBtn1()" class="viewpage_reservationbtn">결제하러 가기</button>
                                 
                             	</c:when>
                             	<c:otherwise>
                   
                             		<button onclick="reservationBtn()"  class="viewpage_reservationbtn">결제하러 가기</button>
                                   
                             	</c:otherwise>
                             </c:choose>
                        </div>
                </div>
                                              
                </div>
            </div>
        </div>
    </section>
	<form action="/commentInsertQa?S_no=${s.s_no }&" method="post">
    <div class="layer_popup" id="layer_popup_Comment" class="_noProfileCheckLayout" style="display:none;position:fixed;">
			<div class="popup_wrap">
                <div class="pop_header">
                	<input type="hidden" name="qaNo" class="CommentNo" value="">                    
					<p>답글 작성하기</p>
                    <button><a href="javascript:void(0);" class="popcencle" style="color:#fff; text-decoration: none;">X</a></button>
                </div>
				<div class="pop_container">
                    <div class="box_l">
                        <label for="input_question_an">답글</label>
                    </div>
                    <div class="box_r"><p id="textarea_input_re">0 /</p><p id="textarea_length_an">200자</p></div>
                    <div class="qna_input">
						<textarea name="qaCommentContent" id="input_question_an" placeholder="답글을 남겨 주세요." maxlength="200" data-ui-sync-length="._question_length" required></textarea>
					</div>
				</div>
                <div class="qna_p">
				   <div class="view_warning_img">
				   <img src="../img/icon_warning.png"> <p>
				    질문은 공개 상태로만 등록하실 수 있습니다.
                    </p>
                    </div>
			     </div>
                <div class="qnaBtns" style="clear: both;">
<!--						<a href="javascript:void(0);" class="popcencle">닫기</a>-->
                    <div id="qna_abtn" >
						<button class="poprollback" id="commentInsertBtn">등록</button>
                    </div>
					</div>
			</div>
		</div>
		</form>
<!-- 			<div class="hostpopupMask"> -->
<!-- 		</div> -->
	<form action="/insertQa?S_no=${s.s_no }" method="post">
    <div class="layer_popup" class="_noProfileCheckLayout" style="display:none;position:fixed;">
			<div class="popup_wrap">
                <div class="pop_header">                     
					<p>질문 작성하기</p>
                    <button type="button"><a href="javascript:void(0);" class="popcencle" style="color:#fff; text-decoration: none;">X</a></button>
                </div>
				<div class="pop_container">
                    <div class="box_l">
                        <label for="input_question">질문</label>
                    </div>
                    <div class="box_r"><p id="textarea_input">0 /</p><p id="textarea_length_qa">200자</p></div>
                    <div class="qna_input">
						<textarea name="qaCommentContent" id="input_question" placeholder="질문을 남겨 주세요." maxlength="200" data-ui-sync-length="._question_length" required></textarea>
					</div>
				</div>
                <div class="qna_p">
				   <div class="view_warning_img">
				   <img src="../img/icon_warning.png"> <p>
				    질문은 공개 상태로만 등록하실 수 있습니다.
                    </p>
                    </div>
			     </div>
                <div class="qnaBtns" style="clear: both;">
<!--						<a href="javascript:void(0);" class="popcencle">닫기</a>-->
                    <div id="qna_abtn">
						<button class="poprollback">등록</button>
                    </div>
					</div>
			</div>
		</div>
		</form>
 		<div class="hostpopupMask"> 
 		</div> 
		
		<form method="post" id="qaUpdateForm">
    <div class="layer_popup_up" class="_noProfileCheckLayout" style="display:none;position:fixed;">
			<div class="popup_wrap">
                <div class="pop_header">
                	<input type="hidden" name="qaCommentNo" class="cNo" value="">  
                	<input type="hidden" name="S_no" value="${s.s_no}">                    
					<p>질문 작성하기</p>
                    <button type="button" class="popcencleUP">X</button>
                </div>
				<div class="pop_container">
                    <div class="box_l">
                        <label for="input_update">질문수정</label>
                    </div>
                    <div class="box_r"><p id="textarea_update">0 /</p><p id="textarea_uplength">200자</p></div>
                    <div class="qna_input">
						<textarea name="qaCommentContent" id="input_update" maxlength="200"></textarea>
					</div>
				</div>
                <div class="qna_p">
                    <div class="view_warning_img">
				   <img src="../img/icon_warning.png"> <p>
				    질문은 공개 상태로만 등록하실 수 있습니다.
                    </p>
                    </div>
			     </div>
                <div class="qnaBtns" style="clear: both;">
<!--						<a href="javascript:void(0);" class="popcencle">닫기</a>-->
                    <div id="qna_updateBtn">
						<button type="submit" class="poprollback">등록</button>
                    </div>
				</div>
			</div>
		</div>
		</form>
		<div class="hostpopupMaskan"> 
 		</div> 
               
                                                    
        <%-- 메뉴바 스크롤 따라오기 스크립트 --%>
        <script>
        function reservationBtn() {
            window.location = "/views/login.jsp";
        }
	function reservationBtn1(){
		window.location = "/selectOneReservation?S_no=${s.s_no}";
	}
        var $ = jQuery.noConflict();
       $(document).ready(function() {
    	   if('${l}' != ""){
    		   $("#like_full").css("display","inline");
			}
    	   var floatPosition = parseInt($(".viewpage_right").css('top'));    	   
           $(window).scroll(function() {
               var scrollTop = $(window).scrollTop();
               console.log(scrollTop);
               console.log($(document).height());
               if(scrollTop<800){
                   var newPosition = 0 + "px";
                    $(".viewpage_right").stop().animate({
                        "top" : newPosition
                    }, 1000);
               }else if($(document).height() > scrollTop+$(window).height()){
                  var newPosition = (scrollTop-700) + "px";
                   $(".viewpage_right").stop().animate({
                       "top" : newPosition
                   }, 1000);
               }else{
                  var newPosition = (scrollTop - (parseInt($(".viewpage_right").css("height"))+150)) + "px";
                   $(".viewpage_right").stop().animate({
                       "top" : newPosition
                   }, 1000);
               }
           }).scroll();
           
          if('${sessionScope.User}' != ""){
        	  $("#like").click(function(){
                 	var s_no = ${s.s_no};
                 
                 	var userNo = '${sessionScope.User.userNo}';
                 	
                 	
                 	$.ajax({
                 		type:"GET",
                 		url: "/likeInsertAjax?S_no="+s_no+"&userNo="+userNo,
                 		success : function(data){
                 			var result = data;
                 			if(result==1){
                 				$("#viewpage_alert").slideDown(700);
                             	$("#viewpage_alert").delay(1300);
                             	$("#viewpage_alert").css("display","inline");
                             	$("#viewpage_alert").delay(1300);
                             	$("#viewpage_alert").slideUp(700); 
                             	$("#like_full").css("display","inline");
                             	$("#viewpage_alert p").html("내가 가고 싶은 공간에 등록되었습니다.");	
                 			}
                 		}
                 	});
                 });
                
               $('#input_question').keyup(function(){
                  var inputLength = $(this).val().length;
                   var remain = 200 - inputLength;
                   $("#textarea_length").html(remain+"자");
                   $("#textarea_input").html(inputLength+" /");
               }); 
               $('#input_update').keyup(function(){
                   var upLength = $(this).val().length;
                    var remain = 200 - $('#input_update').val().length;
                    $("#textarea_uplength").html(remain+"자");
                    $("#textarea_update").html(upLength+" /");
                }); 
               $('#input_question_an').keyup(function(){
                   var inputLength = $(this).val().length;
                    var remain = 200 - inputLength;
                    $("#textarea_length_an").html(remain+"자");
                    $("#textarea_input_re").html(inputLength+" /");
                }); 
                 $("#like_full").click(function(){
                 	var s_no = ${s.s_no};
                 	
                 	var userNo = '${sessionScope.User.userNo}';
                 	
                     $.ajax({
                 		type:"GET",
                 		url: "/likeDeleteAjax?S_no="+s_no+"&userNo="+userNo,
                 		success : function(data){
                 			var result = data;
                 			if(result==1){
                					$("#viewpage_alert").slideDown(700);
                	                $("#viewpage_alert").delay(1300);
                	                $("#viewpage_alert").css("display","inline");
                	                $("#viewpage_alert").delay(1300);
                	                $("#viewpage_alert").slideUp(700); 
                	                $("#like_full").css("display","none"); 
                	                $("#viewpage_alert p").html("내가 가고 싶은 공간에서 제외되었습니다.");
                 				
                 			}	
                 		}
                 	});
           		});
          }else{
        	  $("#like").click(function(){
        		  $("#viewpage_alert").slideDown(700);
	                $("#viewpage_alert").delay(1300);
	                $("#viewpage_alert").css("display","inline");
	                $("#viewpage_alert").delay(1300);
	                $("#viewpage_alert").slideUp(700); 
	                $("#like_full").css("display","none"); 
	                $("#viewpage_alert p").html("로그인 후 이용가능 합니다.");
        	  });
        	  
          }
           $(".viewpage_content").css("background","url(/upload/space/${s.s_img1})no-repeat center center");
           $(".viewpage_content").css("background-size","cover");
          
         //current position
           var pos = 0;
           //number of slides
           var totalSlides = $('#slider-wrap ul li').length;
           //get the slide width
           var sliderWidth = $('#slider-wrap').width();
               
               /*****************
                BUILD THE SLIDER
               *****************/
               //set width to be 'x' times the number of slides
               $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
               
               //next slide    
               $('#next').click(function(){
                   slideRight();
               });
               
               //previous slide
               $('#previous').click(function(){
                   slideLeft();
               });
               
               
               
               /*************************
                //*> OPTIONAL SETTINGS
               ************************/
               //automatic slider
               var autoSlider = setInterval(slideRight, 3000);
               
               //for each slide 
               $.each($('#slider-wrap ul li'), function() { 

                  //create a pagination
                  var li = document.createElement('li');
                  $('#pagination-wrap ul').append(li);    
               });
               
               //counter
               countSlides();
               
               //pagination
               pagination();
               
               //hide/show controls/btns when hover
               //pause automatic slide when hover
               $('#slider-wrap').hover(
                 function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
                 function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
               );
               
               

  
               


           /***********
            SLIDE LEFT
           ************/
           function slideLeft(){
               pos--;
               if(pos==-1){ pos = totalSlides-1; }
               $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
               
               //*> optional
               countSlides();
               pagination();
           }


           /************
            SLIDE RIGHT
           *************/
           function slideRight(){
               pos++;
               if(pos==totalSlides){ pos = 0; }
               $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
               
               //*> optional 
               countSlides();
               pagination();
           }



               
           /************************
            //*> OPTIONAL SETTINGS
           ************************/
           function countSlides(){
               $('#counter').html(pos+1 + ' / ' + totalSlides);
           }

           function pagination(){
               $('#pagination-wrap ul li').removeClass('active');
               $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
           }
                    	
        });   
       $("#viewQna").click(function(){
			if('${sessionScope.User.userId}' == ''){
				$("#viewQna").attr("href","/views/login.jsp");
			}else{
				$('.layer_popup').show();
				$('.hostpopupMask').show();
			}
		});
       $(".viewQnaComment").click(function(){
    	   $('.CommentNo').val($(this).prev().val());
    	   console.log($('.CommentNo').val());
    	   $('#layer_popup_Comment').show();
    	   $('.hostpopupMaskan').show();
       });
       $('#declare').click(function(){
    	   $('#declare_content').toggle();
       });
       $('.declare_type').click(function(){
    	   $('.declare_type').removeClass("change_btn");
    	   $(this).toggleClass("change_btn");
    	   $('#declareType').val($(this).text());
       });
       $('#noneBtn').click(function(){
    	   $('#declare_content').css("display","none");
       });
       $('#declareBtn').click(function(){
    	   
    	   var params = $('#declare_form').serialize();
           $.ajax({
               url:"/insertDeclare",
               type:"POST",
               data:params, 
               error:function(request,status,error){
                   alert("실패");
                   alert(request.status);
               },
               success:function(data){
            	   var result = data;
        			if(result==1){
        				$('#declare_content').css("display","none");
        				$("#viewpage_alert").slideDown(700);
        				var offset = $("#viewpage_alert").offset();
        		        $('html, body').animate({scrollTop : offset.top}, 400);
                    	$("#viewpage_alert").delay(1300);
                    	$("#viewpage_alert").css("display","inline");
                    	$("#viewpage_alert").delay(1300);
                    	$("#viewpage_alert").slideUp(700); 
                    	$("#viewpage_alert p").html("신고접수가 완료되었습니다.");//마커
        			}else{
        				$('#declare_content').css("display","none");
        				$("#viewpage_alert").slideDown(700);
        				var offset = $("#viewpage_alert").offset();
        		        $('html, body').animate({scrollTop : offset.top}, 400);
                    	$("#viewpage_alert").delay(1300);
                    	$("#viewpage_alert").css("display","inline");
                    	$("#viewpage_alert").delay(1300);
                    	$("#viewpage_alert").slideUp(700);
                    	$("#viewpage_alert p").html("신고접수 실패");
                    	
        			}
               }
           });
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
			map.setOptions("mapTypeControl", true);
			
			var marker = new naver.maps.Marker({ 
				position : new naver.maps.LatLng(y,x), //마커
				map : map,
				icon: {
			        content: '<img src="/img/mark.png">',
			        size: new naver.maps.Size(22, 35),
			        anchor: new naver.maps.Point(11, 35)
			    }
				
			});
			var infoWindow =new naver.maps.InfoWindow();
			naver.maps.Event.addListener(marker,'click',function(e){	//클릭햇을떄 이벤트 줘야지
				if(infoWindow.getMap()){ //지도에 열려있는지 아닌지 판단여부 (정보창)
					infoWindow.close();
				}else{
					infoWindow.setContent('<div style="width:180px;text-align:center;padding:10px;"><img src="/upload/space/${s.s_img1}" style="width:150px;">${s.address}</div>');
					infoWindow.open(map,marker);
				}
				
			});
			
	    });		
		};
		
		$(".popcencle").click(function(){
			$('.layer_popup').hide();
			$('.hostpopupMask').hide();
		});
		$(".qaupdate").click(function(){
			$('.cNo').val($(this).next().next().val());
			$('.layer_popup_up').show();
			$('#qaUpdateForm').attr('action',"/qaViewpageUpdateEnd");
			$('#input_update').html($(this).parents('.rlist').find(".p_review").html());
			$('.hostpopupMaskUp').show();
		});
		$(".popcencleUp").click(function(){
			$('.layer_popup_up').hide();
			$('.hostpopupMaskUp').hide();
		});
</script>		
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>