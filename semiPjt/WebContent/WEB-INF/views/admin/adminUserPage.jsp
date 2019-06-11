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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
    <div class="section_content">
    	 
    	 <div class="table-wrapper">
    	 	<div class="adminuser_header">
    	 		<h2>회원 관리</h2>
    	 	</div>
            <table class="table">
                
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
                            <button type="button" class="adminUserBtn">삭제</button>
						</td>
                    </tr>
                </c:forEach>
            </table>
            <div style="text-align: center;">${up.pageNavi}</div>
        </div>
    </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$('.adminUserBtn').click(function(){
		var userNo = $(this).parent().prev().prev().prev().prev().html();
		$.ajax({
			type:"GET",
			url:"/adminUserDelete?userNo="+userNo,
			success : function(data){
				var result = data;
				if(result == 1){
					$("#searchAlert").text("회원 탈퇴 성공");
			        $("#searchAlert").slideDown(700);
			        $("#searchAlert").delay(1300);
			        $("#searchAlert").slideUp(700);
				}else{
					$("#searchAlert").text("회원 탈퇴 실패");
			        $("#searchAlert").slideDown(700);
			        $("#searchAlert").delay(1300);
			        $("#searchAlert").slideUp(700);
				}
			}
		});
		

	})
</script>
</html>