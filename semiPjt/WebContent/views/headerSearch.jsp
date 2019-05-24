<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.headerInnerSearch{
			width:1180px;
			padding-top: 50px;
			padding-bottom: 50px;
			margin-left:370px;
			margin-right:370px;
		}
		.selectArea{
			margin-top:30px;
		}
		.typeOutline{
			width:100%;
			clear:left;
			height:50px;
		}
		.searchP{
			margin-bottom : 10px;
		}
		.placeType{
			box-sizing: border-box;
			border: 1px solid gainsboro;	
			width:16.66%;
			height:100%;
			float: left;
			text-align: center;
			line-height: 50px;
			font-size:17px;
			color: darkgrey;
		}
		.placeType:hover{
			cursor: pointer;
			background-color:purple;
			color:black;
			font-size:20px;
		}
		#searchIcon:hover{
			cursor: pointer;
		}
	</style>
		
	
</head>
<body>
	<button class="back">X</button>
	<div class="headerInnerSearch">
		<span id="searchIcon"><img src="/img/search_icon.png" style="width:50px;height:50px;"></span>
		<br><br>
		<input type="text" id="searchInput" placeholder="공간을 빠르게 검색해보세요" size="81" style="font-size:30px;">
		<div class="selectArea">
			<p class="searchP"><b>유형별로 찾아보기</p>
			<div class="typeOutline">
				<div class="placeType">회의실</div>
				<div class="placeType">세미나실</div>
				<div class="placeType">다목적홀</div>
				<div class="placeType">작업실</div>
				<div class="placeType">레저시설</div>
				<div class="placeType">파티룸</div>
			</div>
			<div class="typeOutline">
				<div class="placeType">공연장</div>
				<div class="placeType">연습실</div>
				<div class="placeType">카페</div>
				<div class="placeType">스터디룸</div>
				<div class="placeType">엠티장소</div>
				<div class="placeType">루프탑</div>
			</div>
		</div>
		<br>
		<div class="">
			<p class="searchP"><b>핫플레이스로 찾아보기</p>
			<div class="typeOutline">
				<div class="placeType">이태원</div>
				<div class="placeType">홍대입구</div>
				<div class="placeType">신림</div>
				<div class="placeType">신촌</div>
				<div class="placeType">강남</div>
				<div class="placeType">건대입구</div>
			</div>
		</div>
		<br>
		<div class="">
			<p class="searchP"><b>지하철역으로 찾아보기</p>
			<div class="typeOutline">
				<div class="placeType">신촌역</div>
				<div class="placeType">성수역</div>
				<div class="placeType">사당역</div>
				<div class="placeType">홍대입구역</div>
				<div class="placeType">이태원역</div>
				<div class="placeType">강남역</div>
			</div>
		</div>
	</div>
	<script>
		$('.placeType').click(function(){
			var type = $(this).text();
			location.href="/headerSearchPlace?type="+type;
		});
		$("#searchInput").keydown(function(key) {
			if(key.keyCode == 13){
	            if ($(this).val()=="") {
	            	$("#searchAlert").slideDown(700);
	                $("#searchAlert").delay(1300);
	                $("#searchAlert").slideUp(700);
	           } else {
	   				var type = $(this).val();
	   				location.href="/headerSearchPlace?type="+type;
	           }
			}
        });
        $('#searchIcon').click(function(){
        	if ($("#searchInput").val()=="") {
            	$("#searchAlert").slideDown(700);
                $("#searchAlert").delay(1300);
                $("#searchAlert").slideUp(700);
           } else {
   				var type = $("#searchInput").val();
   				location.href="/headerSearchPlace?type="+type;
           }
        });
	</script>
</body>
</html>