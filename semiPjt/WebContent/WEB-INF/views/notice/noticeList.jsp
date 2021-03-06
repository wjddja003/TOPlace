<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
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
    #notice_search{
       width:900px;
    }
    .table-wrapper{
       margin-top:250px;
    }
    .nc_tr{
        visibility: collapse;
    }
    .d_img{
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
         text-align: center;;
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
          .table_toggle tbody tr td{
        	padding: 20px;
        }
    #nlist{
        background-color: #183058;
        color: #f7f7f7;
    }
    .noticeBtn{
        background: #fff;
        border: 1px solid #f69b02;
        font-size: 12px;
        margin: 0 0 5px 0;
        float: right;
        width: 50px;
        height: 30px;
        color:#f69b02; 
        border-color:#f69b02;
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
</style>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<div id="deleteMsg"></div>
	<section>
    <div class="section_content">
            <div class="box_search">
                <div>
                    <label style="font-weight:bold">공지사항 검색</label>
                </div>
                <div>
                    <form action="/searchKeyword">
                        <input type="text" placeholder="     검색어를 입력해주세요."style="height:49px" id="notice_search" name="keyword">
                        <button type="submit" class="searchbtn">검색</button>
                    </form>
                </div>
            </div>

         <div class="table-wrapper">
            <table class="table_toggle">
                <tr>
                    <th colspan="5" style="font-size:20px; font-weight:bold" id="nlist">공지사항</th>
                </tr>
                <tr>
                    <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
                </tr>
                
                <c:forEach items="${pd.list }" var="n">
               		<tr class="n_tr">
	                    <td>${n.noticeNo }</td>
	                    <td>${n.noticeTitle }</td>
	                    <td>${n.noticeWriter }</td>
	                    <td>${n.noticeDate }</td>
                        <td><img src="/img/chevrondown.png" class="d_img"></td>
                    </tr>
					<tr class="nc_tr">
						<td colspan="5">
						
							
							${n.noticeContent }
							<c:if test="${sessionScope.User.userGrade == '관리자'}">
								<input type="hidden" value="${n.noticeNo }">
                                <button type="button" id="noticeDeleteBtn" class="noticeBtn" style="margin: 0 0 5px 5px;">삭제</button>
                                <button type="button" class="noticeBtn"><a href="/noticeUpdate?noticeNo=${n.noticeNo }"style="color:#f69b02">수정</a></button>
							</c:if>
							
								
							
							<br>
							<c:if test="${n.filename != null }">
								<img src="/upload/notice/${n.filename }">
							</c:if>
						</td>
					</tr>
                </c:forEach>
            </table>
            <div style="text-align:center;">${pd.pageNavi }</div>
            <div>
            	<c:if test="${sessionScope.User.userGrade == '관리자'}">
                	<button class="noticeBtn"style="color:#f69b02; border-color:#f69b02"><a href="/noticeWrite" style="color:#f69b02">글쓰기</a></button>
                </c:if>
            </div>
        </div>
    </div>
	</section>
	<script>
        var count = 0;
		$(".n_tr").click(function(){
            var status =  $(this).next().css("visibility");
            if(status == 'collapse'){
                $(this).next().css("visibility","visible");
                $(this).children().find('img').attr("src","/img/chevronup.png");
            } else{
                $(this).next().css("visibility","collapse");
                $(this).children().find('img').attr("src","/img/chevrondown.png");
            }
        });
		$('#noticeDeleteBtn').click(function(){
			var noticeNo = $(this).prev().val();
			$.ajax({
				type:"GET",
				url: "/noticeDelete?noticeNo="+noticeNo,
				success : function(data){
					var result = data;
					if(result == 1){
						alert("공지사항 삭제 완료");
						location.reload();
					}else{
						$("#DeleteMsg").text("공지사항 삭제 실패");
				        $("#DeleteMsg").slideDown(700);
				        $("#DeleteMsg").delay(1300);
				        $("#DeleteMsg").slideUp(700);
					}
				}
			});
		});
	</script>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
