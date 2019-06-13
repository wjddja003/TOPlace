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
		.searchInfo{
			width:100%;
			height:70px;
			margin-top: 30px;
		}
		.like_full{
	        display: none;
	        width:30px;
	    	height: 30px;
	    }
	    .like{
	    	width:30px;
	    	height: 30px;
	    }
	    
	    
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
	<div id="viewpage_alert"><p></p></div>
	<div class="section_content">
	<div class="totalOutLine">
		<div class="searchInfo">
			<span id="selectVal" style="color:#f69b02;font-weight:bold;font-size:30px; border-bottom:4px solid #f69b02">모든 공간보기</span><span style="font-weight:100;font-size:20px;">  검색 결과</span>
		</div>
			<c:forEach items='${list }' var='s'>
				<div class='totalInnerBox'>
					<input class="inputNo" type="hidden" value='${s.s_no }'>
					<div style='height:250px; '>
						<img src='/upload/space/${s.s_img1}' class="bossImg" width="100%" height="250px">
					</div>
					<div style='height:140px; padding-left:5px;border:1px solid #e2e2e2;'>
						<div style="float:left; margin-top:10px;">
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
							&nbsp;<span style="font-size:22px; color:#f69b02;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" /></span><span> 원/일</span>
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
		var viewIndex = 6;
		$(document).ready(function() {
			for(var i = 0; i<6; i++){
				$('.totalInnerBox').eq(i).css("display","block");
			}
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
		});
		
		
		$('.totalInnerBox').click(function(){
			
			var sNumber = $(this).find('input').val();
			location.href = "/selectOneSpace?S_no="+sNumber;
		});
		$('#viewMore').click(function(){
			for(var i = viewIndex; i<viewIndex+6; i++){
				$('.totalInnerBox').eq(i).css("display","block");
			}
			viewIndex = viewIndex+6;
		});
		
		</script>
</body>
</html>