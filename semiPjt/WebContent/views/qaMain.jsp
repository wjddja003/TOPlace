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
        border-top:1px solid #183058;
    	text-align: center;
        margin: 0 auto;
        width: 1000px;
        height: 70px;
        background: #e2e2e2;
    }
    .review{
        border-right: 1px solid #183058;
        color: #183058;
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
</style>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="rq">
            	<a href="/reviewList2">
                	<div class="review"><h3>리뷰</h3></div>
                </a>
                <a href="/qaView">
                	<div class="qa"><h3>Q＆A</h3></div>
                </a>
            </div>
        </div>
    </section>
    
</body>
</html>