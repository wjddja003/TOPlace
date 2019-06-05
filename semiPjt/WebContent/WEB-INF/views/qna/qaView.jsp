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
     #rq{
         font-size: 18px;
        border-top:1px solid #183058;
    	text-align: center;
        margin: 30px 0 0 0;
        width: 1000px;
        height: 70px;
        background: #e2e2e2;
    }
    
    .review{
      
        color: #183058;
        float: left;
        width: 50%;
        height: 70px;
    }
    .qa{
        background-color: #f69b02;
        color: #f7f7f7;
        float: left;
        width: 50%;
         height: 70px;
    }
    #qa_view{
        
        margin: 0 auto;
        width: 1000px;
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
        padding: 10px;
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
    .reviewBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
    }
</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                    <a href="/reviewList2">
                        <div class="review"><p style="line-height:70px">REVIEW</p></div>
                    </a>
                    <a href="/qaView">
                        <div class="qa"><p style="line-height:70px">Q＆A</p></div>
                    </a>
                </div>
                <c:forEach items="${pd.list }" var="q">
                	 
                	<c:if test="${sessionScope.User.userId == q.qaCommentWriter}">
                <div class="qa_v">
              
                    <div class="qa_no">
                        <div class="comment">
                            공간명 :${q.qaCommentNo }<br>
                            ${q.qaCommentContent }<br>
                    	</div>
                        <div class="Q_btn">
                        ${q.qaCommentDate }<br>
                            <button class="reviewBtn"style="color:#f69b02; border-color:#f69b02" href="/qaCommentDelete?qaCommentNo=${q.qaCommentNo }">삭제</button>
                           	<button class="reviewBtn"style="color:#f69b02; border-color:#f69b02" href="/qaCommentUpdate?qaCommentNo=${q.qaCommentNo }">수정</button>
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