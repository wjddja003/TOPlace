<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.hostprofile_tit{
		margin: 50px 0 10px 0;
		border-bottom: 4px solid #183058;
	}
	.hostprofile_option{
		color: red;
		text-align: right;
		display: inline-block;
		float: right;
	}
	.hstprofile_content_profile{
		margin : 0 2% 0 0;
		float: left;
		width: 49%;
		height: 200px;
		
	}
	.hstprofile_content_name{
		float: left;
		width: 49%;
		height: 200px;
		
	}
	.hstprofile_content_text{
		clear: left;
		width: 100%;
		height: 200px;
		
	}
	.hstprofile_footer{
		width: 100%;
	}
	.hstprofile_content span{
		color: red;
	}
	.tit_content{
		margin:  0 0 20px 0;
	}
	#hostContent{
		padding: 15px 16px;
		width: 100%;
	}
	.content_header{
		padding : 10px;
	}
	.content_text{
		padding: 0 10px 0 10px;
		width: 100%;
	}
	.file_box{
		width: 154px;
   		line-height: 50px;
   		margin: 0 0 0 20px;
	}
	.file_img{
		position: absolute;
		border: 1px solid;
		top : 0px;
		left : 0px;
		width: 100px;
		height: 100px;
		border-radius: 50px;
		background-image : url(/img/logo.png);
		background-size: contain;
		background-position: center;
		background-repeat: no-repeat;
	}
	#profileImg>div{
		float: left;
	}
	#profileImg{
		position: relative;
		padding: 30px 0 0 110px;
	}
	.hstprofile_footer{
		margin-top : 20px;
		width: 30%;
	}
	.footerContent{
		margin : 10px;
		float: left;
	}
	#successBtn{
		outline: none;
		background:#f69b02;
		border-radius: 10px;
		width : 300px;
		height: 50px;
		border: 0px;
		color : white;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>	
		<form class="profileForm" action="/hostProfileUpdate" method="post" enctype="multipart/form-data">
			<div class="section_content">
				<div class="hostprofile_tit">
					<div class="tit_content">
						<span class="hostprofile_option">*필수입력</span>	
						<h3>호스트 정보를 입력해 주세요</h3>
						<input type="hidden" id="hostNo" name="hostNo" value="${sessionScope.host.hostNo}">
						<input type="hidden" id="userNo" name="userNo" value="${sessionScope.User.userNo}">
					</div>
				</div>
				<div class="hstprofile_content_profile">
					<div class="content_header">
						<h5>프로필 이미지</h5>
					</div>
					<div class="content_text" id="profileImg">
						<c:choose>
							<c:when test="${empty sessionScope.host.hostFile}">
								<div class="file_img"></div>
							</c:when>
							<c:otherwise>
								<div class="file_img" style="background: url(/upload/hostProfile/${sessionScope.host.hostFile}); background-size:cover;" ></div>
							</c:otherwise>
						</c:choose>
						<div class="placeholder">
							<span style="color:black">파일유형 jpg, jpeg, png, gif<br>
									최대파일크기 10MB</span>
						</div>
						<div class="file_box">
							<label for="hostFile" style="width: 100%; background: #183058; text-align: center;">
							<span style="color:white;">파일첨부</span>
							<input type="hidden" name="oldFilename" value="${sessionScope.host.hostFile}">  <!--예전파일명 -->
							<input type="file" name="hostFile" id="hostFile" style="display: none;" accept="image/*" onchange="loadImg(this)" value="${sessionScope.host.hostFile}">
							</label>
						</div>
					</div>
				</div>
				<div class="hstprofile_content_name">
					<div class="content_header">
						<span class="hostprofile_option"><label id="nameLength"></label>/10자</span>
						<h5>프로필 명<span>*</span></h5>
					</div>
					<div class="content_text">
						<input type="text" name="hostName" id="hostName" maxlength="10" placeholder="프로필명을 입력해주세요" style="width: 300px; height: 50px; font-size: 18px;" value="${sessionScope.host.hostName}">
						<p style="display: none;" id="nameErrorMsg">프로필명은 필수 입력입니다.</p>
					</div>
				</div>
				<div class="hstprofile_content_text">
					<div class="content_header">
						<span class="hostprofile_option"><label id="contentLength"></label>/30자</span>
						<h5>소개말<span>*</span></h5>
					</div>
					<div class="content_text">
						<textarea id="hostContent" name="hostContent" maxlength="30" placeholder="프로필에 노출될 소개말을 입력해주세요." style="height:108px; resize: none;" required>${sessionScope.host.hostContent}</textarea>
						<p style="display: none;" id="contentErrorMsg">소개말(0~30자)은 필수 입력입니다.</p>
					</div>
				</div>
				<center>
					<div class="hstprofile_footer">
						<div class="footerContent"> 
							<button type="button" id="successBtn">완료</button>
						</div>
					</div>
				</center>
			</div>
		</form>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nameLength").text($("#hostName").val().length);
		$("#contentLength").text($("#hostContent").val().length);
	});
	var hostNameFlag = false;
	var hostContentFlag = false;
	$("#successBtn").click(function(){
		if($("#hostName").val() != ""){
			hostNameFlag = true;
			$("#nameErrorMsg").css("display","none");
		}else{
			$("#nameErrorMsg").css("display","block");
		}
		if($("#hostContent").val() != ""){
			hostContentFlag = true;
			$("#contentErrorMsg").css("display","none");
		}else{
			$("#contentErrorMsg").css("display","block");
		}
		
		if(hostNameFlag == true && hostContentFlag ==true){
			$(".profileForm").submit();
		}
	});
	$("#hostName").keyup(function(){
		var count = $("#hostName").val().length;
		$("#nameLength").text(count);
		if(count > 10){
			$("#nameLength").text(10);
		}
	});
	$("#hostContent").keyup(function(){
		var count = $("#hostContent").val().length;
		$("#contentLength").text(count);
		if(count > 30){
			$("#contentLength").text(30);
		}
	});
	function loadImg(event){
		if(event.files.length!=0 && event.files[0] != 0){
			var reader = new FileReader();
			reader.readAsDataURL(event.files[0]);
			reader.onload = function(e){
				console.log($("#hostFile").val());
				$(".file_img").attr("style","background-image:url("+e.target.result+")");
				$(".file_img").css("background-size","cover");
				
			}
		}else{
			$(".file_img").attr("style","background-image:url(/img/logo.png)");
			$(".file_img").css("background-size","contain");
		}
		
	}
	$("#cencelBtn").click(function(){
		$('.layer_popup').show();
		$('.hostpopupMask').show();
	});
	$(".popcencle").click(function(){
		$('.layer_popup').hide();
		$('.hostpopupMask').hide();
	});
</script>
</html>