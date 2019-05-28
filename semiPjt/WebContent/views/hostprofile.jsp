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
<title>호스트 등록</title>
</head>
<style>
	.hostprofile_option{
		color: red;
		text-align: right;
		display: inline-block;
		float: right;
	}
	.hstprofile_content{
		width: 100%;
		height: 150px;
		border: 1px solid;
	}
	.hstprofile_content span{
		color: red;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>	
		<form action="" method="post" enctype="multipart/form-data">
			<div class="section_content">
				<div class="hostprofile_tit">
				<span class="hostprofile_option">*필수입력</span>	
					<h3>호스트 정보를 입력해 주세요</h3>
					<input type="hidden" name="userNo" value="">
				</div>
				<div class="hstprofile_content">
					<h5>프로필 이미지</h5>
					<input type="hidden" name="oldFilename" value="">  <!--예전파일명 -->
                    <input type="hidden" name="oldFilename" value="">  <!--예전파일경로 -->
					<input type="file" name="hostFile">
				</div>
				<div class="hstprofile_content">
					<span class="hostprofile_option">/10자</span>
					<h5>프로필 명<span>*</span></h5>
					<input type="text" name="hostName" maxlength="10" placeholder="프로필명을 입력해주세요">
				</div>
				<div class="hstprofile_content">
					<span class="hostprofile_option">/30자</span>
					<h5>소개말<span>*</span></h5>
					<input type="text" name="hostContent" maxlength="30" placeholder="소개글을 입력해주세요">
				</div>
				<div class="hstprofile_content">
					<input type="checkbox" name="hostSMS" value="1"> 이벤트 등 프로모션 알림 E-MAIL 수신
				</div>
				<div>
					<span>동의하지 않을 경우 .....</span>
				</div>
				<div>
					<span>마케팅 정보 수신에 동의하지 않더라도 .....</span>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>