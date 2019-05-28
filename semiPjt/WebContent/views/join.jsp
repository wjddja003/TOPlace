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
		#birthdayMsg{
			color : red;
		}
		#genderMsg{
			color : red;
		}
	</style>

</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
<center>
	<div class="joincontainer">
		<form action="/join" method="get">
			<input type="hidden" name="termsEmail" value='${param.termsEmail}'>
			<div class="joincontainer join">
			<div class="joinheader">
				<p>회원가입</p>
			</div>
			<table class="table">
				<tr>
					<td><label>아이디</label></td>
                    <td><input type="text" id="userId" name="userId" style="width:200px; height:30px" maxlength="16"><span id="idMsg">  ID는 영문소문자와 숫자만 입력 가능합니다.</span>
                    <p>※ 4~16자까지 영문자(소문자), 숫자만 가능합니다. [한글 및 특수문자 (스페이스 포함) 등은 사용할 수 없습니다.]</p>
                    </td>
				</tr>
				<tr>
					 <td><label>비밀번호</label></td>
                     <td><input type="password" id="userPw" name="userPw" style="width:200px; height:30px"><span id="pwMsg">  </span>
                     <p>※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p>
                     <p style="margin: 5px 0 5px 0;">※ 타인이 계정정보를 도용하지 않도록 회원 본인의 안전한 비밀번호 관리가 필요합니다.</p></td>
				</tr>
				<tr>
					 <td><label>비밀번호 확인</label></td>
                     <td><input type="password" id="userPwre" style="width:200px; height:30px"><span id="pwreMsg">비밀번호를 다시 한번 입력해 주세요.  </span></td>
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
						<label id="eTxt"></label>
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
                        <br><label id="phoneMsg"></label>
                    </td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="addrNum" name="addrNum" style="width:100px; height:20px;"><button type="button" class="addressinsert" >우편주소</button>
						<br>
						<input type="text" id="address" name="address" style="width:350px; height:20px; font-size:10px;">
					</td>				
				</tr>
				<tr>
					<td ><button type="submit">가입하기</button></td>
				</tr>
			</table>
			</div>
		</form>
	</div>
</center>
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
	$(document).ready(function(){
		 var userName = /^[가-힣]([가-힣]{1,3})$/;
		 var userId = /^[a-z0-9]([a-z0-9]{3,11})$/;
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
            } 
         });
         $('#userId').focusout(function(){
             if(!userId.test($('#userId').val())){
            	 $('#idMsg').css("color","red");
                 $('#idMsg').text("ID는 4자리이상 16자리 미만으로 입력해야 합니다.");
                 $(this).val("");
             }else{
                 $('#idMsg').text("사용 가능한 ID 입니다.");
                 $('#idMsg').css("color","black");             
             }
         });
         $('#userPw').focusout(function(){
             if(!userPw.test($('#userPw').val())){
                 $('#pwMsg').css("color","red");
                 $('#pwMsg').text("[사용불가] 안전한 비밀번호 기준에 맞지 않습니다.");
                 $(this).val("");
             }else if(userPw.test($('#userPw').val())&&$('#userPw').val().length>10){
                 $('#pwMsg').css("color","blue");
                 $('#pwMsg').text("[안전] 안전한 비밀번호입니다.");
             }else{
                 $('#pwMsg').css("color","gray");
                 $('#pwMsg').text("[보통] 적정수준의 안전한 비밀번호입니다.");
             }
         });
         $('#userPwre').focusout(function(){
             if($('#userPwre').val() == $('#userPw').val() && !($('#userPwre').val() == "")){
                 $('#pwreMsg').css("color","gray");
                 $('#pwreMsg').text("입력한 비밀번호가 일치합니다.");
             }else{
                 $('#pwreMsg').css("color","red");
                 $('#pwreMsg').text("비밀번호가 일치하지 않습니다.");
                 $(this).val("");
             }
         });
         $('#phone1').focusout(function(){
             if(!phone.test($('#phone1').val())){
                 $('#phoneMsg').css("color","red");
                 $('#phoneMsg').text("숫자만 입력가능합니다.");
                 $(this).val("");
             }else{
                 $('#phoneMsg').css("color","black");
                 $('#phoneMsg').text("");
             }
         });
         $('#phone2').focusout(function(){
             if(!phone.test($('#phone2').val())){
                 $('#phoneMsg').css("color","red");
                 $('#phoneMsg').text("숫자만 입력가능합니다.");
                 $(this).val("");
             }else{
                 $('#phoneMsg').css("color","black");
                 $('#phoneMsg').text("");
             }
         });
         var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
         
         $('#year').focusout(function(){
    		 if(!year.test($(this).val()) || $(this).val().length < 4){
    		 	$('#birthdayMsg').text("태어난 년도 4자리를 정확하게 입력하세요.");
    		 	$(this).val("");
    		 }else{
    			$('#birthdayMsg').text("");
    		 }
    	 });
         var index = 0;
         $('#month').focusout(function(){
        	 index = $("#month option").index($("#month option:selected"));
			 if(index == 0){
				 $('#birthdayMsg').text("생년월일을 다시 확인해주세요.");
				 $(this).val("");
    		 }
			 else{
				 $('#birthdayMsg').text("");
			 }
         });
         $('#day').focusout(function(){
        	 if($(this).val() > month_day[index-1]){
        		 $('#birthdayMsg').text("생년월일을 다시 확인해주세요.");
				 $(this).val("");
        	 }
        	 else{
        		 $('#birthdayMsg').text("");
        	 }
         });
         $('#gender').focusout(function(){
        	 var gender = $("#gender option").index($("#gender option:selected"));
        	 if(gender == 0){
        		$('#genderMsg').text("필수입력 정보입니다.");
        	 }else{
        		$('#genderMsg').text(""); 
        	 }
        		
         })
         
	})
	</script>
</body>


</html>