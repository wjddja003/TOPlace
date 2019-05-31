<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String buffer = (String)request.getAttribute("buffer"); 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	.countTimeMinute{
		color:red;
	}
	.countTimeSecond{
		color:red;
	}
</style>
</head>

<body >
<center>
<h4>인증 번호 7자리를 입력하세요</h4>
	<div class="container">
		<form method="post" name="authenform" onsubmit="return check();">
			<input type="text" name="authnum">
			<input type="submit" class="btn btn-info" value="인증">
			<span class="countTimeMinute"></span>
			<span>:</span>
			<span class="countTimeSecond"></span>

		</form>
	</div>
	
	 <div id="layerPopup" style="display:none">
	   <p id="checkMsg"></p>
	   <button type="button">닫기</button>
	 </div>
	


</center>
</body >
<script type="text/javascript">
	$(document).ready(function(){
		$("#layerPopup").hide();
	
		var minute = 3;
		var second = 0;
		
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
			opener.$("#emailMsg").text("");
			opener.$(".joinpopup").css("display","none");
			opener.emailFlag = true;
			self.close();
		}
	}
	$("#layerPopup button").click(function(){
	    $("#layerPopup").hide();
	    if($("#checkMsg").html() == "인증 시간이 초과 되었습니다."){
	    	opener.$("#emailMsg").text("");
	    	opener.$("#eTxt").text("인증실패");
	    	opener.$("#eTxt").css("color","red");
	    	opener.$(".joinpopup").css("display","none");
	    	self.close();
	    }
	});
	
	
</script>
</html>