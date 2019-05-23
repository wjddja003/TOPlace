<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Insert title here</title>
	<style>
	#thisPageDiv *{color:black;}
	#thisPageDiv div{border:1px solid black;}
	#processBar div{ float:left; width:25%;}
	#process div:not(#process-bt){display:none;}
	</style>
</head>
<body>
		<%@ include file="/WEB-INF/common/header.jsp" %>
		<br><br>
<div id="thisPageDiv">
	<div id="processBar" style="margin:0 auto;width:80%;text-align:center;">
		<div id="processBar-1">1</div>
		<div id="processBar-2">2</div>
		<div id="processBar-3">3</div>
		<div id="processBar-4">4</div>
	</div>
		<br><br><br>
	<div id="process" style="margin:0 auto;width:80%;">
		<div id="process-1">첫번째</div>
		<div id="process-2">두번째</div>
		<div id="process-3">세번째</div>
		<div id="process-4">네번째</div>
		<div id="process-bt" style="text-align:center;">
			<button id="bt-1" type="button" class="btn btn-outline-primary" >이전</button>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="bt-2" type="button" class="btn btn-outline-primary" >다음</button>
			<button id="bt-submit" type="submit" class="btn btn-outline-primary"
			style="display:none;">등록완료</button>
		</div>
	</div>
</div>
		<script>
			var state = 0;
			window.onload = function(){
				$('#processBar-1').css("background-color","lightblue");
				$('#process-1').css("display","block");
				$('#bt-1').css("visibility","hidden");
				state = 1;
			}
			$("#bt-2").click(function(){
				if(state==1){
					$('#processBar-1').css("background-color","white");
					$('#process-1').css("display","none");
					$('#processBar-2').css("background-color","lightblue");
					$('#process-2').css("display","block");
					$('#bt-1').css("visibility","visible");
					state=2;
				}else if(state==2){
					$('#processBar-2').css("background-color","white");
					$('#process-2').css("display","none");
					$('#processBar-3').css("background-color","lightblue");
					$('#process-3').css("display","block");
					state=3;
				}else if(state==3){
					$('#processBar-3').css("background-color","white");
					$('#process-3').css("display","none");
					$('#processBar-4').css("background-color","lightblue");
					$('#process-4').css("display","block");
					$("#bt-2").css("display","none");
					$("#bt-submit").css("display","inline");
					state=4;
				}
			});
			$("#bt-1").click(function(){
				if(state==4){
					$('#processBar-4').css("background-color","white");
					$('#process-4').css("display","none");
					$('#processBar-3').css("background-color","lightblue");
					$('#process-3').css("display","block");
					$("#bt-2").css("display","inline");
					$("#bt-submit").css("display","none");
					state=3;
				}else if(state==3){
					$('#processBar-3').css("background-color","white");
					$('#process-3').css("display","none");
					$('#processBar-2').css("background-color","lightblue");
					$('#process-2').css("display","block");
					state=2;
				}else if(state==2){
					$('#processBar-2').css("background-color","white");
					$('#process-2').css("display","none");
					$('#processBar-1').css("background-color","lightblue");
					$('#process-1').css("display","block");
					$('#bt-1').css("visibility","hidden");
					state=1;
				}
			});

		</script>
</body>
</html>