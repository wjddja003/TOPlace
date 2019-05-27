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
<title>Insert title here</title>
</head>
<style>
    .wrap{
        background: url(img/background2.jpg) no-repeat left top;
        background-size: cover;
        background-repeat: no-repeat;
        width:100%;  
        height: 100%;
    }
    .content{
        width: 800px;
        margin: 0 auto;
    }
    #search{
        width: 400px;
        margin: 0 auto;
        position: relative;
    }
    #search input{
        width: 500px;
        height: 40px;
        margin-top:95%;
        border: 0;
        padding: 10px;
        border-radius: 10px;
        
    }
    #search input[type="submit"]{
        background: url(img/search_icon.png) no-repeat center center;
        position: absolute;
        top: 89%;
        left: 59%;
        margin: 0px;
        outline: none;
        border:0;
        cursor: pointer;
        
    }
    .section{
        background-color: aqua;
        height: 100px;
        }
/*
    #icon-search{
        position: absolute;
        top: 490px;
        left: 1215px;
    }
*/
	
</style>
<body>
    
		
	<div class="wrap">        
	   <jsp:include page="/WEB-INF/common/header.jsp"/>  
        <div class="content">
            <div id="search">
                <input type="text" placeholder="검색어를 입력해주세요">
                <input type="submit" value="">
            </div>

        </div>
      
	</div>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
     <section class="section">
    <div>
    
        </div>
    </section>

</body>
</html>