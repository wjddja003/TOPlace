<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("UTF-8");  
	
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr");  //전체 도로명주소 
	String roadAddrPart1 = request.getParameter("roadAddrPart1");  //도로명주소(참고항목 제외)
	
	String engAddr = request.getParameter("engAddr");   //도로명주소(영문)
	String jibunAddr = request.getParameter("jibunAddr");  //지번 정보
	String zipNo = request.getParameter("zipNo");  //우편번호
	String addrDetail = request.getParameter("addrDetail");  // 고객 입력 상세 주소
	String admCd    = request.getParameter("admCd"); //행정구역코드
	String rnMgtSn = request.getParameter("rnMgtSn"); // 도로명코드
	String bdMgtSn  = request.getParameter("bdMgtSn");  //건물관리번호
	
	/** 2017년 2월 추가제공 **/
	String bdNm  = request.getParameter("bdNm"); //건물명
	String bdKdcd  = request.getParameter("bdKdcd"); //공동주택여부 (1:공동주택, 0: 비공동주택)
	String siNm  = request.getParameter("siNm"); //시도명
	String sggNm  = request.getParameter("sggNm"); //시군구명
	String emdNm  = request.getParameter("emdNm"); //읍면동명
	String liNm  = request.getParameter("liNm"); //법정리명
	String rn  = request.getParameter("rn"); //도로명
	String udrtYn  = request.getParameter("udrtYn");  //지하여부 (0:지상, 1:지하)
	String buldMnnm  = request.getParameter("buldMnnm"); //건물본번
	String buldSlno  = request.getParameter("buldSlno"); //건물부번 (부번이 없는 경우 0)
	String mtYn  = request.getParameter("mtYn"); //산여부 (0:대지, 1:산)
	String lnbrMnnm  = request.getParameter("lnbrMnnm"); //지번본번(번지)
	String lnbrSlno  = request.getParameter("lnbrSlno"); //지번부번(호) (부번이 없는 경우 0)
	/** 2017년 3월 추가제공 **/
	String emdNo  = request.getParameter("emdNo");//읍면동일련번호

%>
</head>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function init(){
	var url = location.href;
	var confmKey = "U01TX0FVVEgyMDE5MDUyMjIzNTQ0MTEwODc0NzY="; // 내승인키
	var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn = "<%=inputYn%>";

	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		//document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		opener.$("#addrNum").val("<%=zipNo%>");
		opener.$("#address").val("<%=roadFullAddr%>"
				,"<%=roadAddrPart1%>"
				,"<%=addrDetail%>"
				,"<%=engAddr%>"
				,"<%=jibunAddr%>"
				,"<%=zipNo%>"
				, "<%=admCd%>"
				, "<%=rnMgtSn%>"
				, "<%=bdMgtSn%>"
				, "<%=bdNm%>"
				, "<%=bdKdcd%>"
				, "<%=siNm%>"
				, "<%=sggNm%>"
				, "<%=emdNm%>"
				, "<%=liNm%>"
				, "<%=rn%>"
				, "<%=udrtYn%>"
				, "<%=buldMnnm%>"
				, "<%=buldSlno%>"
				, "<%=mtYn%>"
				, "<%=lnbrMnnm%>"
				, "<%=lnbrSlno%>"
				, "<%=emdNo%>");
		window.close();
		}

	
	
	
	
	
	
}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
		<div id="list"></div>
		
</form>





</body>
</html>