<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/reviewUpdate.css">
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
		<div class="table-wrapper" style="text-align: center;width:80%;margin:0 auto; margin-top: 100px;">
		<form action="/reviewUpdate" method="post" enctype="multipart/form-data">
				<table class="table">
					<input type="hidden" name="reviewSno" value="${review.reviewSno }">
					<input type="hidden" name="reviewNo" value="${review.reviewNo }">
					<tr class="reviewupdate_tr">
						<th colspan="2" style="font-size:20px;font-weight:bold">공지사항수정</th>				
					</tr>
<!-- 					<tr> -->
<!-- 						<th>제목</th> -->
<%-- 						<td><input type="text" class="form-control" name="reviewTitle" value="<%=n.getNoticeTitle() %>"></td> --%>
<!-- 					</tr> -->
					<tr>					
						<th>작성자</th>
						<td>${review.reviewWriter}</td>					
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
						<div class="placeholder">
							<span style="color:black; font-size:14px;">*파일유형 jpg, jpeg, png, gif
									최대파일크기 10MB</span>
						</div>
						<div class="file_box">
							<label for="hostFile" style="width: 100%; text-align: center;">
							<span style="color:white;">파일첨부</span>
							<c:if test="${not empty review.filename}">
								<img src="/upload/review/${review.filename}" style="width:300px; height:300px;" class="file_img" >
							</c:if>
							<input type="hidden" name="oldFilename" value="${review.filename}">  <!--예전파일명 -->
							<input type="file" name="filename" id="reviewFile" accept="image/*" onchange="loadImg(this)" value="${review.filename}">
							<button type="button" class="btn btn-outline-primary" id="imgdelete">삭제하기</button>
							</label>
						</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="reviewContent" class="form-control" rows="3">${review.reviewContent }</textarea> </td>
						
					</tr>
					<tr>
						<th>별점</th>
						<td> 
							
							<p class="star_rating">
								<c:forEach  begin="1" end='${review.reviewStar}'>
									<a href="#" class="on" style="text-decoration:none;">★</a>
								</c:forEach>
								<c:forEach  begin="${review.reviewStar}" end='4'>
									<a href="#" style="text-decoration:none;">★</a>
								</c:forEach>
							        <input type="hidden" class="star" name="reviewStar" value="${review.reviewStar}">
						    </p>
						 </td>
						
					</tr>
					<tr>
						<th colspan="2" style="text-align:center;">
							<button type="submit" class="btn btn-outline-primary">수정하기</button>
						</th>
					</tr>
					
				</table>
		</form>
		</div>
		</section>
		 <jsp:include page="/WEB-INF/common/footer.jsp"/>
		<script>
		function loadImg(event){
			if(event.files.length!=0 && event.files[0] != 0){
				var reader = new FileReader();
				reader.readAsDataURL(event.files[0]);
				reader.onload = function(e){
					$(".file_img").attr("src",e.target.result);
					$(".file_img").show();
				}
			}else{
				$(".file_img").attr("style","background-image:url(/img/logo.png)");
				
			}
		}
		 $("#imgdelete").click(function(){
			 $("#reviewFile").val("");
			 console.log( $("#reviewFile").val());
			 $(".file_img").hide();
		 });
		 $( ".star_rating a" ).click(function() {
	         $(this).parent().children("a").removeClass("on");
	         $(this).addClass("on").prevAll("a").addClass("on");
	         $(".star").val($('.on').length);
	         console.log($(".star").val());
	         return false;
	    });
		</script>
