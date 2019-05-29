<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.pwSearchcontainer{
		padding: 100px 0 0 0;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<section>
		<div class="section_content">
			<center>
			<div class="pwSearchcontainer">
				<table>
					<tr>
						<td colspan="3" style="text-align: center;"><h3>비밀번호 찾기</h3></td>
					</tr>
					<tr>
						<td>
							<label>아이디</label>
						</td>
						<td colspan="2">
							<input class="insert" type="text" name="userId" id="userId" placeholder="아이디" >
						</td>
					</tr>
					<tr>
						<td>
							<label>이메일 </label>
						</td>
						<td colspan="2">
							<input class="insert" type="text" name="email" id="email" placeholder="이메일">
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><button type="button" style="width:100%;" class="btnpwSearch">비밀번호 찾기</button></td>
					</tr>
				</table>
			</div>
			</center>
		</div>	
</body>
<script type="text/javascript">
	$(".btnpwSearch").click(function(){
		var id = $("#userId").val();
		var email = $("#email").val();
		
		var userEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(id == ""){
			alert("이름을 입력해주세요!");
			$('#userName').focus();
			return false;
		}else{
			if(!userEmail.test(email)){
				$('#email').focus();
				alert("이메일 주소를 다시 확인해주세요.");
	    		return false;
	    	}
		}
  		
	 	$.ajax({
     		type:"GET",
     		url: "/pwSearchAjax?id="+id+"&email="+email ,
     		success : function(){
     			alert("임시 비밀번호를 발송했습니다.\r\n임시 비밀번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
     			location.href="/views/login.jsp";
     		}
   		 });
	});
</script>
</html>