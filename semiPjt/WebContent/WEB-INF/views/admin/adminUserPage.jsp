<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
    <div class="section_content">
    	 <div class="table-wrapper">
            <table class="table">
                <tr>
                    <th colspan="5" style="font-size:20px; font-weight:bold" id="nlist">회원관리</th>
                </tr>
                <tr>
                    <th>회원번호</th><th>회원아이디</th><th>회원이름</th><th>가입일</th><th>
                </tr>
                <c:forEach items="${up.list}" var="u">
               		<tr class="n_tr">
	                    <td>${u.userNo }</td>
	                    <td>${u.userId }</td>
	                    <td>${u.userName }</td>
	                    <td>${u.enrollDate }</td>
	                    <td>	
                            <button class="reviewBtn"style="color:#f69b02; border-color:#f69b02"><a href="/noticeDelete?noticeNo=${n.noticeNo }"style="color:#f69b02">삭제</a></button>
						</td>
                    </tr>
                </c:forEach>
            </table>
            <div>${u.pageNavi}</div>
        </div>
    </div>
    </section>
</body>
</html>