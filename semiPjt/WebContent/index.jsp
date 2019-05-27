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
<body>
    
		<div class="wrap">
		   <jsp:include page="/WEB-INF/common/header.jsp"/>  
        <section>
                <div class="section_content">
                	<div id="search">
	                    <input type="text" placeholder="검색어를 입력해주세요">
	                    <input type="submit" value="">
                    </div>
                </div>
         
        </section>
        </div>
      
	<jsp:include page="/WEB-INF/common/footer.jsp"/>

</body>
</html>