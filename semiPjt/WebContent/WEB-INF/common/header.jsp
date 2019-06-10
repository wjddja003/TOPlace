
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">
</script>
<!--JS-->
<script type="text/javascript" src="/js/headerSearch.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
    <header>
        <div id="searchAlert">검색어를 입력해주세요.</div>
        <div id="detach_div">
	        <div class="header logo" style="width:15%">
	            <a href="/index.jsp"><img src="../../img/logo.png" width="200px" height="100px"></a>
	        </div>
	        <!--logo Fin-->
	        <div class="header navi" style="width:60%;">
	            <ul id="navi-bar">

	               <li class="navi-li"> <a href="/viewsAll">모든 공간보기</a></li>

	                <li class="navi-li"><a href="/viewsBest">베스트 공간보기</a></li>

	                <li class="navi-li"><a href="/insertSpaceCheck">공간등록</a></li>
	                
	            </ul>
	        </div>
	        <div class="header realtime" style="width:9.6%;">
                <span id="ranking" style="color:#605f5d; height: 20px;">실시간</span>
                <div class="header_ranking">
                    <div class="header_ranking_h">
                        <p>실시간 급상승 검색어</p>
                    </div>
                    <ul>
                        <li><a href="#"><span>1.</span> 윤주공간</a></li>
                        <li><a href="#"><span>2.</span> 정엄공간</a></li>
                        <li><a href="#"><span>3.</span> 수용공간</a></li>
                        <li><a href="#"><span>4.</span> 윤호공간</a></li>
                        <li><a href="#"><span>5.</span> 창직공간</a></li>
                        <li><a href="#"><span>6.</span> 영훈공간</a></li>
                        <li><a href="#"><span>7.</span> 동천공간</a></li>
                        <li><a href="#"><span>8.</span> 투플레이스</a></li>
                        <li><a href="#"><span>9.</span> 이클립스</a></li>
                        <li><a href="#"><span>10.</span> 프로젝트</a></li>
                    </ul>
                </div>
            </div>
	        <div class="header search" style="width:7.7%;"><span>검색</span></div>
	        <div class="header mypage" style="width:7.7%;"><span>마이페이지</span></div>
        </div>
        <div id="header-search">
            
       		<jsp:include page="/views/headerSearch.jsp"/>
    	</div>
    	<div id="header-mypage">
        	
        	<jsp:include page="/WEB-INF/views/mypage.jsp"/>
    	</div>
    </header>
    
    <script>
    //실시간  스크립트
    var rankingArr1 = new Array();
 	var rankingArr2 = new Array();
 	$.ajax({
  	    url: "/realTime", // 클라이언트가 요청을 보낼 서버의 URL 주소
  	    type: "GET",                             // HTTP 요청 방식(GET, POST)
  	    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
  	    async: false,
  	    success : function(data) {
  	    console.log("성공!: " + data);
  	    var ranking = "";
  	    for(var i=0; i<data.length; i++){
  	    	var spaceName = decodeURIComponent(data[i].S_placeName);
  	    	var spaceNo = decodeURIComponent(data[i].S_no);
  	    	ranking1 =(i+1)+"위 "+spaceName;
  	    	ranking2 = spaceNo;
  	    	rankingArr1[i] = ranking1;
  	    	rankingArr2[i] = ranking2;
  	    }
  	    console.log(rankingArr1);
  	    console.log(rankingArr2);
  	   },error : function(xhr, status, error) {
  	      console.log("에러!: " + error);
  	   }
  	});
     	var i=0;	
     	var interval = setInterval(function(){	
     		if(i>=rankingArr1.length){
     			i=0;
     		}
     	 	$('#ranking').html("<a href='/selectOneSpace?S_no="+rankingArr2[i]+"' id='rank'>"+rankingArr1[i]+"</a>");
     	 	 $('#rank').each(function(){
     	    	var length = 10;
     	    	$(this).each(function(){
     	    		if($(this).text().length >= length){
     	    			$(this).text($(this).text().substr(0,length)+'...');
     	    		}
     	    		console.log(length);
     	    	});
     	    });
     	  	i++;	  
     	  }, 2000);			//2초마다 갱신
   
//      $(document).on('mouseover', '#ranking', function() {
//         $('.header_ranking').slideDown(300);
       
//     });
//     $(document).on('mouseout', '.header_ranking', function () {            
//             	$('.header_ranking').slideUp(300);          
        
//     });

    </script>
    


