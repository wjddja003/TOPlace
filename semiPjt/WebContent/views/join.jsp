<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/common/header.jsp" %>
<center>
	<section>
		<form action="/" method="post">
			<table>
				<tr>
					<td><label>아이디</label></td>
                    <td><input type="text" id="userId" style="width:200px; height:30px" maxlength="16"><span id="idMsg">  ID는 영문소문자와 숫자만 입력 가능합니다.</span>
                    <p>※ 4~16자까지 영문자(소문자), 숫자만 가능합니다. [한글 및 특수문자 (스페이스 포함) 등은 사용할 수 없습니다.]</p>
                    </td>
				</tr>
				<tr>
					 <td><label>비밀번호</label></td>
                     <td><input type="password" id="userPw" style="width:200px; height:30px"><span id="pwMsg">  </span>
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
						<input type="text" name="year" style="width:70px;">
						<select name=month style="width:70px;height:20px;">
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
						<input type="text" name="day" style="width:70px;">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><select style="width:70px; height:30px;">
                            <option value="">성별</option>
                        	<option value="M">남자</option>
                            <option value="F">여자</option>
                        </select></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email"> <button type="button" class="btn1">인증</button></td>
					<td><label id="eTxt"></label></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<select style="width:70px; height:30px;">
                            <option>선택</option>
                        	<option>010</option>
                            <option>011</option>
                        </select>
                        <span style="margin:0 5px 0 5px;"> - </span><input type="text" id="phone1" style="width:70px; height:30px" maxlength="4">
                        <span style="margin:0 5px 0 5px;"> - </span><input type="text" id="phone2" style="width:70px; height:30px" maxlength="4"> 
                        <br><label id="phoneMsg"></label>
                    </td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="addrNum" name="addrNum" style="width:100px; height:20px;"><button type="button" class="addressinsert" >우편주소</button><br><input type="text" id="address" name="address" style="width:350px; height:20px; font-size:10px;"></td>				
				</tr>
				
			</table>
		</form>
	</section>
</center>
	<script type="text/javascript">
	$(".btn1").click(function(){
		var email = $("input[name=email]").val();
		var url = "/emailCheck";
		var pop = window.open("emailCheck.jsp","emailCheck","width=300,height=300");
		pop.location.href=url+"?email="+email;
		
	});
	$(".addressinsert").click(function(){
		var pop = window.open("/jusoPopup.jsp","주소찾기",'width=600,height=700');
		pop.location.href;
	})
	$(document).ready(function(){
		 var userName = /^[가-힣]([가-힣]{1,3})$/;
		 var userId = /^[a-z0-9]([a-z0-9]{3,11})$/;
         var userPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
         var phone = /^[0-9]*$/;
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
         
	})
	</script>
</body>


</html>