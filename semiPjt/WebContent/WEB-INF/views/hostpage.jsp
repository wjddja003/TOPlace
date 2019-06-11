<%@page import="space.model.vo.Space"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hostpage.model.vo.HostDataPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
 
<style>
	
    .hosh_mid{
        box-sizing:border-box;
        margin-left: 250px;            
    }
    .profile ul{
        list-style: none;
    }
    .profile{
        width: 30%;
        height: 90%;
        float: left;
    }
    .sp{         
       width: 70%;
       float: left;      
    }
    .more{
  	  	height: 3%;
   		width: 773px;
   		float: left;;
    }
    .space{      
        float: left;
        width: 773px;                   
   }
    .review{     
        float: left;
        width: 773px;        
        box-sizing: border-box;
    }
    .button{
        background-color: #f69b02;
        border-style: none;
        text-align: center;
        color: #f7f7f7;
        border-radius: 10px;
        width: 100px;
        height: 40px;
        margin-left: 16px;
        padding: 5px;		
    }	
    .deleteBtn{
      background-color: #f69b02;
        border-style: none;
        text-align: center;
        color: #f7f7f7;
        border-radius: 10px;
        width: 100px;
        height: 40px;
        margin-left: 15px;
        padding: 5px;
    }
    .imgs{
   		padding: 15px;    	       
    }
    .fixed{
    	box-sizing:border-box;
    	position: fixed;
     	top : 200px; 		
  		width: 18.3%;
        height: 25%;
        left: 300px;
        text-align: center;
    }
    .img1{
    	border-radius: 50%;
    	width: 150px;
    	height: 150px;
    			  		
    }
    .a{
    	float: left;
    	width: 30%;
    	margin-top: 53px;
    	margin-left: 9px;
    }
    #more-btn{
    	width: 100%;
    	background-color: #f69b02;
        border-style: none;
        color: #f7f7f7;
    	margin-top: 15px;
    	border-radius: 5px;
    }
    .reviewlist{
    	width:773px;   	
    	float: left;
    	text-align: left;   
    }
    .reviewimg{
    	border-radius: 50%;
    	width: 100px;
    	height: 100px;
    	float: left;
    	margin-top: 30px;  
    	background-color: ivory; 
    	background-size: cover;   	
    }
    .day{  
   		font-size: 11px;
   		text-align: -webkit-right;
    }
    .reviewComment{
 	   float: right;
	  
    }
    .reviewgo{
     	color: #f69b02;
    }
    .list{ 	
   		color: #f69b02;
   		font-size: 50px;
   	}
      .list2{
        color: #f69b02;   
        width: 34%;
        font-size: 50px;
  	}
    .comment{	
	    float: left;
	    width: 70%;
	    margin-top: -45px;
	    margin-left: 20px;
    }
    .QRAlist{  
      
        width: 773px;
       text-align: left;      
    }
    .QRAcomment{
       float: left;
        width: 70%;
        margin-left: 115px;
    }
    .navi{
		float: left;
	    width: 100%; 			  
	}
	.navi2{
		float: left;
	 	width: 80%;
		text-align: center;
	}
	.selectPage{
		font-size: 21px;
		color: blue;
	}.bot{
		float:right;
		margin-top: 50px;
	}
	.hostpage_DATE{	
	}
    .QRA_DATE{
    float: right;
    }
   .spspan{   
 	  color: #f69b02;
  	 }
  	 .QRA{
  	 margin-right: 3px;
  	 }
  	 
  	 .elist{ 	
   		color: #f69b02;
   		font-size: 50px;
   		text-align: center;
   		
   	}
   	.reviewName{
   		font-size: 25px;
   	}
   	.rlist{
   	 	color:#f69b02;  
   	 	  
   	}
   	.rlist:hover{
   		text-decoration: none;
  		color:#f69b02;
   	}
   	.rlistBtn{
   		width: 150px;
   		height: 50px;
   		font-size: 25px;
   		border:  1px solid #f69b02;
   		background: white;
   	}
   	.QRalspan{
   		font-size : 25px;
   		text-align: center;
   		margin-left: 30px;
   		
	}
	.pageBtn{
		color: #183058;
	}
	.selectPage{
		color: #f69b02;
		padding: 0 5px;
	}




   		
   	}
</style>


</head>
<body> 

<jsp:include page="/WEB-INF/common/header.jsp"/>   
	<section>
		<div class="section_content">
			<div class="hosh_mid" id="hosh_mid">               
                    <div class="profile">
                    	<div class="fixed">
	                        <span><img src="/upload/hostProfile/${sessionScope.host.hostFile}" class="img1"></span>
	                        <ul><h1>${sessionScope.host.hostName}</h1>
	                        <li>${sessionScope.host.hostContent}</li>		                         					
       						<button type="button" class="rlistBtn"><a href="/hostreservationList?hostNum=${sessionScope.host.hostNo}" class="rlist">예약 내역 </a></button>	       									       						             
	                        </ul>
                        </div>                        
                    </div>
                    <div class="sp"><h1> <span class="spspan">${sessionScope.host.hostName}</span>의공간 <span class="spspan">${hd.count}개 </span><h1></h1></div>
                    <div class="space"></div>
                    <div class="more"><button type="button" currentCount="0" totalCount='${totalCount}' id="more-btn" value="1">더보기</button></div> 
                 <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <br> <br><br> <br> <br>	       
                    <div class="review">
                    <div class="elist">     					
       				<div></div>      				
					</div>	
                    <div class="list">리뷰창<br></div>                
                    <c:forEach items="${hp.list}" var="hp" varStatus="i">
	                    	<div class=" reviewlist">	                    		
	                    		<div><span class="reviewName">${hp.reviewWriter}	                    		
	                    		 </span><a href="/selectOneSpace?S_no=${hp.reviewSno}"><img src="../../img/logo.png" class="reviewimg"></a>                  		 
	                    		 </div>
	                    		<br><br>
	                    		<div class="comment">${hp.reviewContent}</div>
	                    		<div class="bot">
			                    	<c:forEach items="${hd.list}" var="hd" varStatus="j">
			                    		<c:if test="${hp.reviewSno eq hd.s_no}">
				                    		<div class="day">${hd.s_placeName} </div>			                  					                 
				                    	</c:if>
				                    	
				                    </c:forEach>
								<div class="hostpage_DATE">${hp.reviewDate}</div>                           		
				                </div>   
	                         </div>           	
                    </c:forEach>
                    <div class="navi">${hp.pageNavi}</div>
                    </div>
                    
                    <div class="QRA">
		                <div class="list2">Q&amp;A<br></div>       	        
	               <c:forEach items="${Qalist}" var="Q">
	               	  
	               	   <c:if test="${Q.qaCommentRef eq 0}">     	                         	               			               
		                    <div class="QRAlist" id="${Q.qaCommentNo }">	                 
			                    <div><span class="QRalspan">작성자아디 :${Q.qaCommentWriter}</span></div>
			                    <div class="QRAcomment">글:  ${Q.qaCommentContent}</div>
				                    <c:forEach items="${hd.list}" var="l">
				                    	<c:if test="${l.s_no eq Q.qaRef}">
				                    		<div class="day">장소 :  ${l.s_placeName }</div>
				                    	</c:if>	                  
				                    </c:forEach>           		               
			                    <div class="QRA_DATE"> 날자 :${Q.qaCommentDate}</div>
			                    <br><br>		                    	 	               	
			               	</div>
						</c:if>
							<c:forEach items="${Qalist}" var="Qa">
								<c:if test="${Q.qaCommentNo == Qa.qaCommentRef}">		         	 
									<div>ㄴ 작성자 아이디 : ${Qa.qaCommentWriter }, 작성 내용 : ${Qa.qaCommentContent }</div>
								</c:if>
							</c:forEach>
		         	 	          		                        
                   </c:forEach>  
                   
                   	<div class="navi2">${hqa.pageNavi}</div>
                   	</div> 
                   	</div>                                   
	             </div>                                                                                
            </div>
		</div>
	</section> 
	<br><br><br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
	</body>
		<script type="text/javascript">
			//그 댓글의 글번호(아이디)
			function appendDiv(ref,writer,content){
				$("#"+ref ).append("<div> ㄴ 작성자아디 : "+writer+" 글 : "+content+"</div>");
			}
			function del(event){
				location.href="/deleteHostPage?s_no="+event;	
  				
			}
			
			$(document).ready(function () {
				
				fn_more(1);
				$("#more-btn").click(function () {
					console.log($(this).val());
					fn_more($(this).val());
				
				});
				
			});
			function fn_more(start) {
				var html = "";
				var param = {start:start};
				$.ajax({
					url:'/hostmore',
					data:param,
					type:"post",
					dataType:"json",
					success : function (data) { //포토객체 3개 받아올꺼니까 data 쓴다
						for (var i in data){		
						var p = data[i];
						//html += "<div class='a'><img src='/upload/space/"+p.S_img1+"' style='width: 250px; height: 130px;' class='imgs'>"; 
						html += "<div class='a'><a href='/selectOneSpace?S_no="+p.S_no+"'><img src='/upload/space/"+p.S_img1+"' style='width:250px; height: 200px;' class='imgs'></a>"; 
						html += "<button class='button' id='btn' value='z' onclick='selectOneSpace2("+p.S_no+")'>수정하기 </button>" ;
                  		html += "<button type='button' id='btn' class='deleteBtn' onclick='del("+p.S_no+")''> 삭제하기</button> </div>";
						
						}
						$(".space").append(html); //사진출력  
						//커런트값이랑 벨류값을 지정해줘야된다
						$("#more-btn").val(Number(start)+3);		//형변환으로 해야한다 문자로 인식해서 , value currentCount 셋팅값 변경
						$("#more-btn").attr("currentCount",Number($("#more-btn").attr("currentCount"))+3); 
						//얘도형변환  data.length 마지막 까지 가져온 경우 더보기 버튼 비활성화
						
						var totalCount = $("#more-btn").attr("totalCount");
						var currentCount = $("#more-btn").attr("currentCount");
					
						
							if(totalCount == currentCount){
							$("#more-btn").attr("disabled",true);
							$("#more-btn").css("cursor","not-allowed");
						console.log(totalCount);
						console.log(currentCount);
						}
					},
					error : function () {
						console.log("아잓처리 실패");
					}
					
				});
			}
			function selectOneSpace2(S_no){
				location.href='/selectOneSpace2?S_no='+S_no;
			}
			
			
			
		</script>
</html>