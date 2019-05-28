<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뷰페이지</title>
<style>
    .viewpage_content{
        width: 100%;
        height: 520px;
        background: url(../img/viewpage_background.jpg) no-repeat center center;
        background-size: cover;
    }
    #viewpage_icon{
        position: relative;
    }
    #viewpage_icon img:first-child{
        position: absolute;
        right: 80px;
        top: 450px;
    }
    #viewpage_icon img:last-child{
        position: absolute;
        right: 0;
        top: 450px;
    }
    /*상단 이미지 Fin*/
    .viewpage_section{
        margin-top: 20px;
    }
    .viewpage_section h1{
        font-weight: bold;
    }
    .viewpage_section p{
        font-size: 22px;
        font-weight: 100;
    }
    .viewpage_section ul li{
        list-style: none;
        display: inline-block;
        margin: 6px 6px 6px 0;
        padding: 0 15px;
        border: 1px solid #e0e0e0;
        border-radius: 10px;
    }
    .viewpage_section ul li a{
        text-decoration: none;
        color: #656565;
        font-weight: 100;
        font-size: 16px;
    }
    /*.viewpage_section Fin*/
    
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/common/header.jsp"/>  
    <section>
        <div class="viewpage_content">
            <div class="section_content">
                <div id="viewpage_icon">
                    <img src="../img/share_icon.png">
                    <img src="../img/like_icon.png">
                </div>
            </div>
        </div>
        <!-- 상단 이미지 fin -->
        <div class="section_content">
            <div class="viewpage_section">
                <h1>업타운 SKY 루프탑 파티공간</h1>
                <p>도심 속 자유를 느끼는 우리만의 옥상 정원</p>
                <ul>
                    <li><a href="#">#루프탑</a></li>
                    <li><a href="#">#파티</a></li>
                    <li><a href="#">#옥상</a></li>
                    <li><a href="#">#안암</a></li>
                    <li><a href="#">#동대문구</a></li>
                </ul>
            </div>
            <!--viewpage_section Fin-->
        </div>
    </section>
</body>
</html>