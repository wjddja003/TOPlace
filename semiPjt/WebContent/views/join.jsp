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
			background-color: ivory;
			height: 840px;
			
		}
		.join{
			width:70%;
		}
		.joinheader{
			padding: 40px 0 0 0;
			text-align: left;
			font-size: 30px;
			font-weight: 900;
		}
		span{
			color : red;
		}
	</style>

</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
	<section>
		<div class="section_content">
			<div class="joincontainer">
				<form action="/join" method="get" id="joinform">
					<input type="hidden" name="termsEmail" value='${param.termsEmail}'>
					<div class="joincontainer join">
					<div class="joinheader">
						<p>회원가입</p>
					</div>
					<table class="table" style="width:100%">
						<tr>
							<td><label>아이디</label></td>
		                    <td><input type="text" id="userId" name="userId" style="width:200px; height:30px" maxlength="16"><span id="idMsg"></span>
		                   
		                    </td>
						</tr>
						<tr>
							 <td><label>비밀번호</label></td>
		                     <td><input type="password" id="userPw" name="userPw" style="width:200px; height:30px"><span id="pwMsg">  </span>
		                     <p>※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p>
		                    
						</tr>
						<tr>
							 <td><label>비밀번호 확인</label></td>
		                     <td><input type="password" id="userPwre" style="width:200px; height:30px"><span id="pwreMsg">  </span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" id="userName" maxlength="4"><span id="nameMsg"></span></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<input type="text" name="year" id="year" style="width:70px;" maxlength="4">
								<select name=month id="month" style="width:70px;height:20px;">
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
								<input type="text" name="day" id="day" style="width:70px;" maxlength="2"><br><span id="birthdayMsg"></span>
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td><select id="gender" name="gender" style="width:70px; height:30px;">
		                            <option>성별</option>
		                        	<option value="M">남자</option>
		                            <option value="F">여자</option>
		                        </select>
		                        <br>
		                        <span id="genderMsg"></span>
		                        </td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email" id="email"> <button type="button" class="btn1">인증</button><br>
								<span id="emailMsg"></span>
								<span id="eTxt" style="color:blue"></span>
							</td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td>
								<select style="width:70px; height:30px;" name="phone">
		                            <option>선택</option>
		                        	<option>010</option>
		                            <option>011</option>
		                        </select>
		                        <span style="margin:0 5px 0 5px;"> - </span><input type="text" id="phone1" name="phone1" style="width:70px; height:30px" maxlength="4">
		                        <span style="margin:0 5px 0 5px;"> - </span><input type="text" id="phone2" name="phone2" style="width:70px; height:30px" maxlength="4"> 
		                        <br><span id="phoneMsg"></span>
		                    </td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" id="addrNum" name="addrNum" style="width:100px; height:20px;" readonly="readonly"><button type="button" class="addressinsert" >우편주소</button>
								<br>
								<input type="text" id="address" name="address" style="width:350px; height:20px; font-size:10px;" readonly="readonly"><br>
								<span id="addrMsg"></span>
							</td>				
						</tr>
						<tr>
							<td ><button type="button" class="btnjoin">가입하기</button></td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	$(".btn1").click(function(){
		var email = $("input[name=email]").val();
		var url = "/emailCheck";
		var pop = window.open("/views/emailCheck.jsp","emailCheck","width=300,height=300");
		pop.location.href=url+"?email="+email;
		
	});
	
	$(".addressinsert").click(function(){
		var pop = window.open("/views/jusoPopup.jsp","주소찾기",'width=600,height=700');
		pop.location.href;
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
         var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
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
			 if(index == 0){
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
        	 if($(this).val() > month_day[index-1]){
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
        	if(!email.test($(this).val())){
        		$("#emailMsg").text("이메일 주소를 다시 확인해주세요.");
        	}else{
        		$("#emailMsg").text("");
        	} 
         });
         
	})
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
     				}else{
     					$("#idMsg").hide();
     				}
     				idFlag =true;
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
</body>


</html>