<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">   
</script>
<!--JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<title>Insert title here</title>
   
</head>
<body> 
	<header>
       <div class="header logo" style="width:15%;">
           <a href="/index.jsp"><img src="img/logo.png" width="200px" height="100px"></a>
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
    </header>
    <div id="header-search">
        <button class="back">X</button>
    </div>
    <div id="header-mypage">
        <button class="back">></button>
        <jsp:include page="/WEB-INF/views/mypage.jsp"/>
    </div>
    <script>
        
        $(".search").click(function(){
        	$("#header-mypage").css("display","none");
            $("#header-search").css("display","block");
            $("#test").css("opacity","0.5");
        });
        $(".mypage").click(function(){
        	$("#header-search").css("display","none");
            $("#header-mypage").css("display","block");
            $("#test").css("opacity","0.5");
        });
        $(".back").click(function(){
        	$("#header-search").css("display","none");
        	$("#header-mypage").css("display","none");
        	$("#test").css("opacity","1");
        });
    </script>

</body>
</html>
    