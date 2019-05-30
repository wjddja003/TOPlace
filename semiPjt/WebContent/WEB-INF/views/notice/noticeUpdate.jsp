<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="noticeSy.model.vo.Notice"%>
    <%
    	Notice n = (Notice)request.getAttribute("notice");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"/>

<!--  -->
	<section>
		<div class="table-wrapper" style="text-align: center;width:80%;margin:0 auto;">
		<form action="/noticeUpdateEnd" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">공지사항</th>				
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" name="noticeTitle" value="<%=n.getNoticeTitle()%>"></td>
					</tr>
					<tr>					
						<th>작성자</th>
						<td><%=n.getNoticeWriter() %></td>					
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="hidden" id="status" name="status" value="stay">
							<%if(n.getFilepath()!=null){ %>
							<img class="delFile" src="/img/file.png" width="16px">
							<input type="file" name="filename" id="file" style="display:none">
							<span class="delFile"><%=n.getFilename() %></span>
							<button type="button" id="fileDelBtn" class="btn btn-primary btn-sm delFile">삭제</button> 
							<input type="hidden" name="oldFilename" value="<%=n.getFilename()%>">
							<input type="hidden" name="oldFilepath" value="<%=n.getFilepath()%>">
							<%} else {%>
							<input type="file" name="filename">
							<%} %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="noticeContent" class="form-control" rows="3"><%=n.getNoticeContent()%></textarea></td>
						
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
</body>
<script>
	$(document).ready(function(){
		$("#fileDelBtn").click(function(){
			if(confirm("첨부파일을 삭제하시겠습니까?")){
				$(".delFile").hide();
				$("#file").show();
				$("#status").val("delete");
			}
		})
	})
		
	</script>
</html>