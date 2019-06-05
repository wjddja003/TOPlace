<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>

<script
      src="https://code.jquery.com/jquery-3.4.0.js"
      integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
      crossorigin="anonymous">   
    </script>
    <style>
        .calendar{
            visibility: collapse;
        }

        td{
            width: 80px;
            height: 50px;
            cursor: pointer;
        }
        th{
        	width: 50px;
            height: 50px;
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
    </style>

	<table border="1">
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
                <button id="btn">다시 선택하기</button>
                <span></span><br>
                <button id="testbtn11">다시 선택하기</button>
                </th>
            </tr>
            
        </tfooter>
    </table>    
    <script>
    $(document).ready(function(){
         
        var sysday = new Date();         
        //오늘날짜 객체로 받아오기
        var year = sysday.getFullYear(); 
        //년도 받기
        var backyear = sysday.getFullYear();
        //뒤로예약 처리용 년도 변수
        var month = sysday.getMonth()+1; 
        //월 받기
        var day = sysday.getDate();      
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
        var timetestArray=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        
        var holiday = [sysday.getFullYear()+"0101",sysday.getFullYear()+"0301",sysday.getFullYear()+"0505",sysday.getFullYear()+"0512",sysday.getFullYear()+"0606",sysday.getFullYear()+"0815",sysday.getFullYear()+"1003",sysday.getFullYear()+"1009",sysday.getFullYear()+"1225"];
        var selectInhibitDay = new Array();
        var array = new Array(); 
        var inhibitType = new Array(${s.s_holiday}); 
        
        var inhibitDay = new Array();
        var inhibitDOW = [-1,-1,-1,-1,-1,-1,-1]
        if(inhibitType[0]==1){
        	inhibitDay = holiday;
        }else if(inhibitType[0]==2){
        	for(var hIndex=1;hIndex<8;hIndex++){
        		if(inhibitType[0]==1){
        			inhibitDOW[hIndex-1] = hIndex-1;
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
        	inhibitDay = selectInhibitDay;
        }
        console.log(inhibitDay);
        //윤호 예약테이블완료되면 예약된날선택 불가 =>기간별만 inhibitDay에 들어감
        //시간별일때는 따로 로직 태워야함 => 마커 부분에서
        $(".calendar").eq(visibleMonth).css("visibility","visible"); // 온로드시 보여줘야 될 캘린더 인덱스
       
        $('th').eq(1).text(year+"년 "+month+"월"); //지금 띄워진 달력이 몇년도 몇월인지
        var weeknum = 1;
        for(var i=1;i<monthEndDay[month-1]+1;i++){
        	var price = '${s.s_price1}';
        	if(DOW==0 || DOW==5 || DOW==6){
        		price = price*2;
        	}
            $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price); //해당 달의 끝날자만큼 for문이 돌아서 날짜를 td에 입력
            if(month==parseInt(sysday.getMonth()+1) && i<day){  //지금 이번달이 맞는지 또 입력되고 있는 날짜가 현재 날자보다 작은지 에따른 조건으로
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
            } //오늘 이전의 날들은 예약불가 처리 하는 로직
            for(var k = 0; k<inhibitDay.length; k++){
                if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
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
                month=1;	//month 1월로 초기화
                visibleMonth=month-1;	//표시될 tbody index를 0으로 초기화
                backyear = year;
                year++;		//year 추가
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
            	var price = '${s.s_price1}';
            	if(DOW==0 || DOW==5 || DOW==6){
            		price = price*2;
            	}
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price);
                //기본 날짜 넣는 로직
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                //기존에 가지고있을 예약불가 처리 날짜 리셋
                if(month==parseInt(sysday.getMonth()+1) && i<day && year==sysday.getFullYear()){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                }
                //저번달 달력에 담아있을 예약불가 처리 날짜 리셋
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).find('p').text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }//td체크하여 날짜가 들어가있지않은 td
                
                for(var k = 0; k<inhibitDay.length; k++){
                    if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }
                }//예약불가 날짜 처리 로직
                if(array.length>0){
                	for(var k2=0; k2<array.length; k2++){
                    	if(year == parseInt(array[k2].substring(0,4)) && month==parseInt(array[k2].substring(4,6)) && i==parseInt(array[k2].substring(6,8))){
                    		$(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","green");
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
                alert("지난 예약은 불가능합니다.")
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
            	var price = '${s.s_price1}';
            	if(DOW==0 || DOW==5 || DOW==6){
            		price = price*2;
            	}
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>￦"+price);
                
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                
                if(month==parseInt(sysday.getMonth()+1) && i<day && year==sysday.getFullYear()){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                }    
                
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).find('p').text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }
                
                for(var k = 0; k<inhibitDay.length; k++){
                    if(year == parseInt(inhibitDay[k].substring(0,4)) && month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).html("<p>"+i+"</p>");
                    }
                }
                if(array.length>0){
                	for(var k2=0; k2<array.length; k2++){
                    	if(year == parseInt(array[k2].substring(0,4)) && month==parseInt(array[k2].substring(4,6)) && i==parseInt(array[k2].substring(6,8))){
                    		$(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","green");
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
                    $('td').not('td.inhibitDay').css("background-color","white");
                    $('td').removeClass("selectDay");
                    //선택된 날짜 초기화 
                    startDay = $('td').index(this);
                    //선택된 날짜의 td index 가져오기
                    $(this).css("background-color","green");
                    $(this).addClass("selectDay");
                    //선택된 날짜 css 변경 및 클래스 생성
                    startMonth = month;
                    startYear = year;
                    //선택된 날짜 스트링 변수로 바꿔서 배열에 넣기 위한 조건변수들
                    count=1;
                    //예약 시작 날짜 출력
                    $('.endDay').text("");
                    $('.hapDay').text("");
                    $('.startDay').text(year+"."+month+"."+$(this).find('p').text()+"일");
                } else if($(this).hasClass("inhibitDay") === false && count==1){
                    endDay = $('td').index(this);
                    $(this).css("background-color","red");
                    $(this).addClass("selectDay");
                    endMonth = month;
                    endYear = year;
                    clickEndDay = $(this).find('p').text();
                    count = 0;
                    //예약 종료 날짜 출력
                    $('.endDay').text("");
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

                    for(var i =startDay; i<endDay+1;i++){
                    	during = $('.selectDay').length;
                        if(during>30){
                            resetfn();
                            return;
                        }       
                        if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).find('p').text()!=""){
                            $('td').eq(i).css("background-color","green");
                            $('td').eq(i).addClass("selectDay");
                        }
                    }
                    for(var i =endDay; i<startDay+1;i++){    
                    	during = $('.selectDay').length;
                        if(during>30){
                            resetfn();
                            return;
                        }
                        if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).find('p').text()!=""){
                            $('td').eq(i).css("background-color","green");
                            $('td').eq(i).addClass("selectDay");
                        }
                    }//for가 두개인 이유는 날짜 거꾸로 선택 가능 하게 하기위해서
                    createSelectDay();
                    $('#duringSpan').text(during);
                    endDay=null;
                    //예약 날짜 합계 출력
                    $('.hapDay').text("총"+during+"일");
                }              
        	} else if(btnVal==2 && $(this).find('p').text() != ""){
                if($(this).hasClass("inhibitDay") === false && count==0){
                    $('td').not('td.inhibitDay').css("background-color","white");
                    $('td').removeClass("selectDay");
                    startDay = $('td').index(this);
                   	$(this).css("background-color","green");
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
                    count=1;
                }
        		
                if($("td").eq(startDay).hasClass("selectDay") === true && count==1){
					//마커 
					//여기 윤호랑 맞춰서 아이디 클래스 변수명 변경 해야함
					$('#reservation_time').slideDown(500);
					var test12 = "000001111100000111111111";
					var dbDay='20190531';
					
					if(dbDay==strOneDay){
						for(var i=0;i<$('.swiper-slide').length;i++){
							if(test12.charAt(i)==1){
							$('.swiper-slide').eq(i).children().css('background','#183058');
							$('.swiper-slide').eq(i).children().css('color','white');//css변경구문으로 교체하면 됨.
							}
						}
					}
					$('.selDay').text(strOneDay);
					count=0;
                }
                console.log(strOneDay);
        	} else if(btnVal==3 && $(this).find('p').text() != ""){
        		if(array.length==7){
        			alert("원하는 날짜는 7일까지 선택가능합니다.");
        			return;
        		}
        		if($(this).hasClass("inhibitDay") === false && $(this).attr("class") != "selectDay"){
                    //선택된 날짜 초기화 
                    startDay = $('td').index(this);
                   	$(this).css("background-color","green");
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
                    if (idx > -1) array.splice(idx, 1)
                }
        		array.sort();
        		$('#choiceDay').html("");
        		for(appendCount = 0; appendCount<array.length;appendCount++){
        			$('#choiceDay').append("<button onclick='selectTimeBtnfn();' class='selectTimeBtn'>"+array[appendCount]+"</button>");
        		}
        		
        		
                 console.log(array);
                 if($("td").eq(startDay).hasClass("selectDay") === true){
 					//마커 
 					//여기 윤호랑 맞춰서 아이디 클래스 변수명 변경 해야함 이거아직 해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 					$('#reservation_time').slideDown(500);
 					var test12 = "000001111100000111111111";
 					var dbDay='20190531';
 					
 					if(dbDay==strOneDay){
 						for(var i=0;i<$('.swiper-slide').length;i++){
 							if(test12.charAt(i)==1){
 							$('.swiper-slide').eq(i).children().css('background','#183058');
 							$('.swiper-slide').eq(i).children().css('color','white');//css변경구문으로 교체하면 됨.
 							}
 						}
 					}
 					$('.selDay').text(strOneDay);

                 }
        	}
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//날짜 클릭 이벤트 로직 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        resetfn = sample;	
        function sample(){
            alert("예약일은 30일을 초과할수 없습니다.")
            $('.endDay').text("");
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
        }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//30일 이상 선태 불가 메소드 종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////  
        $('#btn').click(function(){
            $('td').not('td.inhibitDay').css("background-color","white");
            during = 0;
            $('#duringSpan').text(during);
            multiSelectCount = 0;
        });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//선택된 날짜 길이 확인용 메소드
		createSelectDay = function(){
	            if(startMonth>endMonth){
	            	$('.endDay').text("");
	                $('.hapDay').text("");
	                $('.startDay').text("");
	                alert("이전 날짜부터 선택해주십시오.")
	                $('td').not('td.inhibitDay').css("background-color","white");
	                return;
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
	
	                console.log(month);
	                for(var i =0;i<$('.selectDay').length;i++){
	                    if($('.selectDay').eq(i).find('p').text().length<2){
	                        strDay = "0"+$('.selectDay').eq(i).find('p').text();
	                    }else { 
	                        strDay = $('.selectDay').eq(i).find('p').text();
	                    }
	                    array[i] = year+strMonth+strDay;
	                }
	            }
	            console.log(array);
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
    </script>
