<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.joincontainer{
		width:90%;
		margin: 0 auto;
	}
	.joinheader{
		margin: 40px 0;
		text-align: left;
		font-size: 30px;
		font-weight: 900;
	}
	.joinErrorMsg{
		color : red;
		font-size: 12px;
		margin: 0 0 0 5px;
	}
	.joinpopup{
		top:0;
		left:0;
		border:1px solid black;
		z-index:99;
		position: fixed;
		width: 100%;
		height: 1000px;
		background-color: black;
		opacity: 0.6;
		display:none;
	}
	.inputBox{
		width: 300px;
	}
	.table{
		line-height: 40px;
		
	}
	.btn1{
		background: #f69b02;
		color:white;
		width: 50px;
		border: none;
		cursor:pointer;
	}
	.btn1:hover{
		background: #183058;
		color:white;
		cursor:pointer;
	}
	button{
		background: #f69b02;
		color:white;
		border: none;
		cursor:pointer;
	}
	button:hover{
		background: #183058;
		color:white;
		border: none;
		cursor:pointer;
	}
	#addrNum{
		text-align: center;
	}
	#address{
		margin-top: 5px;
		width: 600px;
	}
	.btnjoin{
		border-radius : 10px;
		width: 200px;
	}
	.addressinsert{
		margin: 0 0 0 5px;
		border-radius : 10px;
	}
	.btn1{
		border-radius : 10px;
	}
	.gMsg{
		text-align: right;
		color: red;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<section>
		<div class="section_content">
			<div class="joincontainer">
				<form action="/join" method="post" id="joinform">
					<input type="hidden" name="termsEmail" value='${param.termsEmail}'>
					<div class="joincontainer join">
					<div class="joinheader">
						<img class="loginLogo" src="../img/logo.png" alt="이용약관" align="middle"><span style="font-size: 20px">회원가입</span>
					</div>
					<div class="gMsg">
						<span>모든 입력사항은 필수입력입니다.</span>
					</div>
					<table class="table">
						<tr>
							<td><label for="userId">아이디</label></td>
		                    <td><input class="inputBox" type="text" id="userId" name="userId"  maxlength="16"><span class="joinErrorMsg" id="idMsg"></span>
		                   
		                    </td>
						</tr>
						<tr>
							 <td><label for="userPw">비밀번호</label></td>
		                     <td><input class="inputBox" type="password" id="userPw" name="userPw"><span class="joinErrorMsg" id="pwMsg">  </span>
		                     <p style="font-size: 12px; height: 20px;">※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p>
		                    
						</tr>
						<tr>
							 <td><label for="userPwre">비밀번호 확인</label></td>
		                     <td><input class="inputBox" type="password" id="userPwre"><span class="joinErrorMsg" id="pwreMsg">  </span></td>
						</tr>
						<tr>
							<td><label for="userName">이름</label></td>
							<td><input class="inputBox" type="text" name="userName" id="userName" maxlength="4"><span class="joinErrorMsg" id="nameMsg"></span></td>
						</tr>
						<tr>
							<td><label for="year">생년월일</label></td>
							<td>
								<input type="text" name="year" id="year"  maxlength="4" style="width:70px; height:40px">
								<select name="month" id="month" style="width:70px; height:40px">
									<option>월</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>	
								</select>
								<input type="text" name="day" id="day" maxlength="2" style="width:70px; height:40px"><br><span class="joinErrorMsg" id="birthdayMsg"></span>
							</td>
						</tr>
						<tr>
							<td><label for="gender">성별</label></td>
							<td>
								<select id="gender" name="gender" style="width:70px; height:40px">
		                            <option>성별</option>
		                        	<option value="M">남자</option>
		                            <option value="F">여자</option>
		                        </select>
		                        <span class="joinErrorMsg" id="genderMsg"></span>
		                    </td>
						</tr>
						<tr>
							<td><label for="email">이메일</label></td>
							<td>
								<input type="text" name="email" id="email"> <button type="button" class="btn1" disabled="disabled">인증</button><br>
								<span class="joinErrorMsg" id="emailMsg"></span>
								<span id="eTxt" style="color:blue"></span>
							</td>
						</tr>
						<tr>
							<td><label for="phone">휴대폰</label></td>
							<td>
								<select name="phone" id="phone" style="width:70px; height:40px">
		                            <option>선택</option>
		                        	<option>010</option>
		                            <option>011</option>
		                            <option>016</option>
		                            <option>017</option>
		                            <option>019</option>
		                        </select>
		                        <span style="margin:0 5px 0 5px; color:black;" > - </span><input type="text" id="phone1" name="phone1" style="width:70px; height:40px" maxlength="4">
		                        <span style="margin:0 5px 0 5px; color:black;"> - </span><input type="text" id="phone2" name="phone2" style="width:70px; height:40px" maxlength="4"> 
		                        <br><span class="joinErrorMsg" id="phoneMsg"></span>
		                    </td>
						</tr>
						<tr>
							<td><label for="btnAddr">주소</label></td>
							<td>
								<input type="text" id="addrNum" name="addrNum"  readonly="readonly"><button type="button" class="addressinsert" id="btnAddr">우편주소</button>
								<br>
								<input type="text" id="address" name="address"  readonly="readonly"><br>
								<span class="joinErrorMsg" id="addrMsg"></span>
							</td>				
						</tr>
						<tr>
							<td colspan="3" style="text-align: center;" ><button type="button" class="btnjoin">가입하기</button></td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
		<div class="joinpopup">
		
		</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$(".btn1").click(function(){
		$(".joinpopup").css("display","block");
		var windowW = 350;  // 창의 가로 길이
	    var windowH = 300;  // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		var email = $("input[name=email]").val();
		var url = "/emailCheck";
		pop = window.open("/views/emailCheck.jsp","이메일 인증","top="+top+", left="+left+", height="+windowH+", width="+windowW);
		pop.location.href=url+"?email="+email;
		var popclose = setInterval(function() {
            if (pop == null || pop.closed) {
                $(".joinpopup").css("display","none");
                clearInterval(popclose);
            }
		  }, 500);
	});
	$(".addressinsert").click(function(){
		$(".joinpopup").css("display","block");
		var windowW = 600;  // 창의 가로 길이
	    var windowH = 600;  // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		var josu = window.open("/views/jusoPopup.jsp","주소찾기","top="+top+", left="+left+", height="+windowH+", width="+windowW);
		var josuclose = setInterval(function() {
            if (josu == null || josu.closed) {
                $(".joinpopup").css("display","none");
                clearInterval(josuclose);
            }
		  }, 500);
	})
	var idFlag = false;
	var pwFlag = false;
	var pwreFlag = false;
	var nameFlag = false;
	var phoneFlag = false
	var birthFlag = false;
	var genderFlag = false;
	var addrFlag = false;
	var emailFlag = false;
	$(document).ready(function(){
		 var userName = /^[가-힣]([가-힣]{1,3})$/;
         var userPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
         var phone = /^[0-9]*$/;
         var year = /^[0-9]*$/;
         $('#userName').focusout(function(){
        	if(!userName.test($('#userName').val())){
        		 $('#nameMsg').css("color","red");
                 $('#nameMsg').text("한글만 입력 가능합니다.");
                 $(this).val("");
        	}else{
                $('#nameMsg').text(""); 
                nameFlag = true;
            } 
         });
         $('#userId').focusout(function(){
             idFlag=false;
             checkId("first");
         });
         $('#userPw').focusout(function(){
             if(!userPw.test($('#userPw').val())){
                 $('#pwMsg').css("color","red");
                 $('#pwMsg').text("[사용불가] 안전한 비밀번호 기준에 맞지 않습니다.");
                 $(this).val("");
                 pwFlag = false;
                 
             }else if(userPw.test($('#userPw').val())&&$('#userPw').val().length>10){
                 $('#pwMsg').css("color","blue");
                 $('#pwMsg').text("[안전] 안전한 비밀번호입니다.");
                 pwFlag = true;
             }else{
                 $('#pwMsg').css("color","gray");
                 $('#pwMsg').text("[보통] 적정수준의 안전한 비밀번호입니다.");
                 pwFlag = true;
             }
         });
         $('#userPwre').focusout(function(){
             if($('#userPwre').val() == $('#userPw').val() && !($('#userPwre').val() == "")){
                 $('#pwreMsg').css("color","gray");
                 $('#pwreMsg').text("입력한 비밀번호가 일치합니다.");
                 pwreFlag = true;
             }else{
                 $('#pwreMsg').css("color","red");
                 $('#pwreMsg').text("비밀번호가 일치하지 않습니다.");
                 $(this).val("");
                 pwreFlag = false;
             }
         });
         $('#phone1').focusout(function(){
             if(!phone.test($('#phone1').val())){
                 $('#phoneMsg').css("color","red");
                 $('#phoneMsg').text("숫자만 입력가능합니다.");
                 $(this).val("");
                 phoneFlag = false;
                 
             }else{
                 $('#phoneMsg').css("color","black");
                 $('#phoneMsg').text("");
                 phoneFlag = true;
             }
         });
         $('#phone2').focusout(function(){
             if(!phone.test($('#phone2').val())){
                 $('#phoneMsg').css("color","red");
                 $('#phoneMsg').text("숫자만 입력가능합니다.");
                 $(this).val("");
                 phoneFlag = false;
             }else{
                 $('#phoneMsg').css("color","black");
                 $('#phoneMsg').text("");
                 phoneFlag = true;
             }
         });
         var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
         
         $('#year').focusout(function(){
    		 if(!year.test($(this).val()) || $(this).val().length < 4){
    		 	$('#birthdayMsg').text("태어난 년도 4자리를 정확하게 입력하세요.");
    		 	$(this).val("");
    		 	birthFlag = false;
    		 	
    		 }else{
    			$('#birthdayMsg').text("");
    			birthFlag = true;
    		 }
    	 });
         var index = 0;
         $('#month').focusout(function(){
        	 index = $("#month option").index($("#month option:selected"));
			 if(index == 0 || $("#month option:selected").val() == null){
				 $('#birthdayMsg').text("생년월일을 다시 확인해주세요.");
				 $(this).val("");
				 birthFlag = false;
    		 }
			 else{
				 $('#birthdayMsg').text("");
				 birthFlag = true;
			 }
         });
         $('#day').focusout(function(){
        	 if($(this).val() > month_day[index-1] || $(this).val() == ""){
        		 $('#birthdayMsg').text("생년월일을 다시 확인해주세요.");
				 $(this).val("");
				 birthFlag = false;
        	 }
        	 else{
        		 $('#birthdayMsg').text("");
        		 birthFlag = true;
        	 }
         });
         $('#gender').focusout(function(){
        	 var gender = $("#gender option").index($("#gender option:selected"));
        	 if(gender == 0){
        		$('#genderMsg').text("필수입력 정보입니다.");
        		genderFlag = false;
        	 }else{
        		$('#genderMsg').text("");
        		genderFlag = true;
        	 }
        		
         });
         $('#address').focusout(function(){ // 미해결
        	if($(this).val() == ""){
        		$("#addrMsg").text("필수입력 정보입니다.");
        	}else{
        		$("#addrMsg").text("");
        		addrFlag = true;
        	}
         });
         $('#email').focusout(function(){
             emailFlag=false;
             checkEmail();
         });
         
         
	});
	function checkEmail(){
		
		var email = $("#email").val();
		
		var userEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!userEmail.test(email)){
    		$("#emailMsg").text("이메일 주소를 다시 확인해주세요.");
    		$(".btn1").prop("disabled", true);
    		return false;
    	}
  		
	 	$.ajax({
     		type:"GET",
     		url: "/emailAjax?email="+email ,
     		success : function(data){
     			var result = decodeURIComponent(data);
     			if(result == 'Y'){
     				$("#emailMsg").text("사용가능한 이메일 입니다.");
     				$(".btn1").prop("disabled", false);
     			} else{
     				$("#emailMsg").text("이미 가입한 이메일 입니다.");
     			}
     		}
   		 });
	}
	function checkId(event){
     	 if(idFlag) return true;
     	 
     	 var id = $("#userId").val();
     	 
     	 
     	 if(id==""){
     		 $("#idMsg").text("필수 정보 입니다.");
     		 return false;
     	 }
     	 
     	 var userId =/^[a-z0-9][a-z0-9_\-]{3,9}$/;
     	 if(!userId.test(id)){
     		 $("#idMsg").text("4~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용가능합니다.");
     		 return false;
     	 }
     	 
     	 idFlag = false;
     	 $.ajax({
     		type:"GET",
     		url: "/joinAjax?id="+id ,
     		success : function(data){
     			var result = decodeURIComponent(data);
     			console.log(result);
     			if(result == 'Y'){
     				console.log(result);
     				if(event == "first"){
     					$("#idMsg").text("사용 가능한 아이디 입니다.!");
     					idFlag =true;
     				}else{
     					$("#idMsg").hide();
     					idFlag =true;
     				}
     			} else{
     				 $("#idMsg").text("이미 사용중이거나 탈퇴한 아이디입니다.");
     			}
     		}
     	 });
     	 return true;
    }
	$(".btnjoin").click(function(){
		if(idFlag && pwFlag && nameFlag && pwreFlag && genderFlag && birthFlag && phoneFlag && addrFlag && emailFlag){
			$("#joinform").submit();
		}else{
			if(idFlag == false){
				$("#idMsg").text("필수 입력 사항입니다.");
			}
			if(pwFlag == false){
				$("#pwMsg").text("필수 입력 사항입니다.");
			}
			if(pwreFlag == false){
				$("#pwreMsg").text("필수 입력 사항입니다.");
			}
			if(genderFlag == false){
				$('#genderMsg').text("필수입력 정보입니다.");
			}
			if(birthFlag == false){
				$('#birthdayMsg').text("생년월일을 다시 확인해주세요.");
			}
			if(phoneFlag == false){
				$('#phoneMsg').text("필수입력 정보입니다.");
			}
			if(nameFlag == false){
				$('#nameMsg').text("필수입력 정보입니다.");
			}
			if(addrFlag == false){
				$('#addrMsg').text("필수입력 정보입니다.");
			}
			if(emailFlag == false){
				$('#emailMsg').text("인증이 필요합니다.");
			}
		}
	});
	</script>


</html>