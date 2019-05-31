<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="noticeSy.model.vo.Notice" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="noticeSy.model.vo.NoticePageData" %>
    <%@ page import="user.model.vo.User" %>
    <%
          NoticePageData pd = (NoticePageData)request.getAttribute("pd");
        ArrayList<Notice> list = pd.getList();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<style>
    
    .box_search{
        position: absolute;
        top: 150px;
        width: 1160px;
        height: 140px;
/*        left: 191px;*/
        padding: 30px;
        border: 4px solid #f69b02;
        background: white;
    }
    
    .searchbtn{
        position: absolute;
        right: 30px;
        width: 134px;
        height: 50px;
        background-color: #f69b02;
        color: white;
        border:none;
        font-size: 20px;
        font-weight: bold;
        float: right;
       
    }
    #notice_search{
       width:900px;
    }
    .table-wrapper{
        text-align: center;
        width: 1160px;
        margin: 0 auto;
        position: absolute;
        top: 40%;
    }
    .nc_tr{
        visibility: collapse;
    }
    .d_img{
        width: 25px;
        height: 25px;
    }
    .btn1{
        float: right;
    }
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
                    <label style="font-weight:bold">공지사항 검색</label>
                </div>
                <div>
                    <form action="/searchKeyword">
                        <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="notice_search" name="keyword">
                        <button type="submit" class="searchbtn">검색</button>
                    </form>
                </div>
            </div>

         <div class="table-wrapper">
            <table class="table table-striped">
                <tr>
                    <th colspan="5" style="font-size:20px; font-weight:bold">공지사항 리스트</th>
                </tr>
                <tr>
                    <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
                </tr>
                
                <c:forEach items="${pd.list }" var="n">
               		<tr class="n_tr">
	                    <td>${n.noticeNo }</td>
	                    <td>${n.noticeTitle }</td>
	                    <td>${n.noticeWriter }</td>
	                    <td>${n.noticeDate }</td>
                        <td><img src="/img/chevrondown.png" class="d_img"></td>
                    </tr>
					<tr class="nc_tr">
						<td colspan="5">
						
							
							${n.noticeContent }
							<c:if test="${sessionScope.User.userId == n.noticeWriter}">
							<a class="btn btn-outline-primary btn-sm btn1" href="/noticeDelete?noticeNo=${n.noticeNo }">삭제</a>
								<a class="btn btn-outline-primary btn-sm btn1" href="/noticeUpdate?noticeNo=${n.noticeNo }">수정</a>
							</c:if>
							
								
							
							<br>
							<c:if test="${n.filename != null }">
								<img src="/upload/notice/${n.filename }">
							</c:if>
						</td>
					</tr>
                </c:forEach>
            </table>
            <div><%= pd.getPageNavi() %></div>
            <div>
                <a class="btn btn-outline-primary btn-sm" href="/noticeWrite">글쓰기</a>
            </div>
        </div>
    </div>
	</section>
	<script>
        var count = 0;
		$(".n_tr").click(function(){
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