<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="space.model.vo.Space"%>
    <%
    	Space s = (Space)request.getAttribute("s");
    	String[] kg = (s.getS_kategorie2()).split(",");
    	String[] kg2 = {"TV/프로젝터","인터넷/WIFI","복사/인쇄기","화이트보드","음향/마이크","취사시설","음식물반입가능","주류반입가능","샤워시설","주차","금연","반려동물 동반 가능","PC/노트북","의자/테이블","내부화장실","탈의실","테라스/루프탑","공용라운지","전신거울","바베큐시설","도어락"};
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    #rq{
        padding-top: 20px;
        font-size: 18px;
    	text-align: center;
        margin: 30px 0 0 0;
        width: 1000px;
        height: 70px;
        background: #f69b02;
    }
  
    #qa_view{
        margin: 0 auto;
        width: 1000px;
    }
    .qa_header{
        color: #f7f7f7;
        background-color: #183058;
        border: 1px solid black;
        width: 100%;
        height: 50px;
        text-align: center;
    }
    .qa_v{

        width: 45%;
        margin: 0 0 0 20px;
        padding: 10px;
        height: 100%;
        float: left;
    }
    .qa_no{
        padding: 10px;
        float: left;
        margin: 20px 0 0 20px;
        border: 1px solid #e2e2e2;
        width: 100%;
        height: 420px;
        overflow: hidden;
        position: relative;
    }
    .Q_btn{
        margin-left: 100px;
        position: absolute;
        bottom: 0;
    }
    .re_navi{
    	clear: both;
    	text-align: center;
    }
    .reviewBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
    }
    .spaceImg{
    	width: 400px;
    	height: 220px;
    }
    .likeContent{
    	position:absolute;
    	bottom: 0;
    }
    .placeName{
        font-weight: bold;
        position: absolute;
        bottom: 130px;
        
    }
    .spaceImg {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	.spaceImg:hover {
	  transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);
	}
	.img {width:408px; height:280px; overflow:hidden 
	}
	.tag{
		font-size: 10px;
		color: #605f5d;
	}
	.price{
		color: #f69b02;
	}
</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                   내가 가고싶은 공간
                </div>
                <c:forEach items="${pd.list }" var="l">
                	 
                	<c:if test="${sessionScope.User.userNo == l.userNo}">
                <div class="qa_v">
              
                    <div class="qa_no">
                    	<div class="img">
                    	<a href="/selectOneSpace?S_no=${l.sNo}"><img class="spaceImg"src="/upload/space/${l.img}"></a><br>
                    	</div>
                    	<h4 class="placeName">${l.placeName }</h4><br>
                    	<div class="likeContent">
                    	<img src="../../img/map-marker.png"> ${l.address }<br>
                    	<div class="tag">${l.placeTag }</div><br>
                    	￦<a style="color: #f69b02">${l.price }</a>/${l.type }<br>
                    	 <div class="viewpage_right_icon">
                                        <%  int count = 0;
                                        	for(int i = 0; i<kg.length; i++) {
	                                    		if(kg[i].equals("1")){ 
	                                    			count++;
	                                    			if(count<=3){
	                                    		%>
	                                    			<div class="viewpage_right_kategorie"><img src="/upload/space/kategorie2/<%=i+1 %>.png" width="30px;">
	                                    				<p style="font-size:14px;"><%=kg2[i] %></p>
	                                    			</div>
	                                    		  <%}
	                                    		} 
                                    		}%>
                                    </div>
                    	</div>
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="re_navi">${pd.pageNavi }</div>
            </div>
        </div>
    </section>	
</body>
</html>