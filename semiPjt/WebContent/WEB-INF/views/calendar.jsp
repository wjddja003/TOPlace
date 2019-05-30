<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            width: 40px;
            height: 40px;
            cursor: pointer;
        }
        tr{
            text-align: center;
        }
        tr>td:first-child{
            color:red;
        }tr>td:last-child{
            color:skyblue;
        }
    </style>
</head>
<body>
	<table border="1">
        <thead>
            <th><button id="prevbtn">뒤로</button></th>
            <th colspan="5"></th>
            <th><button id="nextbtn">다음</button></th>
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
            <button id="btn">다시 선택하기</button>
            <span id="duringSpan"></span><br>
            <br>
            <button id="strCheck">확인하기</button>
            <div></div>
        </tfooter>
    </table>
    
    
    
    <script>
    $(document).ready(function(){
            
        var sysday = new Date();         
        //오늘날짜 객체로 받아오기
        var year = sysday.getFullYear(); 
        //년도 받기
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
        var booktypeValue = 0;
        var holiday = [sysday.getFullYear()+"0101",sysday.getFullYear()+"0301",sysday.getFullYear()+"0505",sysday.getFullYear()+"0512",sysday.getFullYear()+"0606",sysday.getFullYear()+"0815",sysday.getFullYear()+"1003",sysday.getFullYear()+"1009",sysday.getFullYear()+"1225"];
        var selectInhibitDay = new Array();
        selectInhibitDay.push("20191002");
        
        //나중에 조건나오면 if 걸어서 제외할 날들 배열 합치기 inhibitDay가 최종 배열
        //조건 나오면 정렬 돌려서 넣기
        var inhibitDay = holiday.concat(selectInhibitDay);
        
        console.log(inhibitDay);
        $(".calendar").eq(visibleMonth).css("visibility","visible");
       
        $('th').eq(1).text(year+"년 "+month+"월");
        var weeknum = 1;
        for(var i=1;i<monthEndDay[month-1]+1;i++){
            $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).text(i);
            if(month==parseInt(sysday.getMonth()+1) && i<day){
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
            }
            for(var k = 0; k<inhibitDay.length; k++){
                if(month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
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
        }
        
        var whileIndex = 0;
        
        $('#nextbtn').click(function(){
            
            $(".calendar").eq(visibleMonth).css("visibility","collapse");
            month++;
            visibleMonth++;
            
            if(month>12){
                prevDOWY.push(prevDOWM);
                prevDOWM = new Array(12);
                month=1;
                visibleMonth=month-1;
                year++;
                yearIndex++;
                if(year==leapYear){
                    monthEndDay[1]=29;
                    leapYear=leapYear+4;
                }else{
                    monthEndDay[1]=28;
                }
                console.log(yearIndex);
            }
            $(".calendar").eq(visibleMonth).css("visibility","visible");
            $(".calendar").eq(visibleMonth).find('td').text("");
            
            weeknum = 1;
            if(nextDOW==6){
                DOW= 0;
            }else{
                DOW= nextDOW+1;
            }
            $('th').eq(1).text(year+"년 "+month+"월");
            console.log($(".calendar").eq(visibleMonth).find('td'));
            for(var i=1;i<monthEndDay[month-1]+1;i++){
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).text(i);
                
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                
                if(month==parseInt(sysday.getMonth()+1) && i<day && year==sysday.getFullYear()){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                }
                
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }
                
                for(var k = 0; k<inhibitDay.length; k++){
                    if(month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
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
            }
            console.log(prevDOWM);
            console.log(prevDOWY);
        });
        $('#prevbtn').click(function(){
            
            if(sysday.getFullYear()==year && (month-1)<sysday.getMonth()+1){
                alert("지난 예약은 불가능합니다.")
                return;
            }
            
            $(".calendar").eq(visibleMonth).css("visibility","collapse");
            month--;
            visibleMonth--;
            
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
            $(".calendar").eq(visibleMonth).css("visibility","visible");
            $(".calendar").eq(visibleMonth).find('td').text("");
            
            weeknum = 1;
            DOW= prevDOWM[month-1];
           
            $('th').eq(1).text(year+"년 "+month+"월");
            for(var i=1;i<monthEndDay[month-1]+1;i++){
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).text(i);
                
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","white");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","pointer");
                $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).removeClass("inhibitDay");
                
                if(month==parseInt(sysday.getMonth()+1) && i<day && year==sysday.getFullYear()){
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                    $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
                }    
                
                for(var i2 = 0; i2<$(".calendar").eq(visibleMonth).find('td').length; i2++) {
                    if($(".calendar").eq(visibleMonth).find('td').eq(i2).text()==""){
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("background-color","white");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).css("cursor","pointer");
                        $(".calendar").eq(visibleMonth).find('td').eq(i2).removeClass("inhibitDay");
                    }
                }
                
                for(var k = 0; k<inhibitDay.length; k++){
                    if(month==parseInt(inhibitDay[k].substring(4,6)) && i==parseInt(inhibitDay[k].substring(6,8))){
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("background-color","grey");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).css("cursor","not-allowed");
                        $(".calendar").eq(visibleMonth).find('tr').eq(weeknum).find('td').eq(DOW).addClass("inhibitDay");
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
            }
            console.log(prevDOWM);
            console.log(prevDOWY);
        });
        
        $('.book_type').click(function(){
            if(this.checked){
                booktypeValue = this.value;
            }
            console.log(booktypeValue);
        });

        
        $('td').not('td.inhibitDay').click(function(){
                if($(this).hasClass("inhibitDay") === false && count==0){
                    $('td').not('td.inhibitDay').css("background-color","white");
                    $('td').removeClass("selectDay");
                    startDay = $('td').index(this);
                    $(this).css("background-color","green");
                    $(this).addClass("selectDay");
                    startMonth = month;
                    startYear = year;
                    count=1;
                } else if($(this).hasClass("inhibitDay") === false && count==1){
                    endDay = $('td').index(this);
                    $(this).css("background-color","red");
                    $(this).addClass("selectDay");
                    endMonth = month;
                    endYear = year;
                    clickEndDay = $(this).text();
                    count = 0;
                }

                if($("td").eq(endDay).hasClass("selectDay") === true && count==0){

                    for(var i =startDay; i<endDay+1;i++){
                        during = $('.selectDay').length;
                        if(during>30){
                            resetfn();
                            break;
                        }       
                        if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).text()!=""){
                            $('td').eq(i).css("background-color","green");
                            $('td').eq(i).addClass("selectDay");
                        }

                    }
                    for(var i =endDay; i<startDay+1;i++){
                        during = $('.selectDay').length;
                        if(during>30){
                            resetfn();
                            break;
                        }
                        if($("td").eq(i).hasClass("inhibitDay") === false && $('td').eq(i).text()!=""){
                            $('td').eq(i).css("background-color","green");
                            $('td').eq(i).addClass("selectDay");
                        }

                    }

                    $('#duringSpan').text(during);
                    endDay=null;
                }              
            
        });
        resetfn = sample;	
        function sample(){
            alert("예약일은 30일을 초과할수 없습니다.")
            $('td').not('td.inhibitDay').css("background-color","white");
            during = 0;
            $('#duringSpan').text(during);
        }
            
        $('#btn').click(function(){
            $('td').not('td.inhibitDay').css("background-color","white");
            during = 0;
            $('#duringSpan').text(during);
        });
        $("#strCheck").click(function(){
            if(startMonth>endMonth){
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
                    if($('.selectDay').eq(i).text().length<2){
                        strDay = "0"+$('.selectDay').eq(i).text();
                    }else { 
                        strDay = $('.selectDay').eq(i).text();
                    }
                    
                    array[i] = year+strMonth1+strDay;
                    if(($('.selectDay').eq(i).text())==prepareEndDay){
                        i++;
                        break;
                    }
                    i++;
                }
                while(true){
                    if($('.selectDay').eq(i).text().length<2){
                        strDay = "0"+$('.selectDay').eq(i).text();
                    }else { 
                        strDay = $('.selectDay').eq(i).text();
                    }
                    
                    array[i] = year+strMonth2+strDay;
                    if(($('.selectDay').eq(i).text())==clickEndDay){
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
                    if($('.selectDay').eq(i).text().length<2){
                        strDay = "0"+$('.selectDay').eq(i).text();
                    }else { 
                        strDay = $('.selectDay').eq(i).text();
                    }
                    array[i] = year+strMonth+strDay;
                }
            }
            console.log(array);
        });
    });
    </script>
</body>
</html>