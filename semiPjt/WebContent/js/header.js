$(document).ready(function(){
	
	 $(".search").click(function(){
     	$("#header-mypage").css("display","none");
         $("#header-search").toggle();
         
     });
     $(".mypage").click(function(){
     	$("#header-search").css("display","none");
         $("#header-mypage").css("display","block");
         
     });
     $(".back").click(function(){
     	$("#header-search").css("display","none");
     	$("#header-mypage").css("display","none");
     	
     });
     $(".login").click(function(){
    	location.href="/views/login.jsp"; 
     });
     
     $('section').click(function(){
    	 $("#header-search").css("display","none");
      	$("#header-mypage").css("display","none");
      
     });
});

