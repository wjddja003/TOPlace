<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
   border-top: 3px solid #183058;
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
   border-top: 3px solid #183058;
   font-size: 28px;
}
#payment {
   height: 56px;
   width: 100%;
   border: none;
   outline: none;
   background: #183058;
   color: white;
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
   border-top: 2px solid #183058;
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
#person_plus{
   width:50px;
   height:50px;
   border: 1px; solid #ccc;
   background : #f69b02;
   color: white;
   outline:none;
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
#option_plus{
	width:50px;
   	height:50px;
   	border: 1px; solid #ccc;
   	background : #f69b02;
   	color: white;
   	outline:none;
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
   z-index: 99;
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
.reservation_popCloseBtn{
   width: 120px;
   height: 50px;
   color:white;
   background: #183058;
   outline:none;
   border:none;
   border-radius: 10px;
}
#pop_payment{
   color:white;
   background: #f69b02;
   width: 120px;
   height: 50px;
   outline:none;
   border:none;
   border-radius: 10px;
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
   background: #f69b02;
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
/*reservation css fin*/
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/common/header.jsp" />
   <section style="background: white">
      <div class="section_content" style="background: white; clear:both;">
         <div class="reservation">
            <%-- 예약페이지 컨텐츠 --%>
            <div class="reservation_lMenu">
               <%-- 예약페이지 공간소개 --%>
               <div class="reservation_head">
                  <span class="reservation_title">예약 공간</span> 
                  <c:if test="${s.s_type eq 'day'}">
                  	<span class="reservation_sub"  style="color:red;">￦ ${s.s_price1}<span style="font-size:14px">/일</span></span>
                  </c:if>
                  <c:if test="${s.s_type eq 'time'}">
                  	<span class="reservation_sub"  style="color:red;">￦ ${s.s_price1}<span style="font-size:14px">/시간</span></span>
                  </c:if>
               </div>
               <div class="reservation_content">
               		<div class="reservation_space_info">
	               		<div class="reservation_space_img" style="width:20%; float:left">
	               			<img src="/upload/space/${s.s_img1 }" width='100%;'>
	               		</div>
	               		<div class="reservation_space_tit" style="width:80%; float:left; border-bottom:1px solid #183058;">
	               			<h3>${s.s_placeName} </h3>
	               		</div>
	               		<div class="reservation_space_tit" style="width:80%; float:left">
	               			<span>${s.s_placeIntroduce1}</span>
	               			<span>${s.s_placeIntroduce2}</span>
	               		</div>
	               		<div class="viewpage_textbox">
                            <div style="border-bottom:1px solid #183058"></div>
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
               <%-- 예약 단위 선택  --%>
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
               <%-- 예약페이지 날짜선택 --%>
               <div class="reservation_head">
                  <span class="reservation_title">날짜 선택</span>
                  <span class="reservation_sub">
                     <span class="startDay"></span>
                     <span class="endDay"></span>
                     <span class="hapDay"></span>
                  </span>
               </div>
               <div class="reservation_content">
                  <div class="demo">
                     <jsp:include page="/WEB-INF/views/calendar.jsp" />
                  </div>
               </div>
      <%-- 나중에 if문으로 시간용 공간 설정해주어야함 --%>
     		<c:if test="${s.s_type eq 'time'}">
               <%-- 예약페이지 시간선택 --%>
               <div id="reservation_time">
	               <div class="reservation_head">
	                  <span class="reservation_title">시간 선택</span> 
	                  <span class="reservation_sub">
	                     <span class="selTime"></span>
	                  </span>
	               </div>
	               <div class="reservation_content">
	                  <div class="swiper-container">
	                     <div class="swiper-wrapper">
	                        <div class="swiper-slide">
	                           <button>0</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>1</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>2</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>3</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>4</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>5</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>6</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>7</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>8</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>9</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>10</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>11</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>12</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>13</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>14</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>15</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>16</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>17</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>18</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>19</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>20</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>21</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>22</button>
	                        </div>
	                        <div class="swiper-slide">
	                           <button>23</button>
	                        </div>
                     	</div>
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
                  <span class="reservation_title">추가 옵션 선택</span> 
                  <span class="reservation_sub"><span class="option1"></span></span>
               </div>
               <div class="reservation_content">
                  <div class="reservation_person">
                     <div id="reservation_people" style="clear:both; width:50%">
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
                  <label>예약자 <span>*</span><input type="text" name="booker"
                     value="${sessionScope.User.userName}" required="required"></label><br> <label>연락처
                     <span>*</span> <select name="phone" required="required">
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>
                  </select>- <input type="text" name="phone1" value=" ${sessionScope.User.userPhone.substring(3,7)}" required="required"
                     maxlength="4">- <input type="text" name="phone2" value="${sessionScope.User.userPhone.substring(7,11)}"
                     required="required" maxlength="4">
                  </label><br> <label>이메일 <span></span><input type="text"
                     name="email" placeholder="이메일 주소를 남겨주세요."></label><br> <label>요청사항
                     <span></span><input type="text" placeholder="남기고 싶은 말을 적어주세요.">
                  </label><br>
               </div>
               <%-- 예약페이지 호스트정보 --%>
               <div class="reservation_head">
                  <span class="reservation_title">호스트 정보</span> <span
                     class="reservation_sub">&nbsp;</span>
               </div>
               <div class="reservation_content"></div>
               <%-- 예약페이지 예약주의사항 --%>
               <div class="reservation_head">
                  <span class="reservation_title">예약시 주의사항</span> <span
                     class="reservation_sub">&nbsp;</span>
               </div>
               <div class="reservation_content">
               		<ol style="margin-left:15px;">
               			<c:forTokens items="${s.s_warning }" delims="," var="warning" varStatus="i" >
                          <li style="margin: 10px 0px 10px 0px; font-size: 16px;">
                          	${warning}
                          </li>
                      	</c:forTokens>
                    </ol>
               </div>
               <%-- 서비스 동의--%>
               <div class="reservation_head">
                  <span class="reservation_title">서비스 동의</span> <label
                     class="reservation_sub"><span><input
                        type="checkbox" id="allCheck">전체 동의</span></label>
               </div>
               <div class="reservation_content">
                  <div class="reservaion_list">
                     <label> <input type="checkbox" name="agree" value="1">
                        위 공간의 예약조건 확인 및 결제진행 동의 <span>(필수)</span>
                     </label>
                  </div>
                  <br>
                  <div class="reservaion_list">
                     <label> <input type="checkbox" name="agree" value="1">
                        환불규정 안내에 대한 동의 <span>(필수)</span>
                     </label>
                  </div>
                  <br>
                  <div class="reservaion_list">
                     <label> <input type="checkbox" name="agree" value="1">
                        개인정보 제3자 제공 동의 <span>(필수)</span>
                     </label> <img src="/img/chevrondown.png" width="15px" height="15px"
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
                     <label> <input type="checkbox" name="agree" value="1">
                        개인정보 수집 및 이용 동의 <span>(필수)</span>
                     </label> <img src="/img/chevrondown.png" width="15px" height="15px"
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
               			<span class="startDay">-</span>
               		</div>
               </div>
               </c:if>
               <c:if test="${s.s_type eq 'day'}">
               <div class="rMenu_list">
               		<div class="pop_list_left">이용시간</div>
               		<div class="pop_list_right"><span>${s.s_start}시~${s.s_end}시</span></div>
               </div>
               </c:if>
               <c:if test="${s.s_type eq 'time'}">
               <div class="rMenu_list">
               		<div class="pop_list_left">예약시간</div>
               		<div class="pop_list_right"><span class="selTime">-</span></div>
               </div>
               </c:if>
               <div class="rMenu_list">
               		<div class="pop_list_left">예약인원</div>
               		<div class="pop_list_right"><span class="reservation_people2"></span></div>
               </div>
               <div class="rMenu_price">
               		<div class="pop_list_left" style="color:red;font-size:16px;" id="reservation_price"></div>
                  	<div class="pop_list_left" style="color:#183058">￦</div>
                  	<div class="pop_list_right" style="color:#183058"><span class="price">0</span></div>
               </div>
               <button id="payment">결제하기</button>
            </div>
            <%-- 예약 정보 창 --%>
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
                  <div class="pop_list_left">예약날짜</div>
                  <div class="pop_list_right"><span class="selDay"></span></div>
               </div>
               <div class="reservation_popupDiv_list">
                  <div class="pop_list_left">예약시간</div>
                  <div class="pop_list_right"><span class="selTime"></span></div>
               </div>
               <div class="reservation_popupDiv_list">
                  <div class="pop_list_left">예약인원</div>
                  <div class="pop_list_right"><span class="reservation_people2"></span></div>
               </div>

               <div class="reservation_popupDiv_list">
                  <div class="pop_list_left">추가인원</div>
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
                  <button id="pop_payment">예약 하기</button>
               </div>
            </div>
            <%-- div 기준 초기화--%>
            <div style="clear: both;"></div>
         </div>
      </div>
   </section>

   <script>
      $(document).ready(function() {
   <%-- 예약정보 정규식 --%>
      var phoneCheck = /[0-9]{4}$/;
      var bookerCheck = /[가-힣]{2,13}$/;
   <%-- 시간 선택 스크립트 --%>
      var count = 0; // 시간 버튼 클릭
      var start = -1; // 시간 시작 버튼 인덱스
      var end = -1; // 시간 끝 버튼 인덱스
      var startTime; // 시간 시작 값
      var endTime; // 시간 끝 값
      var hapTime; // 총 시간 값(실제 금액 계산)
      var selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; // 시간 값 배열로 전달하여 디비 저장 할 값
      $('.swiper-slide button').click(function() {
         count++;
         if (count == 1) {
            start = $('.swiper-slide button').index(this);
            $(this).css('background','#183058');
            $(this).css('color','white');
            startTime = parseInt($(this).text());
            hapTime = 1;
            $(".selTime").text(startTime+"~"+(startTime+1)+",  "+hapTime+"시간");
            } else if (count == 2) {
               endTime = parseInt($(this).text());
               if(startTime<endTime){
                  hapTime = (endTime-startTime)+1;
                  $(".selTime").text(startTime+"~"+(endTime+1)+",  "+hapTime+"시간");
               }else{
                  hapTime = (startTime-endTime)+1;
                  $(".selTime").text(endTime+"~"+(startTime+1)+",  "+hapTime+"시간");
               }
               end = $('.swiper-slide button').index(this);
                  for (var i = start; i < end + 1; i++) {
                     $('.swiper-slide button').eq(i).css('background-color','#183058');
                     $('.swiper-slide button').eq(i).css('color','white');
                     $('.swiper-slide button').eq(i).addClass('tSel');
                     selTimeArray[i]=1;
                     }
                  for (var i = start; i > end - 1; i--) {
                     $('.swiper-slide button').eq(i).css('background-color','#183058');
                     $('.swiper-slide button').eq(i).css('color','white');
                     $('.swiper-slide button').eq(i).addClass('tSel');
                     selTimeArray[i]=1;
                     }
               }else if (count > 2) {
                  count = 0;
                  $('.swiper-slide button').css('background','#f69b02');
                  $('.swiper-slide button').css('color','black');
                  $('.swiper-slide button').eq(i).removeClass('tSel');
               }
         console.log(selTimeArray);
         });
   <%-- 인원 선택 스크립트 --%>
      var person = parseInt($('.people').text());
      $('.reservation_people2').text(person+"명");
      $('#person_minus').click(function(){
         if(person<=1){
            $('#person_minus').attr("button",false);
            $('#person_plus').attr("button",true);
            alert("최소인원은"+"1"+ "명입니다.");
         }else{
            person = person-1;
            $('.people').text(person);
            $('.reservation_people2').text(person+"명");
         }
      });
      $('#person_plus').click(function(){
         if(person>="${s.s_people}"){
            $('#person_minus').attr("button",true);
            $('#person_plus').attr("button",false);
            alert("최대인원은"+"${s.s_people}"+ "명입니다.");
         }else{
            person = person+1;
            $('.people').text(person);
            $('.reservation_people2').text(person+"명");
         }
      });
      <%-- 추가옵션 선택 스크립트 --%>
      var option = 0;
      $('#option_minus').click(function(){
         if(option<=0){
            $('#option_minus').attr("button",false);
            $('#option_plus').attr("button",true);
         }else{
        	 option = option-1;
            $('#option2').text(option);
            $('.option1').text(option+"명");
         }
      });
      $('#option_plus').click(function(){
         if(option>=100){
            $('#option_minus').attr("button",true);
            $('#option_plus').attr("button",false);
            alert("최대 추가 옵션 인원은"+"100"+ "명입니다.");
         }else{
        	 option = option+1;
            $('#option2').text(option);
            $('.option1').text(option+"명");
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
   <%-- 날짜 체크 확인--%>
      if ($('#hapDay').val() == "") {
         alert("예약 날짜를 선택해주세요.");
         }else {
   <%-- 시간 체크 확인 --%>
   <%-- 넘어온 타입이 시간일때 --%>
   if("${s.s_type == 'time'}"){
	   if (count == 1) {
	      alert("최소 두시간 이상 예약이 가능합니다.");
	      } else if (count != 2) {
	         alert("시간을 선택해주세요.");
	      }
	   } else {
   <%-- 예약정보 체크 --%>
      if (!bookerCheck.test($('input[name=booker]').val())) {
         alert("예약자 정보를 확인해주세요(예약자명 두글자 이상)");
         $('input[name=booker]').focus();
         $('input[name=booker]').css('border','1px solid red');
         } else if (!phoneCheck.test($('input[name=phone1]').val())){
            alert("연락처 정보를 확인해주세요");
            $('input[name=booker]').css('border','');
            $('input[name=phone1]').focus();
            $('input[name=phone1]').css('border','1px solid red');
            } else if (!phoneCheck.test($('input[name=phone2]').val())) {
               alert("연락처 정보를 확인해주세요");
               $('input[name=phone1]').css('border','');
               $('input[name=phone2]').focus();
               $('input[name=phone2]').css('border','1px solid red');
               } else {
   <%-- 동의 체크 확인 --%>
                  var aChk = $("input").filter($("input[name=agree]:checked"));
                  if (aChk.length != 4) {
                     $('#allCheck').focus();
                     alert("필수사항을 체크해주세요.");
                     } else {
               <%-- 예약 정보 확인 창 열기 --%>
                  $("#reservation_popupDiv").css({
                     "top" : (($(window).height() - $(   "#reservation_popupDiv").outerHeight()) / 4 + $(window).scrollTop())+ "px",
                     "left" : (($(window).width() - $("#reservation_popupDiv").outerWidth()) / 4 + $(window).scrollLeft())+ "px"
                     });
                  $("#reservation_popup_mask").css("display","block");
                  $("#reservation_popupDiv").css("display","block");
                  $("body").css("overflow","auto");
               <%-- 예약 정보 확인 창 닫기 --%>
                  $(".reservation_popCloseBtn")   .click(function(event) {
                     $("#reservation_popup_mask").css("display","none");
                     $("#reservation_popupDiv").css("display","none");
                     $("body").css("overflow","auto");
                     });
                  $(".reservation_popCloseBtn_1").click(function(event) {
                     $("#reservation_popup_mask").css("display","none");
                     $("#reservation_popupDiv").css("display","none");
                     $("body").css("overflow","auto");
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
         IMP.init('imp07297817'); //복사해온 개인 키
         IMP.request_pay({ //결제정보작성
            merchant_uid : "상품명_"+ payDate, //거래아이디
            name : "결제테스트", //결제명
            amount : price, // 결제금액
            buyer_email : 'next007@nate.com', // 구매자 email
            buyer_name : '이윤수',
            buyer_tel : '010-2636-9873',
            buyer_addr : '서울',
            buyer_postcode : '123-456' //우편번호
            },
            function(rsp) {
               if (rsp.success) {
                  var msg = '결제가완료되었습니다';
                  var info1 = '고유 ID : ' + rsp.imp_uid;
                  var info2 = '결제금액 :  ' + rsp.paid_amount;
                  var info3 = '카드승인번호 : ' + rsp.apply_num;
                  alert(msg+ info1+ info2+ info3);
                  } else {
                     alert('에러내용 : ' + rsp.error_msg);
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
      $('.agree_img')   .click(function() {
         if ($(this).next().css("display") == "none") {
            $(this).next().css("display", "block");
            $(this).attr("src",   "/img/chevronup.png");
            } else {   
               $(this).next().css("display", "none");
               $(this).attr("src",   "/img/chevrondown.png");
            }
         });
      });
   </script>
   <jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>