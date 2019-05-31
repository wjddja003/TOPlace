<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.model.vo.User" %>
    <%@ page import="noticeSy.model.vo.Notice" %>
    <% 
    	 User u = (User)session.getAttribute("User");
    %>
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
			<form action="/insertHelp" method="post" enctype="multipart/form-data">
				<table class="table table-bordered" style="text-align:left;">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">공지사항</th>				
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="helpTitle" style="width:1050px"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%=u.getUserId()%>
							<input type="hidden" name="helpWriter" value="<%=u.getUserId()%>">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="helpfilename" value="filname">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="helpContent" rows="3" cols="40" style="width:1050px;overflow:visible"></textarea>
						</td>
					</tr>
					<tr style="text-align: center;">
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
			</center>
		</div>
	</section>

</body>
</html>