$(document).ready(function(){
	
	 $(".search").click(function(){
     	$("#header-mypage").css("display","none");
         $("#header-search").css("display","block");
         $('section').addClass("bgBlur");
     });
     $(".mypage").click(function(){
     	$("#header-search").css("display","none");
         $("#header-mypage").css("display","block");
         $('section').addClass("bgBlur");
     });
     $(".back").click(function(){
     	$("#header-search").css("display","none");
     	$("#header-mypage").css("display","none");
     	$('section').removeClass("bgBlur");
     });
     $(".login").click(function(){
    	location.href="/views/login.jsp"; 
     });
     
     $('section').click(function(){
    	 $("#header-search").css("display","none");
      	$("#header-mypage").css("display","none");
      	$('section').removeClass("bgBlur");
     });
});

