<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="helpSy.model.vo.Help" %>
    <%@ page import="helpSy.model.vo.HelpPageData" %>
    <%
    	HelpPageData pd = (HelpPageData)request.getAttribute("pd");
    	ArrayList<Help> list = pd.getList();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
    
    .box_search{
        position: absolute;
        top: 150px;
        width: 1160px;
        height: 140px;
      
/*        left: 191px;*/
        padding: 30px;
        border: 4px solid #704de4;
        background: white;
    }
    
    .searchbtn{
        position: absolute;
        right: 30px;
        width: 134px;
        height: 50px;
        background-color: #704de4;
        color: white;
        border:none;
        font-size: 20px;
        font-weight: bold;
        float: right;
       
    }
   
    #help_search{
        position: absolute;
        left: 360px;
        width: 600px;
        outline: none;
        border: 1px solid #e2e2e2;
    }
    #help_cat{
        height: 50px;
        width: 273px;
        outline: none;
        border-color: #e2e2e2;
        float: left;
    }
    #help_label{
        padding-left: 234px;
    }
    .table-wrapper{
        text-align: center;
        width: 1160px;
        margin: 0 auto;
        position: absolute;
        top: 40%;
    }
     .hc_tr{
        visibility: collapse;
    }
    .d1_img{
        width: 25px;
        height: 25px;
    }
    .btn1{
        float: right;
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
        <div class="section_content">
            <div class="box_search">
                <div>
                    <label style="font-weight:bold" >카테고리 선택</label>
                    <label style="font-weight:bold" id="help_label">도움말 검색</label>
                </div>
                <div>
                	<form action="/searchHKeyword">
	                    <select id="help_cat" name="type">
	                        <option value="all">전체</option>
	                        <option value="member">회원</option>
	                        <option value="pay">예약 및 결제</option>
	                        <option value="cancel">취소 및 환불</option>
	                        <option value="use">공간이용 및 후기</option>
	                        <option value="other">기타</option>
	                    </select>
	                    <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="help_search" name="keyword">
	                    <button type="submit" class="searchbtn">검색</button>
                    </form>
                </div>
            </div>
                     <div class="table-wrapper">
            <table class="table table-striped">
                <tr>
                    <th colspan="4" style="font-size:20px; font-weight:bold">도움말</th>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                <c:forEach items="${pd.list }" var="h">
                <tr class="c_tr">
                    <td>${h.helpCategoryName }</td>
                    <td>${h.helpTitle }</td>
                    <td>${h.helpDate }</td>
                    <td><img src="/img/chevrondown.png" class="d1_img"></td>
                </tr>
                	<tr class="hc_tr">
						<td colspan="5">
							${h.helpContent }
							<c:if test="${sessionScope.User.userId == h.helpWriter}">
							<a class="btn btn-outline-primary btn-sm btn1" href="/helpDelete?helpNo=${h.helpNo }">삭제</a>
								<a class="btn btn-outline-primary btn-sm btn1" href="/helpUpdate?helpNo=${h.helpNo }">수정</a>
							</c:if>
							<br>
							<c:if test="${h.filename != null }">
								<img src="/upload/notice/${h.filename }">
							</c:if>
						</td>
                </c:forEach>
            </table>
            <div><%= pd.getPageNavi() %></div>
            <div>
                <a class="btn btn-outline-primary btn-sm" href="/helpWrite">글쓰기</a>
            </div>
        </div>
        </div>
	</section>
		<script>
        var count = 0;
		$(".c_tr").click(function(){
            var status =  $(this).next().css("visibility");
            if(status == 'collapse'){
                $(this).next().css("visibility","visible");
                $(this).children().find('img').attr("src","/img/chevronup.png");
            } else{
                $(this).next().css("visibility","collapse");
                $(this).children().find('img').attr("src","/img/chevrondown.png");
            }
        }); 
	</script>
</body>
</html>