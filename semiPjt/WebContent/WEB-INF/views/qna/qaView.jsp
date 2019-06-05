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
</head>
<style>
    #qa_view{
        
        margin: 0 auto;
        width: 1000px;
    }
    .qa_header{
        color: #f7f7f7;
        background-color: #183058;
        border: 1px solid black;
        width: 100%;
        height: 50px;
        text-align: center;
    }
    .qa_v{
        text-align: center;
        width: 300px;
        margin: 0 20px 0 0;
        padding: 10px;
        height: 100%;
        float: left;
    }
    .qa_no{
        float: left;
        margin: 20px 0 0 20px;
        border: 1px solid #e2e2e2;
        width: 300px;
        height: 150px;
        overflow: hidden;
        position: relative;
        text-align: center;
    }
    .Q_btn{
        margin-left: 100px;
        position: absolute;
        bottom: 0;
    }
    .qa_navi{
    	clear: both;
    	text-align: center;
    }
</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div class="qa_header">
                	<h3>Q＆A</h3>
                </div>
                <c:forEach items="${pd.list }" var="q">
                	 
                	<c:if test="${sessionScope.User.userId == q.qaCommentWriter}">
                <div class="qa_v">
              
                    <div class="qa_no">
                    	공간명 :${q.qaCommentNo }<br>
                    	${q.qaCommentContent }<br>
                    	
                        <div class="Q_btn">
                        ${q.qaCommentDate }<br>
                            <a class="btn btn-outline-primary btn-sm btn1"style="color:#f69b02; border-color:#f69b02" href="/qaCommentDelete?qaCommentNo=${q.qaCommentNo }">삭제</a>
                           	<a class="btn btn-outline-primary btn-sm btn1"style="color:#f69b02; border-color:#f69b02" href="/qaCommentUpdate?qaCommentNo=${q.qaCommentNo }">수정</a>
                        </div>
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="qa_navi"><%=pd.getPageNavi() %></div>
            </div>
        </div>
    </section>
</body>
</html>