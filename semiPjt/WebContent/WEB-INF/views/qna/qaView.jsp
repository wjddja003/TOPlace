<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/qaview.css">
<title>Q&amp;A/리뷰</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:include page="/WEB-INF/common/header.jsp"/>
    <section>
        <div class="section_content">
            <div id="qa_view">
                <div id="rq">
                    <a href="/reviewList2">
                        <div class="review"><p style="line-height:70px">REVIEW</p></div>
                    </a>
                    <a href="/qaView">
                        <div class="qa"><p style="line-height:70px">Q＆A</p></div>
                    </a>
                </div>
                <c:forEach items="${pd.list }" var="q">
                	
                	<c:if test="${sessionScope.User.userId == q.qaCommentWriter}">
                <div class="qa_v">
              		
                    <div class="qa_no">
                    	<input type="hidden" class="qNoHidden" value="${q.qaCommentNo }">
                        <div class="comment">
                           	 <a href="/selectOneSpace?S_no=${q.qaRef}" style=color:#f69b02;font-size:14px;>공간명 : ${q.placeName }</a><br>
                            <textarea class="text" readonly="readonly">${q.qaCommentContent}</textarea><br>
                    	</div>
                        <div class="Q_btn">
                        <a class="qdate" style="color:#605f5d">${q.qaCommentDate }</a><br>
                            <button class="my_reviewBtn"style="color:#f69b02; border-color:#f69b02" ><a href="/qaCommentDelete?qaCommentNo=${q.qaCommentNo }"style="color:#f69b02">삭제</a></button>
                            <button onclick="updateFn(this);" class="my_reviewBtn qaupdate" style="color:#f69b02; border-color:#f69b02; margin-left:10px;" >수정</button>
                        </div>
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="qa_navi">${pd.pageNavi }</div>
            </div>
	<form method="post" id="qaUpdateForm2" action="/qaCommentUpdateEnd">
	    <div class="layer_popup_up"  style="display:none;position:fixed;">
	         <div class="popup_wrap">
	                <div class="pop_header">
	                   <input type="hidden" name="S_no" value="${s.s_no}">                    
	               <p>질문 작성하기</p>
	                    <button type="button" class="popcencleUp">X</a></button>
	                </div>
	            <div class="pop_container">
	                    <div class="box_l">
	                        <label for="input_update">질문수정</label>
	                    </div>
	                    <div class="box_r"><p id="textarea_update">0 /</p><p id="textarea_uplength">200자</p></div>
	                    
	                    <div class="qna_input">
	                    
	                  <textarea name="qaCommentContent" id="updateContent" maxlength="200"></textarea>
	                  <input type="hidden" name="qaCommentNo" id="updateCommentNo">
	               </div>
	            </div>
	          <div class="qna_p">
	          	<div class="view_warning_img">
	               <img src="../img/icon_warning.png"> <p>
	               		 질문은 공개 상태로만 등록하실 수 있습니다.
	                    </p>
	         	</div>
              </div>
	                <div class="qnaBtns">
	<!--                  <a href="javascript:void(0);" class="popcencle">닫기</a>-->
	                 <div id="qna_updateBtn">
	                  <button type="submit" class="poprollback">등록</button>
	                 </div>
	            </div>
	         </div>
	      </div>
	      </form>
	      <div class="hostpopupMaskUp">
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