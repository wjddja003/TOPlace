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
        padding-top: 20px;
        font-size: 18px;
    	text-align: center;
        margin: 30px 0 0 0;
        width: 1000px;
        height: 70px;
        background: #f69b02;
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
        width: 45%;
        margin: 0 0 0 20px;
        padding: 10px;
        height: 100%;
        float: left;
    }
    .qa_no{
        padding: 10px;
        float: left;
        margin: 20px 0 0 20px;
        border: 1px solid #e2e2e2;
        width: 100%;
        height: 320px;
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
    #spaceImg{
     
    	width: 400px;
    	height: 220px;
    }
</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                    예약 내역 리스트
                </div>
                <c:forEach items="${pd.list }" var="r">
                	 
                	<c:if test="${sessionScope.User.userNo == r.userNo}">
                <div class="qa_v">
              
                    <div class="qa_no">
                    	<a href="/selectOneSpace?S_no=${r.s_no}"> <img id="spaceImg"src="/upload/space/${r.img}"></a><br>
                    	
                    	공간명 :${r.placeName }<br>
                    	예약날짜 :${r.reservationDay }<br>
                    	￦${r.paymentPrice }
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="re_navi">${pd.pageNavi }</div>
            </div>
        </div>
    </section>
    <script>
    </script>
</body>
</html>