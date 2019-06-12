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
    .rv_no{
        padding: 10px;
        float: left;
        margin: 20px 50px 0 50px;
        border: 1px solid #e2e2e2;
        width: 400px;
        overflow: hidden;
        position: relative;
        text-align: center;
    }
    .Q_btn{
        
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
    .rdate{
		font-size: 13px;
		text-align: right;
		padding: 0 0 0 300px;
	}
	.on{
		color:#f69b02;
	}
	.reviewImg{
		width: 100%;
		height: 200px;
	}
	.reviewText{
		margin: 5px;
		font-size:17px;
		text-align: left;
	}
</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                    <a href="/adminReviewPage">
                        <div class="review"><p style="line-height:70px">REVIEW</p></div>
                    </a>
                    <a href="/adminQaPage">
                        <div class="qa"><p style="line-height:70px">Q＆A</p></div>
                    </a>
                </div>
                <div class="qa_v">
                	<c:forEach items="${pd.list }" var="r">
                    <div class="rv_no">
                    <c:choose>
                    	<c:when test="${not empty r.filename}">
	                    	<div class="imgBox">
	                			<img class="reviewImg" src="/upload/review/${r.filename}">
	                		</div>
                		</c:when>
                		<c:otherwise>
                			<div class="imgBox">
                				<img class="reviewImg" src="/img/logo.png">
                			</div>
                		</c:otherwise>
                	</c:choose>          
                    	<p class="reviewText" ><span style="color:#f69b02;">공간명 : </span>${r.placeName }</p>
                    	<p class="reviewText" ><span style="color:#f69b02;">별점 : </span>
                    	<c:forEach  begin="1" end='${r.reviewStar}'>
						<span class="on">★</span>
						</c:forEach>
						<c:forEach  begin="${r.reviewStar}" end='4'>
							<span style="color:#e2e2e2;">★</span>
						</c:forEach></p>
                    	<p class="reviewText"><span style="color:#f69b02;">제목 : </span>${r.reviewTitle}</p>
                    	<span class="rdate" style="color:#605f5d">${r.reviewDate }</span>                   	
                        <div class="Q_btn">
	                        
	                        <a href="/reviewDelete?reviewNo=${r.reviewNo}"><button type="button" class="reviewBtn"style="color:#f69b02; border-color:#f69b02">삭제</button></a>
	                        <a href="/selectOneSpace?S_no=${r.reviewSno}"> <button class="reviewBtn"style="color:#f69b02; border-color:#f69b02">리뷰보러가기</button></a>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                	
               
               <div class="re_navi">${pd.pageNavi }</div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>