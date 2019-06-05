<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
		<div class="table-wrapper" style="text-align: center;width:80%;margin:0 auto;">
		<form action="/reviewUpdate" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<input type="hidden" name="reviewNo" value="${review.reviewNo }">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">공지사항</th>				
					</tr>
<!-- 					<tr> -->
<!-- 						<th>제목</th> -->
<%-- 						<td><input type="text" class="form-control" name="reviewTitle" value="<%=n.getNoticeTitle() %>"></td> --%>
<!-- 					</tr> -->
					<tr>					
						<th>작성자</th>
						<td>${review.reviewWriter }</td>					
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
						<div class="placeholder">
							<span style="color:black">파일유형 jpg, jpeg, png, gif<br>
									최대파일크기 10MB</span>
						</div>
						<div class="file_box">
							<label for="hostFile" style="width: 100%; background: #183058; text-align: center;">
							<span style="color:white;">파일첨부</span>
							<img src="/upload/review/${review.filename}" style="width:300px; height:300px;" >
							<input type="hidden" name="oldFilename" value="${review.filename}">  <!--예전파일명 -->
							<input type="file" name="filename" id="reviewFile" accept="image/*" onchange="loadImg(this)" value="${review.filename}">
							</label>
						</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="reviewContent" class="form-control" rows="3">${review.reviewContent }</textarea> </td>
						
					</tr>
					<tr>
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">수정하기</button>
						</th>
					</tr>
				</table>
		</form>
		</div>
		</section>
		<script>
		function loadImg(event){
			if(event.files.length!=0 && event.files[0] != 0){
				var reader = new FileReader();
				reader.readAsDataURL(event.files[0]);
				reader.onload = function(e){
					console.log($("#hostFile").val());
					$(".file_img").attr("src",e.target.result);
					$(".file_img").css("background-size","cover");
					
				}
			}else{
				$(".file_img").attr("style","background-image:url(/img/logo.png)");
				$(".file_img").css("background-size","contain");
			}
			
		}
		</script>
</body>
</html>