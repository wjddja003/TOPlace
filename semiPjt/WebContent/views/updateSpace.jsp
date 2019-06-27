<%@page import="space.model.vo.Space"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <% Space s = (Space)request.getAttribute("s");
    	String[] kg1 = s.getS_kategorie1().split(",");
    	String[] pt = s.getS_placeTag().split("#");
    	String[] kg2 = s.getS_kategorie2().split(",");
    	
    	String[] img2 = s.getS_img2().split(",");
    	
    	String email = s.getS_email().split("@")[0];
    	String com = s.getS_email().split("@")[1];
    	String[] comlist = {"naver.com","chol.com","dreamwiz.com","empal.com","gmail.com","hanafos.com","hanmail.net","hanmir.com","hitel.net","hotmail.com","korea.com","lycos.co.kr","nate.com","직접입력"};
    	String[] holiday = s.getS_holiday().split(",");
    	String[] warning = s.getS_warning().split(",");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>공간 등록</title>

	<style>
	#S_processBar div{ float:left; width:25%; height:100px; line-height: 50px;   border-bottom:2px solid #f69b02; border-top:2px solid #f69b02;}  
	#S_process div:not(#S_process-bt){display:none;} 
	
	.S_red{color:#f69b02;} 
	.S_condition{float:right;} 
	
	#S_process li:hover{
		background: #e2e2e2;
	}
	#S_ul1{list-style: none; margin:0 auto;width:90%;} 
	#S_ul1 li{display: block;
		float: left;
		width:33%;
		height:40px;
		line-height:40px;
		border: 2px solid black;
		text-align:center;
		cursor:pointer;
		margin:1px;
		}
	#S_ul2{list-style: none; margin:0 auto;width:90%;}
	#S_ul2 li{display: block;
		float: left;
		width:14%;
		height:90px;
		border: 2px solid black;
		text-align:center;
		cursor:pointer;
		margin:1px;
		
		}
	#S_ul3{list-style: none;text-align : center;}
	#S_ul3 li{ display:block;
		float:left;
		width:5%;
		height:30px;
		border: 2px solid lightgray;
		cursor:pointer;
		margin:1px;
		}
	.S_filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #f69b02; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #f69b02; 
		border-bottom-color: #f69b02; 
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
	.delbt{
		border:1px solid #605f5d;
		color : #605f5d;
		width:100px;
		background:white;
		display:none;
		height: 37px;
		border-radius : 5px;
	}
	.delbt:hover{
		color : white;
		background:#605f5d;
	}
	#emptyValue{
		width:100%;
		height: 100px;
		text-align: center;
		letter-spacing: 8px;
		word-spacing:15px;
		background-color: #f69b02;
		color:white;
		font-size: 30px;
		line-height: 100px;
		display:none;
		top:0px;
		position:fixed;
	}
	</style>
</head>


<body>
<!-- 헤더파일포함 -->
<jsp:include page="/WEB-INF/common/header.jsp"/>
<div id="emptyValue">
</div>		
		<br>
		
<section>
<!-- section content -->
<div class="section_content">
	<h1>공간등록</h1><br>
	<!-- 프로세스바 -->
	<div id="S_processBar" style="text-align:center;">
		<div id="S_processBar-1">1. 공간 정보 수정<br>수정할 공간 정보를 입력해주세요.</div>
		<div id="S_processBar-2">2. 연락처 정보 수정<br>수정할 연락처 정보를 입력해주세요.</div>
		<div id="S_processBar-3">3. 이용 안내 수정<br>수정할 이용 정보를 입력해주세요.</div>
		<div id="S_processBar-4">4. 결제 사항 수정<br>수정할 결제 사항을 입력해주세요.</div>
	</div><!-- 프로세스바 -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<span class="S_red S_condition">* 필수입력</span>
		<br>
	<!-- 프로세스를 담는 Div -->	
	<div id="S_process"">
	<form action="/updateSpace" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<!-- 프로세스1 -->
		<div id="S_process-1">
			<input type="hidden" name="S_no" value="${s.s_no }">
			<input type="hidden" name="S_hostNum" value="${s.s_hostNum }">
			
			<br>
			공간명(수정) <span class="S_red">*</span><span class="S_condition" id="S_lengthspan1">0자/18자</span> <br>
			<input type="text" id="S_placeName" name="S_placeName" class="form-control" placeholder="공간명을 입력해주세요." value="${s.s_placeName }">
			<span id="S_opspan1"></span><span class="S_condition">사용가능 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)</span>
			<br><br><br>
			
			<input type="hidden" name="S_kategorie1" id="S_kategorie1" value="${s.s_kategorie1 }">
			공간유형(수정) <span class="S_red">*</span><br><span class="S_condition S_red">최소1개선택 &nbsp;최대5개선택</span>
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
			</ul><br><br><br><br><br><br><br><br><br>
			
			
			
			공간 한줄 소개(수정)  <span class="S_red">*</span><span class="S_condition" id="S_lengthspan2">0자/27자</span>
			<input type="text" id="S_placeIntroduce1" name="S_placeIntroduce1" class="form-control" placeholder="공간을 소개하는 한 줄 문장을 입력해주세요." value="${s.s_placeIntroduce1 }">
			<span id="S_opspan2"></span><br><br>
			
			공간 소개(수정) <span class="S_red">*</span><span class="S_red S_condition">(최소 20자)</span><span class="S_condition" id="S_lengthspan3">0자/500자</span>
			<textarea id="S_placeIntroduce2" name="S_placeIntroduce2" class="form-control" placeholder="공간을 상세하게 소개해주세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다." style="height:150px;"><%=s.getS_placeIntroduce2()%></textarea>
			<span id="S_opspan3"></span><br><br>
			
			공간 태그(수정) <span class="S_red">*</span><span class="S_condition">최대 5개</span><br>
			<input type="text" id ="S_placeTag" class="form-control" placeholder="태그를 입력해 주세요" style="width:94%;float:left;"><button type="button" id="S_tagbt" class="btn btn-outline-warning" style="width:6%;">추가</button>
			<span id="S_opspan4"></span> <button type="button" id="S_init" style="display:none;" class="btn btn-outline-warning"> 초기화</button>
			<input type="hidden" id="S_hiddentag" name="S_placeTag" value="${s.s_placeTag }">
			<br><br><br><br>
			
			편의 시설(수정)<br><span class="S_condition">구비된 편의시설을 선택해주세요</span><br>
			<ul id="S_ul2">
				<li>TV/프로젝터<br><img src="/upload/space/kategorie2/1.png" ></li>
				<li>인터넷/WIFI<br><img src="/upload/space/kategorie2/2.png" ></li>
				<li>복사/인쇄기<br><img src="/upload/space/kategorie2/3.png" ></li>
				<li>화이트보드<br><img src="/upload/space/kategorie2/4.png" ></li>
				<li>음향/마이크<br><img src="/upload/space/kategorie2/5.png" ></li>
				<li>취사시설<br><img src="/upload/space/kategorie2/6.png" ></li>
				<li>음식물반입가능<br><img src="/upload/space/kategorie2/7.png" ></li>
				<li>주류반입가능<br><img src="/upload/space/kategorie2/8.png" ></li>
				<li>샤워시설<br><img src="/upload/space/kategorie2/9.png" ></li>
				<li>주차<br><img src="/upload/space/kategorie2/10.png" ></li>
				<li>금연<br><img src="/upload/space/kategorie2/11.png" ></li>
				<li>반려동물 동반 가능<br><img src="/upload/space/kategorie2/12.png" ></li>
				<li>PC/노트북<br><img src="/upload/space/kategorie2/13.png" ></li>
				<li>의자/테이블<br><img src="/upload/space/kategorie2/14.png" ></li>
				<li>내부화장실<br><img src="/upload/space/kategorie2/15.png" ></li>
				<li>탈의실<br><img src="/upload/space/kategorie2/16.png" ></li>
				<li>테라스/루프탑<br><img src="/upload/space/kategorie2/17.png" ></li>
				<li>공용라운지<br><img src="/upload/space/kategorie2/18.png" ></li>
				<li>전신거울<br><img src="/upload/space/kategorie2/19.png" ></li>
				<li>바베큐시설<br><img src="/upload/space/kategorie2/20.png" ></li>
				<li>도어락<br><img src="/upload/space/kategorie2/21.png" ></li>
			</ul><br><br><br><br><br><br>
			<input type="hidden" name="S_kategorie2" id="S_kategorie2" value="${s.s_kategorie2 }">
			<br><br><br><br><br><br><br><br>
			
			웹사이트(수정)<br>
			<input type="text" name="S_placeWeb" id="S_placeWeb" class="form-control" placeholder="웹사이트 URL을 입력해주세요.(예시:http://toplace.com)" value="${s.s_placeWeb }">
			<br><br><br>
			
			대표이미지(수정)<span class="S_red"> *</span><span class="S_condition">최대 10MB</span><br>
				<img id="S_img1img" width="400px" height="200px" style="display:none;">
				<input id="S_img1text" type="text" class="form-control" style="background:white;width:400px;height:200px;display:inline" placeholder="대표 이미지 파일 1장을 추가해 주세요." readonly>
			<div class="S_filebox S_condition" style="display:inline; border:0;"> 
			<label for="S_img1" class="btn btn-outline-warning">업로드</label> 
			<input type="file" id="S_img1" name="S_img1" onchange="loadImg1(this)" accept="image/*"> 
			</div>
			<br><br><br>
			
			이미지(수정) <span class="S_red"> *</span><span class="S_condition">한 장당 최대 10MB <span class="S_red">(최소 3장)  (최대 10장)</span></span><br>
			<c:forEach var="i" begin="1" end="10">
				<div style="display:inline;float:left;height:140px;margin-top:10px;margin-right:10px;">
				<img id="S_img2img${i }" width="100px" height="100px" >
				<img id="S_img2x${i }" width="100px" height="100px" style="display:none;">
				<br>
				<div class="S_filebox" style="display:inline; border:0;" id="S_upload${i }"> 
				<label for="S_img2${i }" class="btn btn-outline-warning" style="width:100px;">${i }.업로드</label> 
				<input type="file" id="S_img2${i }" name="S_img2${i }" onchange="loadImg2(this,${i })" accept="image/*">
				</div>
				<button type="button" id="S_imgdelbt${i }" class="delbt" onclick="deleteimg(${i })">${i }.수정</button>
				</div>
			</c:forEach>
			<input type="hidden" id="S_img" name="S_img">
			<input type="hidden" id="S_imgupdate" name="S_imgupdate">
			<input type="hidden" id="S_imgdelete" name="S_imgdelete">
			<br><br>
			<br><br>
			<br><br>
			<br><br>
			<br>
			
			주소(위치)(수정)<span class="S_red"> *</span><br>
			<input type="text" id="addrNum" name="addrNum" class="form-control" placeholder="주소를 등록해주세요." style="width:94%;float:left;background:white;" readonly>
			<button type="button" class="addressinsert btn btn-outline-warning" style="width:6%;float:left;">등록</button>
			<input type="text" id="address" name="address" class="form-control" placeholder="상세주소를 등록해주세요.">
			<br>
			
		</div><!-- 프로세스1 -->
		<!-- 프로세스2 -->
		<div id="S_process-2">
		
			이메일(수정) <span class="S_red"> *</span><br>
			<input type="text" id="S_idemail" class="form-control" style="width:47%;display:inline" placeholder="이메일을 입력해 주세요."> @ 
			<input type="text" id="S_inputemail" value="naver.com" class="form-control" style="background:white;width:25%;display:inline" readonly> 
			<select id="S_selectemail" class="form-control" style="width:25%;display:inline">
				<option selected>naver.com</option>
				<option>chol.com</option>
				<option>dreamwiz.com</option>
				<option>empal.com</option>
				<option>gmail.com</option>
				<option>hanafos.com</option>
				<option>hanmail.net</option>
				<option>hanmir.com</option>
				<option>hitel.net</option>
				<option>hotmail.com</option>
				<option>korea.com</option>
				<option>lycos.co.kr</option>
				<option>nate.com</option>
				<option>직접입력</option>
			</select>
			<input type="hidden" name="S_email" id="S_email"> 
		<br><br>
		<br>
		
		<div style="display:block;float:left;width:49%;">
		휴대폰(수정) <span class="S_red"> *</span><button id="btphone1" type="button" class="btn btn-outline-warning">수정</button><br>
		<div id="beforephone1">
		<select id="S_phone1_1" class="form-control" style="width:30%;display:inline;">
			<option selected>010</option>
			<option>011</option>
			<option>016</option>
			<option>017</option>
			<option>018</option>
			<option>019</option>
		</select>
		 - 
		<input id="S_phone1_2" type="text" class="form-control" style="width:30%;display:inline;" numberOnly maxlength="4">
		 - 
		<input id="S_phone1_3" type="text" class="form-control" style="width:30%;display:inline;" numberOnly maxlength="4">
		</div>
		<input type="text" id="S_phone1" name="S_phone1" class="form-control" value="${s.s_phone1 }" readonly>
		</div>
		
		
		
		<div style="display:block;float:left;width:50%;">
		대표전화(수정) <span class="S_red"> *</span><button id="btphone2" type="button" class="btn btn-outline-warning">수정</button><div id="beforephone2"> <span class="S_condition"> <input id="S_phonecheck" type="checkbox"> 휴대폰과 동일</span><br>
		
		<input id="S_phone2_1" type="text" class="form-control" style="width:31%;display:inline;" numberOnly maxlength="4">
		 - 
		<input id="S_phone2_2" type="text" class="form-control" style="width:31%;display:inline;" numberOnly maxlength="4">
		 - 
		<input id="S_phone2_3" type="text" class="form-control" style="width:31%;display:inline;" numberOnly maxlength="4">
		</div>
		<input type="text" id="S_phone2" name="S_phone2" class="form-control" value="${s.s_phone2}" readonly>
		</div>
		<br>
		<br>
		<br>
		</div><!-- 프로세스2 -->
		<!-- 프로세스3 -->
		<div id="S_process-3">
		
		예약 유형(수정) <span class="S_red"> *</span><br>
		<div style="width:50%;float:left;display:block;text-align:center;"><input class="S_type1" type="radio" name="S_type1" value="time"> 시간단위</div>
		<div style="width:50%;float:left;display:block;text-align:center;"><input class="S_type1" type="radio" name="S_type1" value="day"> 일단위</div>
		<br><br>
		<input type="hidden" id="S_type" name="S_type">
		<br>
		
		이용시간(수정) <span class="S_red">*</span><br>
		<select class="form-control" style="display:inline;width:46%;" id="S_start">
		<c:forEach begin="0" end="24" var="i">
			<c:choose>
			<c:when test="${i eq 0 }">
				<option value="${i }" selected>${i }시</option>
			</c:when>
			<c:otherwise>
				<option value="${i }">${i }시</option>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</select>  
		   부터  
		 <select class="form-control" style="display:inline;width:47%;" id="S_end">
		<c:forEach begin="0" end="24" var="i">
			<c:choose>
			<c:when test="${i eq 0 }">
				<option value="${i }" selected>${i }시</option>
			</c:when>
			<c:otherwise>
				<option value="${i }">${i }시</option>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</select>
		 까지
		<input type="hidden" id="S_starthidden" name="S_start" value="${s.s_start }">
		<input type="hidden" id="S_endhidden" name="S_end" value="${s.s_end }">
		<br>
		<br>
		<br>
		
		
		정기휴무(수정) <span class="S_red">*</span><br>
		<select class="form-control" id="S_holiday">
			<option value="0" selected>휴무없음</option>
			<option value="1">공휴일</option>
			<option value="2">매주</option>
			<option value="3">직접지정</option>
		</select>
		<ul id="S_ul3" style="display:none;">
			<li>월</li>
			<li>화</li>
			<li>수</li>
			<li>목</li>
			<li>금</li>
			<li>토</li>
			<li>일</li>
		</ul>
		<span id="S_holispan" style="display:none;">
		<input id="S_holispan1" type="text" type="form-control" numberOnly maxlength="2" class="form-control" style="display:inline;width:10%;"> 월
		<input id="S_holispan2" type="text" type="form-control" numberOnly maxlength="2" class="form-control" style="display:inline;width:10%;"> 일
		</span>
		<input type="hidden" id="S_holiday1" name="S_holiday" value="${s.s_holiday }">
		<br><br><br>
		
		최대 수용 인원(수정) <span class="S_red"> *</span><br>
		<input id="S_people" name="S_people" type="text" class="form-control" style="width:98%;display:inline;" numberOnly placeholder="최대 수용 인원을 입력해 주세요." value="${s.s_people }"> 명
		<br><br><br>
		
		예약 시 주의사항(수정) <span class="S_red"> *</span><span class="S_condition" style="color:blue;"><span class="S_red">(최소 1개)</span>(최대 10개)</span>
		<input id="S_warning" type="text" class="form-control" style="width:93%;display:inline;" placeholder="예약 시 주의사항을 입력해 주세요.">
		<button type="button" id="S_warbt" class="btn btn-outline-warning" style="width:6%;display:inline;">추가</button>
		<span id="S_warspan"></span><button type="button" id="S_warinit" style="display:none;" class="btn btn-outline-warning">초기화</button>
		<input type="hidden" id="S_warninghidden" name="S_warning">
		
		
		
		</div><!-- 프로세스3 -->
		<!-- 프로세스4 -->
		<br>
		<div id="S_process-4">
			
			<span id="S_whattype"></span>
			<span class="S_red"> *</span><br> 
			<input type="text" id="S_price1" name="S_price1" class="form-control" numberOnly placeholder="가격을 입력해 주세요." style="display:inline;width:98%;" value="${s.s_price1 }">원

			<br><br>
			
			1인당 추가 가격(수정) <span class="S_red"> *</span><br>
			<input type="text" id="S_price2" name="S_price2" class="form-control" numberOnly placeholder="1인당 추가 가격을 입력해 주세요." style="display:inline;width:98%;" value="${s.s_price2 }">원
			
		</div><!-- 프로세스4 -->
		
		<br>
		<br>
		<br>
		<!-- 프로세스버튼-->
		<div id="S_process-bt" style="text-align:center;">
			<button id="S_bt-1" type="button" class="btn btn-outline-warning btn-lg" >이전</button>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="S_bt-2" type="button" class="btn btn-outline-warning btn-lg" >다음</button>
			<button id="S_bt-submit" type="submit" class="btn btn-outline-warning btn-lg"
			style="display:none;">등록완료</button>
		</div><!-- 프로세스버튼-->
		</form>
	</div><!-- 프로세스를 담는 Div -->	
</div><!-- section content -->
</section>
<br>
<br>
<br>
<jsp:include page="/WEB-INF/common/footer.jsp"/> <!-- footer 추가 -->


		<script>
		//S_placeName
			$("#S_placeName").keyup(function(){
				var value = $(this).val();
				$("#S_lengthspan1").text(value.length+"자/18자");
				var optimizer = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣0-9\(\)\[\]\-\.\,\ ]{1,18}$/;
				if(optimizer.test(value)){
					$("#S_opspan1").text("사용가능한 공간명입니다.");
					$("#S_opspan1").css("color","blue");
					check1[0] = true;
				}else{
					$("#S_opspan1").text("사용불가능한 공간명입니다.");
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
						$(this).css("background-color","#f69b02");
						S_kategorie1[index] = 1;
						stack1 +=1;
					}else{
						emptyValue("최대 5개까지 선택할 수 있습니다.");
					}
				}else{
					S_kategorie1[index] = 0;
					$(this).css("background-color","");
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
						emptyValue("태그는 최대 5개까지 가능합니다.");
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
						$(this).css("background-color","#f69b02");
						S_kategorie2[index] = 1;
				}else{
					S_kategorie2[index] = 0;
					$(this).css("background-color","");
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
						check1[5] = true;
						if(imgupdate[0]==false){
							imgupdate[0] = true;
							imgdelete[0] = img[0];
						}
					}
				} else{ //파일을 뺄 경우
					$("#S_img1img").attr("src","");
					$("#S_img1img").css("display","none");
					$("#S_img1text").css("display","inline");
					check1[5] = false;
				}
			}
			//S_img2
			var imgcheck = 0;
			//var updatestr = "0";
			function loadImg2(f,i){
				if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
					$("#S_img2x"+i).css("display","none");
					$("#S_img2img"+i).css("display","inline");
					var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
					reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
					reader.onload = function(e){
						$("#S_img2img"+i).attr("src",e.target.result);
						imgcheck +=1;
						<%--updatestr += ","+i;
						$('#updateIndex').val(updatestr);--%>
					}
				} else{ //파일을 뺄 경우
					$("#S_img2img"+i).attr("src","");
					$("#S_img2x"+i).css("display","inline");
					$("#S_img2img"+i).css("display","none");
					imgcheck -=1;
				}
			}
			function deleteimg(i){
				$("#S_imgdelbt"+i).css("display","none");
				$("#S_upload"+i).css("display","inline");
				$("#S_img2img"+i).attr("src","");
				$("#S_img2img"+i).css("display","none");
				$("#S_img2x"+i).css("display","inline");
				imgcheck -=1;
				imgupdate[i] = true;
				imgdelete[i] = img[i];
			}
			//addrNum, address
			$(".addressinsert").click(function(){
      		var pop = window.open("/views/jusoPopup.jsp","주소찾기",'width=600,height=700');
      		pop.location.href;
   			});
			
			//S_email
			$("#S_selectemail").change(function(){
				if($("#S_selectemail option:selected").text()=="직접입력"){
					$("#S_inputemail").val("");
					$("#S_inputemail").removeAttr("readonly");
					$("#S_inputemail").focus();
				}else{
					$("#S_inputemail").val($("#S_selectemail option:selected").text());
					$("#S_inputemail").attr("readonly","true");
				}
			});
			
			//S_phone1, S_phone2
			//숫자만 입력하게 하는 것
			$("input:text[numberOnly]").on("keyup", function() {
    			$(this).val($(this).val().replace(/[^0-9]/g,""));
    			});
			$("#S_phonecheck").change(function(){
				if($("#S_phonecheck").is(":checked")){
					$("#S_phone2_1").val($("#S_phone1_1 option:selected").text());
					$("#S_phone2_2").val($("#S_phone1_2").val());
					$("#S_phone2_3").val($("#S_phone1_3").val());
				}
			})
			var pcheck1 = false;
			var pcheck2 = false;
			$("#btphone1").click(function(){
				$("#beforephone1").css("display","inline");
				$("#S_phone1").attr("type","hidden");
				$(this).css("visibility","hidden");
				pcheck1 = true;
			});
			$("#btphone2").click(function(){
				$("#beforephone2").css("display","inline");
				$("#S_phone2").attr("type","hidden");
				$(this).css("visibility","hidden");
				pcheck2 = true;
			});
			//S_type
			$(".S_type1").change(function(){
				
				$("#S_type").val($('input[name="S_type1"]:checked').val());
			});
			
			//S_start,S_end
			$("#S_start").change(function(){
				$("#S_starthidden").val($("#S_start option:selected").val());
			});
			$("#S_end").change(function(){
				$("#S_endhidden").val($("#S_end option:selected").val());
			});
			
			//S_holiday
			var S_holiday = [0,0,0,0,0,0,0,0];
			$("#S_holiday").change(function(){
				if($("#S_holiday option:selected").val()==0){
					S_holiday = [0,0,0,0,0,0,0,0];
					$("#S_holispan").css("display","none");
					$("#S_ul3").css("display","none");
				}else if($("#S_holiday option:selected").val()==1){
					S_holiday = [1,0,0,0,0,0,0,0];
					$("#S_holispan").css("display","none");
					$("#S_ul3").css("display","none");
				}else if($("#S_holiday option:selected").val()==2){
					S_holiday = [2,0,0,0,0,0,0,0];
					$("#S_holispan").css("display","none");
					$("#S_ul3").css("display","inline");
					$("#S_ul3 li").css("background","");
				}else{
					S_holiday = [3,0,0,0,0,0,0,0];
					$("#S_holispan").css("display","inline");
					$("#S_ul3").css("display","none");
					$("#S_holispan1").val("");
					$("#S_holispan2").val("");
				}
			});
			$("#S_ul3 li").click(function(){
						var index = $(this).index();
						if(S_holiday[index+1]==0){
							S_holiday[index+1]=1;
							$(this).css("background","#f69b02");
						}else{
							S_holiday[index+1]=0;
							$(this).css("background","");
						}
			});
			$("#S_holispan1").blur(function(){
				if($(this).val()==""){
					S_holiday[1] = 0;
					return;
				}
				S_holiday[1] = $(this).val();
			});
			$("#S_holispan2").blur(function(){
				if($(this).val()==""){
					S_holiday[2] = 0;
					return;
				}
				S_holiday[2] = $(this).val();
			});
			
			//S_warning
			var warnum = 0;
			var warningmsg = "";
			var warning = new Array(10);
			$("#S_warbt").click(function(){
				if($("#S_warning").val()==""){
					return;
				}else{
					if(warnum==10){
						alert("더 이상 등록 할 수 없습니다.");
						return;
					}
					$("#S_warinit").css("display","inline");
					warnum +=1;
					warning[warnum-1] = $("#S_warning").val(); //배열에 들어가는 값
					warningmsg += warnum+". "+warning[warnum-1]+"<br>";
					$("#S_warspan").html(warningmsg);
					$("#S_warning").val("");
				}
			});
			$("#S_warinit").click(function(){
				$("#S_warinit").css("display","none");
				warning = new Array(10);
				warnum=0;
				warningmsg="";
				$("#S_warspan").html("");
				$("#S_warning").val("");
			});
			
			//alert(emptyValue)
			function emptyValue(msg){
				$("#emptyValue").text(msg);
				$("#emptyValue").slideDown(700);
				$("#emptyValue").delay(1300);
				$("#emptyValue").slideUp(700);
			}
			function check(){
				if($("#S_price1").val()==""){
					emptyValue("대여가격을 입력해주세요.");
					$("#S_price1").focus();
					return false;
				}else if($("#S_price2").val()==""){
					emptyValue("1인당 추가 가격을 입력해주세요.");
					$("#S_price2").focus();
					return false;
				}else{
					return true;
				}
			}
			
		//프로세스 이전,다음 로직
			var state = 0;
			window.onload = function(){
				$('#S_processBar-1').css("background-color","#f69b02");
				$('#S_process-1').css("display","block");
				$('#S_bt-1').css("visibility","hidden");
				state = 1;
				
				check1[0]=true; // placeName 을 true값으로
				
				<% for(int i = 0; i<kg1.length;i++){%> //카테고리1을 배열로 만들고  
					<%if(kg1[i].equals("1")){ %> //1인곳을
						S_kategorie1[<%=i%>] = 1; //S_kategorie배열에도 1로 만들어 줌.
						$("#S_ul1 li").eq(<%=i%>).css("background","#f69b02"); //그런 위치의 박스에 색칠
						stack1 += 1; //선택가능개수 +
					<% }%>
				<% }%>
				
				check1[2] = true; //placeIntroduce1 을 true 값으로
				check1[3] = true; //placeIntroduce2 를 true 값으로
				
				tagmsg = $("#S_hiddentag").val(); //S_placeTag네임을 지닌 히든인풋태그에 값을 설정
				$("#S_opspan4").html(tagmsg); // 그 값을 태그보여주는 스판에 설정
				$("#S_init").css("display","inline"); //초기화버튼 켜준다.
				tagnum = <%=pt.length-1%> //현재 태그갯수를 설정해놓음.
				
			<% for(int i = 0; i<kg2.length;i++){%> //카테고리2을 배열로 만들고  
				<%if(kg2[i].equals("1")){ %> //1인곳을
					S_kategorie2[<%=i%>] = 1; //S_kategorie배열에도 1로 만들어 줌.
					$("#S_ul2 li").eq(<%=i%>).css("background","#f69b02"); //그런 위치의 박스에 색칠
				<% }%>
			<% }%>

	    	
	    	var imglength = <%=img2.length%>+1;
	    	img = new Array(imglength);
	    	imgupdate = new Array(imglength);
	    	imgdelete = new Array(imglength);
	    	<% for(int i =0; i<img2.length+1; i++){%>
	    		<% if(i==0){ %>
	    				img[0] = "<%=s.getS_img1()%>";
	    				imgupdate[<%=i%>] = false;
	    				imgdelete[<%=i%>] = "0";
	    		<%continue;} %>
	    		img[<%=i%>] = "<%=img2[i-1]%>";
    			imgupdate[<%=i%>] = false;
    			imgdelete[<%=i%>] = "0";
    		<% }%>
			$("#S_img1img").css("display","inline");
			$("#S_img1text").css("display","none");
			$("#S_img1img").attr("src","/upload/space/"+"<%=s.getS_img1()%>");
			check1[5] = true;
			<%for (int i = 0 ; i<img2.length;i++){ %>
				<%--alert("<%=img2[i]%>");--%>
				$("#S_img2img"+<%=i+1%>).attr("src","/upload/space/"+"<%=img2[i]%>");
				$("#S_upload"+<%=i+1%>).css("display","none");
				$("#S_imgdelbt"+<%=i+1%>).css("display","inline");
			<%}%>
			imgcheck = <%=img2.length%>;
			
			$("#addrNum").val(<%=s.getAddrNum()%>);
			$("#address").val("<%=s.getAddress()%>");
			
			$("#S_idemail").val("<%=email%>");
			<%for(int i = 0; i<14; i++){%>
				<%if(com.equals(comlist[i])){%>
					$("#S_selectemail").find("option:eq(<%=i%>)").prop("selected", true);
					$("#S_inputemail").val("<%=com%>");
				<%break;}else if(i==13){%>
					$("#S_selectemail").find("option:eq(<%=i%>)").prop("selected", true);
					$("#S_inputemail").val("<%=com%>");
				<%break;}%>
			<%}%>
			
			if("${s.s_type}"=="time"){
				$(".S_type1").eq(0).prop("checked", true);
				$("#S_type").val("time");
			}else{
				$(".S_type1").eq(1).prop("checked", true);
				$("#S_type").val("day");
			}
			
			$("#S_start").find("option:eq(<%=s.getS_start()%>)").prop("selected","true");
			$("#S_end").find("option:eq(<%=s.getS_end()%>)").prop("selected","true");
			
			<% for(int i = 0; i<holiday.length;i++){ %>
				S_holiday[<%=i%>] = <%=holiday[i]%>;
			<%}%>
			if(S_holiday[0]==0){
				$("#S_holiday").find("option:eq(0)").prop("selected", true);
			}else if(S_holiday[0]==1){
				$("#S_holiday").find("option:eq(1)").prop("selected", true);
			}else if(S_holiday[0]==2){
				$("#S_holiday").find("option:eq(2)").prop("selected", true);
				$("#S_ul3").css("display","inline");
				for(var i = 1; i<S_holiday.length;i++){
					if(S_holiday[i]==1){
						$("#S_ul3 li").eq(i-1).css("background","#f69b02");
					}
				}
			}else if(S_holiday[0]==3){
				$("#S_holiday").find("option:eq(3)").prop("selected", true);
				$("#S_holispan").css("display","inline");
				$("#S_holispan1").val(S_holiday[1]);
				$("#S_holispan2").val(S_holiday[2]);
			}
			/////////
			$("#S_warinit").css("display","inline");
			<%for(int i = 0 ; i<warning.length;i++){%>
				warning[<%=i%>] = "<%=warning[i]%>";
			<%}%>
			for(var i =0; i<warning.length;i++){
				if(warning[i]!=null){
					warnum+=1;
					warningmsg+=warnum+". "+warning[i]+"<br>";
					$("#S_warspan").html(warningmsg);
					$("#S_warning").val("");
				}else{
					break;
				}
			}
			};
			
			var check1 = [false,0,false,false,0,false,0,0]; //다음버튼 가기 전 체크용
			var check11 = ["#S_placeName","#S_kategorie1","#S_placeIntroduce1","#S_placeIntroduce2","#S_placeTag","#S_img1","#addrNum","#address"]; //다음버튼 가기 전 체크용
			
			$("#S_bt-2").click(function(){ //다음 버튼 클릭 시
				if(state==1){ //프로세스 1일 때, 다음 버튼 클릭 시
					$("#S_kategorie1").val(S_kategorie1.join(','));
					$("#S_kategorie2").val(S_kategorie2.join(','));
					$("#S_hiddentag").val($("#S_opspan4").text());
					$("#S_img").val(img.join(','));
					$("#S_imgupdate").val(imgupdate.join(','));
					$("#S_imgdelete").val(imgdelete.join(','));
					for(var i = 0 ; i<check1.length;i++){ 
						switch(i){
						case 0: 
							if(check1[i]==false){
								$(check11[i]).focus();
								emptyValue("공간명을 입력해주세요.");
								return;}
							break;
						case 2:
							if(check1[i]==false){
								$(check11[i]).focus();
								emptyValue("공간 한줄 소개를 입력해주세요.");
								return;}
							break;
						case 3:
							if(check1[i]==false){
								$(check11[i]).focus();
								emptyValue("공간 소개를 입력해주세요.");
								return;}
							break;
						case 1:
							if($("#S_kategorie1").val()=="0,0,0,0,0,0,0,0,0,0,0,0"){
								emptyValue("공간유형은 최소한 한개 이상 선택하여야 합니다.");
								$(check11[i]).focus(); return;}
							break;
						case 4:
							if($("#S_opspan4").text()==""){
								emptyValue("공간 태그는 최소 1개 이상 등록하여야 합니다.");
								$(check11[i]).focus(); return;}
							break;
						case 5:
							if(check1[i]==false){
								emptyValue("대표사진은 최소한 1장 이상 등록하여야 합니다.");
								$("#S_img1text").focus(); return;}
							break;
						case 6:
						case 7:
							if($(check11[i]).val()==""){
								emptyValue("주소 및 상세주소를 등록해 주세요.");
								$(check11[i]).focus(); return;}
							break;
						}
					}
					if(imgcheck<3){
						emptyValue("공간의 이미지는 최소 3장 이상 등록하여야 합니다.");
						return;
					}
					$('#S_processBar-1').css("background-color","white");
					$('#S_process-1').css("display","none");
					$('#S_processBar-2').css("background-color","#f69b02");
					$('#S_process-2').css("display","block");
					$('#S_bt-1').css("visibility","visible");
					state=2;
				}else if(state==2){ //프로세스 2일 때, 다음 버튼 클릭 시
					if($("#S_idemail").val()==""){
						emptyValue("이메일을 입력해주세요.");
						$("#S_idemail").focus();
						return;
					}else if($("#S_inputemail").val()==""){
						emptyValue("이메일을 입력해주세요.");
						$("#S_inputemail").focus();
						return;
					}
					var S_email = $("#S_idemail").val()+"@"+$("#S_inputemail").val();
					$("#S_email").val(S_email);
					if(pcheck1 == true){
						if($("#S_phone1_2").val()==""){
							emptyValue("휴대폰번호를 입력해주세요.");
							$("#S_phone1_2").focus();
							return;
						}else if($("#S_phone1_3").val()==""){
							emptyValue("휴대폰번호를 입력해주세요.");
							$("#S_phone1_3").focus();
							return;
						}
						var S_phone1 = $("#S_phone1_1 option:selected").text()+$("#S_phone1_2").val()+$("#S_phone1_3").val();
						$("#S_phone1").val(S_phone1);
					}
					if(pcheck2 == true){
						if($("#S_phone2_1").val()==""){
							emptyValue("대표전화를 입력해주세요.");
							$("#S_phone2_1").focus();
							return;
						}else if($("#S_phone2_2").val()==""){
							emptyValue("대표전화를 입력해주세요.");
							$("#S_phone2_2").focus();
							return;
						}else if($("#S_phone2_3").val()==""){
							emptyValue("대표전화를 입력해주세요.");
							$("#S_phone2_3").focus();
							return;
						}
						var S_phone2 = $("#S_phone2_1").val()+$("#S_phone2_2").val()+$("#S_phone2_3").val();
						$("#S_phone2").val(S_phone2);
					}	
					$('#S_processBar-2').css("background-color","white");
					$('#S_process-2').css("display","none");
					$('#S_processBar-3').css("background-color","#f69b02");
					$('#S_process-3').css("display","block");
					state=3;
					
				}else if(state==3){ //프로세스 3일 때, 다음 버튼 클릭 시
					$("#S_holiday1").val(S_holiday.join(","));
					$("#S_warninghidden").val(warning.join(","));
					if($("#S_type").val()==""){
						emptyValue("예약 유형을 선택하여 주십시오.");
						return;
					}else if($("#S_people").val()==""){
						emptyValue("최대 수용 인원을 입력해주십시오.");
						$("#S_people").focus();
						return;
					}else if(warning.join(",")==",,,,,,,,,"){
						emptyValue("주의사항을 적어도 1개 이상 입력해 주세요.");
						$("#S_warning").focus();
						return;
					}
					$('#S_processBar-3').css("background-color","white");
					$('#S_process-3').css("display","none");
					$('#S_processBar-4').css("background-color","#f69b02");
					$('#S_process-4').css("display","block");
					$("#S_bt-2").css("display","none");
					$("#S_bt-submit").css("display","inline"); //프로세스 4가 되면서 서브밋 버튼 활성화
					if($("#S_type").val()=="time"){
						$("#S_whattype").text("시간당 대여 가격(수정)");
					}else{
						$("#S_whattype").text("종일 대여 가격(수정)");
					}
					state=4;
				}
			});
			$("#S_bt-1").click(function(){ //이전 버튼 클릭 시,
				if(state==4){ //프로세스 4일 때, 이전 버튼 클릭 시
					$('#S_processBar-4').css("background-color","white");
					$('#S_process-4').css("display","none");
					$('#S_processBar-3').css("background-color","#f69b02");
					$('#S_process-3').css("display","block");
					$("#S_bt-2").css("display","inline");
					$("#S_bt-submit").css("display","none");
					state=3;
				}else if(state==3){ //프로세스 3일 때, 이전 버튼 클릭 시
					$('#S_processBar-3').css("background-color","white");
					$('#S_process-3').css("display","none");
					$('#S_processBar-2').css("background-color","#f69b02");
					$('#S_process-2').css("display","block");
					state=2;
				}else if(state==2){ //프로세스 2일 때, 이전 버튼 클릭 시
					$('#S_processBar-2').css("background-color","white");
					$('#S_process-2').css("display","none");
					$('#S_processBar-1').css("background-color","#f69b02");
					$('#S_process-1').css("display","block");
					$('#S_bt-1').css("visibility","hidden"); //프로세스 1일 때, 이전 버튼은 사라짐
					state=1;
				}
			});
			
			
			
			
		</script>
</body>
</html>