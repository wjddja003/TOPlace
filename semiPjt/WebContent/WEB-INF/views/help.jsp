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
        width: 64%;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		    <div class="box_search">
        <div>
            <label style="font-weight:bold">카테고리 선택</label>
        </div>
        <div>
            <select>
                <option>전체</option>
                <option>회원</option>
                <option>예약 및 결제</option>
                <option>취소 및 환불</option>
                <option>공간이용 및 후기</option>
                <option>기타</option>
            </select>
            <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="search">
            <button type="submit" class="searchbtn">검색</button>
            
        </div>
    </div>
	</section>
</body>
</html>