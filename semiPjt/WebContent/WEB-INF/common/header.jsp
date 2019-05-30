
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
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
	               <li class="navi-li"> <a href="/views/testmenu.jsp">베스트</a></li>
	                <li class="navi-li"><a href="#">핫딜/이벤트</a></li>
	                <li class="navi-li"><a href="/views/insertSpace.jsp">공간등록</a></li>
	            </ul>
	        </div>
	        <div class="header realtime" style="width:9.6%;">실시간</div>
	        <div class="header search" style="width:7.7%;">검색</div>
	        <div class="header mypage" style="width:7.7%;">마이페이지</div>
        </div>
        <div id="header-search">
            
       		<jsp:include page="/views/headerSearch.jsp"/>
    	</div>
    	<div id="header-mypage">
        	
        	<jsp:include page="/WEB-INF/views/mypage.jsp"/>
    	</div>
    </header>
    


