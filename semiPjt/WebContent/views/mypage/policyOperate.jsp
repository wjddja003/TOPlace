<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    #content_wraper{
        position: relative;
    }
    .heading_agree{
        padding: 0px 140px 16px 0px;
        position: relative;
    }
    .h_agree_section{
        display: inline-block;
        padding: 0px;
        font-size: 20px;
        color: #000;
    }
    .p_enforce_date{
        display: inline-block;
        margin-left: 8px;
        font-size: 14px;
        color: #656565;
        vertical-align: top;
    }
    .agree_wrap{
        border-top: 2px solid #656565;
        border-bottom: 1px solid #ccc;
        padding: 15px 0px 30px;
        margin-top: 0px;
        line-height: 26px;
    }
    .agree_wrap dl{
        padding: 10px 0px;
    }
    .agree_wrap dl dt{
        background-color: #183058;
        color: #fff;
        
    }
    .agree_wrap dl dd{
        margin-top: 10px;
        font-size: 16px;
        line-height: 27px;
    }
    ol{
        list-style: none;
    }
    .agree_wrap dl dd li ol{
        display: block;
        list-style: none;
        margin-left: 18px;
        margin-bottom: 10px;
        padding: 0px;
    }
    ul li{
        list-style: none;
    }
    .agree_wrap dl table td{
        border:1px solid #656565;
    }
    .agree_wrap dl table td.td_tit{
        color: #656565;
        border:1px solid #656565;
    }
    .agree_wrap dl table{
        width: 100%;
        margin: 10px 0px;
        border:1px solid #656565;
    }
 
</style>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"/>
  
<div id="content_wraper" role="main">
			<section class="section_content" style="padding:45px 50px 100px;">
				<div class="heading_agree">
					<h3 class="h_agree_section">운영정책</h3>
					<p class="p_enforce_date">시행일자 : 2019년 06월 13일</p>
				</div>
				<div class="agree_wrap">
					<dl>
						<dt class="blind">투플레이스 예약 및 환불 정책</dt>
						<dd> 본 정책은 투플레이스 게스트 이용약관에 따라 작성되었으며 본 정책에서 사용되는 용어의 정의는 투플레이스 게스트 이용약관과 동일합니다.</dd>
						<dt>1. 공간 예약</dt>
						<dd>
							공간 예약 방식에는 (i) 신청과 동시에 예약확정&amp;바로결제 유형, (ii) 호스트 예약 승인 후 결제 유형, (iii) 호스트 예약 승인 유형이 있습니다. 이 중 호스트 예약 승인 유형의 공간은 “회사”에서 게스트가 예약만 할 수 있도록 지원할 뿐이므로 대금 지불 등 구체적인 절차는 게스트회원이 해당 호스트회원과 직접 연락하여 처리하여야 하고, 본 정책이 적용되지 않습니다.
						</dd>
						<dt>2. 취소 수수료</dt>
						<dd>
							<ol>
								<li>A. 결제 취소 시 수수료는 취소 및 환불 신청기간, 신청자의 결제수단에 따라 아래와 같이 적용 됩니다. <br>
									<strong class="table_title">&lt;게스트의 결제 취소시 수수료&gt;</strong>
					 				<table>
										<caption class="">모임공간 취소시</caption>
										<colgroup>
											<col width="40%">
											<col width="15%">
											<col width="15%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<tbody>
										<tr>
											<td class="td_tit"></td>
											<td class="td_tit">결제 후 2시간 이내<br>(당일예약인 경우, 결제 후 2시간 이내 예약 시간 전까지) (a)</td>
											<td class="td_tit">공간 사용일 8일전까지(b)</td>
											<td class="td_tit">공간 사용일 7일전 ~<br> 공간 사용일 당일(c)</td>
											<td>비고</td>
										</tr>
										<tr>
											<td class="td_tit">신용카드</td>
											<td colspan="2">수수료 없음</td>
											<td rowspan="7">호스트가 정한 환불률(%)에 따른 부분환불</td>
											<td rowspan="7">결제당일 공간사용일로부터 8일 이내인 경우에는 그에 해당하는 취소수수료(c)가 부과됨</td>
										</tr>
										<tr>
											<td class="td_tit">실시간 계좌이체</td>
											<td> 결제 당일 수수료 없음, <br>결제 익일 수수료 발생 (1.98%)</td>
											<td> 1.98% (예약 취소 수수료)</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (신용카드)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (계좌이체)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (포인트)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (복합)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">크레딧</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										</tbody>
									</table>
									<br>
									<table>
										<caption class="">공유 오피스 취소시</caption>
										<colgroup>
											<col width="40%">
											<col width="15%">
											<col width="15%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<tbody>
										<tr>
											<td class="td_tit"></td>
											<td class="td_tit">결제 후 2시간 이내<br>(당일예약인 경우, 결제 후 2시간 이내 예약 시간 전까지) (a)</td>
											<td class="td_tit">공간 사용일 8일전까지(b)</td>
											<td class="td_tit">공간 사용일 7일전 ~<br> 공간 사용일 당일(c)</td>
											<td>비고</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (신용카드)</td>
											<td colspan="2">수수료 없음</td>
											<td rowspan="5">
												<strong>- 1일 단위 공간</strong><br>
												호스트가 직접 환불률을 지정<br><br>
												<strong>- 1개월 단위 공간</strong><br>
												8일 전 까지 100%<br>
												7 ~ 1일전까지 90% 환불<br>
												당일 0%
											</td>
											<td rowspan="5">결제당일 공간사용일로부터 8일 이내인 경우에는 그에 해당하는 취소수수료(c)가 부과됨</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (계좌이체)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (포인트)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">네이버페이 (복합)</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										<tr>
											<td class="td_tit">크레딧</td>
											<td colspan="2">수수료 없음</td>
										</tr>
										</tbody>
									</table>
									<ul>
										<li>- 호스트회원이 정한 환불률(%)은 개별 공간 예약시의 상세조건에서 안내됩니다.
											<ul>
												<li>* 네이버페이 복합결제 (카드+포인트, 계좌이체+포인트) 의 경우 주 결제수단(카드 또는 계좌이체)이 먼저 환불되며, 포인트가 차감됩니다.</li>
												<li>* 크레딧 복합결제 (크레딧+일반결제,크레딧+간편결제) 의 경우 주 결제수단(일반결제, 간편결제)이 먼저 환불되며, 크레딧이 차감됩니다.</li>
												<li>* 예를 들어 공간사용일이 2016년 4월 27일이고, 4월 19일에 실시간 계좌이체 방식으로 결제한 경우라면, 4월 19일에 취소하는 경우 1.98%, 4월 20일 이후 취소하는 경우 호스트가 정한 환불률에 따른 부분 환불이 됩니다.</li>
											</ul>
										</li>
										<li>- 실시간 계좌이체의 경우 은행별 전산시스템 초기화 시간에 따라, 23시 이후부터 결제 또는 취소가 안될 수 있습니다. 사전에 확인하고, 결제를 진행해주시길 부탁드립니다.</li>
									</ul>
								</li>
					
								<li>B. 게스트회원 또는 호스트회원의 귀책사유로 공간사용일에 공간을 정상적으로 사용하지 못한 경우 결제 취소 및 환불은 양 당사자의 합의에 따라 처리하며, “회사”는 관여하지 않습니다.</li>
								<li>C. 결제 후 2시간 이내에 결제를 취소하시는 건은 100% 환불 및 취소를 하고 있으나, 계좌이체의 경우 결제 당일이 지났을 경우에는, 예약 취소 수수료가 발생합니다. <br>단, 공간 사용일(시간)부터는 게스트 또는 호스트의 직접 예약 취소가 되지 않으므로, 양측 협의 후 투플레이스에 연락해주시길 바랍니다.</li>
								<li>D. 워크스페이스의 경우, 입실이 완료되면, 투플레이스의 중개자로서의 역할은 종료되며, 이용 중 중도 취소 또는 환불의 경우에는 양 당사자가 합의하여 처리해야합니다.</li>
								<li>E. 예약 변경
									<ul>
										<li>예약 변경 신청은 1회만 가능합니다. 예약변경 기능을 통하여, 예약변경이 성사된 경우 기존 예약은 취소됩니다. 변경된 예약에 대한 환불 기준(%)은 예약변경 요청시 지정된 호스트 환불율에 따라 진행됩니다. 이에 따라, 최초 예약시의 환불기준과 달라질 수 있습니다.</li>
									</ul>
								</li>
								<li>F. 변경 확정된 예약을 취소하실 경우에는 변경된 이용일을 기준으로 호스트가 지정한 환불율(E항목에서 확정된 환불율)에 따라 진행됩니다.</li>
								<li>G. 미성년자는 공간 예약 및 결제시에 법정대리인의 동의를 받아야 합니다. 미성년자가 법정대리인의 동의 없이 예약 및 결제를 했을 경우 예약은 전액 취소 됩니다. 그러나, 미성년자가 법정대리인으로부터 처분을 허락 받은 재산의 범위내인 경우 또는 미성년자가 법정대리인 또는 성년자 명의의 스마트 기기 또는 신용카드 등 결제 수단을 사용하여 결제한 경우와 같이 사술 등을 사용하여 성년자로 “회사”와 “호스트”가 믿게 한 때에는 결제의 취소는 제한 됩니다.</li>
							</ol>
						</dd>
						<dt>3. 최저결제금액</dt>
						<dd>
							<ol>
								<li>A. 투플레이스의 최저결제금액은 1,000원 입니다. 단, 부분 환불시 부분 환불 요율에 따라 1,000원 미만 500원 이상의 결제가 가능합니다.</li>
								<li>B. 5,000원 미만의 금액에 대해서는 전체 취소, 전체 환불만 가능합니다.</li>
							</ol>
						</dd>
						<dt>4. 결제수단별 환불방법 및 소요시간</dt>
						<dd>
							<ol>
								<li>A. 결제에 대한 취소 및 환불 신청은 마이페이지&gt;신청확정&gt;상세 예약내용에서 진행하실 수 있습니다.</li>
								<li>B.	체크카드 또는 신용카드로 결제한 경우 일반적으로 “회사”의 취소 처리가 완료되고 4~5 일 후 카드사의 취소가 확인됩니다. 이 때 결제 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가 있을 수 있습니다.</li>
								<li>C.	실시간계좌이체로 결제한 경우 일반적으로 “회사”의 취소 처리가 완료되고 PG사 처리 기준으로, 평일 기준 4~5일 이후 결제에 사용한 계좌로 입금됩니다. 이 때, 결제 취소 시점과 해당 은행사의 업무처리기간에 따라 다소 차이가 있을 수 있습니다.</li>
								<li>D.	간편결제로 결제하신 경우 “회사”의 취소 처리가 완료되고 PG사 처리 기준으로, 평일 기준 4~5일 이후 결제에 사용한 계좌,카드 또는 포인트로 입금됩니다. 이 때, 결제 취소 시점과 해당 은행사의 업무처리기간에 따라 다소 차이가 있을 수 있습니다.</li>
							</ol>
						</dd>
						<dt>5. 크레딧</dt>
						<dd>
							<ol>
								<li>1)	투플레이스 크레딧은, 공간사업을 위한 제휴, 투플레이스 이벤트를 통해 특정한 사람에게 지급되는, 가상화폐 입니다.</li>
								<li>2)	체크카드 또는 신용카드로 결제한 경우 일반적으로 “회사”의 취소 처리가 완료되고 4~5 일 후 카드사의 취소가 확인됩니다. 이 때 결제 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가 있을 수 있습니다.</li>
								<li>3)	실시간계좌이체로 결제한 경우 일반적으로 “회사”의 취소 처리가 완료되고 PG사 처리 기준으로, 평일 기준 4~5일 이후 결제에 사용한 계좌로 입금됩니다. 이 때, 결제 취소 시점과 해당 은행사의 업무처리기간에 따라 다소 차이가 있을 수 있습니다.</li>
								<li>4) 간편결제로 결제하신 경우 “회사”의 취소 처리가 완료되고 PG사 처리 기준으로, 평일 기준 4~5일 이후 결제에 사용한 계좌, 카드 또는 포인트로 입금됩니다. 이 때, 결제 취소 시점과 해당 은행사의 업무처리기간에 따라 다소 차이가 있을 수 있습니다.</li>
								<li>
									5) 크레딧의 소멸은 다음과 같습니다.
									<ol>
										<li>A. 크레딧의 유효기간이 경과하는 경우</li>
										<li>B. 투플레이스 이용계약 해지되었을 경우</li>
										<li>C. 그 밖에 투플레이스 운영팀에서 부정사용, 잘못된 지급 등을 확인하고 금액을 회수할 경우
											<ul>
												<li>부정사용 예시 : 지급된 본인이 아닌 타인이 사용하도록 ID를 양도한 경우, 크레딧으로 결제를 하고 해당 공간을 본인이 아닌 타인이 사용할 경우, 재화판매 시도 또는 적발시</li>
											</ul>
										</li>
									</ol>
								</li>
								<li>6) 크레딧의 유효기간은 발급일로부터 3개월 입니다.</li>
							</ol>
						</dd>
						<dt>6. 분쟁의 처리</dt>
						<dd>
							<ol>
								<li>1) 회사는 거래의 당사자가 아닌 예약 및 결제를 시스템으로서 제공하는 중개인으로서 분쟁상황 발생시 책임은 게스트와 호스트 양 당사자에게 있습니다. </li>
								<li>2) 회사는 시스템에 기록, 결제된 ‘공간 대관비’ 에 대해서만 환불, 취소와 같은 시스템적 도움을 제공하며, 그외에 부가적 비용(EX: 게스트의 이동비, 체류비, 강사초빙비, 공간의 물품파손 등)에 대해서는 책임을 지지 않습니다. 해당 비용에 대해서는 게스트와 호스트간 양자간 협의를 바탕으로 처리하여야 합니다. </li>
								<li>3) 게스트와 호스트간 문제가 없도록, 공간 이용전 사진, CCTV 등 영상자료 확보, 시설파손 등에 대한 계약을 따로 작성하시길 권유드립니다.</li>
								<li>4) 투플레이스에 있는 공간 사진은, 호스트 및 사진작가가 찍은 사진으로, 실제 공간 이용시 차이는 있을 수 있습니다. </li>
								<li>5) 기본적으로 양 당사자가 협의를 하는 것을 원칙으로하며, 법적 소송, 분쟁 등이 발생했을 경우 최종 결과에 대하여 다음과 같이 처리됩니다.
									<ul>
										<li> - 게스트 환불처리 및 호스트 미노출 처리
											<ul>
												<li>a) 투플레이스를 통해 결제된 내역에 대해서만 환불처리 및 공간 미노출 등 가능한 범위에서 진행하며, 추가적인 피해 보상은 따로 처리하셔야 합니다.</li>
												<li>b) 호스트의 공간 미노출은 사유 발생시 1회 1일 공간 미노출 / 2회 3일 공간 미노출 / 3회 영구 미노출로 진행됩니다.</li>
												<li>c) 이용에 문제가 있는 경우
													<ul>
														<li>- 사용인원이 시스템에 적혀있는 내용과 다를 때 </li>
														<li>- 실제 사용 공간 평수, 또는 이용면적이 다를 때 (50평 공간이라 적어두었으나, 실제는 15평 등으로 이용할 수 있는 면적이 다를 때)</li>
														<li>- 공간의 위생상태 불량(쓰레기, 악취), 소음, 시설에 문제가 있음을 게스트에게 호스트가 사전에 공지하지 않아 사용을 못하였을 때  또는 사진 또는 영상 등으로 그 상황을 확인 할 수 있는 경우 호스트의 환불 대상입니다</li>
														<li>- 호스트가 공간을 열어주지 않았거나, 연락이 되지 않아 공간이용을 하지 못하였을 때,이용완료 시점부터 5영업일 내로 연락하셔야 하며, 그 이후에는 처리해드리지 않습니다. 호스트는 투플레이스 확인 요청시 3영업일 이내로 답변하여야하며, 답변이 없을 경우 환불됩니다.</li>
													</ul>
													<ul>
														<li>c)의 경우 호스트가 최선을 다해, 그에 상응하는 수단을 준비하고, 게스트와 협의 및 공간이용이 되었을 때는 환불이 불가하거나 사용한 시간을 제외하고 환불이 될 수 있습니다.</li>
													</ul>
												</li>
												<li>d) 예약 중복으로 인하여 다른 공간을 소개 받은 경우. 기본적으로 환불 대상이나, 게스트와 호스트간 협의 후 다른 공간을 소개 받아 사용하신 경우에는 환불 대상이 되지 않습니다. </li>
												<li>e) 게스트가 이용 중 겪은 불편사항에 대해서 남긴 정당한(욕설 및 비꼼 등이 없는) 이용후기 및 점수에 대해 불만을 가지고, 게스트에게 연락하여 영업방해 등 고소행위를 통해 겁박한 경우 또는 게스트의 실명을 거론하여 개인정보를 노출시킨 경우</li>
											</ul>
										</li>
									</ul>
								</li>
								<li>6) 게스트 이용 정지
									<ul>
										<li>a) 불편사항을 과장, 허위로 이용후기로 남기거나, 처리를 요청하는 경우 사실 확인 후 이용후기 블락 및 게스트 ID 의 블락 처리 합니다.</li>
										<li>b) 호스트가 게스트의 불편사항을 즉시 확인하고 처리를 위해 최선을 다하고 (다른 공간 사용 및 재이용시 추가 사용 가능하도록 등) 현장에서 게스트와 협의가 되었으나, 투플레이스에 환불 등 처리를 요청한 경우, 블락 처리 합니다.</li>
										<li>c) 공간을 이용하고, 이용하지 않았다고 허위신고를 할 때 블락 처리 합니다.</li>
									</ul>
								</li>
								<li>7) 이용 후기
									<p>작성된 이용 후기에 대한 책임은 게스트와 호스트에게 있습니다.</p>
									<ul>
										<li>a) 이용후기 작성시 업로드 가능한 이미지는 공간 사진 및 이용한 공간과 관련된 사진(공간 내 소품 등)만 가능하며, 저작권 위반 및 공간과 관계없는 이미지(선정성, 광고, 공간 사진이 아닌 경우 등) 일 경우 통보 없이 운영진이 블락할 수 있습니다.</li>
										<li>b) 이용후기에 업로드 된 이미지에 인물이 있는 경우, 업로드 전 인물에 대한 허락을 받으시거나, 그렇지 않은 경우 모자이크 등 블러 처리를 해주시길 바랍니다.</li>
										<li>c) 이용 후기에 욕설이 있거나, 실명 또는 연락처 등으로 개인정보가 노출된 경우 통보 없이 블락됩니다.</li>
										<li>d) 이용후기에 대한 블락은 기본적으로 호스트와 게스트간 협의 또는 게스트의 요청이 있어야만 블락됩니다.</li>
									</ul>
								</li>
								<li>8) 영상정보처리기기 설치 및 운영
									<ul>
										<li>a) 투플레이스에 공간을 유통하는 운영자 (이하 호스트)의 경우 범죄 예방, 화재 예방, 고객 안전 및 시설 보호를 위하여 CCTV 및 영상 정보 처리 기기를 설치-운영할 수 있습니다.</li>
										<li>b) 위의 목적으로 영상정보처리기기를 설치 및 운영한 경우 아래의 내용을 반드시 공간 현장에 안내문으로 부착하여 고객이 인지하도록 하여야 합니다.
											<ul>
												<li>(1) 범죄 예방, 시설 보호, 화재 예방 등 안전의 목적으로 실내에 "CCTV가 설치되어 있는 사실 명기"</li>
												<li>(2) CCTV의 촬영 시간 명기</li>
												<li>(3) CCTV의 설치 장소, 설치 대수 표기</li>
												<li>(4) 실내의 경우 CCTV 카메라 위치 및 '촬영중 부착문' 표기 ( * 카메라 위장은 이용자에게 '불법 촬영'으로 판단될 수 있으므로 카메라 옆에 CCTV 촬영중 부착 필수)</li>
												<li>(5) CCTV 관리 책임자 및 연락처 표기</li>
												<li>(6) 영상물 보관기간, 보관장소 및 처리 방법 표기 (* 통상 공공기관 기준으로 30일 자동보관 후 폐기함을 명기하고 있습니다)</li>
												<li>(7) 투플레이스 온라인 예약 페이지에 CCTV 및 영상정보처리기기 설치 명기</li>
											</ul>
										</li>
										<li>c) 위 b번 사항의 (1)~(7)가이드에 준수 되지 않은 경우는 개인정보보호법 위반으로 투플레이스에서는 아래와 같은 서비스 제재가 이어집니다.
											<ul>
												<li>(1) 투플레이스에서 해당 공간 즉시 미노출 및 해당 업체 재등록 불가</li>
												<li>(2) 해당 게스트에 전액 환불 집행 (투플레이스 결제고객에 해당)</li>
												<li>(3) 해당 공간을 예약한 투플레이스 이용 예정자에게 위반 상황 통지 및 전액 환불 집행 (투플레이스 결제고객에 해당)</li>
											</ul>
										</li>
									</ul>
								</li>
							</ol>
						</dd>
						<dt>[부칙] (2019. 06. 13)</dt>
						<dd>(시행일) 본 정책은 2019년 06월 13일부터 시행합니다.</dd>
					</dl>
				</div>
			</section>
    </div>
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>