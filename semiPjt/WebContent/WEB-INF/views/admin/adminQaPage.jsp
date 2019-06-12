<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/qaview.css">
<title>Insert title here</title>
</head>

<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                    <a href="/adminReviewPage">
                        <div class="review"><p style="line-height:70px">REVIEW</p></div>
                    </a>
                    <a href="/adminQaPage">
                        <div class="qa"><p style="line-height:70px">Q＆A</p></div>
                    </a>
                </div>
                <c:forEach items="${pd.list }" var="q">
                	<div class="qa_v">
              		
                    <div class="qa_no">
                    	<input type="hidden" class="qNoHidden" value="${q.qaCommentNo }">
                        <div class="comment">
                           	 <a href="/selectOneSpace?S_no=${q.qaRef}" style=color:#f69b02;font-size:14px;>공간명 : ${q.placeName }</a><br>
                            <textarea class="text" readonly="readonly">${q.qaCommentContent}</textarea><br>
                    	</div>
                        <div class="Q_btn" style="margin-left: 115px;">
                        <a class="qdate" style="color:#605f5d">${q.qaCommentDate }</a><br>
                            <button class="my_reviewBtn"style="color:#f69b02; border-color:#f69b02" ><a href="/qaCommentDelete?qaCommentNo=${q.qaCommentNo }"style="color:#f69b02">삭제</a></button>
                        </div>
                    </div>
                </div>
				</c:forEach>
                
               <div class="qa_navi">${pd.pageNavi }</div>
            </div>
    </section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script>
    $(".qaupdate").click(function(){
        $('.layer_popup_up').show();
        $('.hostpopupMaskUp').show();
     });
 	$(".popcencleUp").click(function(){
		$('.layer_popup_up').hide();
		$('.hostpopupMaskUp').hide();
	});
     function updateFn(content){
    	 var commentContent = $(content).parent().prev().find('textarea').text();
    	 var commentNo = $(content).parent().prev().prev().val();
    	
    	 $('#updateContent').text(commentContent);
    	 $('#updateCommentNo').val(commentNo);
     }
     $('#updateContent').keyup(function(){
         var upLength = $(this).val().length;
          var remain = 200 - $('#updateContent').val().length;
          $("#textarea_uplength").html(remain+"자");
          $("#textarea_update").html(upLength+" /");
      }); 
    </script>
</body>
</html>