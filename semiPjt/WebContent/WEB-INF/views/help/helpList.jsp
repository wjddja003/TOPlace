<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
    
    .box_search{
        position: absolute;
        top: 150px;
        width: 1160px;
        height: 140px;
      
/*        left: 191px;*/
        padding: 30px;
        border: 4px solid #f69b02;
        background: white;
    }
    
    .searchbtn{
        position: absolute;
        right: 30px;
        width: 134px;
        height: 50px;
        background-color: #f69b02;
        color: white;
        border:none;
        font-size: 20px;
        font-weight: bold;
        float: right;
       
    }
   
    #help_search{
        position: absolute;
        left: 360px;
        width: 600px;
        outline: none;
        border: 1px solid #e2e2e2;
    }
    #help_cat{
        height: 50px;
        width: 273px;
        outline: none;
        border-color: #e2e2e2;
        float: left;
    }
    #help_label{
        padding-left: 234px;
    }
        
    .table-wrapper{
        text-align: center;
        width: 1160px;
        margin: 0 auto;
   		margin-top: 250px;
    }
     .hc_tr{
        visibility: collapse;
    }
    .d1_img{
        width: 25px;
        height: 25px;
    }
    .btn1{
        float: right;
    }
    .table_toggle{
         margin-top: 60px;
         font-size:15px;
         width:100%;
    }
        .table_toggle tbody tr{
            height: 60px;
        }
        .table_toggle tbody tr:nth-child(2n+1){
            background-color: #f7f7f7;
        }
        .table_toggle>tbody>tr:first-child>td{
            border-top: 2px solid #656565;
        }
        .helpDeleteBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
        float: right;
        width: 50px;
        height: 30px;
        }
        .helpUpdateBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 5px 5px 0;
        float: right;
        width: 50px;
        height: 30px;
        }
        .helpInsertBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
        float: right;
        width: 50px;
        height: 30px;
        }
        #DeleteMsg{
	      width:100%;
	      height: 100px;
	      text-align: center;
	      letter-spacing: 8px;
	      word-spacing:15px;
	      background-color: #f69b02;
	      color:white;
	      font-size: 30px;
	      line-height: 100px;
	      display:none;
	      top:0px;
	      position:fixed;
	      z-index:99;
	   }
    }
    
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<div id="DeleteMsg"></div>
	<section>
        <div class="section_content">
        	
            <div class="box_search">
                <div>
                    <label style="font-weight:bold" >카테고리 선택</label>
                    <label style="font-weight:bold" id="help_label">도움말 검색</label>
                </div>
                <div>
                	<form action="/searchHKeyword">
	                    <select id="help_cat" name="type">
	                        <option value="all">전체</option>
	                        <option value="member">회원</option>
	                        <option value="pay">예약 및 결제</option>
	                        <option value="cancel">취소 및 환불</option>
	                        <option value="use">공간이용 및 후기</option>
	                        <option value="other">기타</option>
	                    </select>
	                    <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="help_search" name="keyword">
	                    <button type="submit" class="searchbtn">검색</button>
                    </form>
                </div>
            </div>
            <div class="table-wrapper">
                <table class="table_toggle">
                    <tr>
                        <th colspan="4" style="font-size:20px; font-weight:bold; color:#f7f7f7; background:#183058">도움말</th>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach items="${pd.list }" var="h">
                    <tr class="c_tr">
                        <td>${h.helpCategoryName }</td>
                        <td>${h.helpTitle }</td>
                        <td>${h.helpDate }</td>
                        <td><img src="/img/chevrondown.png" class="d1_img"></td>
                    </tr>
                        <tr class="hc_tr">
                            <td colspan="5">
                                ${h.helpContent }
                                <c:if test="${sessionScope.User.userGrade == '관리자'}">
                                <input type="hidden" value="${h.helpNo }">
                                <button type="button" class="helpDeleteBtn" style="color:#f69b02; border-color:#f69b02">삭제</button>
                                <button type="button" class="helpUpdateBtn" style="color:#f69b02; border-color:#f69b02"><a style="color:#f69b02;" href="/helpUpdate?helpNo=${h.helpNo }">수정</a></button>
                                </c:if>
                                <br>
                                <c:if test="${h.filename != null }">
                                    <img src="/upload/notice/${h.filename }">
                                </c:if>
                            </td>
                    </c:forEach>
                </table>
            <div>${pd.pageNavi }</div>
            <div>
				<c:if test="${sessionScope.User.userGrade == '관리자'}">
                	<button class="helpInsertBtn"  style="color:#f69b02; border-color:#f69b02"><a href="/helpWrite"style="color:#f69b02"> 글쓰기</a></button>
                </c:if>
            </div>
        </div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
		<script>
        var count = 0;
		$(".c_tr").click(function(){
            var status =  $(this).next().css("visibility");
            if(status == 'collapse'){
                $(this).next().css("visibility","visible");
                $(this).children().find('img').attr("src","/img/chevronup.png");
            } else{
                $(this).next().css("visibility","collapse");
                $(this).children().find('img').attr("src","/img/chevrondown.png");
            }
        });
		$('.helpDeleteBtn').click(function(){
			var helpNo = $(this).prev().val();
			console.log(helpNo);
			$.ajax({
				type:"GET",
				url: "/helpDelete?helpNo="+helpNo,
				success : function(data){
					var result = data;
					if(result == 1){
						alert("도움말 삭제 완료");
						location.reload();
					}else{
						$("#DeleteMsg").text("도움말 삭제 실패");
				        $("#DeleteMsg").slideDown(700);
				        $("#DeleteMsg").delay(1300);
				        $("#DeleteMsg").slideUp(700);
					}
				}
			});
		});
	</script>
</body>
</html>