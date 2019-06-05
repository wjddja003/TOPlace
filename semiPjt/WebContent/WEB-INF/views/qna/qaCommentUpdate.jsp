<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.model.vo.User" %>
    <%@ page import="qaSy.model.vo.QaComment" %>
    <%@ page import="space.model.vo.Space" %>
    <% 
    	User u = (User)session.getAttribute("User");
    	Space s = new Space();
    	QaComment q = (QaComment)request.getAttribute("qaComment");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#reservation_popupDiv {
   z-index: 99;
   top: 0px;
   position: absolute;
   background: white;
   width: 500px;
   border-radius: 15px;
   display: block;
   text-align: center;
}
#reservation_popupDiv_title {
   text-align: left;
   border-top-left-radius: 15px;
   border-top-right-radius: 15px;
   padding: 10px 10px 20px;
   background: #183058;
   height: 50px;
   font-size: 24px;
   color: white;
}
#reservation_popupDiv_content {
   border-bottom: 2px solid #183058;
   height: 100px;
   line-height: 100px;
   font-size: 24px;
}
.reservation_popupDiv_list {
   margin: 0 auto; 
   width : 80%;
   border-bottom: 1px solid #ccc;
   height: 50px;
   line-height: 50px;
   font-size: 16px;
}
   .pop_list_left {
   text-align: left;
   float: left;
}
.pop_list_right {
   text-align: right;
   float: right;
}
.reservation_popupDiv_info{
   border-top:2px solid #183058;
   clear: both;
   text-align: left;
}
.pop_list_info{
   margin-top:5px;
   margin-left:40px;
   color: red;
   font-size:10px;
   text-align: left;
}
#reservation_popup_footer {
   margin-bottom:30px;
}
.reservation_popCloseBtn{
   width: 120px;
   height: 50px;
   color:white;
   background: #183058;
   outline:none;
   border:none;
   border-radius: 10px;
}
</style>
</head>
<body>
	<section>
		<div class="section_content" style="margin: 0 auto;">
			<center>
			<form action="/qaCommentUpdateEnd" method="post">
				<input type="hidden" name="qaCommentNo" value="<%=q.getQaCommentNo() %>">
				<input type="hidden" name="qaCommentWriter" value="${sessionScope.User.userId }">
				<%-- <input type="hidden" name="qaRef" value="1"> --%>
	            <div id="reservation_popup_mask"></div>
	            <div id="reservation_popupDiv">
                <div id="reservation_popupDiv_title">
                  질문 작성하기 
                  
               </div>
                <a style="float:left">질문</a><br>
                <div>
                  <textarea style="height:115px;width:400px;" name="qaCommentContent"><%=q.getQaCommentContent() %></textarea>  
                </div>
               <br>
               <div class="reservation_popupDiv_info">
                  <div class="pop_list_info"><img src="../img/icon_warning.png" width="13px" height="13px">&nbsp;질문은 공개 상태로만 등록하실 수 있습니다.</div>
               </div>
               <br>
               <div id="reservation_popup_footer">
                  <button type="submit" class="reservation_popCloseBtn">등록</button>
               </div>
            </div>
			</form>
			</center>
		</div>
	</section>

</body>
</html>