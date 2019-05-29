<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">   
    </script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        
        #mypage{
            position: fixed; 
            background-color: floralwhite;
            width: 300px;
            height: 970px;
            position: absolute;
            right:0px;
            top:0px;
        }
        #aside-login_t{
            padding:70px 20px 0px 20px;
            background-color: #f69b02;
            width: 100%;
            height: 20%;
            text-align: center;
            
        }
        #aside-login_t li{
            list-style-type: none;
        }
        #aside-login_t li a{
            color: black;
            text-decoration: none;
        }
        .aside-mng{
            border: 1px solid gray;
            width: 100%;
            height: 10%;
            box-sizing: border-box;
            border-bottom: none;
            
        }
        .aside-mng_1{
            border: 1px solid gray;
            height: 100%;
            width: 50%;
            float: left;
            color: gray;
            border-bottom: none;
            text-align: center;
        }
        .aside-navi{
            padding: 0;
            margin: 0;
        }
        .aside-navi li{
            padding: 0;
            padding-top: 25px;
            padding-left: 20px;
            color: black;
            list-style-type: none;
            border: 1px solid gray;
            width: 300px;
            height: 80px;
            border-bottom: none;
        }
        .aside-list a{
            text-decoration: none;
        }
        #aside-login_b{
            border: 1px solid gray;
            width: 100%;
            height: 20%;
            position: relative;
            border-bottom: none;
        }
        #aside-login_b a{
            text-decoration: none;
            color: gray;
            position: absolute;
            top: 60px;
            left: 120px;
        }
        #aside-host{
            border: 1px solid gray;
            width: 100%;
            height: 20%;
            position: relative;
        }
        #aside-host a{
            text-decoration: none;
            color: gray;
            position: absolute;
            top: 60px;
            left: 65px;
        }
        .aside-navi ul{
            opacity: 1;
            padding: 0;
        }
        #sv_list li{
            
            padding: 0;
            padding-left: 50px;
            padding-top: 25px;
        }
        .aside-navi span{
            float: right;
            padding-right: 40px;
        }
        .r_img{
            width: 30px;
            height: 30px;
        }
        .d_img{
            width: 30px;
            height: 30px;
        }
    </style>

	
    <div id="mypage">
        <button class="back">></button>
        <div id="aside-login_t">
            <ul>
                <li><a><img src="../img/logo_2.png" style="width:80px; height:40px;"></a></li>
                <li>
                	<c:choose>
                		<c:when test="${empty sessionScope.User}">
                			<a href="/views/login.jsp">로그인이 필요합니다.</a>		
                		</c:when>
                		<c:otherwise>
                			<a href="#">${sessionScope.User.userName}</a>
                		</c:otherwise>
                	</c:choose>	
                </li>
                
            </ul>
        </div>
        <div class="aside-mng">
            <a href="#">
            	<div class="aside-mng_1 r">
            		<div><img src="../../img/KakaoTalk_20190528_121506545.png"></div>
           			예약리스트
            	</div>
            </a>
            <a href="/qaMngment">
            	<div class="aside-mng_1 l">
            		<div><img src="../../img/KakaoTalk_20190528_121506674.png"></div>
            		Q＆A관리
            	</div>
            </a>
        </div>
        <div class="aside-list">
            <ul class="aside-navi">
                <li><a href="#">내가 가고 싶은 공간<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li><a href="/noticeList">공지사항<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li><a href="/help">도움말<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li><a href="https://talk.naver.com/ct/wc89we">1:1문의<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li class="service"><a href="#">서비스정보<span><img src="/img/chevrondown.png" class="d_img"></span></a></li>
                <div style="display:none" id="sv_list">
                        <ul>
                            <a href="/views/mypage/introduction.jsp"><li>서비스 소개</li></a>
                            <a href="/views/mypage/TermsOfService.jsp"><li>이용약관</li></a>
                            <a href="#"><li>개인정보처리방침</li></a>
                            <a href="#"><li>운영정책</li></a>
                        </ul>
                </div>
            </ul>
        </div>
        <div id="aside-login_b">
        	<c:choose>
				<c:when test="${empty sessionScope.User}">
	       			<a href="/views/login.jsp">로그인</a>		
	       		</c:when>
	       		<c:otherwise>
	       			<a href="/logout">로그아웃</a>
	       		</c:otherwise>
	       	</c:choose>
        </div>
        <div id="aside-host">
            <a href="#">호스트센터로 이동</a>
        </div>
       
    </div>
<script>
    var count =0;
    $(".service").click(function(){
        if(count==0){
            $(".service img").attr("src","/img/chevronup.png");
            $("#sv_list").css("display","block");
            $("#sv_list > ul").css("background","lightgrey");
            count=1;
            $('#mypage').css("overflow-y","scroll");
        }else if(count==1){
            $(".service img").attr("src","/img/chevrondown.png");
            $("#sv_list").css("display","none")
            count=0;
            $('#mypage').css("overflow-y","hidden");
        }
       
//        $("#sv_list").css("display","block");
//        $("#sv_list > ul").css("background","lightgrey");
    })
</script>
