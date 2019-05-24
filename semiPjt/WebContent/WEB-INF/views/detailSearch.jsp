<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		div{
			box-sizing: border-box;
		}
		#detailSearchDiv{
			width:1180px;
			padding-top: 50px;
			padding-bottom: 50px;
			margin-left:370px;
			margin-right:370px;
			height: 864px;
		}
		.searchInfo{
			width:100%;
			height:100px;
		}
		.detailSearchList{
			width:29%;
			float:left;
			padding-left:5%;
			padding-right:5%;
			font-size:18px;
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
			width:40%;
		}
		.typeOutlineDetail{
			clear:left;
		}
		.selectBox>span{
			text-align: right;
		}
		.selectBoxInner{
			display:none;
		}
		.selectBox:hover{
			cursor: pointer;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<div id="detailSearchDiv">
		<div class="searchInfo">
			<span style="color:blue;font-weight:bold;font-size:30px;"><u>${type }</u></span><span style="font-weight:100;font-size:30px;"> (으)로 검색한 결과입니다.</sapn>
		</div>
		<div>
			<div class="detailSearchList">공간유형
				<div class="selectBox">모든공간<span>▽</span></div>
				<div class="selectBoxInner">
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
				</div>
			</div>
			
			<div class="detailSearchList">이용일
				<div class="selectBox">모든날짜<span>▽</span></div>
			</div>
			<button id="detailSearchMap" class="detailSearchBtn">지도</button>
			<button id="detailSearchFilter" class="detailSearchBtn">필터</button>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			var index = ${index};
			if(index>=0 && index<12){
				$('.selectBox').eq(0).html('${type }<span>▽</span>');
				$('.placeTypeDetail').eq(index).css("background-color","blue");
			} else if(index>=12 && index<18){
				$('.selectBox').eq(1).html('${type }<span>▽</span>');
				$('.placeTypeDetail').eq(index).css("background-color","blue");
			} else{
				$('.selectBox').eq(2).html('${type }<span>▽</span>');
			}
			var count = 0;
			$('.selectBox').click(function(){
				if(count == 0){
					$(this).find('span').html('▲');
					count = 1;
					$(this).next().css("display","block");
				}else{
					$(this).find('span').html('▽');
					count = 0;
					$(this).next().css("display","none");
				}
			});
		});
		
	</script>
</body>
</html>