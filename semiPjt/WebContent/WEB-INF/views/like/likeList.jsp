<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="space.model.vo.Space" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    .totalOutLine{
			width:100%;
			margin-top:10px;
			margin-bottom:10px;
			clear:left;
		}
		.totalInnerBox{
			margin: 10px 5px;
			width:49%;
			padding:5px;
			cursor: pointer;
			float:left;
			display:none;
			
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
	        width:40px;
	    	height: 40px;
	    }
	    .like{
	    	width:40px;
	    	height: 40px;
	    }
		.kategorie1{
			float:left;
			text-align: center;
			width:14%;
		}
		.kategorie2{
			
			clear:both;
			height:290px;
		}
		.scale {
			  transform: scale(1);
			  -webkit-transform: scale(1);
			  -moz-transform: scale(1);
			  -ms-transform: scale(1);
			  -o-transform: scale(1);
			  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		}
		.scale:hover {
			  transform: scale(1.2);
			  -webkit-transform: scale(1.2);
			  -moz-transform: scale(1.2);
			  -ms-transform: scale(1.2);
			  -o-transform: scale(1.2);
		}
		.scale_img{
			width:100%; height:250px; overflow:hidden;
		}
</style>
<body>				
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
	<div id="viewpage_alert"><p></p></div>
	<div class="section_content">
	<div class="totalOutLine">
		<div class="searchInfo">
			<span id="selectVal" style="color:#f69b02;font-weight:bold;font-size:30px; border-bottom:4px solid #f69b02">내가 가고싶은 공간</span><span style="font-weight:100;font-size:20px;">  검색 결과</span>
		</div>
        <c:forEach items="${pd.list }" var="l">
        	<c:if test="${sessionScope.User.userNo == l.userNo}">
                <div class='totalInnerBox'>
					<input class="inputNo" type="hidden" value='${l.sNo }'>
					<div class="scale_img">
						<div class="scale" style='height:250px; '>
							<img src='/upload/space/${l.img}' class="bossImg" width="100%" height="250px">
						</div>
					</div>
					<div style='height:460px; padding-left:5px;border:1px solid #e2e2e2;'>
						<div style="float:left;">
							<a class="likeClick" href="#">
								<img src="../img/like_border.png" class="like">
	                    		<img src="../img/like_full_icon.png" class="like_full">
	                    	</a>
                    	</div>
                    	
						<p style="font-size:20px; color:#f69b02; margin:5px 5px; line-height:40px;">&nbsp;&nbsp;${l.placeName}</p>
						
						&nbsp;<span style="clear:both;"><img src='/img/map-marker.png'>&nbsp;</span><span>${l.addressCut}</span>
						<div style="width:100%; height:22px; margin-top:10px;margin-bottom:20px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">
							&nbsp;${l.placeTag}
						</div>
                    	<div class="kategorie2">
	                    	<c:forEach items="${l.s_kategorie2}" var="list" varStatus="i">
	                        	<c:if test="${list == '1'}">
	                            	<div class="kategorie1"><img src="/upload/space/kategorie2/${i.index+1}.png" width="30px;">
	                                	<p>${l.s_kategorieName[i.index]}</p>
	                                </div>
	                           	</c:if>
	                           	<c:if test="${list == '0'}">
	                            	<div class="kategorie1" style="opacity:0.1;"><img src="/upload/space/kategorie2/${i.index+1}.png" width="30px;">
	                                	<p>${l.s_kategorieName[i.index]}</p>
	                                </div>
	                           	</c:if>
	                        </c:forEach>
                       	</div>
                       	<c:if test="${l.type eq 'time' }">
							&nbsp;<span style="font-size:24px; color:#f69b02;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${l.price}" /></span><span style=""> 원/시간</span>
						</c:if>
						<c:if test="${l.type eq 'day' }">
							&nbsp;<span style="font-size:24px; color:#f69b02;">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${l.price}" /></span><span> 원/일</span>
						</c:if>   
	                  </div>
                        
                   </div>
                   </c:if>
                </c:forEach>
             </div>
             <div style="margin-bottom:50px;margin-left:20%;width:60%; height:50px; clear:left; text-align:center; border: 1px solid #f69b02;">
				<button id="viewMore">더보기</button>
			</div>
         </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script type="text/javascript">
		var viewIndex = 4;
		$(document).ready(function() {
			for(var i = 0; i<4; i++){
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
	                     location.href="/likeList";
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
			for(var i = viewIndex; i<viewIndex+4; i++){
				$('.totalInnerBox').eq(i).css("display","block");
			}
			viewIndex = viewIndex+4;
		});
		
		</script>
</body>
</html>