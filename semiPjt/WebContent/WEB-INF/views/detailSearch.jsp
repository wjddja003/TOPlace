<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			height : 100%;
			border: 1px solid black;
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
			padding-top:20px;
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
			width:13.5%;
			cursor: pointer;
		}
		.filterBox:hover{
			background-color:purple;
			color:black;
		}
		.filterOutBox{
			clear:left;
			margin-left:20%;
		}
		#filterBack{
			font-size: 20px;
    		background-color: black;
    		color: white;
    		width: 30px;
    		border: 0px;
    		float:right;
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
						<button id="filterBack")>X</button>
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
						<button id="filterBack")>X</button>
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
				<div class="selectBox" style="width:800px")>모든날짜<span>▽</span></div>
				<div class="selectBoxInner">
					<jsp:include page="/WEB-INF/views/calendar.jsp"/>
				</div>
			</div>
			<div class="detailSearchList">
				<button id="detailSearchMap" class="detailSearchBtn">지도</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="detailSearchFilter" class="detailSearchBtn">필터</button>
			</div>
			<div class="filterOutLine">
				<div class="filterOutBox">
					<span>편의시설을 선택하세요.</span>
					<button id="filterBack")>X</button>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">TV/프로젝터</div>
					<div class="filterBox">인터넷/Wifi</div>
					<div class="filterBox">복사/인쇄기</div>
					<div class="filterBox">화이트보드</div>
					<div class="filterBox">음향/마이크</div>
					<div class="filterBox">취사시설</div>
					<div class="filterBox">음식물반입가능</div>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">주류반입가능</div>
					<div class="filterBox">샤워시설</div>
					<div class="filterBox">주차</div>
					<div class="filterBox">금연</div>
					<div class="filterBox">반려동물 동반가능</div>
					<div class="filterBox">PC/노트북</div>
					<div class="filterBox">의자/테이블</div>
				</div>
				<div class="filterOutBox">
					<div class="filterBox">내부화장실</div>
					<div class="filterBox">탈의실</div>
					<div class="filterBox">테라스/루프탑</div>
					<div class="filterBox">공용라운지</div>
					<div class="filterBox">전신거울</div>
					<div class="filterBox">바베큐시설</div>
					<div class="filterBox">도어락</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function() {
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
		var prepareNum=-1;
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
	});
	$('.placeTypeDetail').click(function() {
		var index = $('.placeTypeDetail').index(this);
		var type = $('.placeTypeDetail').eq(index).text();
		location.href = "/headerSearchPlace?type=" + type + "&index=" + index;
	});
	var filterCount = 0;
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
	$('#filterBack').click(function() {
	     	$(this).parent().parent().css("display","none");
	     	filterCount = 0;
	});
	$("input:radio[name='testradio']:radio[value='2']").prop('checked', true);
	var filterArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var filterCount = 0;
	$('.filterBox').click(function(){
		if(filterCount>5){
			alert("")
		}
		var filterIndex = $('.filterBox').index(this);
		filterArray[filterIndex] = 1;
		filtercount++
	});
	</script>
</body>
</html>