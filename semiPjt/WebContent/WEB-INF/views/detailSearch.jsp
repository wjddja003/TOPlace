<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
			position:relative;
			float:left;
			padding-left:5%;
			padding-right:5%;
			font-size:18px;
			padding-left: 10px;
		}
		
		.detailSearchBtn:focus{
			outline:none;
		}
		.placeTypeDetail{
			margin:0 auto;
			float:left;
			box-sizing: border-box;
			background-color:#f69b02;
			border:1px solid white;	
			color: white;
			text-align: center;
			width:45%;
			height:30px;
			cursor: pointer;
		}
		.placeTypeDetail:hover{
			border:1px solid white;	
			background-color: #183058;
			color:white;
			font-size:20px;
		}
		.typeOutlineDetail{
			clear:left;
		}
		.selectBox>span{
			text-align: right;
		}
		.selectBoxInner{
			position:absolute;
			top:55px;
			padding:20px;
			display:none;
			width: 500px;
			border:1px solid #f69b02;
			overflow: hidden;
			background-color: white;
			
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
			position:absolute;
			background-color: white;
			width:1140px;
			
			top:350px;
			padding:20px;
			display: none;
			clear: both;
			border: 1px solid #f69b02;
			
		}
		.detailSearchBtn{
			background-color: white;
			width: 100%;
			height: 40px;
			color:#f69b02;
			border:1px solid #f69b02;
			
			font-size:20px;
		}
		.detailSearchBtn:hover{
			background-color: #f69b02;
			color:white;
		}
		.detailBox{
			margin-top:30px;
			
		}
		.filterBtn{
			background-color: white;
			width: 35%;
			height: 60px;
			color:#f69b02;
			border:1px solid #f69b02;
			
			font-size:20px;
		}
		.filterBtn:hover{
			background-color: #f69b02;
			color:white;
		}
		.filterBox{
			margin:0 auto;
			float:left;
			box-sizing: border-box;
			border: 1px solid white;
			color: #183058;
			text-align: center;
			width:13.7%;
			height:90px;
			cursor: pointer;
			background-color: white;
		}
		.selectFilter{
			background-color: #f69b02;
			color: white;
		}
		.filterOutBox{
			clear:left;
			overflow: hidden;
		}
		.filterBack{
			font-size: 20px;
    		background-color:#f69b02;
    		color: white;
    		width: 30px;
    		border: 1px solid white;
    		float:right;
		}
		.filterBack:hover{
			background-color:#183058;
			color: white;
		}
		
		.totalOutLine{
			width:100%;
			margin-top:10px;
			margin-bottom:10px;
			clear:left;
		}
		.totalInnerBox{
			margin: 10px 5px;
			width:32%;
			padding:5px;
			cursor: pointer;
			float:left;
			display:none;
			height:410px;
		}
		#viewpage_alert{
        width: 100%;
        height: 100px;
        background-color: #f69b02;
        position: absolute;
        top: 0px;
        display: none;
        text-align: center;
        font-size: 22px;
        padding: 30px 0px 30px 0px;
        color: #fff;
    	}
		#viewMore{
			width:100%;
			height:100%;
			border:none;
			background:white;
			color:#f69b02;
			
			font-size:20px;
		}
		#viewMore:hover{
			background:#f69b02;
			color:white;
		}
		#viewMore:focus{
    		outline: none;
		}
		
		.like_full{
	        display: none;
	        width:40px;
	    	height: 40px;
	    }
	    .like{
	    	width:40px;
	    	height: 40px;
	    }
	    .searchInput:focus{
	    	outline: none;
	    }
	    .searchInput{
	    	border:1px solid #183058;
	    }

	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	
	<section>
	<div id="viewpage_alert"><p></p></div>
	<div class="section_content">
		<div class="searchInfo">
			<span style="color:#f69b02;font-weight:bold;font-size:30px; border-bottom:4px solid #f69b02">${type }</span><span style="font-weight:100;font-size:20px;"> (으)로 검색한 결과입니다.</span>
		</div>
		<div class="detailSearch">
            <input class="searchInput" type="text" placeholder="검색어를 입력해주세요" size="81" style="font-size:30px;">
            <input class="searchIcon" type="submit" value="" style="color:#183058;">
        </div>
		<div class="detailBox">
			<div class="detailSearchList" style="width:37.5%;">공간유형
				<div class="selectBox">모든공간<span>&nbsp;&nbsp;&nbsp;▽</span></div>
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
				
			<div class="detailSearchList" style="width:37.5%;">지역
				<div class="selectBox">모든지역<span>&nbsp;&nbsp;&nbsp;▽</span></div>
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
			<div class="detailSearchList" style="width:25%;">
				
				<button id="detailSearchFilter" class="detailSearchBtn">필터</button>
			</div>
			<div class="filterOutLine">
				<div class="filterOutBox">
					<span>편의시설</span><span style="font-weight:100;">을 선택하세요.</span>
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
				<div class="filterOutBox" style="margin-top:20px; text-align:center">
					<button class="filterBtn" id="filterReset">초기화 하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="filterBtn" id="filterSubmit">필터 적용하기</button>
				</div>
			</div>
		</div>
		<div class="totalOutLine">
		
			<c:forEach items='${list }' var='s'>
				<div class='totalInnerBox'>
					<input class="inputNo" type="hidden" value='${s.s_no }'>
					<div style='height:250px; '>
						<img src='/upload/space/${s.s_img1}' class="bossImg" width="100%" height="250px">
					</div>
					<div style='height:140px; padding-left:5px;border:1px solid #e2e2e2;'>
						<div style="float:left;">
						<a class="likeClick" href="#">
							<img src="../img/like_border.png" class="like">
                    		<img src="../img/like_full_icon.png" class="like_full">
                    	</a>
                    	</div>
                    	
						<p style="font-size:20px; color:#f69b02; margin:5px 5px; line-height:40px;overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">&nbsp;&nbsp;${s.s_placeName}</p>
						
						&nbsp;<span style="clear:both;"><img src='/img/map-marker.png'>&nbsp;</span><span style="font-weight:100;">${s.addressCut}</span>
						<div style="font-weight:100;width:100%; height:22px; margin-bottom:5px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">&nbsp;${s.s_placeTag}</div>
						<c:if test="${s.s_type eq 'time' }">
							&nbsp;<span style="font-size:22px; color:#f69b02;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /></span><span style=""> 원/시간</span>
						</c:if>
						<c:if test="${s.s_type eq 'day' }">
							&nbsp;<span style="font-size:22px; color:#f69b02;">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /></span><span> 원/일</span>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="margin-bottom:50px;margin-left:20%;width:60%; height:50px; clear:left; text-align:center; border: 1px solid #f69b02;">
			<button id="viewMore">더보기</button>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
	
	<script type="text/javascript">
		$(document).ready(function() {
	var userNo = '${sessionScope.User.userNo}';
	$.ajax({
 		type:"GET",
 		url: "/likeSearchAjax?userNo="+userNo,
 		dataType: "json",                         // 서버에서 보내줄 데이터의 타입
        
 		success : function(data){
 			console.log(data);
 			for(var k=0; k<$('.inputNo').length; k++){
 				for(var i=0; i<data.length; i++){
 					
     				if($('.inputNo').eq(k).val()==data[i].sNo){
     					
     					$(".like").eq(k).css("display","none");
     					$(".like_full").eq(k).css("display","inline");
     				}
     			}
 			}
 			}
 		
 	});
	
	
	if('${sessionScope.User}' != ""){
    	  $(".like").click(function(){
    		  event.stopPropagation();
    		  	var imgIndex = $(".like").index(this);
             	var s_no = $(this).parent().parent().parent().prev().prev().val();
             	
             	
             	
             	$.ajax({
             		type:"GET",
             		url: "/likeInsertAjax?S_no="+s_no+"&userNo="+userNo,
             		success : function(data){
             			var result = data;
             			if(result==1){
             				$("#viewpage_alert").slideDown(700);
                         	$("#viewpage_alert").delay(400);
                         	$("#viewpage_alert").css("display","inline");
                         	$("#viewpage_alert").delay(400);
                         	$("#viewpage_alert").slideUp(700); 
                         	$(".like").eq(imgIndex).css("display","none");
                         	$(".like_full").eq(imgIndex).css("display","inline");
                         	$("#viewpage_alert p").html("내가 가고 싶은 공간에 등록되었습니다.");	
             			}
             		}
             	});
             });
             $(".like_full").click(function(){
            	 event.stopPropagation();
            	 var imgIndex = $(".like_full").index(this);
             	var s_no = $(this).parent().parent().parent().prev().prev().val();
             	
             	var userNo = '${sessionScope.User.userNo}';
             	console.log($(this).parent().html());
             	console.log(s_no);
             	console.log(userNo);
                 $.ajax({
             		type:"GET",
             		url: "/likeDeleteAjax?S_no="+s_no+"&userNo="+userNo,
             		success : function(data){
             			var result = data;
             			if(result==1){
            					$("#viewpage_alert").slideDown(700);
            	                $("#viewpage_alert").delay(400);
            	                $("#viewpage_alert").css("display","inline");
            	                $("#viewpage_alert").delay(400);
            	                $("#viewpage_alert").slideUp(700); 
            	                $(".like").eq(imgIndex).css("display","inline");
                             	$(".like_full").eq(imgIndex).css("display","none");
            	                $("#viewpage_alert p").html("내가 가고 싶은 공간에서 제외되었습니다.");
             				
             			}	
             		}
             	});
       		});
      }else{
    	  $(".like").click(function(){
    		  event.stopPropagation();
    		  $("#viewpage_alert").slideDown(700);
                $("#viewpage_alert").delay(400);
                $("#viewpage_alert").css("display","inline");
                $("#viewpage_alert").delay(400);
                $("#viewpage_alert").slideUp(700); 
                
                $("#viewpage_alert p").html("로그인 후 이용가능 합니다.");
    	  });
    	  
      }
	var filterCount = 0;
	var prepareNum=-1;
	$('.searchInput').val('${type}');
	var type = '${type}';
	var index = '${index }';
	if (index >= 0 && index < 12) {
		if($('.placeTypeDetail').eq(index).text()=='${type}'){
			$('.selectBox').eq(0).html('${type }<span>&nbsp;&nbsp;&nbsp;▽</span>');
			$('.selectBox').eq(0).css("color", "#f69b02")
			$('.placeTypeDetail').eq(index).css("background-color", "#183058");
			$('.placeTypeDetail').eq(index).css("color", "white");
		}
		inputType=1;
	} else if (index >= 12 && index < 20) {
		if($('.placeTypeDetail').eq(index).text()=='${type}'){
			$('.selectBox').eq(1).html('${type }<span>&nbsp;&nbsp;&nbsp;▽</span>');
			$('.selectBox').eq(1).css("color", "#f69b02")
			$('.placeTypeDetail').eq(index).css("background-color", "#183058");
			$('.placeTypeDetail').eq(index).css("color", "white");
		}
		inputType=2;
	} else {
		if($('.placeTypeDetail').eq(index).text()=='${type}'){
			$('.selectBox').eq(2).html('${type }<span>▽</span>');
		}
		inputType=3;
	}
	
	for(var i = 0; i<6; i++){
		$('.totalInnerBox').eq(i).css("display","block");
	}


	$('.selectBox').click(function() {
		var selectNum = $('.selectBox').index(this);
		
			$('.selectBox').find('span').html('&nbsp;&nbsp;&nbsp;▽');
			$('.selectBox').next().css("display", "none");
			$('.filterOutLine').css("display","none");
		if(prepareNum!=selectNum){
			$('.selectBox').eq(selectNum).find('span').html('&nbsp;&nbsp;&nbsp;▲');
			$('.selectBox').eq(selectNum).next().css("display", "block");
			prepareNum = selectNum;
		}else{
			prepareNum=-1;
		}
		filterCount = 0;
	});
	
	$('.placeTypeDetail').click(function() {
		
		var index = $('.placeTypeDetail').index(this);
		var type = $('.placeTypeDetail').eq(index).text();
		if(index>-1 && index<12){
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
			$('.selectBox').find('span').html('&nbsp;&nbsp;&nbsp;▽');
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
	
	var filterArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var filterCount = 0;
	$('.filterBox').click(function(){
		
		var filterIndex = $('.filterBox').index(this);
		$(this).toggleClass("selectFilter");
		if($(this).hasClass("selectFilter")){
			filterArray[filterIndex] = 1;
		}else{
			filterArray[filterIndex] = 0;
		}
		console.log(filterArray);
	});
	
	var viewIndex = 6;//공간 리스트 인덱스
	$('#viewMore').click(function(){
		for(var i = viewIndex; i<viewIndex+6; i++){
			$('.totalInnerBox').eq(i).css("display","block");
		}
		viewIndex = viewIndex+6;
	});
	
	$('#filterReset').click(function(){
		$('#filterCheck').prop("checked", false);
		filterArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		$(".selectFilter").removeClass("selectFilter");
	});
	$('#filterSubmit').click(function(){
		var filter = filterArray.join("");
		console.log(filter);
		location.href = "/filterSearch?type=" + type + "&index=" + index + "&inputType=" + inputType +"&filter="+filter;
	});
	
});
	</script>
	
</body>
</html>