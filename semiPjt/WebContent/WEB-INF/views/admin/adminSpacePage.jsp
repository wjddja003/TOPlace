<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.adminuser_header{
		margin: 50px 0 0 0;
	}
	.user_table{
		border:1px solid #183058;
	}
	.user_table td, .user_table th{
		padding: .75rem;
		border-top: 1px solid #f69b02;
		border-bottom: 1px solid #f69b02;
	}
	.adminUserBtn{
		width: 100px;
		height: 30px;
		border: 1px solid #f69b02;
		background: white;
		color: #f69b02;
	}
	#DeleteMsg{
	      width:100%;
	      height: 100px;
	      text-align: center;
	      letter-spacing: 8px;
	      word-spacing:15px;
	      background-color: #f69b02;
	      color:white;
	      font-size: 30px;
	      line-height: 100px;
	      display:none;
	      top:0px;
	      position:fixed;
	      z-index:99;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<div id="DeleteMsg"></div>
	<section>
    <div class="section_content">
    	 
    	 <div class="table-wrapper">
    	 	<div class="adminuser_header">
    	 		<h2>신고 공관 관리</h2>
    	 	</div>
    	 	
            <table class="table">
                
                <tr>
                    <th>신고된 공간</th><th>신고자</th><th>신고종류</th><th>신고내용</th><th>
                </tr>
                <c:forEach items="${sp.list}" var="d">
               		<tr class="n_tr">
	                    <td>${d.s_placeName }</td>
	                    <td>${d.userName }</td>
	                    <td>${d.declareType }</td>
	                    <td>${d.declareContent }</td>
	                    <td>	
                            <button type="button" class="adminUserBtn">삭제</button>
                            <input type="hidden" class="hiddenSno" value="${d.s_no }">
						</td>
                    </tr>
                </c:forEach>
            </table>
            <div style="text-align: center;">${sp.pageNavi}</div>
        </div>
    </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$('.adminUserBtn').click(function(){
		var dIndex = $('.adminUserBtn').index(this);
		var sNo = $('.hiddenSno').eq(dIndex).val();
		$.ajax({
			type:"GET",
			url:"/adminDeclareDelete?sNo="+sNo,
			success : function(data){
				var result = data;
				if(result == 1){
					alert("신고 공간 삭제 완료");
					location.reload();
				}else{
					$("#DeleteMsg").text("신고 공간 삭제 실패");
			        $("#DeleteMsg").slideDown(700);
			        $("#DeleteMsg").delay(1300);
			        $("#DeleteMsg").slideUp(700);
				}
			}
		});
		

	})
</script>
</html>