<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="qaSy.model.vo.QaComment" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="qaSy.model.vo.QaPageData" %>
    <%@ page import="user.model.vo.User" %>
    <%
    	QaPageData pd = (QaPageData)request.getAttribute("pd");
    	ArrayList<QaComment> list = pd.getList();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    #review_page{
        background-color: #f7f7f7;
        width: 100%;
        height: 400px;
    }
    .h_intro{
        padding-bottom: 16px;
        margin-bottom: 28px;
    }
    .h_intro_b{
        position: absolute;
        top: 135px;
        height: 4px;
        width: 20px;
        background-color: #f69b02;
    }
     .table_toggle{
         margin-top: 60px;
         font-size:15px;
         width:100%;
    }
    .table_toggle tbody tr{
        height: 60px;
    }
    .table_toggle tbody tr:nth-child(2n+1){
        background-color: #f7f7f7;
    }
     .table_toggle>tbody>tr:first-child>td{
         border-top: 2px solid #656565;
     }
    .viewpage_qnaview{
    width: 773px;
    text-align: center;
    }
    .viewpage_qna_header h4{
        float: left;
        border-bottom: 3px solid #f69b02;
        font-size: 18px;
    }
    .viewpage_qna_header a{
        border: 1px solid #f69b02;
        border-radius: 50px;
        margin-left: 35px;
        background-color: #f69b02;
        text-decoration: none;
        color: #fff;
        width: 150px;
        text-align: center;
        float:right;
    }
    .viewpage_qnaview{
        height: 300px;
        line-height: 90px;
        text-align: center;
    }
    .viewpage_qnaview p{
        font-size: 22px;
    }
    .table_toggle tbody tr{
         height: 60px;
    }
    .table_toggle tbody tr:nth-child(2n+1){
         background-color: #f7f7f7;
    }
    .table_toggle>tbody>tr:first-child>td{
         border-top: 2px solid #656565;
    }
        
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    
	<section>
        <div class="section_content">
            <div class="viewpage_qna">
                <div class="viewpage_qna_header">
                    <h4>Q&amp;A 0개</h4>
                    <a href="#" style="text-decoration: none;"><span>질문작성하기</span></a>
                </div>
                <div class="viewpage_qnaview">
                    <table class="table_toggle">
                    	<tr>
                    		<th>공간명</th><th>내용</th><th>작성일</th><th></th>
                    	</tr>
                    	<c:forEach items="${pd.list }" var="q">
                    		<c:if test="${q.qaCommentRef eq 0}">
	                    	<tr>
	                    		<td>${q.qaCommentNo }</td>
	                    		<td>${q.qaCommentContent }</td>
	                    		<td>${q.qaCommentDate }</td>
	                    		<td>
		                    		<a class="btn btn-outline-primary btn-sm btn1"style="color:#f69b02; border-color:#f69b02" href="/qaDelete?qaCommentNo=${q.qaCommentNo }">삭제</a>
									<a class="btn btn-outline-primary btn-sm btn1"style="color:#f69b02; border-color:#f69b02" href="/qaUpdate?qaCommentNo=${q.qaCommentNo }">수정</a> 
								</td>
	                    	</tr>
	                    	</c:if>
	                    	<c:forEach items="${pd.listAll}" var="q1">
	                    		<c:if test="${q1.qaCommentRef eq q.qaCommentNo}">
			                    	<tr>
			                    		<td>댓글이요</td>
			                    		<td>${q1.qaCommentNo }</td>
			                    		<td>${q1.qaCommentContent }</td>
			                    		<td>${q1.qaCommentDate }</td>
			                    	</tr>
	                    		</c:if>
	                    	</c:forEach>
                    	</c:forEach>
                    </table>
                    <div><%= pd.getPageNavi() %></div>
                </div>
            </div>
                <a class="btn btn-outline-primary btn-sm" href="/qaCommentInsert"style="color:#f69b02; border-color:#f69b02">글쓰기</a>
        </div>
	</section>
	
</body>
</html>