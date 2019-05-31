<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="helpSy.model.vo.Help"%>
    <%
    	Help h = (Help)request.getAttribute("help");
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
		<form action="/helpUpdateEnd" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<input type="hidden" name="helpNo" value="<%=h.getHelpNo() %>">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">도움말</th>				
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
						<select id="help_cat" name="type" style="float: left;">
	                        <option value="all">전체</option>
	                        <option value="member">회원</option>
	                        <option value="pay">예약 및 결제</option>
	                        <option value="cancel">취소 및 환불</option>
	                        <option value="use">공간이용 및 후기</option>
	                        <option value="other">기타</option>
	                    </select>
	                    </td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" name="helpTitle" value="<%=h.getHelpTitle()%>"></td>
					</tr>
					
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="hidden" id="status" name="status" value="stay">
							<%if(h.getFilepath()!=null){ %>
							<img class="delFile" src="/img/file.png" width="16px">
							<input type="file" name="filename" id="file" style="display:none">
							<span class="delFile"><%=h.getFilename() %></span>
							<button type="button" id="fileDelBtn" class="btn btn-primary btn-sm delFile">삭제</button> 
							<input type="hidden" name="oldFilename" value="<%=h.getFilename()%>">
							<input type="hidden" name="oldFilepath" value="<%=h.getFilepath()%>">
							<%} else {%>
							<input type="file" name="filename">
							<%} %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="helpContent" class="form-control" rows="3"><%=h.getHelpContent()%></textarea></td>
						
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