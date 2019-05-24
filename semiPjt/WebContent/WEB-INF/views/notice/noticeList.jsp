<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    
    .box_search{
        position: absolute;
        top: 150px;
        width: 80%;
        height: 140px;
      
        left: 191px;
        padding: 30px;
        border: 4px solid #704de4;
        background: white;
    }
    
    .searchbtn{
        position: absolute;
        right: 80px;
        width: 134px;
        height: 50px;
        background-color: #704de4;
        color: white;
        border:none;
        font-size: 20px;
        font-weight: bold;
        float: right;
       
    }
    #search{
        width: 85%;
    }
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
    <div class="box_search">
        <div>
            <label style="font-weight:bold">공지사항 검색</label>
        </div>
        <div>
            <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="search">
            <button type="submit" class="searchbtn">검색</button>
            
        </div>
    </div>
	 <div class="table-wrapper" style="text-align:center; width:80%; margin:0 auto;position:absolute;top:40%;left:10%">
		<table class="table table-striped">
			<tr>
				<th colspan="4" style="font-size:20px; font-weight:bold">공지사항 리스트</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
		</table>
		<div> 1 2 3 4 5 </div>
		<div>
			<button type="submit">글쓰기</button>
		</div>
	</div>
	</section>
</body>
</html>