<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="reservation.model.vo.ReservationImg" %>
    <%@ page import="reservation.model.vo.ReservationPageData" %>
    <%
    	ReservationPageData pd = (ReservationPageData)request.getAttribute("pd");
    %>
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
       
        float: left;
        margin: 20px 0 0 20px;
        border: 1px solid #e2e2e2;
        width: 100%;
       
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
                <c:forEach items="${list}" var="r">
                	 
                	<c:if test="${sessionScope.User.userNo == r.userNo}">
                <div class="qa_v">
              
                    <div class="qa_no">
                    	<img id="spaceImg"src="/upload/space/${r.s_img1}"><br>
                    	예약자성명 :${r.reservationName }<br>
                    	예약인원 : ${r.reservationPerson}<br>
                    	추가인원 : ${r.reservationOption }     <br>              	
                    	예약날짜 :${r.reservationDay }<br>
                    	가격 :${r.paymentPrice }<br>
                    	폰번호: ${r.reservationPhone } - ${r.reservationPhone1 } - ${r.reservationPhone2 } <br>
                    	요청사항 : ${r.reservationRequest} 
                    	
                    </div>
                </div>
                	</c:if>
                </c:forEach>
              
            </div>
          
        </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script>
    	$(document).ready(function(){
    		console.log(${sessionScope.User.userNo});
    		console.log(${pd.list[1].userNo});
    	});
    </script>
</body>
</html>