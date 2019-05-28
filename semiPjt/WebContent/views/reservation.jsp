<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>예약페이지</title>

<link rel="stylesheet" href="/Calendar/daterangepicker.css" />
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><%-- 아임포트 --%>
<script src="../Calendar/jquery-1.11.2.min.js"></script>
<script src="../Calendar/moment.min.js"></script>
<script src="../Calendar/jquery.daterangepicker.js"></script>
<script src="../Calendar/demo.js"></script>
<script>var jc = jQuery.noConflict();</script> <%-- 달력 제이쿼리 충돌 해결코드 --%>
<style>
/* 달력 css */
#wrapper {
	width: 800px;
	margin: 0 auto;
	color: #333;
	font-family: Tahoma;
	line-height: 1.5;
	font-size: 14px;
	clear:both;
}
.caption th{
	color:black;
}
th{
	color:black;
	font-weight:normal;
}
.demo {
	margin: 30px 0;
	color: black;
}
.date-picker-wrapper .month-wrapper table .day.lalala {
	background-color: orange;
}
.options {
	display: none;
	border-left: 6px solid #8ae;
	padding: 10px;
	font-size: 12px;
	line-height: 1.4;
	background-color: #eee;
	border-radius: 4px;
}
.date-picker-wrapper.date-range-picker19 .day.first-date-selected {
	background-color: red !important;
}
.date-picker-wrapper.date-range-picker19 .day.last-date-selected {
	background-color: orange !important;
}
/* 달력 css fin */

/*reservation css start*/
.reservation_lMenu{
	float: left;
	width: 800px;
	background: green;
	margin:20px 10px 0px 0px; 
}
/* reservation_lMenu css fin */
.reservation_rMenu{
	float: left;
	width: 350px;
	height: 300px;
	background: red;
	top: 120px;
	right:350px;
	position: absolute;
	overflow-y:auto;
}
/* reservation_rMenu  css fin */
.reservation_content{
	background: orange;
	height: 300px;
	margin:20px 0px 20px 0px;
	padding: 20px;
	clear: both;
	position: relative;
}
/* reservation_content css fin */
.reservation_title{
	display : block;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
	float: left;
}
/* reservation_title css fin */
.reservation_sub{
	display : block;
	margin:0px 10px 0px 0px;
	text-align: right;
	font-size: 18px;
}
/* reservation_sub css fin */
.reservation_content label{
	font-weight: bold;
	font-size: 18px;
}
/* reservation페이지 label태그 css fin */
.reservation_content label span{
	color: red;
	padding-right: 20px;
}
/* reservation페이지 label span 태그 css fin */
.reservation_content span{
	color: red;
}
/* reservation페이지 reservation_content span태그 css fin */
#reservation_popupDiv {  
    top : 0px;
    position: absolute;
    background: blue;
    width: 500px;
    height: 500px;
    display: none; 
 }
 /* reservation페이지 팝업창 css */ 
#reservation_popup_mask { 
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none; 
	background-color:#000;
	opacity: 0.6;
}
/* reservation페이지 팝업시 배경 css */
/*reservation css fin*/

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		<div class="section_content">
		<%-- 예약페이지 컨텐츠 --%>
			<div class="reservation_lMenu">
		<%-- 예약페이지 공간소개 --%>
				<span class="reservation_title">예약 공간</span>
				<span class="reservation_sub">금액/시간</span>
				<div class="reservation_content">
				</div>
		<%-- 예약페이지 날짜선택 --%>
				<span class="reservation_title">날짜 선택</span>
				<span class="reservation_sub">날짜</span>
				<div class="reservation_content">
					<div class="demo">
						Single date Mode: <input id="date-range13" size="30" value=""><br>
						Single Month Mode: <input id="date-range23" size="30" value="">
					</div>
				</div>
		<%-- 예약페이지 시간선택 --%>
				<span class="reservation_title">시간 선택</span>
				<span class="reservation_sub">시간</span>
				<div class="reservation_content">
				<div class="time">
				Single Time mode:
				<div class="timeSel">
					<button>0</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>6</button>
					<button>7</button>
					<button>8</button>
					<button>9</button>
					<button>10</button>
					<button>11</button>
					<button>12</button>
					<button>13</button>
					<button>14</button>
					<button>15</button>
					<button>16</button>
					<button>17</button>
					<button>18</button>
					<button>19</button>
					<button>20</button>
					<button>21</button>
					<button>22</button>
					<button>23</button>
					<button>24</button>
				</div>
			</div>
				</div>
		<%-- 예약페이지 인원선택 --%>
				<span class="reservation_title">인원 선택</span>
				<span class="reservation_sub">인원</span>
				<div class="reservation_content">
				</div>
		<%-- 예약페이지 예약자정보 --%>
				<span class="reservation_title">예약자 정보</span>
				<span class="reservation_sub" style="color: red;">*필수 입력</span>
				<div class="reservation_content">
					<label>예약자 <span>*</span><input type="text" name="booker" value="" required="required"></label><br>
					<label>연락처 <span>*</span>
					<select name="phone" required="required">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>-
					<input type="text" name="phone1" value="" required="required" maxlength="4">-
					<input type="text" name="phone2" value="" required="required" maxlength="4">
					</label><br>
					<label>이메일 <span></span><input type="text" name="email" placeholder="이메일 주소를 남겨주세요."></label><br>
					<label>요청사항 <span></span><input type="text" placeholder="남기고 싶은 말을 적어주세요."></label><br>
				</div>
		<%-- 예약페이지 호스트정보 --%>
				<span class="reservation_title">호스트 정보</span>
				<div class="reservation_content">
				</div>
		<%-- 예약페이지 예약주의사항 --%>
				<span class="reservation_title">예약시 주의사항</span>
				<div class="reservation_content">
				</div>
		<%-- 예약페이지 환불규정안내 --%>
				<span class="reservation_title">환불규정 안내</span>
				<div class="reservation_content">
				</div>
		<%-- 서비스 동의--%>
				<span class="reservation_title">서비스 동의</span>
				<label class="reservation_sub"><span><input type="checkbox" id="allCheck">전체 동의</span></label>
				<div class="reservation_content">
					<label><input type="checkbox" name="agree" value="1"> 위 공간의 예약조건 확인 및 결제진행 동의<span>(필수)</span></label><br>
					<label><input type="checkbox" name="agree" value="1"> 환불규정 안내에 대한 동의<span>(필수)</span></label><br>
					<label><input type="checkbox" name="agree" value="1"> 개인정보 제3자 제공 동의<span>(필수)</span></label><br>
					<label><input type="checkbox" name="agree" value="1"> 개인정보 수집 및 이용 동의<span>(필수)</span></label><br>
				</div>
			</div>
		<%-- 결제 메뉴 창 --%>
			<div class="reservation_rMenu">
				<span class="reservation_title">결제 예정 금액</span><br><br>
				<div>예약날짜<span>??</span></div>
				<div>예약시간<span>??</span></div>
				<div>예약인원<span>명</span></div>
				<div>￦<span>돈</span></div>
				<button id="payment">결제하기</button>
			</div>

		<%-- 예약 정보 창 --%>
		<%-- 팝업 배경 DIV--%>
			<div id ="reservation_popup_mask" >
			</div> 
		<%-- 팝업 DIV--%>
   			<div id="reservation_popupDiv">
   				<div><button class="reservation_popCloseBtn">x</button></div>
   				<div><h1>결제하시겠습니까?</h1></div>
   				<div>예약공간</div>
   				<div>예약날짜</div>
   				<div>예약시간</div>
   				<div>예약인원</div>
   				<div>결제예정금액</div>
   				<div>결제후 2시간....</div>
   				<div>결제 전에....</div>
   				<div>
   				<button class="reservation_popCloseBtn">닫기</button>
   				<button id="pop_payment">결제하기</button>
   				</div>
    		</div>
    	<%-- 달력 DIV --%>
			<div style="clear: both;">
			</div>
	</section>
	<script>
		$(document).ready(function(){
			<%-- 예약정보 정규식 --%>
			var phoneCheck=/[0-9]{4}$/;
			var bookerCheck=/[가-힣]{2,13}$/;
			<%-- 시간 선택 스크립트 --%>
			var count = 0; // 버튼 클릭
			var start=-1; // 시작 시간
			var end=-1; // 끝 시간
	        $('.timeSel button').click(function(){
	        	count++;
	        	if(count==1){
	        		start = $('.timeSel button').index(this);
	            	$(this).css('background','black');
	    			$(this).css('color','white');
	        	}else if(count==2){
	        		end = $('.timeSel button').index(this);
	        		for(var i=start; i<end+1; i++){
	        			$('.timeSel button').eq(i).css('background-color','black');
	        			$('.timeSel button').eq(i).css('color','white');
	        			$('.timeSel button').eq(i).addClass('tSel');
	        		}
	        		for(var i=start; i>end-1; i--){
	        			$('.timeSel button').eq(i).css('background-color','black');
	        			$('.timeSel button').eq(i).css('color','white');
	        			$('.timeSel button').eq(i).addClass('tSel');
	        		}
	        	}else if(count>2){
	        		count = 0;
	        		$('.timeSel button').css('background','#ccc');
	    			$('.timeSel button').css('color','black');
	    			$('.timeSel button').eq(i).removeClass('tSel');
	        	}
	     	});
			<%-- 전체 체크박스 선택 스크립트 --%>
			$('#allCheck').click(function(){
				if($('#allCheck').prop('checked')){
					$("input[name=agree]:checkbox").prop("checked", true);
				}else{
					$("input[name=agree]:checkbox").prop("checked", false);
				}
			});
			<%-- 체크박스 전체 선택 시 스크립트--%>
			$("input[name=agree]").click(function(){
				var aChk = $("input").filter("input[name=agree]:checked");
				if(aChk.length==4){
					$('#allCheck').prop("checked", true);
				}else{
					$('#allCheck').prop("checked", false);
				}
			});
			<%-- 결제버튼 클릭 스크립트--%>
			$('#payment').click(function(){
				<%-- 시간 체크 확인 --%>
				if(count==1){
					alert("최소 두시간 이상 예약이 가능합니다.");
				}
				else if(count!=2){
					alert("시간을 선택해주세요.");
				}else{
					<%-- 예약정보 체크 --%>
					if(!bookerCheck.test($('input[name=booker]').val())){
						alert("예약자 정보를 확인해주세요(예약자명 두글자 이상)");
						$('input[name=booker]').focus();
						$('input[name=booker]').css('border','1px solid red');
					}else if(!phoneCheck.test($('input[name=phone1]').val())){
						alert("연락처 정보를 확인해주세요");
						$('input[name=booker]').css('border','');
						$('input[name=phone1]').focus();
						$('input[name=phone1]').css('border','1px solid red');
					}else if(!phoneCheck.test($('input[name=phone2]').val())){
						alert("연락처 정보를 확인해주세요");
						$('input[name=phone1]').css('border','');
						$('input[name=phone2]').focus();
						$('input[name=phone2]').css('border','1px solid red');
					}else{ 
						<%-- 동의 체크 확인 --%>
						var aChk = $("input").filter("input[name=agree]:checked");
						if(aChk.length!=4){
							$('#allCheck').focus();
							alert("필수사항을 체크해주세요.");
						}else{
							<%-- 예약 정보 확인 창 열기 --%>
							$("#reservation_popupDiv").css({
					               "top": (($(window).height()-$("#reservation_popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
					               "left": (($(window).width()-$("#reservation_popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
					            }); 
							 $("#reservation_popup_mask").css("display","block");
							 $("#reservation_popupDiv").css("display","block");
							 $("body").css("overflow","auto");
							<%-- 예약 정보 확인 창 닫기 --%>
							 $(".reservation_popCloseBtn").click(function(event){
						           $("#reservation_popup_mask").css("display","none"); 
						           $("#reservation_popupDiv").css("display","none"); 
						           $("body").css("overflow","auto");
						       });
						}<%-- 동의 체크 완료 --%>
					}<%-- 예약정보 체크 완료 --%>
				}<%-- 시간 체크 완료 --%>
			});
			<%-- 메뉴바 스크롤 따라오기 스크립트 --%>
			var floatPosition = parseInt($(".reservation_rMenu").css('top'));
			$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
		    $(".reservation_rMenu").stop().animate({
		            "top" : newPosition
		         }, 500);
		      }).scroll();
			<%-- 팝업창 스크롤 따라오기 스크립트 --%>
			$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
		    $("#reservation_popupDiv").stop().animate({
		            "top" : newPosition
		         }, 500);
		      }).scroll();
			<%-- 결제 모듈 스크립트 --%>
			$('#pop_payment').click(function(){
				 $("#reservation_popup_mask").css("display","none"); 
		         $("#reservation_popupDiv").css("display","none"); 
		         $("body").css("overflow","auto");
				var price = 1000;
				var d = new Date();
				var payDate = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
				 IMP.init('imp07297817');  //복사해온 개인 키 
		         IMP.request_pay({ //결제정보작성
		               merchant_uid : "상품명_"+payDate, //거래아이디
		               name : "결제테스트",  //결제명
		               amount : price, // 결제금액
		               buyer_email : 'next007@nate.com', // 구매자 email
		               buyer_name : '이윤수', 
		               buyer_tel : '010-2636-9873',
		               buyer_addr : '서울',
		               buyer_postcode : '123-456' //우편번호
		            },function(rsp){
		               if(rsp.success){
		                  var msg = '결제가완료되었습니다';
		                  var info1 = '고유 ID : ' +rsp.imp_uid;
		                  var info2 = '결제금액 :  '+ rsp.paid_amount;
		                  var info3 = '카드승인번호 : '+ rsp.apply_num;
		                  alert(msg+info1+info2+info3);
		               }else{
		            	  alert('에러내용 : '+rsp.error_msg+payDate);
		               } 
		            });
		         });
		});
	</script>
	<%-- 달력 스크립트 --%>
	<script>
		jc(function()
		{
			jc('a.show-option').click(function(evt)
			{
				evt.preventDefault();
				jc(this).siblings('.options').slideToggle();
			});
		})
	</script>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>
