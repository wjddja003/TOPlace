
<%@page import="space.model.vo.Space"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%
    ArrayList<Space> list = (ArrayList<Space>)request.getAttribute("list");
    
    %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>   
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=33qm1u5uje&submodules=geocoder"> //네이버 지도 스크립트
	</script>
	<script type="text/javascript" src="MarkerClustering.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
</head>
<body>
	<section>
		<div class="container" style="color: black;">
			<h1> 네이버 지도 API 클래스화 및  이미지 스와이프  </h1>
			<div id="map" style="width: 100%; height: 500px;"></div>	
	
		</div>
	</section>
	<style>
				.swiper-container {
                 	display: none;
                 }
                 .swiper-slide{
                 	    width: 369.4px;
    					margin-right: 10px;
                 }		
                 .testimg{
                 	width: 369.4px;
    				margin-left: 50px;
                     
                 }
                 
     </style>
	 <script> //네이버지도 script		
	 	
	 ///////////////////////////////////////이미지  여기다 이미지 DB 
		var img = {
			
		
		
			 }
			 
			 
	 ///////////////////////////////////////
		window.onload = function () { 
			
			 var htmlMarker1 = {
					 content:'<div onclick="markerClass(this);" class="test" style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(../img/cluster-marker-1.png);background-size:contain;"></div>',
				        size:N.Size(40, 40),
				        anchor: N.Point(20, 20)
				    },
				    htmlMarker2 = {
				        content: '<div  style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(../img/cluster-marker-2.png);background-size:contain;"></div>',
				        size: N.Size(40, 40),
				        anchor: N.Point(20, 20)
				    },
				    htmlMarker3 = {
				        content: '<div  style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(../img/cluster-marker-3.png);background-size:contain;"></div>',
				        size: N.Size(40, 40),
				        anchor: N.Point(20, 20)
				    },
				    htmlMarker4 = {
				        content: '<div  style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(../img/cluster-marker-4.png);background-size:contain;"></div>',
				        size: N.Size(40, 40),
				        anchor: N.Point(20, 20)
				    },
				    htmlMarker5 = {
				        content: '<div  style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(../img/cluster-marker-4.png);background-size:contain;"></div>',
				        size: N.Size(40, 40),
				        anchor: N.Point(20, 20)
				    };
			//var map = new naver.maps.Map('map');  기본적으로 여는방법 서울시청뜸
			
			 markers = [];
			 markers2 = [];
			 infoWindows = [];
			var infoWindow =new naver.maps.InfoWindow();	
///////// 여기에 DB 주소값 받아오고 주소를 변환 해줘야한다.		
			naver.maps.Service.geocode({
			
	        address: "서울특별시 영등포구 당산로 229 (당산동6가)"	
	    	}, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	         	result = response.result, // 검색 결과의 컨테이너
	            items = result.items; // 검색 결과의 배열       
				x = items[0].point.y; // x 좌표
				y = items[0].point.x; // y 좌표
	    		
				
/////좌표변환값 넣기 po
			 po = {
					"이ㅏㄴ우힌우린ㅇㄴ이ㅏ룬이라ㅜㄴㅇ" : [x,y], 
				
					
					
			};
			 var map = new naver.maps.Map('map',{  //학원기준
					center : new naver.maps.LatLng(x,y),//center 중심점 설정
					zoom : 15, 
					zoomControl : true,  //좌측 줌 왓다리 갓다리 해주는 줌 컨트롤
					zoomControlOptions:{
						position : naver.maps.Position.TOP_RIGHT,         //줌컨트롤의 위치
						style : naver.maps.ZoomControlStyle.SMALL  			//스타일 + - 만 나오는게 지도에대한 설정이었다 이말이야
						
					}
				})
				;
//마커삽입 및 정보창 for문				
			for (var i in po){
				 	marker = new naver.maps.Marker({  // 마커  
					position : new naver.maps.LatLng(po[i][0],po[i][1]),
					map : map,
					title : i,
					icon:{	
						//content 마커 text 화 
						 content:  '<div id="markers" style="width:100px;text-align:center;padding:10px; background-color: red; color: bule;  font-size:10px;">'+ i +'</div>',
						 size: new naver.maps.Size(22, 44),
					     anchor: new naver.maps.Point(70, 35),	    
					}
				});
				var infoWindow = new naver.maps.InfoWindow({  //마커정보창 
			        content: '<div style="width:150px;text-align:center;padding:10px;"><img src="https://biketago.com/img/p/102.jpg" style="width:150px;">'+ i +'</div>'
			        																	//이미지에 DB에서 가져온 이미지 를가져온다
			    });
				markers.push(marker);
				infoWindows.push(infoWindow);
			};
//			
			naver.maps.Event.addListener(map, 'idle', function() {
			    updateMarkers(map, markers);
			});
			function updateMarkers(map, markers) {
			    
			    var marker, position;

			    for (var i = 0; i < markers.length; i++) {

			        marker = markers[i]
			        position = marker;
					showMarker(map, marker);
			        
			    }
			}
			function showMarker(map, marker) {

			    if (marker.setMap()) return;
			    marker.setMap(map);
			}
			function hideMarker(map, marker) {

			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}
			function getClickHandler(seq) {
			    return function(e) {
			        var marker = markers[seq],
			            infoWindow = infoWindows[seq];

			        if (infoWindow.getMap()) {
			            infoWindow.close();
			        } else {
			            infoWindow.open(map, marker);
			            
			        }
			    }
			}	
			
			for (var i=0, ii=markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
			 var data = po;				
			 for (var i = 0, ii = data.length; i < ii; i++) {
		     var spot = data[i],
	         latlng = new naver.maps.LatLng(spot.grd_la, spot.grd_lo),
   	     	 marker = new naver.maps.Marker({
             position: latlng,
             draggable: true
      		  });
  		  markers2.push(marker);
			 }		
//마커클래스화			 
		 markerClustering = new MarkerClustering({ //마커 클래스화
		        minClusterSize: 2,
		        maxZoom: 1000,
		        map: map,
		        markers: markers,
		        disableClickZoom: true,
		        gridSize: 120,
		        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
		        indexGenerator: [10, 100, 200, 500, 1000],
		        stylingFunction: function(clusterMarker, count) {
		            $(clusterMarker.getElement()).find('div:first-child').text(count);
		            MarkerKey = Object.values($(clusterMarker.getElement()).find('div:first-child').text(count));                
		        },		       
		    });		
////슬라이드 	 
		 new Swiper('.swiper-container', {  
			slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 10, // 슬라이드간 간격
			slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
				// 그룹수가 맞지 않을 경우 빈칸으로 메우기
				// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,
			
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});			
	   });	
	}
//onload 끝
	 
//////////////////////////////////////////////////////////////클래스화 클릭햇을때
	function markerClass(arg){
		
			$('.test').css("background","url(../img/cluster-marker-1.png)");
			$('.test').css("backgroundSize","contain");
			arg.style.background = "url(../img/cluster-marker-4.png)";
			arg.style.backgroundSize = "contain";		
			var x = document.getElementById("swiper-container1");
			x.style.display = 'block';
			pokey = Object.keys(po); 	
			for (var i in pokey){	
			$(".swiper-wrapper").html($(".swiper-wrapper").html()+img[i]);			
			}		
	}
	
	
	
	</script>
	<div class="swiper-container" id="swiper-container1">
	<div class="swiper-wrapper">
			
	</div>
		<!-- 네비게이션 버튼 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	
		<!-- 스크롤바 -->
		<div class="swiper-scrollbar"></div>
	</div>	
</body>
</html>