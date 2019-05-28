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
		<div class="section_content" style="margin: 0 auto;">
			<center>
			<form action="/insertNotice" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<th>공지사항 작성</th>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="noticeTitle"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							겟작성자아디
							<input type="hidden" name="noticeWriter" value="겟작성자아디">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="noticefilename">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="noticeContent" rows="3" cols="40"></textarea>
						</td>
					</tr>
					<tr style="text-align: center;">
						<th colspan="2">
							<button type="submit">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
			</center>
		</div>
	</section>
</body>
</html>