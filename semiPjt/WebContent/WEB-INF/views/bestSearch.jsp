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
			height:800px;
			margin-top:10px;
			margin-bottom:10px;
			clear:left;
			
		}
		.totalInnerBox{
			margin: 10px 5px;
			width:32%;
			height:410px;
			padding:5px;
			cursor: pointer;
			float:left;
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
			<span id="selectVal" style="color:#f69b02;font-weight:bold;font-size:30px; border-bottom:4px solid #f69b02">조회수순 공간보기</span><span style="font-weight:100;font-size:20px;">  검색 결과</span>
		</div>
			<c:forEach items='${hitList }' var='hits'>
				<div class='totalInnerBox'>
					<input type="hidden" value='${hits.s_no }'>
					<div style='height:250px;'>
						<img src='/upload/space/${hits.s_img1}' width="100%" height="250px">
					</div>
					<div style='height:140px; padding-left:5px;border:1px solid #f69b02;'>
						<p style="font-size:20px; color:#f69b02; margin:5px 5px; line-height:40px;">&nbsp;&nbsp;${hits.s_placeName}</p>
						
						&nbsp;<span style="clear:both;"><img src='/img/map-marker.png'>&nbsp;</span><span>${hits.addressCut}</span>
						<div style="width:100%; height:22px; margin-bottom:5px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">&nbsp;${hits.s_placeTag}</div>
						<c:if test="${hits.s_type eq 'time' }">
							&nbsp;<span style="font-size:22px; color:#f69b02;">￦ ${hits.s_price1}</span><span style=""> 원/시간</span>
						</c:if>
						<c:if test="${hits.s_type eq 'day' }">
							&nbsp;<span style="font-size:22px; color:#f69b02;">￦ ${hits.s_price1}</span><span> 원/일</span>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="totalOutLine">
		<div class="searchInfo">
			<span id="selectVal" style="color:#f69b02;font-weight:bold;font-size:30px; border-bottom:4px solid #f69b02">좋아요순 공간보기</span><span style="font-weight:100;font-size:20px;">  검색 결과</span>
		</div>
			<c:forEach items='${likeList }' var='likes'>
				<div class='totalInnerBox'>
					<input type="hidden" value='${likes.s_no }'>
					<div style='height:200px;'>
						<img src='/upload/space/${likes.s_img1}' width="100%" height="200px">
					</div>
					<div style='height:120px;'>
						<p style="font-size:20px; color:#f69b02; margin:5px 5px; line-height:40px;">&nbsp;&nbsp;${likes.s_placeName}</p>
						
						&nbsp;<span style="clear:both;"><img src='/img/map-marker.png'>&nbsp;</span><span>${likes.addressCut}</span>
						<div style="width:100%; height:22px; margin-bottom:5px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">&nbsp;${likes.s_placeTag}</div>
						<c:if test="${likes.s_type eq 'time' }">
							&nbsp;<span style="font-size:22px; color:#183058;">￦ ${likes.s_price1}</span><span style=""> 원/시간</span>
						</c:if>
						<c:if test="${likes.s_type eq 'day' }">
							<span style="font-size:22px; color:#183058;">￦ ${likes.s_price1}</span><span> 원/일</span>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
		
		<script type="text/javascript">
		$(document).ready(function() {
			
		});
		$('.totalInnerBox').click(function(){
			
			var sNumber = $(this).find('input').val();
			location.href = "/selectOneSpace?S_no="+sNumber;
		});
		
		</script>
</body>
</html>