<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Information</title>
<style type="text/css">
	.Searchcontainer{
		margin: 120px 0 0 40px;
		float: left;
		width: 500px;
	}
	li{
		list-style: none;
	}
	.insert{
		margin: 10px 0;
		width: 100%;
		height: 50px;
	}
	button{
		width: 100%;
		height: 50px;
	}
	.btnidSearch{
		color : #f7f7f7;
		background : #183058;
		margin: 0 0 5px 0;
		border:none;
	}
	.btnpwSearch{
		color : #f7f7f7;
		background : #183058;
		margin: 0 0 5px 0;
		border:none;
	}
	.tit{
		margin : 0 0 20px 0;
		text-align: center;
		clear: both;
		
	}
	.sub-tit{
		width : 100%;
	}
	p {
    	margin: 0 0 15px;
    	font-style: normal;
    	max-width: 100%;
    	height: 84px;
	}
	.find-id{
		padding-right: 50px;
	}
	.find-pw{
		padding-left: 50px;
	}
	.btnlogin{
		background: #f69b02;
		border:none;
		color : #f7f7f7;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<section>
		<div class="section_content">
			<div class="Searchcontainer">
				<div class="find-id">
					<h1 class="tit">아이디 찾기</h1>
					<p class="sub-tit">회원가입 시, 입력하신 이름+이메일로 아이디를 확인하실 수 있습니다.</p>
					<div class="find-info">
						<ul class="frm-list">
							<li>
								<input class="insert" type="text" name="userName" id="userName" placeholder="이름" >
							</li>
							<li>
								<input class="insert" type="text" name="idEmail" id="idEmail" placeholder="이메일">		
							</li>
						</ul>
					</div>
					<div class="find-btn">
					<button type="button" class="btnidSearch">아이디 찾기</button>
					<button type="button" class="btnlogin">로그인</button>
					</div>
				</div>
			</div>
			<div class="Searchcontainer">
				<div class="find-pw">
					<h1 class="tit">임시 비밀번호 발급</h1>
					<p class="sub-tit">가입하신 아이디+이메일를 입력, 본인인증을 통해 이메일로 임시 비밀번호를 보내드립니다. <br>확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다..</p>
					<div class="find-info">
						<ul class="frm-list">
							<li>
								<input class="insert" type="text" name="userId" id="userId" placeholder="아이디" >
							</li>
							<li>
								<input class="insert" type="text" name="pwEmail" id="pwEmail" placeholder="이메일">		
							</li>
						</ul>
					</div>
					<div class="find-btn">
						<button type="button" class="btnpwSearch">임시 비밀번호 발급</button>
						<button type="button" class="btnlogin">로그인</button>
					</div>
				</div>
			</div>
		</div>	
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$(".btnidSearch").click(function(){
		var name = $("#userName").val();
		var idEmail = $("#idEmail").val();
		
		var userEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(name == ""){
			alert("이름을 입력해주세요!");
			$('#userName').focus();
			return false;
		}else{
			if(!userEmail.test(idEmail)){
				console.log($('#idEmail').val());
				$('#idEmail').focus();
				alert("이메일 주소를 다시 확인해주세요.");
	    		return false;
	    	}
		}
	 	$.ajax({
     		type:"GET",
     		url: "/idSearchAjax?name="+name+"&email="+idEmail ,
     		success : function(){
     			alert("아이디 정보를 발송했습니다.\r\n아이디 정보가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
     		}
   		 });
	});
	$(".btnpwSearch").click(function(){
		var id = $("#userId").val();
		var pwEmail = $("#pwEmail").val();
		
		var userEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(id == ""){
			alert("아이디을 입력해주세요!");
			$('#userId').focus();
			return false;
		}else{
			if(!userEmail.test(pwEmail)){
				$('#pwEmail').focus();
				alert("이메일 주소를 다시 확인해주세요.");
	    		return false;
	    	}
		}
  		
	 	$.ajax({
     		type:"GET",
     		url: "/pwSearchAjax?id="+id+"&email="+pwEmail ,
     		success : function(){
     			alert("임시 비밀번호를 발송했습니다.\r\n임시 비밀번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
     		}
   		 });
	});
	$('.btnlogin').click(function(){
		location.href="/views/login.jsp";
	});
</script>
</html>