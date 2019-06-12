<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰작성페이지</title>
<style>
	.star_rating {font-size:0; letter-spacing:0px;}
        .star_rating a {
            font-size:22px;
            letter-spacing:0;
            display:inline-block;
            margin-left:5px;
            color:#ccc;
            text-decoration:none;
        }
        .star_rating a:first-child {margin-left:0;}
        .star_rating a.on {color:#f69b02;}
    /*star Fin*/
    table{
        margin-top: 100px;
    }
    table tr th{
        font-size: 16px;
        text-align: center;
    }
    #reviewWrite_tr{
/*
        border-bottom: 4px solid #f69b02;
        border-top: 4px solid #f69b02;
*/
        background: #f69b02;
        color: #fff;
        height: 80px;
        line-height: 55px;
        
    }
    input{
        border: 1px solid #eee;
        width: 500px;
    }
    #reviewWrite_btn{
        border-color: #f69b02;
        color: #f69b02;
    }
    textarea{
        height: 400px;
    }
    .reviewWrite_bg{
        background: url(../../../img/reviewWrite_bg.jpg)no-repeat center center;
        background-size: cover;
        width: 100%;
        height: 300px;
    }


</style>
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<section>
    <div class="reviewWrite_bg">
        
    </div>
		<div class="section_content">
			<form action="/insertReview" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${s.s_no}" name="reviewSno">
				<table class="table">
					<tr id="reviewWrite_tr">
						<th colspan="2" style="font-size:18px;">리뷰를 작성해주세요</th>
					</tr>
					<tr>
						<th>제목</th>
						<td>						
							<input type="text" name="reviewTitle">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
				
							<input type="text" name="reviewWriter" value="${sessionScope.User.userId}" readonly>
						</td>
					</tr>
					<tr>
						<th>업로드</th>
						<td>                           
							<input type="file" name="filename" onchange="loadImg(this)">      
						</td>
					</tr>
					<tr>
						<th>이미지보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="3" class="form-control" name="reviewContent"></textarea>
						</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>
							 <p class="star_rating">
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <a href="#">★</a>
						        <input type="hidden" class="star" name="reviewStar">
						    </p>

						</td>
					</tr>
					<tr>
						<th colspan="2">
							<button id="reviewWrite_btn" type="submit" class="btn btn-outline-primary">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</section>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
	<script>
		function loadImg(f){
			if(f.files.length!=0 && f.files[0]!=0){// f.files input창에서 선택한 파일들을 배열 형태로 가져옴 f.files[0]!=0 파일의 크기가 0이 아니면
				//js의 FileReader객체 -> 객체 내부의 result라는 속성에 파일 컨텐츠가 있음
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
				reader.onload=function(e){
					$("#img-view").attr('src',e.target.result);
				}
			}else{		//파일 올렸다가 지웠을 때
				$("#img-view").attr('src','');
			}
		}
	    $( ".star_rating a" ).click(function() {
	         $(this).parent().children("a").removeClass("on");
	         $(this).addClass("on").prevAll("a").addClass("on");
	         $(".star").val($('.on').length);
	         console.log($(".star").val());
	         return false;
	    });

	</script>
	</body>
</html>
