<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    #rq{
        font-size: 18px;
    	text-align: center;
        margin: 30px 0 0 0;
        width: 1000px;
        height: 70px;
        background: #e2e2e2;
    }
    
    .review{
         background-color: #f69b02;
        color: #f7f7f7;
        
        float: left;
        width: 50%;
        height: 70px;
    }
    .qa{
        color: #183058;
        float: left;
        width: 50%;
         height: 70px;
    }
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
        margin: 50px 20px 0 0;
        padding: 10px;
        height: 100%;
        float: left;
    }
    .rv_no{
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
    .re_navi{
    	clear: both;
    	text-align: center;
    }
    .reviewBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
    }
    .rv_no a{
    	float: left;
    }
    .rdate{
		font-size: 13px;
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
                <c:forEach items="${pd.list }" var="r">
                	 
                	<c:if test="${sessionScope.User.userId == r.reviewWriter}">
                <div class="qa_v">
              
                    <div class="rv_no">
                    	<a style="color:#f69b02;font-size:14px;"> 공간명 : ${r.placeName }</a><br>
                    	<a>${r.reviewTitle }</a><br>
                    	
                        <div class="Q_btn">
	                        <a class="rdate" style="color:#605f5d">${r.reviewDate }</a><br>
	                        <a href="/selectOneSpace?S_no=${r.reviewSno}"> <button class="reviewBtn"style="color:#f69b02; border-color:#f69b02">리뷰보러가기</button></a>
                        </div>
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="re_navi">${pd.pageNavi }</div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>