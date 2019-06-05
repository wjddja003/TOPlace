<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
		<div  style="text-align:center; width:80%; margin:0 auto; border:1px solid #000;">
			<form action="/insertReview" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${s.s_no}" name="reviewSno">
				<table class="table table-bordered">
					<tr>
						<th colspan="2" style="font-size:20px; font-weight:bold;">리뷰게시판 작성</th>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>
							
							<input type="text" name="reviewWriter" value="user" readonly>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
						
							<input type="text" name="reviewTitle">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">						
						</td>
					</tr>
					<tr>
						<th>이미지보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="3" class="form-control" name="reviewContent"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script>
		function loadImg(f){
			if(f.files.length!=0 && f.files[0]!=0){// f.files input창에서 선택한 파일들을 배열 형태로 가져옴 f.files[0]!=0 파일의 크기가 0이 아니면
				//js의 FileReader객체 -> 객체 내부의 result라는 속성에 파일 컨텐츠가 있음
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
				reader.onload=function(e){
					$("#img-view").attr('src',e.target.result);
				}
			}else{		//파일 올렸다가 지웠을 때
				$("#img-view").attr('src','');
			}
		}
	</script>
</body>
</html>