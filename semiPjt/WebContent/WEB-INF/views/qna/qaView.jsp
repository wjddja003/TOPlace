<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
     #rq{
         font-size: 18px;
    	text-align: center;
        margin: 30px 0 0 0;
        width: 1000px;
        height: 70px;
        background: #e2e2e2;
    }
    
    .review{
      
        color: #183058;
        float: left;
        width: 50%;
        height: 70px;
    }
    .qa{
        background-color: #f69b02;
        color: #f7f7f7;
        float: left;
        width: 50%;
         height: 70px;
    }
    #qa_view{
        
        margin: 0 auto;
        width: 1000px;
    }
    .qa_v{
        text-align: center;
        width: 300px;
        margin: 50px 20px 0 0;
        padding: 10px;
        height: 100%;
        float: left;
    }
    .qa_no{
        padding: 10px;
        float: left;
        margin: 20px 0 0 20px;
        border: 1px solid #e2e2e2;
        width: 300px;
        height: 150px;
        overflow: hidden;
        position: relative;
        text-align: center;
    }
    .Q_btn{
        margin-left: 100px;
        position: absolute;
        bottom: 0;
    }
    .qa_navi{
    	clear: both;
    	text-align: center;
    }
    .reviewBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
    }
    #successBtn{
      outline: none;
      background:#f69b02;
      border-radius: 10px;
      width : 150px;
      height: 50px;
      border: 0px;
      color : white;
   }
   #cencelBtn{
      outline : none;
      background:#183058;
      width : 150px;
      height: 50px;
      border: 0px;
      color : white;
      border-radius: 10px;
   }
   .layer_popup {
      border-radius:10px;
      text-align: center;
      background:#fff;
       position: absolute;
       top: 30%;
       left: 45%;
       display: block;
       width: 500px;
       z-index: 150;
       margin-left: -145px;
       
   }
.layer_popup_up {
      border-radius:10px;
      text-align: center;
      background:#fff;
       position: absolute;
       top: 30%;
       left: 45%;
       display: block;
       width: 500px;
       z-index: 150;
       margin-left: -145px;
       
   }
   .pop_guide_txt{
      font-size: 18px;
   }
   .accent{
      color:#f69b02;
   }
   .qnaBtns{
        width: 500px;
        height: 50px;
        line-height: 47px;
   }
   .qnaBtns a:hover{
      text-decoration: none;
      color: #183058;
   }
   .hostpopupMask{
      top:0;
      left:0;
      z-index:99;
      position: fixed;
      width: 100%;
      height: 1000px;
      background-color: black;
      opacity: 0.6;
      display:none;
   }
.pop_header{
    padding: 10px 20px 0px 20px;
    width: 100%;
    height: 40px;
    background-color: #183058;
    border-radius: 10px 10px 0px 0px;
    color: #fff;
	}
	.pop_header p{
	    float: left;
	}
	.pop_header button{
	    float: right;
	    background: none;
	    border: none;
	    color: #fff;
	}
	.pop_container{
	    clear: both;
	    padding: 20px;
	}
	.box_l{
	    float: left;
	}
	.box_r{
	    float: right;
	    width: 100px;
	    display: inline;
	}
	.qna_input{
	    clear:both;
	}
	#input_question{
	    width: 460px;
	    height: 200px;
	    
	}
	#updateContent{
	    width: 460px;
	    height: 200px;
	    
	}
	#textarea_input{
	    float: left;
	}
	#textarea_update{
	    float: left;
	}
	.qna_p p{
	    color: red;
	    font-size: 14px;
	}
	#qna_abtn{
	    width: 100px;
	    background: #f69b02;
	    margin: 0 auto;
	    height: 45px;
	    border-radius: 15px;
	}
	#qna_updateBtn{
	     width: 100px;
	    background: #f69b02;
	    margin: 0 auto;
	    height: 45px;
	    border-radius: 15px;
	}
	.qnaBtns{
	     width: 100px;
	    background: #f69b02;
	    margin: 0 auto;
	    height: 45px;
	    border-radius: 15px;
	}
	.poprollback{
	    border: none;
	    background: none;
	    color: #fff;
	    
	}
	#pagination-wrap{
    min-width:20px;
    margin-top:580px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

	#pagination-wrap ul {
	    width:100%;
	}
	
	#pagination-wrap ul li{
	    margin: 0 4px;
	    display: inline-block;
	    width:5px;
	    height:5px;
	    border-radius:50%;
	    background:#fff;
	    opacity:0.5;
	    position:relative;
	    top:0;  
	}
	
	#pagination-wrap ul li.active{
	  width:12px;
	  height:12px;
	  top:3px;
	  opacity:1;
	  box-shadow:rgba(0,0,0,0.5) 1px 1px 0px; 
}
</style>
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
                           	 <a href="/selectOneSpace?S_no=${q.qaRef}">공간명 :${q.placeName }</a><br>
                            <span class="text">${q.qaCommentContent }</span><br>
                    	</div>
                        <div class="Q_btn">
                        ${q.qaCommentDate }<br>
                            <button class="reviewBtn"style="color:#f69b02; border-color:#f69b02" ><a href="/qaCommentDelete?qaCommentNo=${q.qaCommentNo }"style="color:#f69b02">삭제</a></button>
                            <button onclick="updateFn(this);" class="reviewBtn qaupdate" style="color:#f69b02; border-color:#f69b02" >수정</button>
                        </div>
                    </div>
                </div>
                	</c:if>
                </c:forEach>
               <div class="qa_navi">${pd.pageNavi }</div>
            </div>
	<form method="post" id="qaUpdateForm2" action="/qaCommentUpdateEnd">
	    <div class="layer_popup_up" class="_noProfileCheckLayout" style="display:none;position:fixed;">
	         <div class="popup_wrap">
	                <div class="pop_header">
	                   <input type="hidden" name="S_no" value="${s.s_no}">                    
	               <p>질문 작성하기</p>
	                    <button type="button" class="popcencleUP">X</button>
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
	               <img src="../img/icon_warning.png"> <p>
	                질문은 공개 상태로만 등록하실 수 있습니다.
	                    </p>
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
    	 var commentContent = $(content).parent().prev().find('span').text();
    	 var commentNo = $(content).parent().prev().prev().val();
    	
    	 $('#updateContent').text(commentContent);
    	 $('#updateCommentNo').val(commentNo);
     }
    </script>
</body>
</html>