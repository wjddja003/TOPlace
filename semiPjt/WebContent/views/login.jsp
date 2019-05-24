<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  카카오 로그인 스크립트-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		*{
			margin: 0 auto;
		}	
		.container{
			position: absolute;
			top: 150px;
			width: 100%;
					
		}
		.login{
			width: 700px;
			
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<div class=container>
	<form action="#" method="post">
		<div class="login">
			<table>
				<tr>
					<td style="text-align: center;">logo</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="userId" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="userPw" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td><button type="submit" style="width:100%;">로그인</button></td>
				</tr>
				<tr>
					<td>로그인 상태 유지 </td><td><a href="/join.jsp">회원가입</a></td><td>아이디/비밀번호찾기</td>
				</tr>
			
			</table>
		</div>
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
</body>
</html>