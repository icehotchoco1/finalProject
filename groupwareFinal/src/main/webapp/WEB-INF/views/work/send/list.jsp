<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="jobSendList" value="${dataMap.jobSendList }" />

<%session.setAttribute("path", request.getContextPath() + "/work/send"); %>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>

<style>
.p_title {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
  margin-left: 5px;
}
p {
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 13px;
	font-weight: bold;
}
td {
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  font-size: 13px;
}
th {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
}
select>option, button{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
.form-control{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
</style>
</head>

<title>지시 업무</title>
<body>

	<c:if test="${from eq 'regist'}">
		<script>
         alert('지시 업무 글 등록이 성공했습니다');
         window.opener.location.reload();
         window.close();
      </script>
	</c:if>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
					<p class="menu-header">지시 업무</p>
					<p class="menu-header">></p>
					<p class="menu-header this">지시 업무</p>
				</div>

			</div>
		</div>
	</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<!-- Main content -->
	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-basic" id="registBtn"
					onclick="OpenWindow('send/registForm.do','지시업무 등록',920,900);">등록</button>
				<div id="keyword" class="card-tools" style="width: 540px;">
					<div class="input-group row">
						<input type="hidden" name="perPageNum" id="perPageNum" value="10">
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
						</select>
						<select class="form-control col-md-3" name="imcode" id="imcode">
							<option value="" ${cri.imcode eq '' ? 'selected':'' }>중요도</option>
							<option value="H003" ${cri.imcode eq 'H003' ? 'selected':'' }>낮음</option>
							<option value="H001" ${cri.imcode eq 'H001' ? 'selected':'' }>보통</option>
							<option value="H002" ${cri.imcode eq 'H002' ? 'selected':'' }>긴급</option>
						</select>
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go4(1,'send');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>			
				</div>
			</div>
			<div class="card-body">
				<table class="table text-center">
					<tr style="font-size: 0.95em;">
						<th style="width:5%;">상 태</th>
						<th style="width:38%;">제 목</th>
						<th style="width:8%;">중요도</th>
						<th style="width:7%;">담당자</th>
						<th style="width:8%;">업무기한</th>
						<th style="width:35% height:15%">진척도</th>
					</tr>
					<c:if test="${empty jobSendList }">
						<tr>
							<td colspan="6">
							<br><br><br><br><br><br><br><br><br><br>
							<strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${jobSendList}" var="job" varStatus="st">
						<tr style='font-size: 0.85em;'>
							<td id="sttus_code">
								<c:choose>
									<c:when test="${job.sttus_code eq 'J001'}">대기</c:when>
									<c:when test="${job.sttus_code eq 'J002'}">진행</c:when>
									<c:when test="${job.sttus_code eq 'J003'}">완료</c:when>
								</c:choose>
							</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',920,900);">
								<span class="col-sm-12">${job.sj}</span>
							</td>
							<td id="im_code">
								<c:choose>
									<c:when test="${job.im_code eq 'H001'}">낮음</c:when>
									<c:when test="${job.im_code eq 'H002'}"><p style="color:blue">보통</p></c:when>
									<c:when test="${job.im_code eq 'H004'}"><p style="color:red">긴급</p></c:when>
								</c:choose>
							</td>
							<td>
							<c:forEach items="${job.jrcvList}" var="jRcv">
								${jRcv.rcver_nm}<br>
							</c:forEach>
							</td>
							<td><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
							</td>
							<td>
							<canvas id="progrsChart${st.count}" width="50" height="5"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>0 && ${job.rcver_progrs}<21){
								   	backgroundcolor.push('rgba(207, 0, 15, 0.5)');
								   	bordercolor.push('rgba(207, 0, 15, 1)');
								} else if (${job.rcver_progrs} >22 && ${job.rcver_progrs}<51){
								   	backgroundcolor.push('rgba(255, 203, 5, 0.5)');
								   	bordercolor.push('rgba(255, 203, 5, 1)');
								} else if (${job.rcver_progrs}>52 && ${job.rcver_progrs} <100){
									backgroundcolor.push('rgb(211, 84, 0, 0.5)');
									bordercolor.push('rgba(211, 84, 0, 1)');
								} else if (${job.rcver_progrs} ==100){
									backgroundcolor.push('rgba(54, 162, 235, 0.5)');
									bordercolor.push('rgba(54, 162, 235, 1)');
								}
								
								
								var ctx${st.count} = document.getElementById("progrsChart${st.count}");
								var progrsChart = new Chart(ctx${st.count},{	//차트 선언
									type: 'horizontalBar',  //차트타입
									data: {	//차트 데이터 object 배열
										datasets: [{//데이터 object 배열
											data: [${job.rcver_progrs}],	//데이터 넣는 곳
											backgroundColor: backgroundcolor,
											borderColor: bordercolor,
											borderWidth: 2,
										}]
									},
									options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
										indexAxis: 'y',
										scales:{
											xAxes:[{
												ticks:{
													beginAtZero:true,
													max:100,
													steps:3
												}
											}]
										},
										elements: {
										    bar: {
										    	borderWidth: 2,
										    }
										}, 
									   	legend: {
									    	display: false
									    },
										responsive: true,
									    plugins: {
									      legend: {
									        position: 'right'
									      }
									    }
									}
								});
								
								</script>
							</td>		
						</tr>
					</c:forEach>
				</table>
			</div>
			<br><br><br><br><br>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/work-pagination.jsp" %>	
					</ul>
				</nav>
			</div>

		</div>

	</section>
	<!-- /.content -->
<script>
function list_go4(page,url){
	if(!url) url="work/send/list.do";
	
	console.log("url : " + url);
	
	var workForm=$('#workForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	workForm.find("[name='page']").val(page);
	workForm.find("[name='perPageNum']").val($('input[name="perPageNum"]').val());
	workForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	workForm.find("[name='imcode']").val($('select[name="imcode"]').val());
	workForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	workForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

</script>
</body>
</html>