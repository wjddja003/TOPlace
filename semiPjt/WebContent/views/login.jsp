<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  카카오 로그인 스크립트-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.logincontainer{
			padding: 70px 0 0;
		}
		.loginLogo{
			width:250px;
			margin: 0 0 50px 0;
		}
		.loginTxt{
			
			color:black;
		}
		input{
			padding : 0 0 10px;
			margin: 0 0 20px 0;
		}
		.insert{
			line-height: 50px;
			width:500px;
			margin: 0 0 10px;
			height: 50px;
		}
		.btnlogin{
			background:#f69b02;
			border:none;
			color:#f7f7f7;
			height: 50px;
		}
		.loginlink{
			text-align: right;
		}
		#idMsg{
			color:red;
			font-size: 14px;
		}
		#pwMsg{
			color:red;
			font-size: 14px;
		}
		.errorMsg{
			color:red;
			font-size: 14px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<section>
		<div class="section_content">
			<center>
			<div class="logincontainer">
				<form action="/login" method="post" id="loginform">
					<table>
						<tr>
							<td style="text-align: center;" colspan="3"><img class="loginLogo" src="../img/logo.png"></td>
						</tr>
						<tr>
							<td colspan="3">
								<input class="insert" type="text" name="userId" id="userId" placeholder="아이디" >
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<span id="idMsg"></span>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input class="insert" type="password" name="userPw" id="userPw" placeholder="비밀번호">
								<p class="errorMsg" style="display:none">아이디 또는 비밀번호를 다시 확인하세요.<br>등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.</p>
							</td>
						</tr>
						<tr>
							<td><span id="pwMsg"></span></td>
						</tr>
						<tr>
							<td colspan="3"><button type="button" style="width:100%;" class="btnlogin">로그인</button></td>
						</tr>
						<tr>
							<td><a href="/views/userTerms.jsp"><span class="loginTxt">회원가입</span></a></td><td colspan="2" class="loginlink"><a href="/views/findInformation.jsp"><span class="loginTxt" style="padding:0;">아이디</span></a><span>·</span><a href="/views/findInformation.jsp"><span class="loginTxt">비밀번호찾기</span></a></td>
						</tr>
					
					</table>
					
					
				<!--  <a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a>
					<script type='text/javascript'>
					  //<![CDATA[
					    // 사용할 앱의 JavaScript 키를 설정해 주세요.
					    Kakao.init('80aa81744db7983a8f525232d450d787');
					    // 카카오 로그인 버튼을 생성합니다.
					    Kakao.Auth.createLoginButton({
					      container: '#kakao-login-btn',
					      success: function(authObj) {
					        alert(JSON.stringify(authObj));
					      },
					      fail: function(err) {
					         alert(JSON.stringify(err));
					      }
					    });
					  //]]>
					</script> 카카오 로그인 미완성 --> 
				</form>
			</div>
			</center>
		</div>	
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$(".btnlogin").click(function(){
		$(".errorMsg").hide();
		$("#pwMsg").text("");
		$("#idMsg").text("");
		if($("#userId").val() == ""){
			$("#idMsg").text("아이디를 입력해주세요.");
			$("#userId").focus();
		}else{
			$("#idMsg").text("");
			if($("#userPw").val() == ""){
				$("#pwMsg").text("비밀번호를 입력해주세요");
				$("#userPw").focus();
			}else{
				$("#pwMsg").text("");
				var id = $("#userId").val();
				var pw = $("#userPw").val();
				$.ajax({
					type:"POST",
					url: "/login",
					data:{ id:id, pw:pw},
					success : function(data){
						var result = data;
						if(result > 0){
							location.href="../index.jsp";
						}else{
							$(".errorMsg").show();
						}
					}
				});
			}
		}
	});
	$('#userPw').keydown(function(key) {
		
		if (key.keyCode == 13) {
			$(".errorMsg").hide();
			$("#pwMsg").text("");
			$("#idMsg").text("");
			if($("#userId").val() == ""){
				$("#idMsg").text("아이디를 입력해주세요.");
				$("#userId").focus();
			}else{
				$("#idMsg").text("");
				if($("#userPw").val() == ""){
					$("#pwMsg").text("비밀번호를 입력해주세요");
					$("#userPw").focus();
				}else{
					$("#pwMsg").text("");
					var id = $("#userId").val();
					var pw = $("#userPw").val();
					$.ajax({
						type:"POST",
						url: "/login",
						data:{ id:id, pw:pw},
						success : function(data){
							var result = data;
							if(result > 0){
								location.href="../index.jsp";
							}else{
								$(".errorMsg").show();
							}
						}
					});
				}
			}
		}
	});
</script>
</html>