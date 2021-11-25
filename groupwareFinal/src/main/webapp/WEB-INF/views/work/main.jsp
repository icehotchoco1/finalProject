<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />

<c:set var="jobList" value="${jobList.jobList }" />
<c:set var="jobRecList" value="${jobRecList.jobRecList }" />
<c:set var="jobWaitList" value="${jobWaitList.jobWaitList }" />
<c:set var="jobSendList" value="${jobSendList.jobSendList }" />
<c:set var="jobComList" value="${jobComList.jobComList }" />

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="YYYY" />
</c:set>
<c:set var="sysMonth">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board/notice.css">
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
<style>
	.row{
		border: 1px solid black;
	}
	.info-boxa{
		background-color:black;
	}
	
</style>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<p class="menu-header">
						<span id=attcolor>${loginUser.nm}</span>님의 업무
					</p>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	
	<!-- 정보차트 -->
	<div class="row">
	
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
				<span style="font-weight:bold; text-align:center; background:tan; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;">받은 업무</span>
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:30%;">제목</th>
							<th style="width:12%;">지시자</th>
							<th style="width:20%;">업무기한</th>
							<th style="width:40%;">업무 진척도</th>
						</tr>
						<c:if test="${empty jobRecList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${jobRecList}" var="job" varStatus="Ast" begin="0" end="2">
							<tr style='font-size:0.85em;'>
								<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);"
								 style='padding-right:0.25em; padding-left:0.25em;'>
								<span class="col-sm-12">${job.sj}</span>
								</td>
								<td data-target="send-writer" style='padding-right:0.25em; padding-left:0.25em;'>${job.emp_nm}</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
								</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'>
								<canvas id="AprogrsChart${Ast.count }" width="40" height="7"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>=0 && ${job.rcver_progrs}<21){
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
								
								var Actx${Ast.count } = document.getElementById("AprogrsChart${Ast.count }");
								var AprogrsChart = new Chart(Actx${Ast.count },{	//차트 선언
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
													steps:10
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
									    },
									}
								});

								</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<span style="font-weight:bold; text-align:center; background:thistle; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;">지시 업무</span>
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:30%;">제목</th>
							<th style="width:12%;">지시자</th>
							<th style="width:20%;">업무기한</th>
							<th style="width:40%;">업무 진척도</th>
						</tr>
						<c:if test="${empty jobSendList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${jobSendList}" var="job" varStatus="Bst" begin="0" end="2">
							<tr style='font-size:0.85em;'>
								<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);"
								style='padding-right:0.25em; padding-left:0.25em;'>
								<span class="col-sm-12" >${job.sj}</span>
								</td>
								<td data-target="send-writer" style='padding-right:0.25em; padding-left:0.25em;'>${job.emp_nm}</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
								</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'>
								<canvas id="BprogrsChart${Bst.count }" width="40" height="7"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>=0 && ${job.rcver_progrs}<21){
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
								
								var Bctx${Bst.count } = document.getElementById("BprogrsChart${Bst.count }");
								var BprogrsChart = new Chart(Bctx${Bst.count },{	//차트 선언
									type: 'horizontalBar',  //차트타입
									data: {	//차트 데이터 object 배열
										datasets: [{//데이터 object 배열
											data: [${job.rcver_progrs}],	//데이터 넣는 곳
											backgroundColor: backgroundcolor,
											borderColor: bordercolor,
											borderWidth: 1,
										}]
									},
									options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
										indexAxis: 'y',
										scales:{
											xAxes:[{
												ticks:{
													beginAtZero:true,
													max:100,
													steps:10
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
									    },
									}
								});

								</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<div class="row">
	
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
				<span style="font-weight:bold; text-align:center; background:sandybrown; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;">대기 업무</span>
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:30%;">제목</th>
							<th style="width:12%;">지시자</th>
							<th style="width:20%;">업무기한</th>
							<th style="width:40%;">업무 진척도</th>
						</tr>
						<c:if test="${empty jobWaitList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${jobWaitList}" var="job" varStatus="Cst" begin="0" end="2">
							<tr style='font-size:0.85em;' style='padding-right:0.25em; padding-left:0.25em;'>
								<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);"
								 style='padding-right:0.25em; padding-left:0.25em;'>
								<span class="col-sm-12">${job.sj}</span>
								</td>
								<td data-target="send-writer" style='padding-right:0.25em; padding-left:0.25em;'>${job.emp_nm}</td>
								<td><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
								</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'>
								<canvas id="CprogrsChart${Cst.count }" width="40" height="7"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>=0 && ${job.rcver_progrs}<21){
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
								
								var Cctx${Cst.count } = document.getElementById("CprogrsChart${Cst.count }");
								var CprogrsChart = new Chart(Cctx${Cst.count },{	//차트 선언
									type: 'horizontalBar',  //차트타입
									data: {	//차트 데이터 object 배열
										datasets: [{//데이터 object 배열
											data: [${job.rcver_progrs}],	//데이터 넣는 곳
											backgroundColor: backgroundcolor,
											borderColor: bordercolor,
											borderWidth: 1,
										}]
									},
									options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
										indexAxis: 'y',
										scales:{
											xAxes:[{
												ticks:{
													beginAtZero:true,
													max:100,
													steps:10
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
									    },
									}
								});

								</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
				<span style="font-weight:bold; text-align:center; background:lightskyblue; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;">완료 업무</span>
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:30%;">제목</th>
							<th style="width:12%;">지시자</th>
							<th style="width:20%;">업무기한</th>
							<th style="width:40%;">업무 진척도</th>
						</tr>
						<c:if test="${empty jobComList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${jobComList}" var="job" varStatus="Dst" begin="0" end="2">
							<tr style='font-size:0.85em;'>
								<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);"
								 style='padding-right:0.25em; padding-left:0.25em;'>
								<span class="col-sm-12">${job.sj}</span>
								</td>
								<td data-target="send-writer" style='padding-right:0.25em; padding-left:0.25em;'>${job.emp_nm}</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
								</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'>
								<canvas id="DprogrsChart${Dst.count }" width="40" height="7"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>=0 && ${job.rcver_progrs}<21){
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
								
								var Dctx${Dst.count } = document.getElementById("DprogrsChart${Dst.count }");
								var DprogrsChart = new Chart(Dctx${Dst.count },{	//차트 선언
									type: 'horizontalBar',  //차트타입
									data: {	//차트 데이터 object 배열
										datasets: [{//데이터 object 배열
											data: [${job.rcver_progrs}],	//데이터 넣는 곳
											backgroundColor: backgroundcolor,
											borderColor: bordercolor,
											borderWidth: 1,
										}]
									},
									options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
										indexAxis: 'y',
										scales:{
											xAxes:[{
												ticks:{
													beginAtZero:true,
													max:100,
													steps:10
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
									    },
									}
								});

								</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
		
		<div class="col-md-12 col-12">
			<div class="info-box">
				<div class="info-box-content">
				<span style="font-weight:bold; text-align:center; background:lightsteelblue; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;">전체 업무</span>
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:10%;">지시자</th>
							<th style="width:25%;">업무기한</th>
							<th style="width:36%;">업무 진척도</th>
						</tr>
						<c:if test="${empty jobList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${jobList}" var="job" varStatus="Est" begin="0" end="4">
							<tr style='font-size:0.85em;'>
								<td>${fn:substring(job.job_no,4,1000000000)}</td>
								<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);"
								 style='padding-right:0.25em; padding-left:0.25em;'>
								<span class="col-sm-12">${job.sj}</span>
								</td>
								<td style='padding-right:0.25em; padding-left:0.25em;' data-target="send-writer">${job.emp_nm}</td>
								<td style='padding-right:0.25em; padding-left:0.25em;'><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" />
								</td>
								<td>
								<canvas id="EprogrsChart${Est.count }" width="10" height="1"></canvas>
								<script>
								var backgroundcolor = [];
								var bordercolor = [];
								if(${job.rcver_progrs}>=0 && ${job.rcver_progrs}<21){
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
								
								var Ectx${Est.count } = document.getElementById("EprogrsChart${Est.count }");
								var EprogrsChart = new Chart(Ectx${Est.count },{	//차트 선언
									type: 'horizontalBar',  //차트타입
									data: {	//차트 데이터 object 배열
										datasets: [{//데이터 object 배열
											data: [${job.rcver_progrs}],	//데이터 넣는 곳
											backgroundColor: backgroundcolor,
											borderColor: bordercolor,
											borderWidth: 1,
										}]
									},
									options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
										indexAxis: 'y',
										scales:{
											xAxes:[{
												ticks:{
													beginAtZero:true,
													max:100,
													steps:10
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
									    },
									}
								});

								</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
	</div>
				
</body>
