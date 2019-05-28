<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chk{
		background: url() no-repeat; 
	}
	.termsContent{
		margin: 0 auto;
		padding : 100px 0 0 0;
	}
	#agreeMsg{
		color : red;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<center>
	<div class="termsContent">
	<form action="/views/join.jsp" method="get" onsubmit="return check()">
	<input type="checkbox" name="chk_all" id="chk_all"> <span>전체 체크</span> <br><br>
	<input type="checkbox" name="termsService" id="termsService" class="chk"> <span>이용약관 동의 (필수)</span> <br><br>
	<input type="checkbox" name="termsPrivacy" id="termsPrivacy" class="chk"> <span>개인정보 수집 및 이용에 대한 안내(필수)</span> <br><br>
	<input type="checkbox" name="termsEmail" class="chk" value="Y"> <span>이벤트 등 프로모션 알림 메일 수신(선택)</span><br>
	<label id="agreeMsg" style="display:none">이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</label><br>
	<button type="button" id="btncencel">비동의</button><button type="submit" id="btnagree">동의</button>
	</form>
	</div>
	</center>
<script type="text/javascript">
$("#chk_all").click(function(){
	if($(this).is(":checked")){
		$(".chk").prop("checked", true);
	}else{
		$(".chk").prop("checked", false);
	}	
})
function check(){
	if($("#termsService").is(":checked") == false || $("#termsPrivacy").is(":checked") == false){
		$("#agreeMsg").show();
		return false;
	}else{
		$("#agreeMsg").hide();
	}
}
	

		
	
</script>	

</body>
</html>