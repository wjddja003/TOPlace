<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
    
		<div class="wrap">
		   <jsp:include page="/WEB-INF/common/header.jsp"/>  
        <section>
                <div class="section_content">
                	<div id="ranking"></div>
                	<div id="main_search">
	                    <input class="searchInput" type="text" placeholder="검색어를 입력해주세요">
                        <button class="searchIcon" type="submit" value=""><img src="../img/main_search_icon.png"></button>
                    </div>
                 </div>  
                <!-- section fin -->
        </section>
        </div>
      
	<jsp:include page="/WEB-INF/common/footer.jsp"/>

</body>
</html>