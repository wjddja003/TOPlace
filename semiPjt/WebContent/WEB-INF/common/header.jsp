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
    	*{
    		margin:0;
    		color:black;
    		font-size:20px;
    		font-weight:bold;
    	}
        header{
        	width: 100%;
            height: 100px;
        }
        .header{
            text-align: center;
            float: left;
            box-sizing: border-box;
            height: 100%;
            line-height: 100px;
            background-color: #846FE8;
            padding: 0;
        }
        .logo{
            background-image: url(/img/exlogo.jpg);
            background-size: 100% 100%;
        }
        .navi{
            text-align: center;
            line-height: 100px;
            
        }
        .navi ul{
            margin: 0 auto;
            width:50%;
        }
        .navi li{
            float: left;
            display: block;
            list-style: none;
            text-align: center;
            width:25%;
        }
        .navi li:hover{
            font-size: 18px;
            cursor: pointer;
        }
        #test{
            
            height: 818px;
            z-index: 1;
            position: relative;
            
        }
        #header-search{
            background-color: blue;
            z-index: 0;
            height: 500px;
            position: absolute;
            top: 150px;
        }
        #header-mypage{
            background-color: darkmagenta;
            width: 300px;
            height: 968px;
            z-index: 0;
            position: fixed;
            float: right;
        }
    </style>
</head>
<body> 
	<header>
        <a href="/"><div class="header logo" style="width:15%;"></div></a>
        <div class="header navi" style="width:60%;">
            <ul id="navi-bar">
                <a href="/views/testmenu.jsp"><li class="navi-li">베스트</li></a>
                <a href="/"><li class="navi-li">핫딜/이벤트</li></a>
                <a href="/"><li class="navi-li">공간등록</li></a>
            </ul>
        </div>
        <div class="header realtime" style="width:10%;">실시간</div>
        <div class="header search" style="width:7.5%;">검색</div>
        <div class="header mypage" style="width:7.5%;">마이페이지</div>
    </header>
   
    <div id="test">
        
    </div>
    <div id="header-search">
        
    </div>
    <div id="header-mypage">
        
    </div>
    <script>
        
        $(".search").click(function(){
            $("#header-search").css("z-index","2");
            $("#test").css("opacity","0.5");
        });
        $(".mypage").click(function(){
            $("#header-mypage").css("z-index","2");
            $("#test").css("opacity","0.5");
        });
    </script>

</body>
</html>
    