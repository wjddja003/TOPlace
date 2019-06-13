<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>예약페이지</title>

<link rel="stylesheet" href="/Calendar/daterangepicker.css" />
<script src="https://code.jquery.com/jquery-3.4.0.js"
   integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
   crossorigin="anonymous">
   
</script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
   <%-- 아임포트 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
    color:black;
}

input[type="checkbox"] + label span {
	line-height: 50px;
    display:inline-block;
    width:19px;
    height:19px;
    margin:0 10px 0 10px;
    vertical-align:middle;
    background: url('../img/icon_check.png') no-repeat;
    cursor:pointer;
    border-radius: 3px;
}

input[type="checkbox"]:checked + label span {
    background: url('../img/icon_checked.png') no-repeat;
    background-size: 19px;
}

/*reservation css start*/
.reservation {
   overflow: hidden;
   position: relative;
}
.reservation_lMenu {
   float: left;
   width: 800px;
   margin: 10px 10px 0px 0px;
}
/* reservation_lMenu css fin */
.reservation_rMenu {
   margin: 0px 0px 0px 0px;
   float: left;
   width: 330px;
   top: 60px;
   right: 0px;
   position: absolute;
   overflow-y: auto;
}
.payment_title{
	font-size:20px;
}
.rMenu_list:first-of-type {
   border-top: 3px solid #f69b02;
}
.rMenu_list {
	border-bottom: 1px solid #ccc;
   	height: 50px;
   	line-height: 50px;
   	font-size: 16px;
   	background: white;
   	clear:both;
}
.rMenu_price {
   background: white;
   line-height: 80px;
   border-top: 3px solid #f69b02;
   font-size: 28px;
}
.rMenu_price_list{
   height: 20px;
      line-height: 20px;
      font-size: 14px;
      clear:both;
      text-align: right;
}
#payment {
   height: 56px;
   width: 100%;
   border: none;
   outline: none;
   background: #f69b02;
   color: white;
}
#payment:hover{
			background: #183058;
}
/* reservation_rMenu  css fin */
.reservation_head {
   margin: 50px 0px 0px 0px;
   background: white;
}
/* reservation_head css fin */
.reservation_content {
   background: #f7f7f7;
   margin: 0px 0px 20px 0px;
   border-top: 2px solid #f69b02;
   padding: 20px;
   clear: both;
   position: relative;
}
/* reservation_content css fin */
.reservation_title {
   display: block;
   text-align: left;
   font-size: 20px;
   font-weight: bold;
   float: left;
}
/* reservation_title css fin */
.reservation_sub {
   display: block;
   margin: 0px 10px 0px 0px;
   text-align: right;
   font-size: 18px;
}
/* reservation_sub css fin */
.reservation_content label {
   font-weight: bold;
   font-size: 18px;
}
.reservaion_list {
   background: white;
   line-height: 50px;
}
.reservaion_list img {
   margin-right: 30px;
}
/*reservation페이지 인원선택*/
#reservation_people{
   margin: 0 auto;
   width:80%;
   background:white;
   text-align:center;   
   height:50px;
}
#person_minus{
   width:50px;
   height:50px;
   border: 1px; solid #ccc;
   background : #f69b02;
   color: white;
   outline:none;
}
#person_minus:hover{
   background : #183058 ;
}
#person_plus{
   width:50px;
   height:50px;
   border: 1px; solid #ccc;
   background : #f69b02;
   color: white;
   outline:none;
}
#person_plus:hover{
   background : #183058 ;
}
.startDay{
	font-size:16px;
}
.endDay{
	font-size:16px;
}
.hapDay{
	font-size:18px;
	color:red;
}
#option_minus{
	width:50px;
   	height:50px;
   	border: 1px; solid #ccc;
   	background : #f69b02;
   	color: white;
   	outline:none;
}
#option_minus:hover{
   background : #183058 ;
}
#option_plus{
	width:50px;
   	height:50px;
   	border: 1px; solid #ccc;
   	background : #f69b02;
   	color: white;
   	outline:none;
}
#option_plus:hover{
   background : #183058 ;
}
/* reservation페이지 label태그 css fin */
.reservation_content label span {
   color: red;
   padding-right: 20px;
}
/* reservation페이지 label span 태그 css fin */
.reservation_content span {
   color: red;
}
/* reservation페이지 reservation_content span태그 css fin */
#reservation_popupDiv {
   z-index: 999;
   top: 0px;
   position: absolute;
   background: white;
   width: 500px;
   border-radius: 15px;
   display: none;
   text-align: center;
}
#reservation_popupDiv_title {
   text-align: left;
   border-top-left-radius: 15px;
   border-top-right-radius: 15px;
   padding: 10px 10px 20px;
   background: #183058;
   height: 50px;
   font-size: 24px;
   color: white;
}
#reservation_popupDiv_content {
   border-bottom: 2px solid #183058;
   height: 100px;
   line-height: 100px;
   font-size: 24px;
}
.reservation_popupDiv_list {
   margin: 0 auto; 
   width : 80%;
   border-bottom: 1px solid #ccc;
   height: 50px;
   line-height: 50px;
   font-size: 16px;
   clear:both;
}
.pop_list_left {
   text-align: left;
   float: left;
}
.pop_list_right {
   text-align: right;
   float: right;
}
.reservation_popupDiv_info{
   border-top:2px solid #183058;
   clear: both;
   text-align: left;
}
.pop_list_info{
   margin-top:5px;
   margin-left:40px;
   color: red;
   font-size:12px;
   text-align: left;
}
#reservation_popup_footer {
   margin-bottom:30px;
}
#pop_option{
	display:none;
}
#rMenu_option{
	display:none;
}
.reservation_popCloseBtn{
   width: 120px;
   height: 50px;
   color:white;
   background: #f69b02;
   outline:none;
   border:none;
   border-radius: 10px;
}
#pop_payment{
   color:white;
   background: #183058;
   width: 120px;
   height: 50px;
   outline:none;
   border:none;
   border-radius: 10px;
}
#choiceDay button{
	font-size: 14px;
	color:white;
   	background: #f69b02;
	width: 80px;
   	height: 30px;
   	outline:none;
	border:none;
	border-radius: 5px;
}
.reservation_popCloseBtn_1 {
   line-height: 50px;
   float: right;
   width: 30px;
   height: 30px;
   border: none;
   outline: none;
   background: url("../img/icon_close.png") no-repeat;
   background-size: 25px;
   margin-top: 5px;
}
/* reservation페이지 팝업창 css */
#reservation_popup_mask {
   z-index: 98;
   position: fixed;
   width: 100%;
   height: 100%;
   top: 0px;
   left: 0px;
   display: none;
   background-color: #000;
   opacity: 0.6;
}

/* reservation페이지 팝업시 배경 css */
/*스와이프 css 시작*/
.swiper-container {
   height: 250px;
   border: 5px solid white;
   border-radius: 7px;
   box-shadow: 0 0 20px white inset;
}

.swiper-slide {
   text-align: center;
   display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
   align-items: center; /* 위아래 기준 중앙정렬 */
   justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide button {
   width: 100px;
   height: 80px;
   max-width: 100%;
   border: 1px solid #ccc;
}

.swiper-slide button:focus {
   outline: none;
}
/*스와이프 css 끝*/
.viewpage_kategorie{
	width: 20%;
	margin-bottom:10px;
	float: left;
}
.viewpage_textbox{
	clear:both;
}
#emptyValue{
      width:100%;
      height: 100px;
      text-align: center;
      letter-spacing: 8px;
      word-spacing:15px;
      background-color: #f69b02;
      color:white;
      font-size: 30px;
      line-height: 100px;
      display:none;
      top:0px;
      position:fixed;
      z-index:99;
   }
/*reservation css fin*/
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/common/header.jsp" />
   <div id="emptyValue"></div>
   <section style="background: white">
      <div class="section_content" style="background: white; clear:both;">
         <div class="reservation">
            <%-- 예약페이지 컨텐츠 --%>
            <div class="reservation_lMenu">
               <%-- 예약페이지 공간소개 --%>
               <div class="reservation_head">
                  <span class="reservation_title">예약 공간</span> 
                  <c:if test="${s.s_type eq 'day'}">
                  	<span class="reservation_sub"  style="color:red;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /><span style="font-size:16px">/일</span></span>
                  </c:if>
                  <c:if test="${s.s_type eq 'time'}">
                  	<span class="reservation_sub"  style="color:red;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /><span style="font-size:16px">/시간</span></span>
                  </c:if>
               </div>
               <div class="reservation_content">
               		<div class="reservation_space_info">
               			<div style="border-bottom:1px solid #ccc; width:100%; float:left; margin-bottom:20px">
		               		<div class="reservation_space_img" style="width:30%; height:300px; float:left">
		               			<img src="/upload/space/${s.s_img1 }" width='100%;' height="100%;">
		               		</div>
		               		<div class="reservation_space_tit" style="width:68%; float:left; border-bottom:1px solid #ccc; margin-left:10px;" >
		               			<h3>${s.s_placeName} </h3>
		               		</div>
		               		<div class="reservation_space_tit" style="width:68%; float:left; margin: 10px 0px 0px 10px;">
		               			<h5><span style="color:black;">${s.s_placeIntroduce1}</span></h5>
		               			<span style="color:black; word-break:break-all">${s.s_placeShow}</span>
		               		</div>
	               		</div>
	               		<div class="viewpage_textbox">
                            <div>
                            	<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               					<span style="font-size:18px; line-height: 100%;"> 공간유형</span><span style="color:black; margin-left:20px;">
	               					<c:forEach items="${s.s_kategorieList1}" var="list1" varStatus="i">
                                    	<c:if test="${list1 == '1'}"><span style="color:black;">${s.s_kategorieName1[i.index]}</span>
                                    	</c:if>
                                    </c:forEach>
	               					</span>
	               				</div>
			               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
			               			<span style="font-size:18px; line-height: 100%;" > 이용시간</span><span style="color:black; margin-left:20px;"> ${s.s_start}시 ~ ${s.s_end}시</span>
			               		</div>
			               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
			               			<span style="font-size:18px; line-height: 100%;"> 예약인원</span><span style="color:black; margin-left:20px;">${s.s_people}명</span>
			               		</div>
			               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               					<span style="font-size:18px; line-height: 100%;"> 연락처&nbsp;&nbsp;&nbsp;</span><span style="color:black; margin-left:20px;">${fn:substring(s.s_phone2, 0, 3)}-${fn:substring(s.s_phone2, 3, 7)}-${fn:substring(s.s_phone2, 7, 11)}&nbsp;&nbsp;${s.s_email}</span>
	               				</div>
	               				<c:if test="${not empty s.s_placeWeb} ">
	               				<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               					<span style="font-size:18px; line-height: 100%;"> 사이트&nbsp;&nbsp;&nbsp;</span><span style="color:black; margin-left:20px;">${s.s_placeWeb}</span>
	               				</div>
	               				</c:if>
                            </div>
                            <ul>
                                <li style="padding:30px 0px 20px 0px; text-align:center; overflow:hidden;">                               
                                    <c:forEach items="${s.s_kategorieList}" var="list" varStatus="i">
                                    	<c:if test="${list == '1'}">
                                    		<div class="viewpage_kategorie"><img src="/upload/space/kategorie2/${i.index+1}.png" width="30px;">
                                    			<p>${s.s_kategorieName[i.index]}</p>
                                    		</div>
                                    	</c:if>
                                    </c:forEach>
                                </li>
                            </ul>
                        </div>
               		</div>
               </div>
               <%-- 예약 단위 선택  
               <div class="reservation_head">
                  <span class="reservation_title">예약 단위 선택</span> 
                  <span class="reservation_sub" style="color:red;">*VAT 가격 포함</span>
                  <div class="reservation_content">
                  	<c:if test="${s.s_type eq 'day'}">
                  		<button class="daySelBtn" value="1">기간 선택</button>
                  	</c:if>
                  	<c:if test="${s.s_type eq 'time'}">
                  		<button class="daySelBtn" value="2">시간 선택</button>
                  		<button class="daySelBtn" value="3">원하는 날짜 선택</button>
                  	</c:if>
                  </div>
               </div>
               --%>
               <%-- 예약페이지 날짜선택 --%>
               <div class="reservation_head">
                  <span class="reservation_title">날짜 선택</span>
                  <c:if test="${s.s_type eq 'day'}">
                  <span class="reservation_sub" style="color: red;">* 최소 1일 ~ 최대 30일</span>
                  </c:if>
                  <c:if test="${s.s_type eq 'time'}">
                  <span class="reservation_sub" style="color: red;">* 최소 1일 ~ 최대 7일</span>
                  </c:if>
               </div>
               <div class="reservation_content">
                <center>
                  <div class="demo">
                     <jsp:include page="/WEB-INF/views/calendar.jsp" />
                  </div>
                   </center>
               </div>
     		<c:if test="${s.s_type eq 'time'}">
               <%-- 예약페이지 시간선택 --%>
               <div id="reservation_time">
	               <div class="reservation_head">
	                  <span class="reservation_title">시간 선택</span> 
	                  <span class="reservation_sub">
	                     <span class="hapDay"></span>
	                  </span>
	               </div>
	               <div class="reservation_content">
	               		<div id="showDay" style="display:block;"></div>
	               		<div id="choiceDay" style="display:block;">
	               		</div>
	               <div style="height: 20px;">
	               </div>
	                  <div class="swiper-container">
	                     <div class="swiper-wrapper">
	                     <c:forEach var="i" begin="0" end="23" step="1">
	                     	<div class="swiper-slide">
		                          <button disabled="disabled">${i} <br>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /></button>
		                 	</div>
		                 </c:forEach>
                     	</div>
                  	</div>
                  	<br>
                  	<div style="text-align: left;">
                  		<img src="../img/icon_warning.png" width="13px" height="13px">&nbsp;<span style="font-size:12px;">날짜 선택 버튼을 클릭 후 시간을 선택하여주세요</span><br>
	                  	<img src="../img/icon_warning.png" width="13px" height="13px">&nbsp;<span style="font-size:12px;">좌우로 드래그하여 예약 하실 시간을 찾아주세요</span><br>
	                  	<img src="../img/icon_warning.png" width="13px" height="13px">&nbsp;<span style="font-size:12px;">1시간 선택 시 두 번 클릭하여 주세요</span>
                  	</div>
               	</div>
              </div>
            </c:if>
               <%-- 예약페이지 인원선택 --%>
               <div class="reservation_head">
                  <span class="reservation_title">인원 선택</span> 
                  <span class="reservation_sub"><span class="reservation_people2"></span></span>
               </div>
               <div class="reservation_content">
                  <div class="reservation_person">
                     <div id="reservation_people" style="clear:both">
                        <div style="float:left"><button id="person_minus">-</button></div>
                        <span class="people" style="color:black; line-height:50px; font-size:18px;">${s.s_people}</span>
                        <div style="float:right"><button id="person_plus">+</button></div>
                     </div>
                  </div>
               </div>
               <%-- 예약페이지 추가옵션 --%>
               <div class="reservation_head">
                  <span class="reservation_title">추가 인원 선택</span> 
                  <span class="reservation_sub"><span class="option1"></span></span>
               </div>
               <div class="reservation_content">
                  <div class="reservation_person">
                     <div id="reservation_people" style="clear:both; width:80%">
                        <div style="float:left"><button id="option_minus">-</button></div>
                        	<span id="option2" style="color:black; line-height:50px; font-size:18px;">0</span>
                        <div style="float:right"><button id="option_plus">+</button></div>
                     </div>
                  </div>
               </div>
               <%-- 예약페이지 예약자정보 --%>
               <div class="reservation_head">
                  <span class="reservation_title">예약자 정보</span> <span
                     class="reservation_sub" style="color: red;">*필수 입력</span>
               </div>
               <div class="reservation_content">
               		<div>
               			<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	                        <label>
	                        	<span style="font-size:18px; line-height: 100%; color:black;">예약자<span>&nbsp;*</span></span>
	                        	<span style="color:black;"><input type="text" name="booker"  value="${sessionScope.User.userName}" required="required" style="width:600px; height: 50px;"></span>
	                     	</label>
             			</div>
	               		<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<label>
	                        	<span style="font-size:18px; line-height: 100%; color:black;">연락처<span>&nbsp;*</span></span>
	                        	<select name="phone" required="required" id="phone" style="width:185px; height: 50px;">
			                        <option>010</option>
			                        <option>011</option>
			                        <option>016</option>
			                        <option>017</option>
			                        <option>018</option>
			                        <option>019</option>
			                     </select>
			                     - <input type="text" name="phone1" class="phone1" value="${sessionScope.User.userPhone.substring(3,7)}" required="required" maxlength="4" style="width:185px; height: 50px;"> - <input type="text" class="phone2" name="phone2" value="${sessionScope.User.userPhone.substring(7,11)}" required="required" maxlength="4" style="width:185px; height: 50px;">
	                        </label>
	               		</div>
	               		<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<label>
		               			<span style="font-size:18px; line-height: 100%; color:black;">이메일 <span>&nbsp;</span></span>
		               			<input type="text" name="email" placeholder="이메일 주소를 남겨주세요." style="width:600px; height: 50px;">
	               			</label>
	               		</div>
	               		<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<label>
	               				<span style="font-size:18px; line-height: 100%; color:black;">요청사항<span></span></span>
	               				<input type="text" name="request" class="reservationRequest" placeholder="남기고 싶은 말을 적어주세요." style="width:600px; height: 150px;">
	               			</label>
	               		</div>
	               	</div>
               </div>
               <%-- 
               <%-- 예약페이지 호스트정보 
               <div class="reservation_head">
                  <span class="reservation_title">호스트 정보</span> 
                  <span class="reservation_sub">&nbsp; 
                  </span>
               </div>
               <div class="reservation_content">
               		<div>
               			<div class="reservation_space_tit" style="width:100%;margin: 10px; border-bottom:1px solid #ccc; padding:10px">
                        <span style="font-size:18px; line-height: 100%"> 대표자</span><span style="color:black; margin-left:20px;">${s.s_hostNum}</span>
             				</div>
	               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<span style="font-size:18px; line-height: 100%"> 소재지</span><span style="color:black; margin-left:20px;">${s.address}</span>
	               		</div>
	               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<span style="font-size:18px; line-height: 100%"> 연락처</span><span style="color:black; margin-left:20px;">${s.s_phone2}&nbsp;&nbsp;${s.s_email}</span>
	               		</div>
	               		<c:if test="${not empty s.s_placeWeb} ">
	               		<div class="reservation_space_tit" style="width:100%; margin: 10px; border-bottom:1px solid #ccc; padding:10px">
	               			<span style="font-size:18px; line-height: 100%"> 사이트</span><span style="color:black; margin-left:20px;">${s.s_placeWeb}</span>
	               		</div>
	               		</c:if>
	               	</div>
               </div>
               --%>
               <%-- 예약페이지 예약주의사항 --%>
               <div class="reservation_head">
                  <span class="reservation_title">예약시 주의사항</span> <span
                     class="reservation_sub">&nbsp;</span>
               </div>
               <div class="reservation_content">
               		<ol style="margin-left:15px;">
               			<c:forTokens items="${s.s_warning }" delims="," var="warning" varStatus="i" >
               			<div style="border-bottom: 1px solid #ccc;">
	                          <li style="margin: 10px; padding-left:10px; font-size: 18px;">
	                          	${warning}
	                          </li>
                         </div>
                      	</c:forTokens>
                    </ol>
               </div>
               <%-- 서비스 동의--%>
               <div class="reservation_head">
                  <span class="reservation_title">서비스 동의</span> 
                  <span class="reservation_sub">
                  	<input type="checkbox" id="allCheck">
                  		<label for ="allCheck"><span></span>전체 동의</label>
                  </span>
               </div>
               <div class="reservation_content">
                  <div class="reservaion_list">
                      <input type="checkbox" name="agree" value="1" id="check1">
                        <label for="check1"><span></span>위 공간의 예약조건 확인 및 결제진행 동의 (필수)</label>
                  </div>
                  <br>
                  <div class="reservaion_list">
                      <input type="checkbox" name="agree" value="1" id="check2">
                       <label for="check2"><span></span>환불규정 안내에 대한 동의 (필수)</label>
                  </div>
                  <br>
                  <div class="reservaion_list">
                     <input type="checkbox" name="agree" value="1" id="check3">
                       <label for="check3"><span></span>개인정보 제3자 제공 동의 (필수)</label>
                      <img src="/img/chevrondown.png" width="15px" height="15px"
                        class="agree_img" style="cursor: pointer">
                     <div style="display: none; overflow: auto; height: 150px;">
                        1. 개인정보를 제공받는 자: 해당 공간의 호스트<br> 2. 제공하는 개인정보 항목<br> -
                        필수항목: 네이버 아이디, 이름, 연락처, 결제정보(결제방식 및 결제금액)<br> - 선택항목: 이메일
                        주소<br> 3. 개인정보의 제공목적: 공간예약 및 이용 서비스 제공, 환불처리<br> 4.
                        개인정보의 제공기간: 서비스 제공기간(단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한
                        경우에는 해당 기간 동안 보관합니다.)<br> 5. 개인정보의 제공을 거부할 권리: 개인정보 주체는
                        개인정보의 제공을 거부할 권리가 있으나, 공간 예약을 위해 반드시 필요한 개인정보의 제공으로서 이를 거부할 시 공간
                        예약이 어려울 수 있습니다.<br>
                     </div>
                  </div>
                  <br>
                  <div class="reservaion_list">
                      <input type="checkbox" name="agree" value="1" id="check4">
                       <label for="check4"><span></span>개인정보 수집 및 이용 동의 (필수)</label> 
                       <img src="/img/chevrondown.png" width="15px" height="15px"
                        class="agree_img" style="cursor: pointer">
                     <div style="display: none; overflow: auto; height: 150px;">
                        1. 수집하는 개인정보의 항목<br> - 예약정보(성명, 이메일주소, 휴대전화번호), 결제정보(신용카드
                        번호 및 은행계좌정보 일부 등)<br> 2. 개인정보의 이용목적<br> - 공간 예약 및 이용<br>
                        3. 개인정보의 보관기간<br> - 예약 완료 후 관련 법령에 따라 5년간 개인정보를 보관합니다.<br>
                        4. 개인정보의 수집 및 이용을 거부할 권리<br> - 개인정보 주체는 개인정보의 수집 및 이용을 거부할
                        권리가 있으나, 공간 예약을 위한 최소한의 개인정보 수집으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.<br>
                     </div>
                  </div>
                  <br>
               </div>
            </div>
            <%-- 결제 메뉴 창 --%>
            <div class="reservation_rMenu">
               <span class="payment_title" style="font-size:20px;">결제 예정 금액</span><br>
               <br>
               <c:if test="${s.s_type eq 'day'}">
               <div class="rMenu_list">
               		<div class="pop_list_left">예약날짜</div>
               		<div class="pop_list_right">
               			<span class="startDay">-</span>
               			<span class="endDay"></span>
               			<span class="hapDay"></span>
               		</div>
               </div>
               </c:if>
               <c:if test="${s.s_type eq 'time'}">
               <div class="rMenu_list">
               		<div class="pop_list_left">예약날짜</div>
               		<div class="pop_list_right">
               			<span class="hapDay" style="color:red">-</span>
               		</div>
               </div>
               </c:if>
               <c:if test="${s.s_type eq 'day'}">
               <div class="rMenu_list">
               		<div class="pop_list_left">이용시간</div>
               		<div class="pop_list_right"><span>${s.s_start}시~${s.s_end}시</span></div>
               		<span class="selTime1" style="display:none">----</span>
               </div>
               </c:if>
               <c:if test="${s.s_type eq 'time'}">
               <div class="rMenu_list" id="rMenu_time">
               		<div class="pop_list_left">예약시간</div>
               		<div class="pop_list_right">
               			<span>-</span>
               		</div>
               </div>
               <div class="rM_time" style="border-bottom: 1px solid #ccc; clear: both; display:none;">
               		<span style="text-align: left;">예약시간</span>
               		<div style="text-align:right;"><span class="selTime2"></span></div>
               </div>
               </c:if>
               <div class="rMenu_list">
               		<div class="pop_list_left">예약인원</div>
               		<div class="pop_list_right"><span class="reservation_people2"></span></div>
               </div>
               <div class="rMenu_list" id="rMenu_option">
               		<div class="pop_list_left">추가인원</div>
               		<div class="pop_list_right"><span class="option1"></span></div>
               </div>
               
               <div class="rMenu_price">
               <div class="rMenu_list" style="border:none; margin-top: 10px; height: 30px;">
               		<div class="rMenu_price_list">
               			<div class="price_day"></div>
               			<c:if test="${s.s_type eq 'time'}">
               				<div class="price_time"></div>
               			</c:if>
               			<div class="price_option"></div>
               		</div>
               </div>
                  	<div class="pop_list_left" style="color:#183058">￦</div>
                  	<div class="pop_list_right" style="color:#183058"><span class="price">0</span></div>
               </div>
               <button id="payment">예약하기</button>
            </div>
            <%-- 예약 정보 창 --%>
            <%-- div 기준 초기화--%>
            <div style="clear: both;"></div>
         </div>
      </div>
   </section>
   <script>
   var totalPrice = 0; //총 계산금액
   var selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //선택 한 시간 값
   var count = 1; //버튼클릭 카운트
   var sendTimeArray = new Array(10); //보낼 시간 값
   var selTimeArr = new Array(); //출력 할 시간 값
   var priceTimeArr = new Array(); //돈 계산 할 시간 값
   var btnIndex;
   var option = 0;
   
		function selectTimeBtnfn(a){
			$('.swiper-slide button').attr('disabled','true');
			$('.swiper-slide button').css('color','white');
			count = 1;
			$('.selectTimeBtn').css('background','#f69b02');
			$(a).css('background','#183058');
			$(a).css('color','white');
            $('.disabled').css('background','#f69b02');
            $('.disabled').css('color','white');
            selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            option = 0;
            totalPrice=0;
            $('.price_option').text("");
            $('.option1').text("");
            $('#option2').text("0");
            $('.price').html("");
            btnIndex = $(a).index();
            priceTimeArr[btnIndex] = 0;
            sendTimeArray.slice(btnIndex);
            selTimeArr.slice(btnIndex);
            for(var i='${s.s_start}'; i<'${s.s_end}'; i++){
          	  	$('.swiper-slide button').eq(i).addClass("disabled");
          		$('.swiper-slide button').eq(i).html(i+"<br>￦"+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" />');
          	  	$('.swiper-slide button').eq(i).css("background","#f69b02");
          		$('.swiper-slide button').eq(i).removeAttr("disabled");
            }
            $('.swiper-slide button').not('.disabled').attr("disabled","true");
            $('.swiper-slide button').not('.disabled').text("");
            $('.swiper-slide button').not('.disabled').css("background","url('../img/icon_close.png') no-repeat");
            $('.swiper-slide button').not('.disabled').css("background-size","100%");
			for(var i12=0;i12<preday.length;i12++){
				if($(a).text()==preday[i12]){
					for(var i11=0;i11<timeInhibitArray[i12].length;i11++){
						
						if(timeInhibitArray[i12][i11]==1){
							$('.swiper-slide button').eq(i11).removeClass('disabled');
							$('.swiper-slide button').eq(i11).attr("disabled","true");
						      $('.swiper-slide button').eq(i11).text("");
						      $('.swiper-slide button').eq(i11).css("background","url('../img/icon_close.png') no-repeat");
						      $('.swiper-slide button').eq(i11).css("background-size","100%");
						}
							
					}
				}
			}
			
	   	}
		
      $(document).ready(function() {
    	  if('${s.s_type}'=='day'){
    		  btnVal=1;
    	  }else{
    		  btnVal=3;
    	  }
   <%-- 예약정보 정규식 --%>
      var phoneCheck = /[0-9]{4}$/;
      var bookerCheck = /[가-힣]{2,13}$/;
   <%-- 시간 선택 스크립트 --%>
      var start = -1; // 시간 시작 버튼 인덱스
      var end = -1; // 시간 끝 버튼 인덱스
      var startTime; // 시간 시작 값
      var endTime; // 시간 끝 값
      var hapTime; // 총 시간 값
      var totalTime = 0; //계산할 시간
      
      
      for(var i='${s.s_start}'; i<'${s.s_end}'; i++){
    	  $('.swiper-slide button').eq(i).addClass("disabled");
    	  $('.swiper-slide button').eq(i).css("background","#f69b02");
      }
      $('.swiper-slide button').not('.disabled').attr("disabled","true");
      $('.swiper-slide button').not('.disabled').text("");
      $('.swiper-slide button').not('.disabled').css("background","url('../img/icon_close.png') no-repeat");
      $('.swiper-slide button').not('.disabled').css("background-size","100%");
      
      //클릭 이벤트
      $('.swiper-slide button').click(function() {
         if (count == 1) {
            start = $('.swiper-slide button').index(this);
            $(this).css('background','#183058');
            $(this).css('color','white');
            startTime = parseInt($(this).text());
            hapTime = 0;
            count = 2;
            } else if (count == 2) {
               endTime = parseInt($(this).text());
               end = $('.swiper-slide button').index(this);
                  if(end==start){
                	  $('.swiper-slide button').eq(end).css('background-color','#183058');
	                     $('.swiper-slide button').eq(end).css('color','white');
	                     selTimeArray[end]=1;
	                     hapTime = 1;
                  }else{
                	  for (var i = start; i < end + 1; i++) {
                    	  if($('.swiper-slide button').eq(i).hasClass('disabled')){
    	                     $('.swiper-slide button').eq(i).css('background-color','#183058');
    	                     $('.swiper-slide button').eq(i).css('color','white');
    	                     selTimeArray[i]=1;
    	                     hapTime++;
                    	  }
                       }
                      for (var i = start; i > end - 1; i--) {
                    	  if($('.swiper-slide button').eq(i).hasClass('disabled')){
     	                     $('.swiper-slide button').eq(i).css('background-color','#183058');
     	                     $('.swiper-slide button').eq(i).css('color','white');
     	                     selTimeArray[i]=1;
     	                    hapTime++;
                     	  }
                      }
                  }
                  
                  arrayStr="";
	  	            for(var arrI=0;arrI<array.length;arrI++){
	  	            	arrayStr += array[arrI];
	  	            	if(arrI<array.length-1){
	  	            		arrayStr += ",";
	  	            	}
	  	            }
	  	          $('input[name=reservationDay]').val(arrayStr);
                  var s = selTimeArray.join('')+'/';
                  sendTimeArray[btnIndex] = s; //얘가 최종적으로 보내야할 예약된 시간임 데이는 원래 저장되던 array?로 보내면됨 둘다 스트링으로 만드는데 sendTime은 /로 항목 구분 해줘야함
                  arrayTime="";
                  for(var Itime=0;Itime<sendTimeArray.length;Itime++){
                	  arrayTime += sendTimeArray[Itime];
                  }
            	  $('.price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                  $('input[name=reservationTime]').val(arrayTime);
                  if(startTime<endTime){
                	  selTimeArr[btnIndex]=startTime+"~"+(endTime+1)+"시,  "+(hapTime)+"시간 ";
                	  priceTimeArr[btnIndex]=hapTime;
                      count = 3;
                   }else{
                	  selTimeArr[btnIndex]=endTime+"~"+(startTime+1)+"시,  "+(hapTime)+"시간 ";
                	  priceTimeArr[btnIndex]=hapTime;
                      count = 3;
                   }
                  $('.selTime2').html("");
                  for(var IItime=0; IItime<selTimeArr.length; IItime++){
           				$('.selTime2').html($('.selTime2').html()+String(array[IItime]).substring(0,4)+"년 "+String(array[IItime]).substring(4,6)+"월 "+String(array[IItime]).substring(6,8)+"일, "+String(selTimeArr[IItime]).replace("undefined","")+"<br>");
           			}
                  totalTime = 0;
                  totalPrice = 0;
                  for(var IIII=0; IIII<priceTimeArr.length; IIII++){
                	  if(priceTimeArr[IIII]!=null){
                  		totalTime += priceTimeArr[IIII];
                      	  totalPrice += priceTimeArr[IIII]*'${s.s_price1}';
                  	}
                  }
         			
                    $('#rMenu_time').css('display','none');
                    $('.rM_time').css('display','block');
                  	$('.price_time').html("총 "+totalTime+'시간 x '+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" />');
                  	$('.totalTime').html("총 "+totalTime+'시간');
                  	$('.price').html((totalPrice+('${s.s_price2}')*option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                  	
               }else if (count > 2) {
                  count = 1;
                  $('.disabled').css('background','#f69b02');
                  $('.disabled').css('color','white');
                  selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                  selTimeArray.pop();
                  selTimeArr.pop();
                  totalPrice -= priceTimeArr[btnIndex]*'${s.s_price1}';
                  $('.price').html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                  
               }
         
         });
   <%-- 인원 선택 스크립트 --%>
      var person = parseInt($('.people').text());
      $('.reservation_people2').text(person+"명");
      $('input[name=reservationPerson]').val(person);
      $('#person_minus').click(function(){
         if(person<=1){
            $('#person_minus').attr("button",false);
            $('#person_plus').attr("button",true);
            emptyValue("최소인원은"+"1"+ "명입니다.");
         }else{
            person = person-1;
            $('.people').text(person);
            $('.reservation_people2').text(person+"명");
            $('input[name=reservationPerson]').val(person);
         }
      });
      $('#person_plus').click(function(){
         if(person>="${s.s_people}"){
            $('#person_minus').attr("button",true);
            $('#person_plus').attr("button",false);
            emptyValue("최대인원은"+"${s.s_people}"+ "명입니다.");
         }else{
            person = person+1;
            $('.people').text(person);
            $('.reservation_people2').text(person+"명");
            $('input[name=reservationPerson]').val(person);
         }
      });
      <%-- 추가옵션 선택 스크립트 --%>
      
      $('#option_minus').click(function(){
    	  option = option-1;
    	  if(option<1){
    		  option = 0;
              $('#option_plus').attr("disabled",false);
              $('#option_minus').attr("disabled",true);
    		  $('.option1').text("");
    		  $('#option2').text(option); 
    		  $('#pop_option').css("display","none");
              $('#rMenu_option').css("display","none");
              $('.price_option').text("");
              totalPrice -= ('${s.s_price2}')*1;
              $('.price').html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	  }else{
        	  $('#option2').text(option);  
              $('.option1').text(option+"명");
              $('input[name=reservationOption]').val(option+"명");
              $('.rMenu_price_list').css("display","block");
              totalPrice -= ('${s.s_price2}')*1;
              $('.price').html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
              $('.price_option').text("추가인원 "+option+"명"+' x '+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price2}" />');
    	  }
      });
      $('#option_plus').click(function(){
         if(option>=10){
            $('#option_minus').attr("button",true);
            $('#option_plus').attr("button",false);
            emptyValue("최대 추가인원은"+"10"+ "명입니다.");
         }else{
        	$('#option_minus').attr("disabled",false);
        	option = option+1;
            $('#option2').text(option);
            $('.option1').text(option+"명");
            $('input[name=reservationOption]').val(option+"명");
            $('#pop_option').css("display","block");
            $('#rMenu_option').css("display","block");
            $('.rMenu_price_list').css("display","block");
            totalPrice += ('${s.s_price2}')*1;
            $('.price').html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            $('.price_option').text("추가인원 "+option+"명"+' x '+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price2}" />');
         }
      });
   <%-- 전체 체크박스 선택 스크립트 --%>
      $('#allCheck').click(function() {
         if ($('#allCheck').prop('checked')) {
            $("input[name=agree]:checkbox").prop("checked", true);
            } else {
               $("input[name=agree]:checkbox").prop("checked", false);
               }
         });
   <%-- 체크박스 전체 선택 시 스크립트--%>
      $("input[name=agree]").click(function() {
         var aChk = $("input").filter("input[name=agree]:checked");
         if (aChk.length == 4) {
            $('#allCheck').prop("checked", true);
            } else {
               $('#allCheck').prop("checked",false);
            }
         });
   <%-- 결제버튼 클릭 스크립트--%>
      $('#payment').click(function() {
    	  $('.price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	  $('.booker').text($('input[name=booker]').val());
    	  $('input[name=reservationBooker]').val($('.booker').text());
    	  $('input[name=reservationPhone]').val($('#phone option:selected').text());
    	  $('input[name=reservationPhone1]').val($('.phone1').val());
    	  $('input[name=reservationPhone2]').val($('.phone2').val());
    	  $('input[name=reservationRequest]').val($('.reservationRequest').val());
   <%-- 날짜 체크 확인--%>
      if ($('.hapDay').html().length < 2) {
    	  emptyValue("예약날짜를 선택해주세요.");
         }else {
   <%-- 시간 체크 확인 --%>
   <%-- 넘어온 타입이 시간일때 --%>
   if($('.selTime1').text().length < 2 && $('.selTime2').text().length < 2){
	   if (count != 3) {
		   emptyValue("예약시간을 선택해주세요.");
	      }
	   } else {
   <%-- 예약정보 체크 --%>
      if (!bookerCheck.test($('input[name=booker]').val())) {
    	  emptyValue("예약자정보를 확인해주세요(예약자명(한글)두 글자 이상)");
         $('input[name=booker]').focus();
         $('input[name=booker]').css('border','1px solid red');
         } else if (!phoneCheck.test($('input[name=phone1]').val())){
        	 emptyValue("연락처정보를 확인해주세요");
            $('input[name=booker]').css('border','');
            $('input[name=phone1]').focus();
            $('input[name=phone1]').css('border','1px solid red');
            } else if (!phoneCheck.test($('input[name=phone2]').val())) {
            	emptyValue("연락처정보를 확인해주세요");
               $('input[name=phone1]').css('border','');
               $('input[name=phone2]').focus();
               $('input[name=phone2]').css('border','1px solid red');
               } else {
   <%-- 동의 체크 확인 --%>
                  var aChk = $("input").filter($("input[name=agree]:checked"));
                  if (aChk.length != 4) {
                     $('#allCheck').focus();
                     emptyValue("필수사항을 체크해주세요.");
                     } else {
               <%-- 예약 정보 확인 창 열기 --%>
                  $("#reservation_popupDiv").css({
                     "top" : (($(window).height() - $(   "#reservation_popupDiv").outerHeight()) / 2 + $(window).scrollTop())+ "px",
                     "left" : (($(window).width() - $("#reservation_popupDiv").outerWidth()) / 2 + $(window).scrollLeft())+ "px"
                     });
                  $("#reservation_popup_mask").css("display","block");
                  $("#reservation_popupDiv").css("display","block");
                  $("body").css("overflow","auto");
               <%-- 예약 정보 확인 창 닫기 --%>
                  $(".reservation_popCloseBtn")   .click(function(event) {
                     $("#reservation_popup_mask").css("display","none");
                     $("#reservation_popupDiv").css("display","none");
                     $("body").css("overflow","auto");
                     return false;
                     });
                  $(".reservation_popCloseBtn_1").click(function(event) {
                     $("#reservation_popup_mask").css("display","none");
                     $("#reservation_popupDiv").css("display","none");
                     $("body").css("overflow","auto");
                     return false;
                     });
                  }
               <%-- 동의 체크 완료 --%>
               }
   <%-- 예약정보 체크 완료 --%>
            }
   <%-- 시간 체크 완료 --%>
      }
   });
   <%-- 메뉴바 스크롤 따라오기 스크립트 --%>
      var floatPosition = parseInt($(".reservation_rMenu").css('top'));
      $(window).scroll(function() {
         var scrollTop = $(window).scrollTop();
         var newPosition = scrollTop + floatPosition + "px";
         $(".reservation_rMenu").stop().animate({"top" : newPosition}, 500);}).scroll();
   <%-- 팝업창 스크롤 따라오기 스크립트 --%>
      $(window).scroll(function() {
         var scrollTop = $(window).scrollTop();
         var newPosition = scrollTop + floatPosition + "px";
         $("#reservation_popupDiv").stop().animate({   "top" : newPosition}, 500);}).scroll();
   <%-- 결제 모듈 스크립트 --%>
      $('#pop_payment').click(function() {
         $("#reservation_popup_mask").css("display", "none");
         $("#reservation_popupDiv").css("display", "none");
         $("body").css("overflow","auto");
         
         var price = 1000;
         var d = new Date();
         var payDate = d.getFullYear()+''+ (d.getMonth() + 1)+ '' + d.getDate() + ''+ d.getHours() + ''+ d.getMinutes() + ''+ d.getSeconds();
         IMP.init('imp59515101'); //복사해온 개인 키
         IMP.request_pay({ //결제정보작성
            merchant_uid : "${s.s_placeName}"+ payDate, //거래아이디
            name : "결제테스트", //결제명
            amount : price, // 결제금액
            buyer_email : '${sessionScope.User.userEmail}', // 구매자 email
            buyer_name : '${sessionScope.User.userName}',
            buyer_tel : '${sessionScope.User.userPhone}',
            buyer_addr : '${sessionScope.User.userAddress}',
            buyer_postcode : '${sessionScope.User.userAddressNumber}' //우편번호
            },
            function(rsp) {
               if (rsp.success) {
                  var msg = '결제가완료되었습니다';
                  var info1 = rsp.imp_uid; //결제 아이디
                  var info2 = rsp.paid_amount; //결제 금액
                  var info3 =  rsp.apply_num; //결제 카드번호
                  $('input[name=paymentId]').val(info1);
                  $('input[name=paymentPrice]').val(price);
                  $('input[name=paymentCard]').val(info3);
                  alert(msg);
                  var frm =  $("#payfrm");
            	  frm.submit();
                  } else {
                     alert(rsp.error_msg);
                  }
               });
         });
   <%-- 스와이프 스크립트 --%>
      new Swiper('.swiper-container', {
         slidesPerView : 10, // 동시에 보여줄 슬라이드 갯수
         spaceBetween : 0, // 슬라이드간 간격
         slidesPerGroup : 10, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
         // 그룹수가 맞지 않을 경우 빈칸으로 메우기
         // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
         loopFillGroupWithBlank : true,
         loop : false, // 무한 반복
         pagination : { // 페이징
            el : '.swiper-pagination',
            clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation : { // 네비게이션
               nextEl : '.swiper-button-next', // 다음 버튼 클래스명
               prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
               },
            });
   <%-- 이용약관 스크립트--%>
      $('.agree_img').click(function() {
         if ($(this).next().css("display") == "none") {
            $(this).next().css("display", "block");
            $(this).attr("src",   "/img/chevronup.png");
            } else {   
               $(this).next().css("display", "none");
               $(this).attr("src",   "/img/chevrondown.png");
            }
         });
      });
      <%-- 얼랏창 --%>
      function emptyValue(msg){
          $("#emptyValue").text(msg);
          $("#emptyValue").slideDown(700);
          $("#emptyValue").delay(1300);
          $("#emptyValue").slideUp(700);
       }
   </script>
   <jsp:include page="/WEB-INF/common/footer.jsp" />
   <%-- 팝업 배경 DIV--%>
            <div id="reservation_popup_mask"></div>
            <%-- 팝업 DIV--%>
	            <div id="reservation_popupDiv">
	               <div id="reservation_popupDiv_title">
	                  예약 신청
	                  <button class="reservation_popCloseBtn_1"></button>
	               </div>
	               <div id="reservation_popupDiv_content">예약 내용을 확인해주세요.</div>
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">예약공간</div>
	                  <div class="pop_list_right">${s.s_placeName}</div>
	               </div>
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">예약자명</div>
	                  <div class="pop_list_right">
	                  	<span class="booker"></span>
               		  </div>
	               </div>
	                <c:if test="${s.s_type eq 'day'}">
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">예약날짜</div>
	                  <div class="pop_list_right">
	                  	<span class="startDay"></span>
               			<span class="endDay"></span>
               			<span class="hapDay"></span>
               		  </div>
	               </div>
	               </c:if>
	               <c:if test="${s.s_type eq 'time'}">
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">예약날짜</div>
	                  <div class="pop_list_right">
               			<span class="hapDay"></span>
               		  </div>
	               </div>
	               </c:if>
	               <c:if test="${s.s_type eq 'day'}">
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">이용시간</div>
	                  <div class="pop_list_right"><span class="selTime1">${s.s_start}시~${s.s_end}시</span></div>
	               </div>
	               </c:if>
	               <c:if test="${s.s_type eq 'time'}">
	               <center>
		           <div class="rM_time" style="border-bottom: 1px solid #ccc; width:80%; clear: both;">
              			<div style="float:left">
              			<span style="text-align: left;">예약시간</span>
              			</div>
              			<div style="text-align:right;">
              				<span class="totalTime"></span>
              				<br>
              				<span class="selTime2"></span>
              			</div>
	               </div>
	               </center>
	               </c:if>
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">예약인원</div>
	                  <div class="pop_list_right"> <span class="reservation_people2"></span></div>
	               </div>
	               <div class="reservation_popupDiv_list" id="pop_option">
	                  <div class="pop_list_left">추가옵션</div>
	                  <div class="pop_list_right"><span class="option1"></span></div>
	               </div>
	
	               <div class="reservation_popupDiv_list">
	                  <div class="pop_list_left">결제예정금액</div>
	                  <div class="pop_list_right"><span class="price"></span></div>
	               </div>
	               <br>
	               <div class="reservation_popupDiv_info">
	                  <div class="pop_list_info"><img src="../img/icon_warning.png" width="13px" height="13px">&nbsp;결제 전에, 환불기준과 예약내용을 반드시 확인해주세요!</div>
	               </div>
	               <br>
	               <div id="reservation_popup_footer">
	                  <button class="reservation_popCloseBtn">예약 수정</button>
	                  <button id="pop_payment">결제 하기</button>
	               </div>
	            </div>
	            <div style="display:none">
	            	<form action="/insertReservation" method="post" id="payfrm">
	            		<input type="hidden" name="S_no" value="${s.s_no}">
	            		<input type="hidden" name="userNo" value="${sessionScope.User.userNo}">
	            		<input type="hidden" name="reservationName" value="${s.s_placeName}">
	            		<input type="hidden" name="reservationDay" value=""><%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="reservationBooker" value=""><%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="reservationPhone" value="">
	            		<input type="hidden" name="reservationPhone1" value="">
	            		<input type="hidden" name="reservationPhone2" value="">
	            		<input type="hidden" name="reservationTime" value=""><%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="reservationPerson" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="reservationOption" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="reservationRequest" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="paymentId" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="paymentPrice" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            		<input type="hidden" name="paymentCard" value=""> <%-- 스크립트에서 밸류 보냄 --%>
	            	</form>
	            </div>
</body>
</html>