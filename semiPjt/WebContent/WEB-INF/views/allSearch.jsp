<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			width:33.3%;
			padding:10px;
			cursor: pointer;
			float:left;
			display:none;
		}
		#viewMore{
			width:200px;
			height:50px;
			margin-top:30px;
		}
		.searchInfo{
			width:100%;
			height:70px;
			margin-top: 30px;
		}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
	<div class="section_content">
	<div class="totalOutLine">
		<div class="searchInfo">
			<span id="selectVal" style="color:blue;font-weight:bold;font-size:30px; border-bottom:4px solid blue">모든 공간보기</span><span style="font-weight:100;font-size:20px;">  검색 결과</span>
			<span style="float:right;">
				<select id="selectType" name="selectType" style="height:50px;">
				  <option value="S_hit">조회수 순으로</option>
				  <option value="S_like">좋아요 순으로</option>
				</select>
			</span>
		</div>
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
		var viewIndex = 6;
		$(document).ready(function() {
			for(var i = 0; i<6; i++){
				$('.totalInnerBox').eq(i).css("display","block");
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
		
		$('#selectVal').text($('#selectType').val('${type}'));
		$('#selectType').change(function(){
			$('#selectVal').text($('#selectType option:selected').text());
			var typeSel = $(this).val(); 
			location.href = "/viewsAll?type=" + typeSel;
		});
		</script>
</body>
</html>