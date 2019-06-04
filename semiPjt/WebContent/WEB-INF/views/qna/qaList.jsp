<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    #review_page{
        background-color: #f7f7f7;
        width: 100%;
        height: 400px;
    }
    .h_intro{
        padding-bottom: 16px;
        margin-bottom: 28px;
    }
    .h_intro_b{
        position: absolute;
        top: 135px;
        height: 4px;
        width: 20px;
        background-color: #f69b02;
    }
         .table_toggle{
         margin-top: 60px;
         font-size:15px;
         width:100%;
    }
        .table_toggle tbody tr{
            height: 60px;
        }
        .table_toggle tbody tr:nth-child(2n+1){
            background-color: #f7f7f7;
        }
        .table_toggle>tbody>tr:first-child>td{
            border-top: 2px solid #656565;
        }
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		<div class="section_content">
            <div id="review_page">
                <div class="review">
                    <h4 class="h_intro">Q＆A</h4>
                    <div class="h_intro_b"></div>
                    <a><img src="../img/logo.png" style="width:100px; height:50px;"></a>
                     <table class="table_toggle">
                <tr>
                    <th>작성자</th><th>내용</th><th>작성일</th>
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
						
							
							
							<c:if test="${sessionScope.User.userId == q.qaWriter}">
							<a class="btn btn-outline-primary btn-sm btn1" href="/noticeDelete?noticeNo=${q.qaNo }">삭제</a>
								<a class="btn btn-outline-primary btn-sm btn1" href="/noticeUpdate?noticeNo=${q.qaNo }">수정</a>
							</c:if>
							
								
							
							<br>
						</td>
					</tr>
                </c:forEach>
            </table>
            <div></div>
            <div>
                <a class="btn btn-outline-primary btn-sm" href="/qaCommentInsert"style="color:#f69b02; border-color:#f69b02">글쓰기</a>
            </div>
                </div>
			</div>
		</div>
	</section>
</body>
</html>