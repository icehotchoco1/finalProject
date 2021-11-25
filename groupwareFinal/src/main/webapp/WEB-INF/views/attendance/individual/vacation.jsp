<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="vacList" value="${dataMap.vacList }" />
<%-- <c:set var="esc" value="${dataMap.vacList.sanctnVO }" /> --%>
<c:set var="totVacCnt" value="${totVacCnt }" />
<c:set var="totUsedVacDays" value="${totUsedVacDays }" />


<%
session.setAttribute("path", request.getContextPath() + "/attendance/vacation");
%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style>
.card-body{
	height:350px;
}

.card-header{
	margin-top:10px;
}

* {
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
}

</style>

</head>

<title>휴가 관리</title>


<body>
<script>
	function vacRegist(){
		
		var pop_title = "휴가신청";
		   
		var _width= '900';
		var _height = '960';
		
		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = Math.ceil(( window.screen.height - _height )/2); 
		
		
		var form = $('#vacForm');
		
		var sdate = $('#startDate').val();
		var edate = $('#endDate').val();
		
		
		if(sdate == "" || edate == ""){
			alert('휴가날짜를 입력해주세요');
			return;
		}		
		if(sdate > edate){
			alert("시작일이 종료일 이후입니다.")
			return;
		}
		
		window.open("",pop_title,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
		form=form.get(0);
		     form.target = pop_title;
		     form.method = 'POST';
		     form.action = "<%=request.getContextPath()%>/approval/ddbox/erf2regist.do";
		     form.submit();
	
	}
	
</script>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">근태</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header">개인근태</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">휴가 관리</p>  				
	  			</div>

	  		</div>
	  	</div>
	</section>
	 <br>
	 <br>
	 <!-- Main content -->
	<div class="row" style="font-weight: bold">
		<div class="col-md-5 col-12 card" style="padding:30px; margin-left:60px;">
			<header style="text-align:center;">
				<h4>
					연차
				</h4>
			</header>
<%-- 				<c:forEach items="${vacList}" var="vac" end="0"> --%>
				<br>
				<h5>
					총 휴가 일수 :	${totVacCnt }
				</h5>
				<h5>
					사용 휴가 일수 :	${totUsedVacDays}
				</h5>
<%-- 				<fmt:parseNumber var="i" type="number" value="${vac.tot_vcatn_daycnt}" /> --%>
<%-- 				<fmt:parseNumber var="j" type="number" value="${vac.use_vcatn_daycnt}" /> --%>
				<h5>남은 휴가 일수 :	<c:out value="${totVacCnt-totUsedVacDays}" />
								
				</h5>
<%-- 				</c:forEach> --%>
		</div>
		<div class="col-md-5 col-12 card" style="padding:30px; margin-left:60px;">
			<header>
				<h4 style="text-align:center;">
					휴가 신청
				</h4>
			</header>
			<br>
			<form id="vacForm" style="text-align:center;">
				<span>휴가 시작일 : &nbsp;&nbsp;</span><input style="width:150px" type="date" id="startDate" name="startDate"> <br><br>
				<span>휴가 종료일 : &nbsp;&nbsp;</span><input style="width:150px" type="date" id="endDate" name="endDate"> <br><br>
				<input type="hidden" name="rvac" value="${i - F}"/>
				<input type="button" style="width:200px;" id="button1" value="휴가 신청" onclick="javascript:vacRegist();">
			</form>
		</div>
	</div>
	
	<div class="col-md-12 col-12"style="text-align:center; background: #293648; color: white;">
		<span style="font-weight:bold; font-size:16px;">휴가 신청 내역</span>
	</div>
	<div class="row">
		<div class="col-md-12 col-12">
		    <section class="content">		
				<div class="gw-card">
					<div class="card-header with-border">
						<div id="keyword" class="card-tools" style="width: 540px;">
							<div class="input-group row">
								<input type="hidden" name="perPageNum" id="perPageNum" value="10">
								<c:forEach items="${codeList}" var="code">
								</c:forEach>
								<select class="form-control col-md-3" name="vcatn_code" id="vcatn_code">
									<option value="a" ${cri.vcatn_code eq 'a' ? 'selected':'' }>연차</option>
									<option value="b" ${cri.vcatn_code eq 'b' ? 'selected':'' }>오전 반차</option>
									<option value="c" ${cri.vcatn_code eq 'c' ? 'selected':'' }>오후 반차</option>
									<option value="d" ${cri.vcatn_code eq 'd' ? 'selected':'' }>병가</option>
									<option value="ab" ${cri.vcatn_code eq 'ab' ? 'selected':'' }>연차+오전반차</option>
									<option value="ac" ${cri.vcatn_code eq 'ac' ? 'selected':'' }>연차+오후반차</option>
									<option value="ad" ${cri.vcatn_code eq 'ad' ? 'selected':'' }>연차+병가</option>
									<option value="bc" ${cri.vcatn_code eq 'bc' ? 'selected':'' }>오전반차+오후반차</option>
									<option value="bd" ${cri.vcatn_code eq 'bd' ? 'selected':'' }>오전반차+병가</option>
									<option value="cd" ${cri.vcatn_code eq 'cd' ? 'selected':'' }>오후반차+병가</option>
									<option value="abc" ${cri.vcatn_code eq 'abc' ? 'selected':'' }>연차+오전반차+오후반차</option>
									<option value="bcd" ${cri.vcatn_code eq 'bcd' ? 'selected':'' }>오전반차+오후반차+병가</option>
									<option value="abcd" ${cri.vcatn_code eq 'abcd' ? 'selected':'' }>연차+오전반차+오후반차+병가</option>
								</select>
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
								<span class="input-group-append">
									<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go4(1,'vacation');">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>			
						</div>
					</div>
					<div class="card-body" style="height:550px;">
						<table class="table text-center" >					
							<tr style="font-size:0.95em;">
								<th style="width:15%;">휴가</th>
								<th style="width:45%;">제 목</th>
								<th style="width:10%;">시작일</th>
								<th style="width:10%;">종료일</th>
								<th style="width:10%;">결재상태</th>
								<th style="width:10%;">사용일수</th>
							</tr>			
							<c:if test="${empty vacList }" >
								<tr>
									<td colspan="5">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>	
							<c:forEach items="${vacList}" var="vac">
									<tr style='font-size:0.85em;'>
									<td>
										${vac.vcatn_code}
									</td>
									<td>
										${vac.sanctnVO.sj }
									</td>
									<td>
										<fmt:formatDate value="${vac.sanctnVO.bgnde }" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<fmt:formatDate value="${vac.sanctnVO.endde }" pattern="yyyy-MM-dd" />
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
										<fmt:parseNumber var="j" type="number" value="${vac.use_vcatn_daycnt}" />
										<c:set var="i" value="${j}"/>
										<c:choose>
											<c:when test="${i lt 1}">
												${vac.use_vcatn_daycnt}
											</c:when>
											<c:when test="${i ge 1}">
												${i}
											</c:when>
											<c:when test="${i eq 0}">
												0
											</c:when>
										</c:choose>
										
									</td>
								</tr>
							</c:forEach>
						</table>				
					</div>
					
					<div class="card-footer">
						<nav aria-label="pds list Navigation">
							<ul class="pagination justify-content-center m-0">
								<%@ include file="/WEB-INF/views/common/basic-pagination.jsp" %>	
							</ul>
						</nav>
					</div>
					
					
				
				</div>
			
		    </section>
	    </div>
    </div>
    <!-- /.content -->

<script>
function list_go3(page,url){
	if(!url) url="vac.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#basicForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>
</body>
</html>