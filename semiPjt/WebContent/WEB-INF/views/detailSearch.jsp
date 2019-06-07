<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
	<style>
		.searchInfo{
			width:100%;
			height:70px;
			margin-top: 30px;
		}
		.detailSearchList{
			width:25%;
			float:left;
			padding-left:5%;
			padding-right:5%;
			font-size:18px;
			padding-left: 10px;
		}
		.detailSearchBtn{
			width:5%;
		}
		.placeTypeDetail{
			margin:0 auto;
			float:left;
			box-sizing: border-box;
			border: 1px solid gainsboro;
			color: darkgrey;
			text-align: center;
			width:45%;
			cursor: pointer;
		}
		.placeTypeDetail:hover{
			background-color:purple;
			color:black;
		}
		.typeOutlineDetail{
			clear:left;
		}
		.selectBox>span{
			text-align: right;
		}
		.selectBoxInner{
			padding:20px;
			display:none;
			width: 500px;
			border: 1px solid black;
			overflow: hidden;
		}
		.selectBox:hover{
			cursor: pointer;
		}
		.detailSearch {
			width: 1160px;
			margin: 0 auto;
		    position: relative;
		}
		.detailSearch input[type="text"]{
			width: 800px;
			height: 60px;
		    padding: 10px;
		    position: relative;
    	}
    	.detailSearch input[type="submit"]{
			background: url(../img/main_search_icon.png) no-repeat center center;
			position: absolute;
		    width: 60px;
		    height: 60px;
			margin: 0px;
			outline: none;
			border: 0;
			cursor: pointer;
		    padding: 0;
		    right: 300px;
		}
		.filterOutLine{
			padding:20px;
			display: none;
			clear: both;
			border: 1px solid black;
			
		}
		.detailSearchBtn{
			background-color: white;
			width: 80px;
			height: 40px;
		}
		.detailBox{
			margin-top:30px;
			
		}

		.filterBox{
			margin:0 auto;
			float:left;
			box-sizing: border-box;
			border: 1px solid gainsboro;
			color: darkgrey;
			text-align: center;
			width:13.7%;
			height:90px;
			cursor: pointer;
		}
		.filterBox:hover{
			background-color:purple;
			color:black;
		}
		.filterOutBox{
			clear:left;
			overflow: hidden;
		}
		.filterBack{
			font-size: 20px;
    		background-color: black;
    		color: white;
    		width: 30px;
    		border: 0px;
    		float:right;
		}
		.selectFilter{
			background-color: blue;
		}
		.totalOutLine{
			width:100%;
			margin-top:10px;
			margin-bottom:10px;
			clear:left;
		}
		.totalInnerBox{
			width:33.3%;
			padding:10px;
			border:1px solid black;
			float:left;
			display:none;
		}
		#viewMore{
			width:200px;
			height:50px;
			margin-top:30px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	
	<section>
	<div class="section_content">
		<div class="searchInfo">
			<span style="color:blue;font-weight:bold;font-size:30px; border-bottom:4px solid blue">${type }</span><span style="font-weight:100;font-size:20px;"> (으)로 검색한 결과입니다.</sapn>
		</div>
		<div class="detailSearch">
            <input class="searchInput" type="text" placeholder="검색어를 입력해주세요">
            <input class="searchIcon" type="submit" value="">
        </div>
		<div class="detailBox">
			<div class="detailSearchList">공간유형
				<div class="selectBox">모든공간&nbsp;&nbsp;&nbsp;&nbsp;<span>▽</span></div>
				<div class="selectBoxInner">
					<div class="typeOutlineDetail">
						<button class="filterBack">X</button>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">회의실</div>
						<div class="placeTypeDetail">세미나실</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">다목적홀</div>
						<div class="placeTypeDetail">작업실</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">레저시설</div>
						<div class="placeTypeDetail">파티룸</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">공연장</div>
						<div class="placeTypeDetail">연습실</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">카페</div>
						<div class="placeTypeDetail">스터디룸</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">엠티장소</div>
						<div class="placeTypeDetail">루프탑</div>
					</div>
				</div>
			</div>
				
			<div class="detailSearchList">지역
				<div class="selectBox">모든지역<span>▽</span></div>
				<div class="selectBoxInner">
					<div class="typeOutlineDetail">
						<button class="filterBack">X</button>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">이태원</div>
						<div class="placeTypeDetail">홍대입구</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">신림</div>
						<div class="placeTypeDetail">신촌</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">강남</div>
						<div class="placeTypeDetail">건대입구</div>
					</div>
					<div class="typeOutlineDetail">
						<div class="placeTypeDetail">사당</div>
						<div class="placeTypeDetail">서울역</div>
					</div>
				</div>
			</div>
			
			<div class="detailSearchList">이용일
				<div class="selectBox" >모든날짜<span>▽</span></div>
				<div class="selectBoxInner">
					<jsp:include page="/WEB-INF/views/calendar2.jsp"/>
				</div>
			</div>
			<div class="detailSearchList">
				<button id="detailSearchMap" class="detailSearchBtn">지도</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="detailSearchFilter" class="detailSearchBtn">필터</button>
			</div>
			<div class="mapInner" style="display:none; width:100%;">
					
			</div>
			<div class="filterOutLine">
				<div class="filterOutBox">
					<span>편의시설</span><span style="font-weight:100;">을 선택하세요.</span>&nbsp;&nbsp;&nbsp;전체선택&nbsp;
					<input type="checkbox" id="filterCheck" style="width:20px;height:20px;" checked="checked">&nbsp;
					<button class="filterBack">X</button>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">TV/프로젝터<br><img src="/upload/space/kategorie2/1.png" ></div>
					<div class="filterBox">인터넷/Wifi<br><img src="/upload/space/kategorie2/2.png" ></div>
					<div class="filterBox">복사/인쇄기<br><img src="/upload/space/kategorie2/3.png" ></div>
					<div class="filterBox">화이트보드<br><img src="/upload/space/kategorie2/4.png" ></div>
					<div class="filterBox">음향/마이크<br><img src="/upload/space/kategorie2/5.png" ></div>
					<div class="filterBox">취사시설<br><img src="/upload/space/kategorie2/6.png" ></div>
					<div class="filterBox">음식물반입가능<br><img src="/upload/space/kategorie2/7.png" ></div>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">주류반입가능<br><img src="/upload/space/kategorie2/8.png" ></div>
					<div class="filterBox">샤워시설<br><img src="/upload/space/kategorie2/9.png" ></div>
					<div class="filterBox">주차<br><img src="/upload/space/kategorie2/10.png" ></div>
					<div class="filterBox">금연<br><img src="/upload/space/kategorie2/11.png" ></div>
					<div class="filterBox">반려동물 동반가능<br><img src="/upload/space/kategorie2/12.png" ></div>
					<div class="filterBox">PC/노트북<br><img src="/upload/space/kategorie2/13.png" ></div>
					<div class="filterBox">의자/테이블<br><img src="/upload/space/kategorie2/14.png" ></div>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">내부화장실<br><img src="/upload/space/kategorie2/15.png" ></div>
					<div class="filterBox">탈의실<br><img src="/upload/space/kategorie2/16.png" ></div>
					<div class="filterBox">테라스/루프탑<br><img src="/upload/space/kategorie2/17.png" ></div>
					<div class="filterBox">공용라운지<br><img src="/upload/space/kategorie2/18.png" ></div>
					<div class="filterBox">전신거울<br><img src="/upload/space/kategorie2/19.png" ></div>
					<div class="filterBox">바베큐시설<br><img src="/upload/space/kategorie2/20.png" ></div>
					<div class="filterBox">도어락<br><img src="/upload/space/kategorie2/21.png" ></div>
				</div>
			</div>
		</div>
		<div class="totalOutLine">
			<c:forEach items='${list }' var='s'>
				<div class='totalInnerBox'>
					<input type="hidden" value='${s.s_no }'>
					<div style='height:200px;'>
						<img src='/upload/space/${s.s_img1}' width="100%" height="200px">
					</div>
					<div style='height:120px;'>
						<h4>${s.s_placeName}</h4>
						<img src='/img/map-marker.png'><span>${s.addressCut}</span>
						<div style="width:100%; height:22px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">${s.s_placeTag}</div>
						<c:if test="${s.s_type eq 'time' }">
							<span style="font-size:22px;">${s.s_price1}</span><span>원/시간</span>
						</c:if>
						<c:if test="${s.s_type eq 'day' }">
							<span style="font-size:22px;">${s.s_price1}</span><span>원/일</span>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="clear:left; text-align:center;">
			<button id="viewMore">더보기</button>
		</div>
	</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function() {
		var filterCount = 0;
		var prepareNum=-1;
		var index = '${index }';
		if (index >= 0 && index < 12) {
			if($('.placeTypeDetail').eq(index).text()=='${type}'){
				$('.selectBox').eq(0).html('${type }<span>▽</span>');
				$('.placeTypeDetail').eq(index).css("background-color", "blue");
			}
			
		} else if (index >= 12 && index < 18) {
			if($('.placeTypeDetail').eq(index).text()=='${type}'){
				$('.selectBox').eq(1).html('${type }<span>▽</span>');
				$('.placeTypeDetail').eq(index).css("background-color", "blue");
			}
		} else {
			if($('.placeTypeDetail').eq(index).text()=='${type}'){
				$('.selectBox').eq(2).html('${type }<span>▽</span>');
			}
		}
		
		$('.selectBox').click(function() {
			var selectNum = $('.selectBox').index(this);
			
				$('.selectBox').find('span').html('▽');
				$('.selectBox').next().css("display", "none");
				$('.filterOutLine').css("display","none");
			if(prepareNum!=selectNum){
				$('.selectBox').eq(selectNum).find('span').html('▲');
				$('.selectBox').eq(selectNum).next().css("display", "block");
				prepareNum = selectNum;
			}else{
				prepareNum=-1;
			}
			filterCount = 0;
		});
		for(var i = 0; i<6; i++){
			$('.totalInnerBox').eq(i).css("display","block");
		}
	});
	
	$('.placeTypeDetail').click(function() {
		
		var index = $('.placeTypeDetail').index(this);
		var type = $('.placeTypeDetail').eq(index).text();
		if(index<12){
			inputType = 1;			
		}else if(index>=12 && index<20){
			inputType = 2;
		}
		location.href = "/headerSearchPlace?type=" + type + "&index=" + index + "&inputType=" + inputType;
	});
	
	$('.totalInnerBox').click(function(){
		var sNumber = $(this).find('input').val();
		location.href = "/selectOneSpace?S_no="+sNumber;
	});
	
	$('#detailSearchFilter').click(function(){
		if(filterCount==0){
			$('.selectBox').find('span').html('▽');
			$('.selectBox').next().css("display", "none");
			$('.filterOutLine').css("display", "block");	
			filterCount = 1;
		} else if(filterCount==1){
			$('.filterOutLine').css("display", "none");	
			filterCount = 0;
		}
	});
	$('.filterBack').click(function() {
		$('.selectBoxInner').css("display", "none");
		$('.filterOutLine').css("display", "none");
	    filterCount = 0;
	});
	$("input:radio[name='testradio']:radio[value='2']").prop('checked', true);
	var filterArray = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
	var filterCount = 0;
	$('.filterBox').click(function(){
		if($('#filterCheck').is(':checked')==true){
			$('#filterCheck').prop("checked", false);
			filterArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		}
		var filterIndex = $('.filterBox').index(this);
		$(this).toggleClass("selectFilter");
		if($(this).hasClass("selectFilter")){
			filterArray[filterIndex] = 1;
		}else{
			filterArray[filterIndex] = 0;
		}
		console.log(filterArray);
	});
	$('#filterCheck').click(function(){
		if($('#filterCheck').is(':checked')==true){
			filterArray = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
		} else{
			filterArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		}
		$(".selectFilter").removeClass("selectFilter");
	});
	var viewIndex = 6;//공간 리스트 인덱스
	$('#viewMore').click(function(){
		for(var i = viewIndex; i<viewIndex+6; i++){
			$('.totalInnerBox').eq(i).css("display","block");
		}
		viewIndex = viewIndex+6;
	});
	$('#detailSearchMap').click(function(){
		
		$('.mapInner').toggle();
	})
	</script>
</body>
</html>