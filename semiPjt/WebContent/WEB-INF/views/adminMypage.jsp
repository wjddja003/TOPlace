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
            background-color: #f7f7f7;
            width: 300px;
            position: absolute;
            right:0px;
            top:0px;
        }
        #mypage1{
            width: 300px;
            height: 830px;
        }
        #aside-login_t{
            padding:47px 20px 0px 20px;
            background-color: #f69b02;
            width: 100%;
            height: 145px;
            text-align: center;
            
        }
        #aside-login_t li{
            list-style-type: none;
        }
        #aside-login_t li a{
            color: #183058;
            font-weight: bold;
            text-decoration: none;
        }
        .aside-mng{
            width: 100%;
            height: 10%;
            box-sizing: border-box;
            border-bottom: none;
            
        }
        .aside-mng_1:first-child{
            border-right: 1px solid #f7f7f7;
        }
        .aside-mng_1{
            height: 100%;
            width: 50%;
            float: left;
            color: #183058;
            text-align: center;
            border-bottom: 1px solid #f7f7f7;
        }
        .aside-mng_1 div{
            padding-top: 15px;
        }
        .aside-mng_1 div img{
            width: 40px;
            height: 40px;
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
            border-left: none;
            border-right: none;
        }
        .aside-navi a{
            color: black;
        }
        .aside-list a{
            text-decoration: none;
        }
        #aside-login_b{
            border: 1px solid gray;
            width: 100%;
            height: 140px;
            position: relative;
            border-bottom: none;
            border-left: none;
            border-right: none;
        }
        #aside-login_b a{
            text-decoration: none;
            color: gray;
            position: absolute;
            top: 40px;
            left: 120px;
        }
        #aside-host{
            border: 1px solid gray;
            width: 100%;
            height: 80px;
            line-height:80px;
            bottom : 0px;
            position: fixed;
            background-color: #183058;
        }
        #aside-host a{
            text-decoration: none;
            color: #f7f7f7;
            margin-left: 115px;

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
                <li>	
                	<a><img src="../../../img/logo_2.png" style="width:100px; height:50px;"></a>	
                </li>
                <li>
                	<a href="#">${sessionScope.User.userName}</a>
                </li>
                
            </ul>
        </div>
        <div id="mypage1">    
      
        	<div class="aside-list">
            <ul class="aside-navi">
                <li><a href="/adminUserPage">회원 정보 관리<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li class="spaceMng">
                	<a href="/adminSpacePage">공간정보 관리<span><img src="/img/chevronright.png" class="r_img"></span></a>
                	
                </li>
                <li><a href="/noticeList">공지사항 관리<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li><a href="/helpList">도움말 관리<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
                <li style="border-bottom: 1px solid gray;"><a href="/adminQaPage">Q&A , 리뷰 관리<span><img src="/img/chevronright.png" class="r_img"></span></a></li>
            </ul>
        	</div>
        </div>
        <div id="aside-host">
	        <a href="/logout">로그아웃 하기</a>	
        </div>
    </div>
<script>
	
    var count =0;
    $(".service").click(function(){
        if(count==0){
        	$(".service").css("border-bottom","none");
            $(".service img").attr("src","/img/chevronup.png");
            $("#sv_list").css("display","block");
            $("#sv_list > ul").css("background","lightgrey");
            count=1;
        }else if(count==1){
        	$(".service").css("border-bottom","1px solid gray");
            $(".service img").attr("src","/img/chevrondown.png");
            $("#sv_list").css("display","none")
            count=0;
        }
       
//        $("#sv_list").css("display","block");
//        $("#sv_list > ul").css("background","lightgrey");
    });
    $('.hostJoin').click(function(){
    	var check = '${sessionScope.User}';
    	if(check == ""){
    		alert("로그인이 필요합니다!");
    		location.href="/views/login.jsp";
    	}
    });
</script>
