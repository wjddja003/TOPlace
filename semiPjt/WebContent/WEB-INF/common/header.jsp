<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<link rel="stylesheet" type="text/css" href="/css/headerSearch.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    		<c:choose>
	       		<c:when test="${sessionScope.User.userGrade != '관리자'}">	
        			<jsp:include page="/WEB-INF/views/mypage.jsp"/>
        		</c:when>
        		<c:otherwise>
        			<jsp:include page="/WEB-INF/views/adminMypage.jsp"/>
        		</c:otherwise>
        	</c:choose>
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
  	    var ranking = "";
  	    for(var i=0; i<data.length; i++){
  	    	var spaceName = decodeURIComponent(data[i].S_placeName);
  	    	var spaceNo = decodeURIComponent(data[i].S_no);
  	    	ranking1 =(i+1)+". "+spaceName;
  	    	ranking2 = spaceNo;
  	    	rankingArr1[i] = ranking1;
  	    	rankingArr2[i] = ranking2;
  	    	$('.header_ranking ul').html($('.header_ranking ul').html()+"<li><a href='/selectOneSpace?S_no="+rankingArr2[i]+"' >"+rankingArr1[i]+"</a></li>");
  	    	}
  	   },error : function(xhr, status, error) {
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
     	    	});
     	    });
     	  	i++;	  
     	  }, 2000);			//2초마다 갱신
    </script>
    


