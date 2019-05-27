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

label{
	font-weight: bold;
	font-size: 18px;
	color:blue;
	
}
/* reservation페이지 label태그 css fin */

label span{
	color: red;
	padding-right: 20px;
}
/* reservation페이지 label span 태그 css fin */

.reservation_content span{
	color: red;
}
/* reservation페이지 reservation_content span태그 css fin */

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
				<div id="t1">t1:</div>
				<div id="t2">t2:</div>
				<div id="count">count:</div>
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
					<label>예약자 <span>*</span><input type="text" name="" value="" required="required"></label><br>
					<label>연락처 <span>*</span>
					<select name="phone" required="required">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>-
					<input type="text" name="phone1" value="" required="required">-
					<input type="text" name="phone2" value="" required="required">
					</label><br>
					<label>이메일 <span></span><input type="text" name="email"placeholder="이메일 주소를 남겨주세요."></label><br>
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
				<span class="reservation_sub"><input type="checkbox">전체 동의</span>
				<div class="reservation_content">
					<input type="checkbox"> 위 공간의 예약조건 확인 및 결제진행 동의<span>(필수)</span><br>
					<input type="checkbox"> 환불규정 안내에 대한 동의<span>(필수)</span><br>
					<input type="checkbox"> 개인정보 제3자 제공 동의<span>(필수)</span><br>
					<input type="checkbox"> 개인정보 수집 및 이용 동의<span>(필수)</span><br>
				</div>
			</div>
			
			<div class="reservation_rMenu">
				<span class="reservation_title">결제 예정 금액</span><br><br>
				<div>예약날짜<span>??</span></div>
				<div>예약시간<span>??</span></div>
				<div>예약인원<span>명</span></div>
				<div>￦<span>돈</span></div>
				<button>결제하기</button>
			</div>
			<div id="wrapper">
			</div>
		</div>
	</section>
	
	
	<%-- 메뉴바 스크롤 따라오기 스크립트 --%>
	<script>
	$(document).ready(function() {
		var floatPosition = parseInt($(".reservation_rMenu").css('top'));
		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			$(".reservation_rMenu").stop().animate({
				"top" : newPosition
			}, 500);
		}).scroll();
	});
	</script>
	
	<%-- 시간선택 스크립트 --%>
	<script>
	var count = 0;
	var tIndex=-1;
	var tIndex2=-1;
    $('.timeSel button').click(function(){
    	count++;
    	if(count==1){
    		tIndex = $('.timeSel button').index(this);
        	$('#t1').html("index: "+tIndex);
        	$('#count').html("count: "+count);
        	$(this).css('background','black');
			$(this).css('color','white');
    	}else if(count==2){
    		tIndex2 = $('.timeSel button').index(this);
    		$('#t2').html("index: "+tIndex2);
    		$('#count').html("count: "+count);
    		for(var i=tIndex; i<tIndex2+1; i++){
    			$('.timeSel button').eq(i).css('background-color','black');
    			$('.timeSel button').eq(i).css('color','white');
    		}
    		for(var i=tIndex2; i<tIndex+1; i++){
    			$('.timeSel button').eq(i).css('background-color','black');
    			$('.timeSel button').eq(i).css('color','white');
    		}
    	}else if(count>2){
    		count = 0;
    		$('.timeSel button').css('background','#ccc');
			$('.timeSel button').css('color','black');
			$('#count').html("count: "+count);
    	}
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
