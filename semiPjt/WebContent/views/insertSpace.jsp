<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Insert title here</title>
	<style>
	
	#processBar div{ float:left; width:25%;}
	#process div:not(#process-bt){display:none;}
	
	.red{color:red;}
	.condition{float:right;}
	
	#ul1{list-style: none;}
	#ul1 li{display: block;
		float: left;
		width:30%;
		border: 1px solid black;
		}
	#ul2{list-style: none;}
	#ul2 li{display: block;
		float: left;
		width:9%;
		height:60px;
		border: 1px solid black;
		}
	.filebox label { 
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
	.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
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
<div class="section content">
	<!-- 프로세스바 -->
	<div id="processBar" style="text-align:center;">
		<div id="processBar-1">1.기본 정보<br>공간정보를 입력해주세요</div>
		<div id="processBar-2">2.연락처 정보<br>연락처 정보를 입력해주세요.</div>
		<div id="processBar-3">3.이용 안내<br>이용 정보를 입력해주세요.</div>
		<div id="processBar-4">4.결제 사항<br>결제 사항을 입력해주세요.</div>
	</div>
		<br>
		<br>
		<br>
		<br>
		<span class="red condition">* 필수입력</span>
		<br>
	<!-- 프로세스를 담는 Div -->	
	<div id="process"">
	
		<!-- 프로세스1 -->
		<div id="process-1">
			<br>
			공간명 <span class="red">*</span><span class="condition" id="lengthspan1">0자/18자</span> <br>
			<input type="text" id="placeName" name="placeName" class="form-control" placeholder="공간명을 입력해주세요.">
			<span id="opspan1"></span><span class="condition">사용가능 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)</span>
			<br><br>
			
			공간유형 <span class="red">*</span><br><span class="condition red">&nbsp;필수선택</span><span class="condition" style="color:blue;">최대5개선택&nbsp;</span>
			<br>
			<ul id="ul1">
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
			<input type="hidden" name="kategorie1" id="kategorie1">
			
			
			공간 한줄 소개  <span class="red">*</span><span class="condition" id="lengthspan2">0자/27자</span>
			<input type="text" id="placeIntroduce1" name="placeIntroduce1" class="form-control" placeholder="공간을 소개하는 한 줄 문장을 입력해주세요.">
			<span id="opspan2"></span><br>
			
			공간 소개 <span class="red">*</span><span class="red condition">(최소 20자)</span><span class="condition" id="lengthspan3">0자/500자</span>
			<textarea id="placeIntroduce2" name="placeIntroduce2" class="form-control" placeholder="공간을 상세하게 소개해주세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다." style="height:150px;"></textarea>
			<span id="opspan3"></span><br><br>
			
			공간 태그 <span class="red">*</span><span class="condition">최대 5개</span><br>
			<input type="text" id ="placeTag" class="form-control" placeholder="태그를 입력해 주세요" style="width:94%;float:left;"><button id="tagbt" class="btn btn-outline-primary" style="width:6%;">추가</button>
			<span id="opspan4" name="placeTag"></span><button id="init" style="display:none;" class="btn btn-outline-primary">초기화</button>
			<br><br><br>
			
			편의시설<br><span class="condition">구비된 편의시설을 선택해주세요</span><br>
			<ul id="ul2">
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
			<input type="hidden" name="kategorie2" id="kategorie2">
			
			웹사이트<br>
			<input type="text" name="placeWeb" id="placeWeb" class="form-control" placeholder="웹사이트 URL을 입력해주세요.(예시:http://toplace.com)">
			<br>
			
			대표이미지<span class="red"> *</span><br>
				<img id="img1img" width="400px" height="200px" style="display:none;">
				<input id="img1text" type="text" class="form-control" style="background:white;width:400px;height:200px;display:inline" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" readonly>
			<div class="filebox condition" style="display:inline; border:0;"> 
			<label for="img1" class="btn btn-outline-success">업로드</label> 
			<input type="file" id="img1" name="img1" onchange="loadImg1(this)" accept="image/*"> 
			</div>
			<br><br>
			
			이미지<br>
				<%for(int i = 0; i<10; i++){%>
				<%if(i==5){%>
				<br>
				<% }%>
				<img id="img2img<%=i %>" width="100px" height="100px" style="display:none;">
				<%} %>
				<input id="img2text" type="text" class="form-control" style="background:white;width:500px;height:200px;display:inline" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" readonly>
			<div class="filebox condition" style="display:inline; border:0;"> 
			<label for="img2" class="btn btn-outline-success">업로드</label> 
			<input type="file" id="img2" name="img2" onchange="loadImg2(this)" multiple="multiple" accept="image/*"> 
			</div>
			<br><br>
			
			주소(위치)<span class="red"> *</span>
		</div>
		<!-- 프로세스2 -->
		<div id="process-2">두번째</div>
		<!-- 프로세스3 -->
		<div id="process-3">세번째</div>
		<!-- 프로세스4 -->
		<div id="process-4">네번째</div>
		
		<!-- 프로세스버튼-->
		<div id="process-bt" style="text-align:center;">
			<button id="bt-1" type="button" class="btn btn-outline-primary" >이전</button>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="bt-2" type="button" class="btn btn-outline-primary" >다음</button>
			<button id="bt-submit" type="submit" class="btn btn-outline-primary"
			style="display:none;">등록완료</button>
		</div>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/common/footer.jsp"/> <!-- footer 추가 -->


		<script>
		//placeName
			$("#placeName").keyup(function(){
				var value = $(this).val();
				$("#lengthspan1").text(value.length+"자/18자");
				var optimizer = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣0-9\(\)\[\]\-\.\,]{1,18}$/;
				if(optimizer.test(value)){
					$("#opspan1").text("사용가능한 공간명입니다.");
					$("#opspan1").css("color","blue");
					check1[0] = true;
				}else{
					$("#opspan1").text("사용불가한 공간명입니다.");
					$("#opspan1").css("color","red");
					check1[0] = false;
				}
			});
		//kategorie1	
			var stack1 = 0;
			var kategorie1 = [0,0,0,0,0,0,0,0,0,0,0,0];
			$("#ul1").children().click(function(){
				var index = $(this).index();
				if(kategorie1[index] == 0){
					if(stack1<5){
						$(this).css("background-color","lightgray");
						kategorie1[index] = 1;
						stack1 +=1;
						alert(kategorie1);
					}else{
						alert('5개까지 선택할 수 있습니다.');
					}
				}else{
					kategorie1[index] = 0;
					alert(kategorie1);
					$(this).css("background-color","white");
					stack1-=1;
				}
			});
		//placeIntroduce1
			$("#placeIntroduce1").keyup(function(){
				var value = $(this).val();
				$("#lengthspan2").text(value.length+"자/27자");
				var optimizer = /^[\W\w]{1,27}$/;
				if(optimizer.test(value)){
					$("#opspan2").text("허용가능한 공간소개입니다.");
					$("#opspan2").css("color","blue");
				}else{
					$("#opspan2").text("공간 한줄 소개는 27자까지 가능합니다.");
					$("#opspan2").css("color","red");
				}
			});
		//placeIntoduce2
			$("#placeIntroduce2").keyup(function(){
				var value = $(this).val();
				$("#lengthspan3").text(value.length+"자/500자");
				var optimizer = /^[\W\w]{20,500}$/;
				if(optimizer.test(value)){
					$("#opspan3").text("허용가능한 공간소개입니다.");
					$("#opspan3").css("color","blue");
				}else{
					$("#opspan3").text("공간 소개는 20~500자까지 가능합니다.");
					$("#opspan3").css("color","red");
				}
			});
		//placeTag
			var tagmsg = "";
			var tagnum = 0;
			$("#tagbt").click(function(){
				if($("#placeTag").val()!=""){
					if(tagnum==5){
						alert("태그는 최대 5개까지 가능합니다.");
					}else{
						tagnum +=1;
						tagmsg += "#"+$("#placeTag").val();
						$("#opspan4").html(tagmsg);
						$("#placeTag").val("");
						$("#init").css("display","inline");
					}
				}
			});
			$("#init").click(function(){
				tagmsg = "";
				tagnum = 0;
				$("#opspan4").html(tagmsg);
				$("#init").css("display","none");
			});
		//kategorie2
			var kategorie2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			$("#ul2").children().click(function(){
				var index = $(this).index();
				if(kategorie2[index] == 0){
						$(this).css("background-color","lightgray");
						kategorie2[index] = 1;
						alert(kategorie2);
				}else{
					kategorie2[index] = 0;
					alert(kategorie2);
					$(this).css("background-color","white");
				}
			});
			//img1
			function loadImg1(f){
				if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
					var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
					reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
					reader.onload = function(e){
						$("#img1img").attr("src",e.target.result);
						$("#img1img").css("display","inline");
						$("#img1text").css("display","none");
						alert($("#img1").val());
					}
				} else{ //파일을 뺄 경우
					$("#img1img").attr("src","");
					$("#img1img").css("display","none");
					$("#img1text").css("display","inline");
				}
			}
			//img2
			function loadImg2(f){
				if(f.files.length!=0 && f.files[0]!=0){
					$("#img2text").css("display","none");
					for(var i=0;i<10;i++){
						$("#img2img"+i).css("display","inline");
					}
					for(var j = 0; j<f.files.length; j++){
						var reader = new FileReader();
						reader.onload = function(e){
							$("#img2img"+j).attr("src",e.target.result);
							reader.readAsDataURL(f.files[j]);//선택한 파일의 경로를 읽어옴
							alert($("#img2").val());
						}
					}
				}else{ //파일을 뺄 경우
					$("#img2text").css("display","inline");
					for(var k=0;k<10;k++){
						$("#img2img"+k).attr("src","");
						$("#img2img"+k).css("display","none");
						
					}
				}
			}
		//프로세스 이전,다음 로직
			var state = 0;
			window.onload = function(){
				$('#processBar-1').css("background-color","lightblue");
				$('#process-1').css("display","block");
				$('#bt-1').css("visibility","hidden");
				state = 1;
			};
			
//			var check1 = [false];
//			var check11 = ["#placeName"];
			
			$("#bt-2").click(function(){
				if(state==1){
//					for(var i = 0 ; i<check1.length;i++){
//						if(check1[i]==false){
//							$(check11[i]).focus();
//							return;
//						}
//					}
					//$("#kategorie1").val(kategorie1.join(',')); //val
					//alert($("#kategorie1").val());
					//$("#kategorie2").val(kategorie2.join(','));
					//alert($("#kategorie2").val());
					$('#processBar-1').css("background-color","white");
					$('#process-1').css("display","none");
					$('#processBar-2').css("background-color","lightblue");
					$('#process-2').css("display","block");
					$('#bt-1').css("visibility","visible");
					state=2;
				}else if(state==2){
					$('#processBar-2').css("background-color","white");
					$('#process-2').css("display","none");
					$('#processBar-3').css("background-color","lightblue");
					$('#process-3').css("display","block");
					state=3;
				}else if(state==3){
					$('#processBar-3').css("background-color","white");
					$('#process-3').css("display","none");
					$('#processBar-4').css("background-color","lightblue");
					$('#process-4').css("display","block");
					$("#bt-2").css("display","none");
					$("#bt-submit").css("display","inline");
					state=4;
				}
			});
			$("#bt-1").click(function(){
				if(state==4){
					$('#processBar-4').css("background-color","white");
					$('#process-4').css("display","none");
					$('#processBar-3').css("background-color","lightblue");
					$('#process-3').css("display","block");
					$("#bt-2").css("display","inline");
					$("#bt-submit").css("display","none");
					state=3;
				}else if(state==3){
					$('#processBar-3').css("background-color","white");
					$('#process-3').css("display","none");
					$('#processBar-2').css("background-color","lightblue");
					$('#process-2').css("display","block");
					state=2;
				}else if(state==2){
					$('#processBar-2').css("background-color","white");
					$('#process-2').css("display","none");
					$('#processBar-1').css("background-color","lightblue");
					$('#process-1').css("display","block");
					$('#bt-1').css("visibility","hidden");
					state=1;
				}
			});
			
			
			
			
		</script>
</body>
</html>