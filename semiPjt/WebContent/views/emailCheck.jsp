<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String buffer = (String)request.getAttribute("buffer"); 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<style type="text/css">
	#layerPopup{
	  padding:20px; 
	  border:4px solid #ddd; 
	  position:absolute; 
	  left:25px; 
	  top:25px;
	  z-index = 10; 
	  background:#fff;
	  width:200px;
	  height: 50px;
	  font-size:12px;
	}

	#layerPopup button{
	  cursor:pointer;
	}
</style>
</head>

<body>
<center>
<h5>인증 번호 7자리를 입력하세요</h5>
	<div class="container">
		<form method="post" name="authenform" onsubmit="return check();">
			<input type="text" name="authnum">
			<input type="submit" class="btn btn-info" value="인증">
			<span class="countTimeMinute"></span>분
			<span class="countTimeSecond"></span>초

		</form>
	</div>
	
	 <div id="layerPopup">
	   <p id="checkMsg">인증 시간이 초과 되었습니다.</p>
	   <button type="button">닫기</button>
	 </div>
	


</center>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#layerPopup").hide();
	
		var minute = 0;
		var second = 50;
		
		$(".countTimeMinute").html(minute);
		$(".countTimeSecond").html(second);
	
		var timer = setInterval(function(){
			$(".countTimeMinute").html(minute);
			$(".countTimeSecond").html(second);
			
			if(second == 0 && minute == 0){
				$("#layerPopup p").html("인증 시간이 초과 되었습니다.");
				$("#layerPopup").show();
				clearInterval(timer);
				
			}else{
				second--;
				
				if(second < 0){
					minute--;
					second = 59
				}
			}
		},1000);	
		
	});
	function check(){
		var form = document.authenform;
		var authNum = <%=buffer%>;
		
		if(!form.authnum.value){
			$("#layerPopup p").html("인증번호를 입력해주세요.");
			$("#layerPopup").show();
			return false;
		}
		if(form.authnum.value!=authNum){
			$("#layerPopup p").html("인증번호가 틀립니다.");
			$("#layerPopup").show();
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum){
			opener.$("#email").attr("readonly",true);
			opener.$("#eTxt").text("인증완료");
			opener.$("#eTxt").css("color","blue");
			self.close();
		}
	}
	$("#layerPopup button").click(function(){
	    $("#layerPopup").hide();
	    if($("#checkMsg").html() == "인증 시간이 초과 되었습니다."){
	    	opener.$("#eTxt").text("인증실패");
	    	opener.$("#eTxt").css("color","red");
	    	self.close();
	    }
	});
	
</script>
</html>