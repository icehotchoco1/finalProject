<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="YYYY" />
</c:set>
<c:set var="sysMonth">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<c:set var="deptVacList" value="${dataMap.deptVacList}"></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="deptLateList" value="${dataMap2.deptLateList}"></c:set>
<c:set var="pageMaker2" value="${dataMap2.pageMaker2 }" />
<c:set var="cri2" value="${dataMap2.pageMaker2.cri }" />
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
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<p class="menu-header">
						<span id=attcolor>ㅇ${loginUser.nm}</span>님의 <span id=attcolor>${sysYear}</span>년 <span>${sysMonth}</span>월 부서 근태 정보
					</p>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	
	<!-- 정보차트 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<div class="row">
	
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptChart");
					var deptChart = new Chart(ctx,{	//차트 선언
						type: 'bar',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["경리부","사업부","시설관리부","인사부","홍보부"],	//라벨 배열
							datasets: [{//데이터 object 배열
								label: '전사',
								data: [15, 15, 15, 15, 15],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)'
								],
								borderColor: [
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)'
								],
								borderWidth: 1
							},
							{	
								label: '부서',
								data: [12, 9, 13, 17, 16],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(255, 206, 86, 0.5)',
									'rgba(255, 206, 86, 0.5)',
									'rgba(255, 206, 86, 0.5)',
									'rgba(255, 206, 86, 0.5)',
									'rgba(255, 206, 86, 0.5)'
								],
								borderColor: [
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '부서별 근태 현황',
								fontSize: 18
							},
							layout:{
								padding:20
							},
							scales:{
								yAxes:[{
									ticks:{
										beginAtZero:true
									}
								}]
							}
						}
					});
						
					</script>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptMonthChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptMonthChart");
					var deptMonthChart = new Chart(ctx,{	//차트 선언
						type: 'doughnut',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["정상근무","지각","조퇴","결근"],	//라벨 배열
							datasets: [{	//데이터 object 배열
								label: '',
								data: [19, 10, 3, 5,],
								backgroundColor: [
									'rgba(11, 156, 49, 0.5)',
									'rgba(255, 206, 86, 0.5)',
									'rgba(255, 140, 0, 0.5)',
									'rgba(255, 99, 132, 0.5)'
								],
								borderColor: [
									'rgba(11, 156, 49, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 140, 0, 1)',
									'rgba(255, 99, 132, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '월별 부서 근태현황',
								fontSize: 18
							},
							layout:{
								padding:20
							}
						}
					});
						
					</script>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptYearChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptYearChart");
					var deptYearChart = new Chart(ctx,{	//차트 선언
						type: 'bar',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["1월","2월","2월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],	//라벨 배열
							datasets: [{//데이터 object 배열
								label: '월별 부서 근태 현황',
								data: [15, 18, 12, 7, 9, 10, 11, 15, 18, 12, 7, 9],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)',
									'rgba(54, 162, 235, 0.5)'
								],
								borderColor: [
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)'
								],
								borderWidth: 1
							},
							{	
								label: '전사 근태 현황',
								data: [12, 19, 3, 5, 2, 12, 19, 3, 5, 2, 12, 19],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(255, 99, 132, 0)'
								],
								borderColor: [
									'rgba(255, 99, 132, 1)'
								],
								borderWidth: 1,
								type:'line'
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '연도 부서 근태현황',
								fontSize: 18
							},
							layout:{
								padding:20
							},
							scales:{
								yAxes:[{
									ticks:{
										beginAtZero:true
									}
								}]
							}
						}
					});
						
					</script>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-6 col-12">
			<div class="gw-card">
			<div class="info-boxa">
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.85em;">
						<th style="width:30%;">휴가일자</th>
						<th style="width:20%;">휴가자</th>
						<th style="width:25%;">결재여부</th>
						<th style="width:25%;">휴가종류</th>
					</tr>
					<c:if test="${empty deptVacList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${deptVacList}" var="vac">
						<tr style='font-size:0.85em;'>
							<td>
							<fmt:formatDate value="${vac.sanctnVO.bgnde}" pattern="MM/dd"/>~<fmt:formatDate value="${vac.sanctnVO.endde}" pattern="MM/dd"/>
							</td>
							<td>
								${vac.empnm}
							</td>			
							<td>
								<c:choose>
									<c:when test="${vac.sanctnVO.sttus_code eq 'G001'}">
										대기
									</c:when>
									<c:when test="${vac.sanctnVO.sttus_code eq 'G002'}">
										진행
									</c:when>
									<c:when test="${vac.sanctnVO.sttus_code eq 'G003'}">
										반려
									</c:when>
									<c:when test="${vac.sanctnVO.sttus_code eq 'G004'}">
										임시저장
									</c:when>
									<c:when test="${vac.sanctnVO.sttus_code eq 'G005'}">
										완료
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${vac.vcatn_code eq 'VCDE1' or 
													vac.vcatn_code eq 'VCDE2' or 
													vac.vcatn_code eq 'VCDE3' or 
													vac.vcatn_code eq 'VCDE4' or 
													vac.vcatn_code eq 'VCDE5' or 
													vac.vcatn_code eq 'VCDE6' or 
													vac.vcatn_code eq 'VCDE7' or 
													vac.vcatn_code eq 'VCDE8' or 
													vac.vcatn_code eq 'VCDE9' or 
													vac.vcatn_code eq 'VCDE10' or 
													vac.vcatn_code eq 'VCDE11' or 
													vac.vcatn_code eq 'VCDE12' or 
													vac.vcatn_code eq 'VCDE13' or 
													vac.vcatn_code eq 'VCDE14' or 
													vac.vcatn_code eq 'VCDE15' or 
													vac.vcatn_code eq 'VCDE16' or 
													vac.vcatn_code eq 'VCDE17' or 
													vac.vcatn_code eq 'VCDE18' or 
													vac.vcatn_code eq 'VCDE19' or 
													vac.vcatn_code eq 'VCDE20' or 
													vac.vcatn_code eq 'VCDE20' or 
													vac.vcatn_code eq 'VCDE21' or 
													vac.vcatn_code eq 'VCDE22'}">
										연차
									</c:when>
									<c:when test="${vac.vcatn_code eq 'VCDE23'}">
										오전반차
									</c:when>
									<c:when test="${vac.vcatn_code eq 'VCDE24'}">
										오후반차
									</c:when>
									<c:when test="${vac.vcatn_code eq 'VCDE25'}">
										병가
									</c:when>
									<c:when test="${vac.vcatn_code eq 'VCDE26'}">
										공가
									</c:when>
									<c:when test="${vac.vcatn_code eq 'VCDE27'}">
										연차
									</c:when>
								</c:choose>
							</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
				
				
				
			</div>
			<!-- /.info-box -->
			</div>
		</div>
		
		<div class="col-md-6 col-12">
			<div class="info-boxa">
				
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.85em;">
						<th style="width:30%;">날  짜</th>
						<th style="width:20%;">이  름</th>
						<th style="width:25%;">직  급</th>
						<th style="width:25%;">사  유</th>
					</tr>			
					<c:if test="${empty deptLateList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${deptLateList}" var="late">
						<tr style='font-size:0.85em;'>
							<td>
							<fmt:formatDate value="${late.rgsde}" pattern="yyyy/MM/dd"/>
							</td>
							<td>
								${late.empVO.nm}
							</td>			
							<td>
								<c:choose>
									<c:when test="${late.empVO.clsf_code eq 'C001'}">
										사원
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C002'}">
										대리
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C003'}">
										기사
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C004'}">
										계장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C005'}">
										과장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C006'}">
										차장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C007'}">
										팀장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C008'}">
										부장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C009'}">
										이사
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C010'}">
										이사장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C011'}">
										사장
									</c:when>
									<c:when test="${late.empVO.clsf_code eq 'C012'}">
										회장
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${late.sttus_code eq 'F002'}">
										조퇴
									</c:when>
									<c:when test="${late.sttus_code eq 'F003'}">
										결근
									</c:when>
									<c:when test="${late.sttus_code eq 'F004'}">
										퇴근미입력
									</c:when>
									<c:when test="${late.sttus_code eq 'F005'}">
										지각
									</c:when>
								</c:choose>
							</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
				
				
				
			</div>
		
	</div>
</div>

</body>
