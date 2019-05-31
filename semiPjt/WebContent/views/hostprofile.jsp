<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<title>TOPlace</title>
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
	.hstprofile_content{
		width: 100%;
		height: 200px;
		border: 1px solid;
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
		width : 150px;
		height: 50px;
		border: 0px;
		color : white;
	}
	#cencelBtn{
		outline : none;
		background:#183058;
		width : 150px;
		height: 50px;
		border: 0px;
		color : white;
		border-radius: 10px;
	}
	.layer_popup {
		border-radius:10px;
		text-align: center;
		background:#f7f7f7;
	    position: absolute;
	    top: 30%;
	    left: 45%;
	    display: block;
	    width: 500px;
	    z-index: 150;
	    padding : 40px 0 0 0;
	    margin-left: -145px;
	    
	}
	.pop_guide_txt{
		font-size: 18px;
	}
	.accent{
		color:#f69b02;
	}
	.btns{
		margin : 30px 0 30px 0;
	}
	.btns a:hover{
		text-decoration: none;
		color: #f7f7f7;
	}
	.popcencle{
		background: #605f5d;
    	font-size: 20px;
    	padding : 10px 40px 10px;
    	color : #f7f7f7;
	}
	.poprollback{
		background:#183058;
		font-size: 20px;
		padding : 10px 20px 10px 20px;
		color : #f7f7f7;
	}
	.hostpopupMask{
		top:0;
		left:0;
		z-index:99;
		position: fixed;
		width: 100%;
		height: 1000px;
		background-color: black;
		opacity: 0.6;
		display:none;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>	
		<form class="profileForm" action="/hostProfile" method="post" enctype="multipart/form-data">
			<div class="section_content">
				<div class="hostprofile_tit">
					<div class="tit_content">
						<span class="hostprofile_option">*필수입력</span>	
						<h3>호스트 정보를 입력해 주세요</h3>
						<input type="hidden" name="userNo" value="">
					</div>
				</div>
				<div class="hstprofile_content">
					<div class="content_header">
						<h5>프로필 이미지</h5>
					</div>
					<div class="content_text" id="profileImg">
						<div class="file_img"></div>
						<div class="placeholder">
							<span style="color:black">파일유형 jpg, jpeg, png, gif<br>
									최대파일크기 10MB</span>
						</div>
						<div class="file_box">
							<label for="hostFile" style="width: 100%; background: #183058; text-align: center;">
							<span style="color:white;">파일첨부</span>
							<input type="hidden" name="oldFilename" value="">  <!--예전파일명 -->
	                    	<input type="hidden" name="oldFilename" value="">  <!--예전파일경로 -->
							<input type="file" name="hostFile" id="hostFile" style="display: none;" accept="image/*" onchange="loadImg(this)">
							</label>
						</div>
						
					</div>
				</div>
				<div class="hstprofile_content">
					<div class="content_header">
						<span class="hostprofile_option"><label id="nameLength"></label>/10자</span>
						<h5>프로필 명<span>*</span></h5>
					</div>
					<div class="content_text">
						<input type="text" name="hostName" id="hostName" maxlength="10" placeholder="프로필명을 입력해주세요" style="width: 300px; height: 50px; font-size: 18px;">
						<p style="display: none;" id="nameErrorMsg">프로필명은 필수 입력입니다.</p>
					</div>
				</div>
				<div class="hstprofile_content">
					<div class="content_header">
						<span class="hostprofile_option"><label id="contentLength"></label>/30자</span>
						<h5>소개말<span>*</span></h5>
					</div>
					<div class="content_text">
						<textarea id="hostContent" name="hostContent" maxlength="30" placeholder="프로필에 노출될 소개말을 입력해주세요." style="height:108px; resize: none;" required ></textarea>
						<p style="display: none;" id="contentErrorMsg">소개말(0~30자)은 필수 입력입니다.</p>
					</div>
				</div>
				<center>
					<div class="hstprofile_footer">
						<div class="footerContent">
							<button type="button" id="cencelBtn">돌아가기</button>
						</div>
						<div class="footerContent"> 
							<button type="button" id="successBtn">등록</button>
						</div>
					</div>
				</center>
			</div>
		</form>
		<div class="layer_popup" id="_noProfileCheckLayout" style="display:none;position:fixed;">
			<div class="popup_wrap alert">
				<div class="pop_container">
					<p class="pop_guide_txt">
						프로필 등록 후 공간을 등록할 수 있습니다.<br>
						<span class="accent">등록을 취소하시겠습니까?</span>
					</p>
					<div class="btns">
						<a href="javascript:void(0);" class="popcencle" _popcls="_noProfileCheckLayout">닫기</a>
						<a href="javascript:history.back();" class="poprollback">등록 취소</a>
					</div>
				</div>
			</div>
		</div>
		<div class="hostpopupMask">
		
		</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
<script type="text/javascript">
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
		console.log(count);
		$("#nameLength").text(count);
		if(count > 10){
			$("#nameLength").text(10);
		}
	});
	$("#hostContent").keyup(function(){
		var count = $("#hostContent").val().length;
		console.log(count);
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