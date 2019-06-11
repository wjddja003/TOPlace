<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="space.model.vo.Space" %>

 

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
        border: 1px solid #f69b02;
        width: 100%;
        height: 730px;
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
    .spaceImg{
    	width: 408px;
    	height: 220px;
    }
    .likeContent{
    	width: 100%;
    	height:30%;
    	position:absolute;
    }
    .placeName{
        font-weight: bold;
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
	.img {width:408px; height:220px; overflow:hidden 
	}
	.tag{
		font-size: 10px;
		color: #605f5d;
	}
	.price{
		position: absolute;
        bottom: 0;
	}
    .kategorie2{
    	width: 100%;
        float: left;
    }
    .kategorie1{
    	width: 18%;
    	height:80px;
    	text-align:center;
        float: left;
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
                        <div>
                    	   <h4 class="placeName">${l.placeName }</h4>
                        </div><br>
                    	<div class="likeContent">
                            <div>
                    	   <img src="../../img/map-marker.png"> ${l.address }
                            </div>
                        <br>    
	                    	<div class="tag">${l.placeTag }</div><br>
	                    	<div class="kategorie2">
		                    	<c:forEach items="${l.s_kategorie2}" var="list" varStatus="i">
		                        	<c:if test="${list == '1'}">
		                            	<div class="kategorie1"><img src="/upload/space/kategorie2/${i.index+1}.png" width="30px;">
		                                	<p>${l.s_kategorieName[i.index]}</p>
		                                </div>
		                           	</c:if>
		                        </c:forEach>
                        	</div><br>    
                    	</div>
                        <div class="price" >
                            <a style="color: #f69b02; font-size:20px;">${l.price }</a>원/${l.type }
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