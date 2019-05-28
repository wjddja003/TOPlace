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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
        <div class="section_content">
            <div class="box_search">
                <div>
                    <label style="font-weight:bold" >카테고리 선택</label>
                    <label style="font-weight:bold" id="help_label">도움말 검색</label>
                </div>
                <div>
                    <select id="help_cat">
                        <option>전체</option>
                        <option>회원</option>
                        <option>예약 및 결제</option>
                        <option>취소 및 환불</option>
                        <option>공간이용 및 후기</option>
                        <option>기타</option>
                    </select>
                    <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="help_search">
                    <button type="submit" class="searchbtn">검색</button>
                </div>
            </div>
                     <div class="table-wrapper">
            <table class="table table-striped">
                <tr>
                    <th colspan="3" style="font-size:20px; font-weight:bold">도움말</th>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                </tr>
            </table>
            <div>페이징</div>
            <div>
                <a class="btn btn-outline-primary btn-sm" href="#">글쓰기</a>
            </div>
        </div>
        </div>
	</section>
</body>
</html>