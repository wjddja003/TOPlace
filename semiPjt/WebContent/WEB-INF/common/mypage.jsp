<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Insert title here</title>
    <style>
        #mypage{
            background-color: floralwhite;
            width: 300px;
            height: 964px;
            position: absolute;
            right:0px;
            top:0px;
        }
        #aside-login{
            padding-top: 25%;
            border: 1px solid black;
            background-color: darkgray;
            width: 100%;
            height: 20%;
            text-align: center;
            
        }
        #aside-login li{
            list-style-type: none;
            float: left;
        }
        .aside-mng{
            border: 1px solid black;
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }
        .aside-mng_1{
            border: 1px solid black;
            height: 100%;
            width: 50%;
            float: left;
            
        }
        .aside-mng_2{
            border:1px solid black;
            height: 100%;
            width: 50%;
            float: left;
        }
    </style>
</head>
<body>
	
    <div id="mypage">
        <div id="aside-login">
            <ul>
                <li><a><img src="img/img_profile_default.jpg"</a></li>
                <li><a href="#">로그인이 필요합니다.</a></li>
            </ul>
        </div>
        <div class="aside-mng">
            <a href="#"><div class="aside-mng_1">예약리스트</div></a>
            <a href="#"><div class="aside-mng_2">이용후기/Q＆A관리</div></a>
        </div>
        <div class="aside-"></div>
       
    </div>
</body>
</html>