<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">   
    </script>
    <style>
       table{
          border:5px solid white;
          border-collapse: collapse;
          
       }
        .calendar{
            visibility: collapse;
        }

        td{
            width: 110px;
            height: 80px;
            cursor: pointer;
            border:1px solid #ccc;
            background-color:white;
          font-size:20px;
        }
        td>p{
           margin-bottom:0px;
           font-size:16px;
        }
        th{
           width: 50px;
            height: 50px;
            background-color:white;
            font-size:20px;
           
        }
        tbody th{
         border:1px solid #ccc;
        }
        tr{
            text-align: center;
        }
        tr>td:first-child{
            color:red;
        }tr>td:last-child{
            color:skyblue;
        }
        .timebar{
           border:1px solid black;
           float:left;
           width: 50px;
           height: 50px;
        }
        #timetest{
           display :none;
        }
        .movebtn{
           width:50px;
        }
        #resetDayBtn {
         height: 56px;
         width: 100%;
         border: none;
         outline: none;
         background: #f69b02;
         color: white;
      }
      #resetDayBtn:hover{
         background: #183058;
      }
      .movebtn{
         width: 100%;
         height: 56px;
         border: none;
         outline: none;
         background: #f69b02;
         color: white;
         font-size:30px;
      }
      .movebtn:hover{
         background: #183058;
      }
    </style>

   <table>
        <thead>
            <th><button class="movebtn" id="prevbtn"><</button></th>
            <th colspan="5"></th>
            <th><button class="movebtn" id="nextbtn">></button></th>
        </thead>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tbody class="calendar">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tfooter>
            <tr>
                <th colspan="7">
                <button id="resetDayBtn">다시 선택하기</button>
                </th>
            </tr>
            
        </tfooter>
    </table>    
    <script>
    var timeInhibitArray=new Array();
    var preday = new Array();
    var array = new Array(); 
    $(document).ready(function(){
         
        var sysday = new Date();         
        //오늘날짜 객체로 받아오기
        var year = sysday.getFullYear(); 
        var yearToday = sysday.getFullYear(); 
        //년도 받기
        var backyear = sysday.getFullYear();
        //뒤로예약 처리용 년도 변수
        var month = sysday.getMonth()+1; 
        var monthToday = sysday.getMonth()+1;
        //월 받기
        var day = sysday.getDate();   
        var dayToday = sysday.getDate();  
        //날 받기
        var strOneDay = year+"-"+month+"-1"; 
        //스트링값으로 오늘이 포함된 달의 1일
        var oneDay = new Date(strOneDay); 
        //1일의 데이트 객체
        var DOW = oneDay.getDay();        
        //1일의 요일
        var visibleMonth = month-1;       
        //달력중 보여져야할 달의 인덱스용 변수
        month = visibleMonth+1            
        //몇월인지 표시해주려는 변수(숫자변환위해 넣음)
        var nextDOW = 0;                  
        //다음달이 시작될 요일을 위한 변수
        var prevDOWM = new Array(12);     
        //전달로 돌아가기위한 시작 요일용 변수
        var prevDOWY = new Array();       
        //년도가 바꼇을때 전달용 변수배열
        var yearIndex = 0;                
        //어떤 년도의 전달용 변수배열을 사용할것인지
        var monthEndDay = [31,28,31,30,31,30,31,31,30,31,30,31]; 
        //각 월의 마지막날
        var leapYear = 2020;    
        //윤년을 위한 기준년도
        var count = 0;          
        //클릭이벤트 셋 클리어용 카운트 변수
        var during = 0;         
        //예약 선택한 총기간알려주는 변수
        var startDay = -1;     
        //예약선택 시작 날 
        var endDay = -1;        
        //예약선택 마지막 날
        var startMonth = 0;    
        //예약선택 시작달
        var endMonth = 0;      
        //예약선택 마지막 달
        var startYear = 0;     
        //예약선택 시작년도
        var endYear = 0;        
        //예약선택 마지막 년도
        var clickEndDay = 0;    
        //선택된 마지막날 비교용
        var multiSelectCount = 0;
        //불규칙 다중 선택 날짜용 인덱스 변수
        var prepareMonth = "";
        var prepareDay = "";
        var MultiSelectArray = new Array();
        var booktypeValue = 0;
        var whileIndex = 0;
        var strOneDay="";
        var appendCount = 0;
        var arrayStr = "";
        
        
        var holiday = [sysday.getFullYear()+"0101",sysday.getFullYear()+"0301",sysday.getFullYear()+"0505",sysday.getFullYear()+"0512",sysday.getFullYear()+"0606",sysday.getFullYear()+"0815",sysday.getFullYear()+"1003",sysday.getFullYear()+"1009",sysday.getFullYear()+"1225"];
        var selectInhibitDay = new Array();
        
        var inhibitType = new Array(${s.s_holiday}); 
        var inhibitrList = new Array();
        var inhibitDay = new Array();
        var exList = new Array();
        var snum = '${s.s_no}';
        var substrarr = new Array();
        $.ajax({
            url: "/searchDay?S_no="+snum, // 클라이언트가 요청을 보낼 서버의 URL 주소
            type: "GET",                             // HTTP 요청 방식(GET, POST)
            dataType: "json",                         // 서버에서 보내줄 데이터의 타입
            async: false,
           success : function(data) {
              for(var i =0;i<data.length;i++){
                 if(data[i].reservationTime==null){
                  inhibitrList.push(data[i].reservationDay);
                  inhibitDay = inhibitDay.concat(inhibitrList[i].split(','));
                 }else{
                    inhibitrList.push(data[i].reservationDay);
                    preday = preday.concat(inhibitrList[i].split(','));
                    substrarr = data[i].reservationTime.split('/');
                    substrarr.pop();
                    console.log(substrarr);
                    timeInhibitArray = timeInhibitArray.concat(substrarr);
                    
                    
                 }
              }
             
           },error : function(xhr, status, error) {
              console.log("에러!: " + error);
           }
        });
        console.log(preday);
        console.log(timeInhibitArray);
        var inhibitDOW = [-1,-1,-1,-1,-1,-1,-1]
        
        if(inhibitType[0]==1){
           inhibitDay = inhibitDay.concat(holiday);
        }else if(inhibitType[0]==2){
           for(var hIndex=1;hIndex<8;hIndex++){
              if(inhibitType[hIndex]==1){
                 inhibitDOW[hIndex-1] = inhibitType[hIndex];
              }
           }
        }else if(inhibitType[0]==3){
           if(inhibitType[1]<10){
              prepareMonth = "0"+inhibitType[1];
           }else{
              prepareMonth =inhibitType[1]
           }
           if(inhibitType[2]<10){
              prepareDay = "0"+inhibitType[2];
           } else{
              prepareDay =inhibitType[2]
           }
           selectInhibitDay.push("2019"+prepareMonth+prepareDay);
           inhibitDay = inhibitDay.concat(selectInhibitDay);
        }
        console.log(inhibitDOW);
        //윤호 예약테이블완료되면 예약된날선택 불가 =>기간별만 inhibitDay에 들어감
        //시간별일때는 따로 로직 태워야함 => 마커 부분에서
        $(".calendar").eq(visibleMonth).css("visibility","visible"); // 온로드시 보여줘야 될 캘린더 인덱스
       
        $('th').eq(1).text(year+"년 "+month+"월"); //지금 띄워진 달력이 몇년도 몇월인지
        var weeknum = 1;
        for(var i=1;i<monthEndDay[month-1]+1;i++){
           var price = "<fmt:formatNumber type='number' maxFractionDigits='3' value='${s.s_price1}' />";
           
            $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price); //해당 달의 끝날자만큼 for문이 돌아서 날짜를 td에 입력
            if(i==dayToday){
               $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#183058");
               $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("color","#fff");
            }
            if(month==parseInt(sysday.getMonth()+1) && i<=day && year==yearToday){  //지금 이번달이 맞는지 또 입력되고 있는 날짜가 현재 날자보다 작은지 에따른 조건으로
               if(i==dayToday){
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#183058");
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("color","#fff");
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                }else{
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f7f7f7");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                }
                
            } //오늘 이전의 날들은 예약불가 처리 하는 로직
            for(var iDOW=0;iDOW<inhibitDOW.length;iDOW++){
               if(inhibitDOW[iDOW]==1 && $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).find('p').text()!=""){
                  
                  $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("background-color","#f7f7f7");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).html("<p>"+i+"</p>");
               }
            }
            for(var k = 0; k<inhibitDay.length; k++){
                if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f7f7f7");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                }
            } //예약불가 처리해야할 날짜들이 담긴 배열을 체크하여 예약불가 처리하는 로직
            if(i==monthEndDay[month-1]){//날짜를 입력하다가 마지막 이되면 다음달 첫날의 요일을 알려주는 변수에 현재 요일을 넣어줌
                nextDOW = DOW; 
            } else if(i==1){ //첫 시작시 요일을 prev버튼을 통해 이동될 저번달의 첫날의 요일로 입력해주는 배열
                prevDOWM[month-1] = DOW;
            }
            if(DOW==6){ //토요일이 될때마다 다음 행으로 넘기고 일요일로바꿔서 td에 해당 요일이 들어갈수 있게
                weeknum++;
                DOW=0;
                continue; //이때 요일표시가 7이 되지않도록 컨티뉴로 바로 포문을 돌려버림
            }
            DOW++
        }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//첫 온로드시 변수 선언 및 첫 달력
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

        
        $('#nextbtn').click(function(){
            
            $(".calendar").eq(visibleMonth).css("visibility","collapse"); //원래 띄워주었던 달력은 숨김처리
            month++; //달을 ++
            visibleMonth++; //띄워줘야할 tbody인덱스
            
            if(month>12){//다음 년도로 넘어갔을때
                prevDOWY.push(prevDOWM); //저번달들의 첫날이 담긴 배열을 2차원배열의 요소로 저장
                prevDOWM = new Array(12); //저번달의 첫날을 저장할 배열을 또 새로 생성
                month=1;   //month 1월로 초기화
                visibleMonth=month-1;   //표시될 tbody index를 0으로 초기화
                backyear = year;
                year++;      //year 추가
                yearIndex++;//저번달 첫날의 데이터가 남긴 2차원 배열용 인덱스
                if(year==leapYear){//윤달용 로직
                    monthEndDay[1]=29;
                    leapYear=leapYear+4;
                }else{
                    monthEndDay[1]=28;
                }//윤달용 로직
            }
            
            $(".calendar").eq(visibleMonth).css("visibility","visible");
            $(".calendar").eq(visibleMonth).find('td').text("");
            //다음달의 tbody비져블 및 td초기화
            weeknum = 1; 
            //첫째주로 클리어
            if(nextDOW==6){
                DOW= 0;
            }else{
                DOW= nextDOW+1;
            }//다음 달로 넘어왓을때 저번달의 마지막날이 토요일이면 이번달의 첫날의 요일을 일요일로 리셋
            $('th').eq(1).text(year+"년 "+month+"월");

            for(var i=1;i<monthEndDay[month-1]+1;i++){
               var price = "<fmt:formatNumber type='number' maxFractionDigits='3' value='${s.s_price1}' />";
               
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price);
                //기본 날짜 넣는 로직
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("color","#000");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                //기존에 가지고있을 예약불가 처리 날짜 리셋
                
                //저번달 달력에 담아있을 예약불가 처리 날짜 리셋
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).find('p').text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }//td체크하여 날짜가 들어가있지않은 td
                for(var iDOW=0;iDOW<inhibitDOW.length;iDOW++){
                   if(inhibitDOW[iDOW]==1 && $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).find('p').text()!=""){
                      
                      $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("background-color","#f7f7f7");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).html("<p>"+i+"</p>");
                   }
                }
                for(var k = 0; k<inhibitDay.length; k++){
                    if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f7f7f7");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }
                }//예약불가 날짜 처리 로직
                if(array.length>0){
                   for(var k2=0; k2<array.length; k2++){
                       if(year == parseInt(array[k2].substring(0,4)) && month==parseInt(array[k2].substring(4,6)) && i==parseInt(array[k2].substring(6,8))){
                          $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f69b02");
                       }
                    }
                }
                
                if(i==monthEndDay[month-1]){
                    nextDOW = DOW;
                } else if(i==1){
                    prevDOWM[month-1] = DOW;
                }//요일 표시용 변수들 값 변경
                if(DOW==6){
                    weeknum++;
                    DOW=0;
                    continue;
                }//주 변경시 로직 처리
            DOW++
            }
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//다음달 버튼 로직 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        $('#prevbtn').click(function(){
            
            if(sysday.getFullYear()==year && (month-1)<sysday.getMonth()+1){
               emptyValue("지난 예약은 불가능합니다.")
                return;
            } //지난 날짜 예약 불가
            
            $(".calendar").eq(visibleMonth).css("visibility","collapse");
            month--;
            visibleMonth--;
            //tdody 표시 로직
            if(month==0){
                month=12;
                visibleMonth=month-1;
                year--;
                yearIndex--;
                prevDOWM=prevDOWY[yearIndex];
                if(year==leapYear){
                    monthEndDay[1]=29;
                    leapYear=leapYear-4;
                }else{
                    monthEndDay[1]=28;
                }
            }
            //다음달 버튼 로직의 반대라고 생각 하면된다.
            $(".calendar").eq(visibleMonth).css("visibility","visible");
            $(".calendar").eq(visibleMonth).find('td').text("");
            
            weeknum = 1;
            DOW= prevDOWM[month-1];
           
            $('th').eq(1).text(year+"년 "+month+"월");
            for(var i=1;i<monthEndDay[month-1]+1;i++){
               var price = "<fmt:formatNumber type='number' maxFractionDigits='3' value='${s.s_price1}' />";
               
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price);
                if(year==yearToday && month==monthToday && i==dayToday){
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#183058");
                   $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("color","#fff");
                }
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                
                if(month==parseInt(sysday.getMonth()+1) && i<=day && year==sysday.getFullYear()){
                   if(year==yearToday && month==monthToday && i==dayToday){
                       $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#183058");
                       $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("color","#fff");
                       $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }else{
                       $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f7f7f7");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }
                }    
                
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).find('p').text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }
                for(var iDOW=0;iDOW<inhibitDOW.length;iDOW++){
                   if(inhibitDOW[iDOW]==1 && $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).find('p').text()!=""){
                      
                      $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("background-color","#f7f7f7");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(iDOW).html("<p>"+i+"</p>");
                   }
                }
                for(var k = 0; k<inhibitDay.length; k++){
                    if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f7f7f7");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }
                }
                if(array.length>0){
                   for(var k2=0; k2<array.length; k2++){
                       if(year == parseInt(array[k2].substring(0,4)) && month==parseInt(array[k2].substring(4,6)) && i==parseInt(array[k2].substring(6,8))){
                          $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","#f69b02");
                       }
                    }
                }
                if(i==monthEndDay[month-1]){
                    nextDOW = DOW;
                } else if(i==1){
                    prevDOWM[month-1] = DOW;
                }
                if(DOW==6){
                    weeknum++;
                    DOW=0;
                    continue;
                }
            DOW++
            }//이전달도 날짜를 뷰시키는 로직은 같다.
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//이전달 버튼 로직 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        $('td').not('td.inhibitDay').click(function(){
           if(btnVal==1 && $(this).find('p').text() != ""){ //기간별 선택 됐을때
              //위의 인풋타입으로 들어온조건 수정해야함 수정용 마커
                if($(this).hasClass("inhibitDay") === false && count==0){ //예약 불가 날짜는 제외
                	array = new Array();
                    $('td').not('td.inhibitDay').css("background-color","white");
                    $('td').removeClass("selectDay");
                    totalPrice -= ((during*'${s.s_price1}')*1);
                    $('.price').html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    //선택된 날짜 초기화 
                    startMonth = month;
                    startYear = year;
                    //선택된 날짜 스트링 변수로 바꿔서 배열에 넣기 위한 조건변수들
                    
                    startDay = $('td').index(this);
                    //선택된 날짜의 td index 가져오기
                   
                       $(this).css("background-color","#f69b02");
                     $(this).addClass("selectDay");
                   
                    
                    //선택된 날짜 css 변경 및 클래스 생성
                    
                    count=1;
                    //예약 시작 날짜 출력
                    $('.endDay').text("");
                    $('.hapDay').text("");
                    $('.startDay').text(year+"."+month+"."+$(this).find('p').text()+"일");
                    //추가
                    $('.price_day').text("");
                } else if($(this).hasClass("inhibitDay") === false && count==1){
                    endDay = $('td').index(this);
                    $(this).css("background-color","#f69b02");
                    $(this).addClass("selectDay");
                    endMonth = month;
                    endYear = year;
                    clickEndDay = $(this).find('p').text();
                    count = 0;
                    //예약 종료 날짜 출력
                    $('.endDay').text("-");
                    if(startDay<endDay){
                       $('.endDay').text("~ "+year+"."+month+"."+$(this).find('p').text()+"일");   
                    }else{
                       var changeStr = $('.startDay').eq(0).text();
                       $('.startDay').text("");
                       $('.endDay').text("~ "+changeStr);
                       $('.startDay').text(year+"."+month+"."+$(this).find('p').text()+"일");
                       
                    }
   
                }
                
                if($("td").eq(endDay).hasClass("selectDay") === true && count==0){//마지막날이 클릭 됐을때 
                   if(startDay<endDay){
                      for(var i =startDay; i<endDay;i++){
                           
                            if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).find('p').text()!=""){
                               if(during==30){
                                  console.log(during);
                                    resetfn();
                                    return;
                                }
                               
                                $('td').eq(i).css("background-color","#f69b02");
                                $('td').eq(i).addClass("selectDay");
                                during=$('.selectDay').length;
                                console.log(during);
                            }
                        }
                   }else if(startDay>endDay){
                      for(var i =endDay; i<startDay;i++){    
                            if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).find('p').text()!=""){
                               if(during==30){
                                  console.log(during);
                                    resetfn();
                                    return;
                                }
                                $('td').eq(i).css("background-color","#f69b02");
                                $('td').eq(i).addClass("selectDay");
                                //추가
                                //$('.price').text($('.price').text()+$('td').eq(i).find('pre').text());
                                during =$('.selectDay').length;
                                console.log(during);
                            }
                        }//for가 두개인 이유는 날짜 거꾸로 선택 가능 하게 하기위해서
                   }else{
                       during =$('.selectDay').length;
                       console.log(during);
                   }

                    
                    createSelectDay();
                    
                    $('#duringSpan').text(during);
                    endDay=null;
                    //예약 날짜 합계 출력
                    option = 0;
                    totalPrice=0;
                    $('.price_option').text("");
                    $('.option1').text("");
                    $('#option2').text("0");
                    $('.price').html("");
                    $('.hapDay').text("총"+during+"일");
                    $('.price_day').text($('.startDay').html()+" "+$('.endDay').html()+" 총"+during+"일"+" x "+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" />');
                    totalPrice += ((during*'${s.s_price1}')*1);
                    $('.price').html((totalPrice+('${s.s_price2}')*option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                }              
           } else if(btnVal==3 && $(this).find('p').text() != ""){
              if(array.length==7){
                 emptyValue("원하는 날짜는 7일까지 선택가능합니다.");
                 //추가
                 $('.price').html("");
                    $('.endDay').text("-");
                    $('.hapDay').text("");
                    $('.startDay').text("");
                    $('.price_time').text("");
                    selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                    sendTimeArray = new Array(10);
                    selTimeArr = new Array(); 
                    priceTimeArr = new Array(); 
                    $('#choiceDay').html("");
                    $('#showDay').html("");
                    $('.price_day').text("");
                    $('.selTime2').text("");
                 $('td').not('td.inhibitDay').css("background-color","white");
                      during = 0;
                      $('#duringSpan').text(during);
                      multiSelectCount = 0;
                      array=new Array();
                      for(var i = 0; i<$('td').not('td.inhibitDay').length;i++){
                         if($('td').not('td.inhibitDay').eq(i).attr("class")=="selectDay"){
                            $('td').not('td.inhibitDay').eq(i).removeClass("selectDay")
                         }
                      }
                   $('#rMenu_time').css('display','block');
                 $('.rM_time').css('display','none');
                 $('.swiper-slide button').attr('disabled','false');
                 return;
              }
              if($(this).hasClass("inhibitDay") === false && $(this).attr("class") != "selectDay"){
                    //선택된 날짜 초기화 
                    startDay = $('td').index(this);
                      $(this).css("background-color","#f69b02");
                    $(this).addClass("selectDay");
                    var strMonth1 = month.toString();
                   if(strMonth1.length<2){
                       strMonth1="0"+strMonth1;
                   }
                   if($('td').eq(startDay).find('p').text().length<2){
                        strDay = "0"+$('td').eq(startDay).find('p').text();
                    }else { 
                        strDay = $('td').eq(startDay).find('p').text();
                    }
                    strOneDay = year+strMonth1+strDay;
                    array.push(strOneDay);
                   //추가
                    $('.hapDay').html("총 "+array.length+"일");
                } else if($(this).hasClass("inhibitDay") === false && $(this).attr("class") == "selectDay"){
                   $(this).css("background-color","white");
                    $(this).removeClass("selectDay");
                    startDay = $('td').index(this);
                    var strMonth1 = month.toString();
                   if(strMonth1.length<2){
                       strMonth1="0"+strMonth1;
                   }
                   if($('td').eq(startDay).find('p').text().length<2){
                        strDay = "0"+$('td').eq(startDay).find('p').text();
                    }else { 
                        strDay = $('td').eq(startDay).find('p').text();
                    }
                    strOneDay = year+strMonth1+strDay;
                    const idx = array.indexOf(strOneDay); 
                    if (idx > -1) {
                       array.splice(idx, 1);
                       priceTimeArr.splice(idx,1);
                        sendTimeArray.splice(idx,1);
                        selTimeArr.splice(idx,1);
                        console.log(array);
                        console.log(priceTimeArr);
                        console.log(sendTimeArray);
                        console.log(selTimeArr);
                    }
                    $('.hapDay').html("총 "+array.length+"일");
                    
                    
                    
                    $('.selTime2').html("");
                    for(var IItime=0; IItime<selTimeArr.length; IItime++){
                         $('.selTime2').html($('.selTime2').html()+String(array[IItime]).substring(0,4)+"년 "+String(array[IItime]).substring(4,6)+"월 "+String(array[IItime]).substring(6,8)+"일, "+String(selTimeArr[IItime]).replace("undefined","")+"<br>");
                      }
                    totalTime = 0;
                    totalPrice = 0;
                    
                    for(var IIII=0; IIII<priceTimeArr.length; IIII++){
                       if(priceTimeArr[IIII]!=null){
                          totalTime += priceTimeArr[IIII];
                             totalPrice += priceTimeArr[IIII]*'${s.s_price1}';
                       }
                       
                    }
                    $('#rMenu_time').css('display','none');
                    $('.rM_time').css('display','block');
                    
                     $('.price_time').html("총 "+totalTime+'시간 x '+'<fmt:formatNumber type="number" maxFractionDigits="3" value="${s.s_price1}" />');
                     $('.totalTime').html("총 "+totalTime+'시간');
                     $('.price').html((totalPrice+('${s.s_price2}')*option).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                     if(array.length==0){
                       selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                        sendTimeArray = new Array(10);
                        selTimeArr = new Array(); 
                        priceTimeArr = new Array(); 
                        
                    }
                }
              array.sort();
              
              $('#choiceDay').html("");
              $('#showDay').html("날짜선택");
              for(appendCount = 0; appendCount<array.length;appendCount++){
                 $('#choiceDay').append("<button onclick='selectTimeBtnfn(this);' class='selectTimeBtn'>"+array[appendCount]+"</button>&nbsp;&nbsp;");
              }
              
            }
           
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//날짜 클릭 이벤트 로직 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        resetfn = sample;   
        function sample(){
           console.log("리셋펑션 확인용"+during);
           if(startMonth>endMonth){
               $('.endDay').text("-");
                $('.hapDay').text("");
                $('.startDay').text("");
                emptyValue("이전 날짜부터 선택해주십시오.")
                $('td').not('td.inhibitDay').css("background-color","white");
                during=0;
                return;
            }
           emptyValue("예약일은 30일을 초과할수 없습니다.")
            $('.endDay').text("-");
            $('.hapDay').text("");
            $('.startDay').text("");
            $('td').not('td.inhibitDay').css("background-color","white");
            for(var i = 0; i<$('td').not('td.inhibitDay').length;i++){
               if($('td').not('td.inhibitDay').eq(i).attr("class")=="selectDay"){
                  $('td').not('td.inhibitDay').eq(i).removeClass("selectDay")
               }
            }
            during = 0;
            $('#duringSpan').text(during);
            $('.swiper-slide button').attr('disabled','false');
        }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//30일 이상 선태 불가 메소드 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////  
        $('#resetDayBtn').click(function(){
            $('td').not('td.inhibitDay').css("background-color","white");
            during = 0;
            $('#duringSpan').text(during);
            multiSelectCount = 0;
            array=new Array();
            for(var i = 0; i<$('td').not('td.inhibitDay').length;i++){
               if($('td').not('td.inhibitDay').eq(i).attr("class")=="selectDay"){
                  $('td').not('td.inhibitDay').eq(i).removeClass("selectDay")
               }
            }
            option = 0;
            console.log(option);
            totalPrice = 0;
            $('.price_option').text("");
            $('.option1').text("");
            $('#option2').text("0");
            $('.price').html("");
            $('.endDay').text("-");
            $('.hapDay').text("");
            $('.startDay').text("");
            selTimeArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            sendTimeArray = new Array(10);
            selTimeArr = new Array(); 
            priceTimeArr = new Array(); 
            $('#choiceDay').html("");
            $('#showDay').html("");
            $('.price_day').text("");
            $('.selTime2').text("");
            $('.price_time').text("");
            $('#rMenu_time').css('display','block');
            $('.rM_time').css('display','none');
            $('.swiper-slide button').attr('disabled','false');
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//선택된 날짜 길이 확인용 메소드
      createSelectDay = function(){
   console.log("크리에이트 확인용"+during);
               if(startMonth>endMonth){
                  $('.endDay').text("-");
                   $('.hapDay').text("");
                   $('.startDay').text("");
                   emptyValue("이전 날짜부터 선택해주십시오.")
                   $('td').not('td.inhibitDay').css("background-color","white");
                   during=0;
                   return ;
               }
               if(startMonth!=endMonth || startYear!=endYear){
                   array = new Array();
                   var prepareEndDay = monthEndDay[startMonth-1];
                   for(var k = inhibitDay.length-1; k>=0; k--){
                       if(startMonth==parseInt(inhibitDay[k].substring(4,6)) && prepareEndDay==parseInt(inhibitDay[k].substring(6,8))){
                           prepareEndDay--;
                       }
                   }
                   var strMonth1 = startMonth.toString();
                   var strMonth2 = endMonth.toString();
                   var strDay = "";
                   if(strMonth1.length<2){
                       strMonth1="0"+strMonth1;
                   }
                   if(strMonth2.length<2){
                       strMonth2="0"+strMonth2;
                   }
                   var i = 0;
                   
                   while(true){
                       if($('.selectDay').eq(i).find('p').text().length<2){
                           strDay = "0"+$('.selectDay').eq(i).find('p').text();
                       }else { 
                           strDay = $('.selectDay').eq(i).find('p').text();
                       }
                       
                       array[i] = year+strMonth1+strDay;
                       if(($('.selectDay').eq(i).find('p').text())==prepareEndDay){
                           i++;
                           break;
                       }
                       i++;
                   }
                   while(true){
                       if($('.selectDay').eq(i).find('p').text().length<2){
                           strDay = "0"+$('.selectDay').eq(i).find('p').text();
                       }else { 
                           strDay = $('.selectDay').eq(i).find('p').text();
                       }
                       
                       array[i] = year+strMonth2+strDay;
                       if(($('.selectDay').eq(i).find('p').text())==clickEndDay){
                           break;
                       }
                       i++;
                   }
                
               }else{
                   array = new Array();
                   var strMonth = month.toString()
                   var strDay = "";
                   if(strMonth.length<2){
                       strMonth="0"+strMonth;
                   }
   
                   console.log("어레이길이:"+$('.selectDay').length);
                   for(var i =0;i<$('.selectDay').length;i++){
                       if($('.selectDay').eq(i).find('p').text().length<2){
                           strDay = "0"+$('.selectDay').eq(i).find('p').text();
                       }else { 
                           strDay = $('.selectDay').eq(i).find('p').text();
                       }
                       array[i] = year+strMonth+strDay;
                   }
               }
               
               arrayStr="";
               for(var arrI=0;arrI<array.length;arrI++){
                  arrayStr += array[arrI];
                  if(arrI<array.length-1){
                     arrayStr += ",";
                  }
               }
               console.log("날짜스트링"+arrayStr);
               $('input[name=reservationDay]').val(arrayStr);
               
      }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//선택된 예약 날짜 배열에 저장하는 로직 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        new Swiper('.swiper-container', {
            slidesPerView : 10, // 동시에 보여줄 슬라이드 갯수
            spaceBetween : 0, // 슬라이드간 간격
            slidesPerGroup : 10, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
            // 그룹수가 맞지 않을 경우 빈칸으로 메우기
            // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
            loopFillGroupWithBlank : true,
            loop : false, // 무한 반복
            pagination : { // 페이징
               el : '.swiper-pagination',
               clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
               },
               navigation : { // 네비게이션
                  nextEl : '.swiper-button-next', // 다음 버튼 클래스명
                  prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
                  },
          });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//기간선택하는 버튼 밸류값 지정메소드
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
      $('.daySelBtn').click(function(){
         btnVal = $(this).val();
         $('td').not('td.inhibitDay').css("background-color","white");
            $('td').removeClass("selectDay");
            array = new Array();
      });
      $('#testbtn11').click(function(){
         $('td.selectDay').addClass('testclass');
         console.log($('.testclass').length);
      }); //예약테이블 완성되면 예약된 날짜에다가 클래스 하나 새로 준다음 그 클래스 인애들은 
    });
    ///커밋
    </script>