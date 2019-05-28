<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Insert title here</title>


	<style>
	
	#S_processBar div{ float:left; width:25%;}
	#S_process div:not(#S_process-bt){display:none;}
	
	.S_red{color:red;}
	.S_condition{float:right;}
	
	#S_ul1{list-style: none;}
	#S_ul1 li{display: block;
		float: left;
		width:30%;
		border: 1px solid black;
		}
	#S_ul2{list-style: none;}
	#S_ul2 li{display: block;
		float: left;
		width:9%;
		height:60px;
		border: 1px solid black;
		}
	.S_filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #7bc143; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #7bc143; 
		border-bottom-color: #7bc143; 
		border-radius: .25em; } 
	.S_filebox input[type="file"] { /* 파일 필드 숨기기 */ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
		}
	
	</style>
</head>


<body>
<!-- 헤더파일포함 -->
		<jsp:include page="/WEB-INF/common/header.jsp"/>
		<br><br>
		
<section>
<!-- section content -->
<div class="section content"">
	<!-- 프로세스바 -->
	<div id="S_processBar" style="text-align:center;">
		<div id="S_processBar-1">1.기본 정보<br>공간정보를 입력해주세요</div>
		<div id="S_processBar-2">2.연락처 정보<br>연락처 정보를 입력해주세요.</div>
		<div id="S_processBar-3">3.이용 안내<br>이용 정보를 입력해주세요.</div>
		<div id="S_processBar-4">4.결제 사항<br>결제 사항을 입력해주세요.</div>
	</div><!-- 프로세스바 -->
		<br>
		<br>
		<br>
		<br>
		<span class="S_red S_condition">* 필수입력</span>
		<br>
	<!-- 프로세스를 담는 Div -->	
	<div id="S_process"">
	
		<!-- 프로세스1 -->
		<div id="S_process-1">
			<br>
			공간명 <span class="S_red">*</span><span class="S_condition" id="S_lengthspan1">0자/18자</span> <br>
			<input type="text" id="S_placeName" name="S_placeName" class="form-control" placeholder="공간명을 입력해주세요.">
			<span id="S_opspan1"></span><span class="S_condition">사용가능 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)</span>
			<br><br>
			
			<input type="hidden" name="S_kategorie1" id="S_kategorie1">
			공간유형 <span class="S_red">*</span><br><span class="S_condition S_red">&nbsp;필수선택</span><span class="S_condition" style="color:blue;">최대5개선택&nbsp;</span>
			<br>
			<ul id="S_ul1">
				<li>회의실</li>
				<li>세미나실</li>
				<li>다목적홀</li>
				<li>작업실</li>
				<li>레저시설</li>
				<li>파티룸</li>
				<li>공연장</li>
				<li>연습실</li>
				<li>카페</li>
				<li>스터디룸</li>
				<li>엠티장소</li>
				<li>루프탑</li>
			</ul><br><br><br><br><br>
			
			
			
			공간 한줄 소개  <span class="S_red">*</span><span class="S_condition" id="S_lengthspan2">0자/27자</span>
			<input type="text" id="S_placeIntroduce1" name="S_placeIntroduce1" class="form-control" placeholder="공간을 소개하는 한 줄 문장을 입력해주세요.">
			<span id="S_opspan2"></span><br>
			
			공간 소개 <span class="S_red">*</span><span class="S_red S_condition">(최소 20자)</span><span class="S_condition" id="S_lengthspan3">0자/500자</span>
			<textarea id="S_placeIntroduce2" name="S_placeIntroduce2" class="form-control" placeholder="공간을 상세하게 소개해주세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다." style="height:150px;"></textarea>
			<span id="S_opspan3"></span><br><br>
			
			공간 태그 <span class="S_red">*</span><span class="S_condition">최대 5개</span><br>
			<input type="text" id ="S_placeTag" class="form-control" placeholder="태그를 입력해 주세요" style="width:94%;float:left;"><button id="S_tagbt" class="btn btn-outline-primary" style="width:6%;">추가</button>
			<span id="S_opspan4" name="S_placeTag"></span><button id="S_init" style="display:none;" class="btn btn-outline-primary">초기화</button>
			<br><br><br>
			
			편의시설<br><span class="S_condition">구비된 편의시설을 선택해주세요</span><br>
			<ul id="S_ul2">
				<li>TV/프로젝터</li>
				<li>인터넷/WIFI</li>
				<li>복사/인쇄기</li>
				<li>화이트보드</li>
				<li>음향/마이크</li>
				<li>취사시설</li>
				<li>음식물반입가능</li>
				<li>주류반입가능</li>
				<li>샤워시설</li>
				<li>주차</li>
				<li>금연</li>
				<li>반려동물 동반 가능</li>
				<li>PC/노트북</li>
				<li>의자/테이블</li>
				<li>내부화장실</li>
				<li>탈의실</li>
				<li>테라스/루프탑</li>
				<li>공용라운지</li>
				<li>전신거울</li>
				<li>바베큐시설</li>
				<li>도어락</li>
			</ul><br><br><br><br><br><br>
			<input type="hidden" name="S_kategorie2" id="S_kategorie2">
			
			웹사이트<br>
			<input type="text" name="S_placeWeb" id="S_placeWeb" class="form-control" placeholder="웹사이트 URL을 입력해주세요.(예시:http://toplace.com)">
			<br>
			
			대표이미지<span class="S_red"> *</span><span class="S_condition">최대 10MB</span><br>
				<img id="S_img1img" width="400px" height="200px" style="display:none;">
				<input id="S_img1text" type="text" class="form-control" style="background:white;width:400px;height:200px;display:inline" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" readonly>
			<div class="S_filebox S_condition" style="display:inline; border:0;"> 
			<label for="S_img1" class="btn btn-outline-success">업로드</label> 
			<input type="file" id="S_img1" name="S_img1" onchange="loadImg1(this)" accept="image/*"> 
			</div>
			<br><br>
			
			이미지<span class="S_condition">한 장당 최대 10MB <span class="S_red"> (최대 10장)</span></span><br>
			<div class="S_filebox S_condition" style="display:inline; border:0;"> 
			<br>
			<label for="S_img2" class="btn btn-outline-success">업로드</label> 
			<input type="file" id="S_img2" name="S_img2" onchange="loadImg2(this)" multiple="multiple" accept="image/*"> 
			</div>
				<%for(int i = 0; i<10; i++){ %>
				<% if(i==5){%>
				<br>
				<% }%>
				<img id="S_img2img<%=i %>" width="100px" height="100px" style="display:none; margin-top:3px;" >
				<%} %>
				<input id="S_img2text" type="text" class="form-control" style="background:white;width:500px;height:200px;display:inline" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" readonly>
			<br><br>
			
			주소(위치)<span class="S_red"> *</span><br>
			<input type="text" id="addrNum" name="addrNum" class="form-control" placeholder="주소를 등록해주세요." style="width:94%;float:left;background:white;" readonly">
			<button type="button" class="addressinsert btn btn-outline-primary" style="width:6%;">등록</button>
			<input type="text" id="address" name="address" class="form-control" placeholder="상세주소를 등록해주세요.">
			<br>
			
		</div><!-- 프로세스1 -->
		<!-- 프로세스2 -->
		<div id="S_process-2">두번째</div><!-- 프로세스2 -->
		<!-- 프로세스3 -->
		<div id="S_process-3">세번째</div><!-- 프로세스3 -->
		<!-- 프로세스4 -->
		<div id="S_process-4">네번째</div><!-- 프로세스4 -->
		
		<!-- 프로세스버튼-->
		<div id="S_process-bt" style="text-align:center;">
			<button id="S_bt-1" type="button" class="btn btn-outline-primary" >이전</button>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="S_bt-2" type="button" class="btn btn-outline-primary" >다음</button>
			<button id="S_bt-submit" type="submit" class="btn btn-outline-primary"
			style="display:none;">등록완료</button>
		</div><!-- 프로세스버튼-->
	</div><!-- 프로세스를 담는 Div -->	
</div><!-- section content -->
</section>

<jsp:include page="/WEB-INF/common/footer.jsp"/> <!-- footer 추가 -->


		<script>
		//S_placeName
			$("#S_placeName").keyup(function(){
				var value = $(this).val();
				$("#S_lengthspan1").text(value.length+"자/18자");
				var optimizer = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣0-9\(\)\[\]\-\.\,]{1,18}$/;
				if(optimizer.test(value)){
					$("#S_opspan1").text("사용가능한 공간명입니다.");
					$("#S_opspan1").css("color","blue");
					check1[0] = true;
				}else{
					$("#S_opspan1").text("사용불가한 공간명입니다.");
					$("#S_opspan1").css("color","red");
					check1[0] = false;
				}
			});
		//S_kategorie1	
			var stack1 = 0;
			var S_kategorie1 = [0,0,0,0,0,0,0,0,0,0,0,0];
			$("#S_ul1").children().click(function(){
				var index = $(this).index();
				if(S_kategorie1[index] == 0){
					if(stack1<5){
						$(this).css("background-color","lightgray");
						S_kategorie1[index] = 1;
						stack1 +=1;
						alert(S_kategorie1);
					}else{
						alert('5개까지 선택할 수 있습니다.');
					}
				}else{
					S_kategorie1[index] = 0;
					alert(S_kategorie1);
					$(this).css("background-color","white");
					stack1-=1;
				}
			});
		//S_placeIntroduce1
			$("#S_placeIntroduce1").keyup(function(){
				var value = $(this).val();
				$("#S_lengthspan2").text(value.length+"자/27자");
				var optimizer = /^[\W\w]{1,27}$/;
				if(optimizer.test(value)){
					$("#S_opspan2").text("허용가능한 공간소개입니다.");
					$("#S_opspan2").css("color","blue");
					check1[2] = true;
				}else{
					$("#S_opspan2").text("공간 한줄 소개는 27자까지 가능합니다.");
					$("#S_opspan2").css("color","red");
					check1[2] = false;
				}
			});
		//placeIntoduce2
			$("#S_placeIntroduce2").keyup(function(){
				var value = $(this).val();
				$("#S_lengthspan3").text(value.length+"자/500자");
				var optimizer = /^[\W\w]{20,500}$/;
				if(optimizer.test(value)){
					$("#S_opspan3").text("허용가능한 공간소개입니다.");
					$("#S_opspan3").css("color","blue");
					check1[3] = true;
				}else{
					$("#S_opspan3").text("공간 소개는 20~500자까지 가능합니다.");
					$("#S_opspan3").css("color","red");
					check1[3] = false;
				}
			});
		//S_placeTag
			var tagmsg = "";
			var tagnum = 0;
			$("#S_tagbt").click(function(){
				if($("#S_placeTag").val()!=""){
					if(tagnum==5){
						alert("태그는 최대 5개까지 가능합니다.");
					}else{
						tagnum +=1;
						tagmsg += "#"+$("#S_placeTag").val();
						$("#S_opspan4").html(tagmsg);
						$("#S_placeTag").val("");
						$("#S_init").css("display","inline");
					}
				}
			});
			$("#S_init").click(function(){
				tagmsg = "";
				tagnum = 0;
				$("#S_opspan4").html(tagmsg);
				$("#S_init").css("display","none");
			});
		//S_kategorie2
			var S_kategorie2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			$("#S_ul2").children().click(function(){
				var index = $(this).index();
				if(S_kategorie2[index] == 0){
						$(this).css("background-color","lightgray");
						S_kategorie2[index] = 1;
						alert(S_kategorie2);
				}else{
					S_kategorie2[index] = 0;
					alert(S_kategorie2);
					$(this).css("background-color","white");
				}
			});
			//S_img1
			function loadImg1(f){
				if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
					var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
					reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
					console.log(f.files[0]);
					reader.onload = function(e){
						$("#S_img1img").attr("src",e.target.result);
						$("#S_img1img").css("display","inline");
						$("#S_img1text").css("display","none");
						alert($("#S_img1").val());
						check1[5] = true;
					}
				} else{ //파일을 뺄 경우
					$("#S_img1img").attr("src","");
					$("#S_img1img").css("display","none");
					$("#S_img1text").css("display","inline");
					check1[5] = false;
				}
			}
			//S_img2
			function loadImg2(e){
				if(e.files.length!=0 && e.files[0]!=0){
					if(e.files.length>10){
						alert("파일은 10장까지만 삽입 가능합니다.");
						return;
					}
					$("#S_img2text").css("display","none");
					for(var i = 0; i<10; i++){
						$("#S_img2img"+i).attr("src","");
					}
					var index = 0;
					var filesArr = Array.prototype.slice.call(e.files);
					filesArr.forEach(function(f){
						var reader = new FileReader();
						reader.onload=function(e){
							$("#S_img2img"+index).css("display","inline");
							$("#S_img2img"+index).attr("src",e.target.result);
							index++;
						}
						reader.readAsDataURL(f);
					});
				}else{
					$("#S_img2text").css("display","inline");
					for(var i = 0; i<10; i++){
						$("#S_img2img"+i).attr("src","");
						$("#S_img2img"+i).css("display","none");
					}
				}
			}
			//addrNum, address
			$(".addressinsert").click(function(){
      		var pop = window.open("/views/jusoPopup.jsp","주소찾기",'width=600,height=700');
      		pop.location.href;
   			});
		//프로세스 이전,다음 로직
			var state = 0;
			window.onload = function(){
				$('#S_processBar-1').css("background-color","lightblue");
				$('#S_process-1').css("display","block");
				$('#S_bt-1').css("visibility","hidden");
				state = 1;
			};
			
			var check1 = [false,0,false,false,0,false,0,0]; //다음버튼 가기 전 체크용
			var check11 = ["#S_placeName","#S_kategorie1","#S_placeIntroduce1","#S_placeIntroduce2","#S_placeTag","#S_img1"]; //다음버튼 가기 전 체크용
			
			$("#S_bt-2").click(function(){
				if(state==1){
					$("#S_kategorie1").val(S_kategorie1.join(','));
					$("#S_kategorie2").val(S_kategorie2.join(','));
					for(var i = 0 ; i<check1.length;i++){ 
						switch(i){
						case 0: 
						case 2:
						case 3:
							if(check1[i]==false){
								$(check11[i]).focus();
								return;
							}
							break;
						case 1:
							if($("#S_kategorie1").val()=="0,0,0,0,0,0,0,0,0,0,0,0"){
								alert("공간유형은 최소한 한 개 이상 선택하여야 합니다.");
								$(check11[i]).focus();
								return;
							}
							break;
						case 4:
							if($("#S_opspan4").text()==""){
								$(check11[i]).focus();
								return;
							}
							break;
						case 5:
							if(check1[i]==false){
								alert("대표사진은 최소한 한 장 이상 등록하여야 합니다.");
								$("#S_img1text").focus();
								return;
							}
							break;
						}
					}
					$('#S_processBar-1').css("background-color","white");
					$('#S_process-1').css("display","none");
					$('#S_processBar-2').css("background-color","lightblue");
					$('#S_process-2').css("display","block");
					$('#S_bt-1').css("visibility","visible");
					state=2;
				}else if(state==2){
					$('#S_processBar-2').css("background-color","white");
					$('#S_process-2').css("display","none");
					$('#S_processBar-3').css("background-color","lightblue");
					$('#S_process-3').css("display","block");
					state=3;
				}else if(state==3){
					$('#S_processBar-3').css("background-color","white");
					$('#S_process-3').css("display","none");
					$('#S_processBar-4').css("background-color","lightblue");
					$('#S_process-4').css("display","block");
					$("#S_bt-2").css("display","none");
					$("#S_bt-submit").css("display","inline");
					state=4;
				}
			});
			$("#S_bt-1").click(function(){
				if(state==4){
					$('#S_processBar-4').css("background-color","white");
					$('#S_process-4').css("display","none");
					$('#S_processBar-3').css("background-color","lightblue");
					$('#S_process-3').css("display","block");
					$("#S_bt-2").css("display","inline");
					$("#S_bt-submit").css("display","none");
					state=3;
				}else if(state==3){
					$('#S_processBar-3').css("background-color","white");
					$('#S_process-3').css("display","none");
					$('#S_processBar-2').css("background-color","lightblue");
					$('#S_process-2').css("display","block");
					state=2;
				}else if(state==2){
					$('#S_processBar-2').css("background-color","white");
					$('#S_process-2').css("display","none");
					$('#S_processBar-1').css("background-color","lightblue");
					$('#S_process-1').css("display","block");
					$('#S_bt-1').css("visibility","hidden");
					state=1;
				}
			});
			
			
			
			
		</script>
</body>
</html>