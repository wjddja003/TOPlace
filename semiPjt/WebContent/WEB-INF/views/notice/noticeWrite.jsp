<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		<div class="section_content" style="margin: 0 auto;">
			<center>
			<form action="/insertNotice" method="post" enctype="multipart/form-data">
				<table class="table" style="text-align:left;margin-top: 100px">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold;background: #f69b02;color: white;text-align: center">공지사항 등록</th>				
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="noticeTitle" style="width:1050px"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							${sessionScope.User.userId }
							<input type="hidden" name="noticeWriter" value="${sessionScope.User.userId }">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="noticefilename" value="filname">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="noticeContent" rows="3" cols="40" style="width:1050px;overflow:visible"></textarea>
						</td>
					</tr>
					<tr style="text-align: center;">
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary" style="color: #f69b02;border-color: #f69b02">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
			</center>
		</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>