<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="icomlist" value="${dataMap.icomlist }" /> 
<c:set var="empInfo" value="${empInfo.empInfo }" /> 


<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/attendance/icommute.css">
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

#searchBtn {
	background: #004680;
	color: white;
	width: 90 px;
	padding: 8 px;
	border: 2 px solid #004680;
	border-radius: 0;
	height: 38 px;
	font-size: 14px;
	font-weight: bold;
}


</style>


</head>

<body>

<script>
window.onload=function(){
	
	<c:forEach items="${empInfo}" var="empInfo" varStatus="status">
	var show = '<div class="row"><div class="col-md-6">'+
				'<div class="col-md-6 info">사번: ${empInfo.empno}<br/>이름: ${empInfo.nm}<br/>부서: ${empInfo.dept_code}<br/>'+
				'직급: ${empInfo.clsf_code} </div></div> ';
		$('#abc${status.index}').append(show);
	</c:forEach>
}
</script>
<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">부서근태</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this"><span id=attcolor style="color:#48a2de ">${loginUser.nm}</span>님의 부서별 개인 출/퇴근현황</p>  				
	  			</div>
	  		
	  		</div>
	  	</div>
	</section>
	<section class="content-header1">
		<div class="container-fluid1">
			<div class="row md-2">
				
			</div>
		</div>
	</section>
	

	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
		
				<div id="keyword" class="card-tools" style="width: 1080px;">	
					<form name="search">
					<div class="input-group row" >
					<div class="col-md-6">
					
					</div>
					<div class="col-md-3">
					</div>
					 	<input type="date" class="form-control col-md-3"  name="startDate" id="startDate" >
					 	<span class="input-group-append">
							<button class="btn btn-basic" type="submit" id="searchBtn" data-card-widget="search" onclick="btnSearch()">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						</div>	
					</form>					
				</div>
			</div>
			
	<div class="card-body">

      

				<table class="table text-center">
					<tr style="font-size:0.95em;">
						<th style="width:20%;">이 름</th>
						<th style="width:20%;">부 서</th>
						<th style="width:15%;">직 급</th>
						<th style="width:15%;">출 근 시 간</th>
						<th style="width:15%;">퇴 근 시 간</th>
						<th style="width:15%;">상 태</th>
					</tr>	
					<c:if test="${empty icomlist }" >
						<tr>
							<td colspan="7">
							<br/><br/><br/><br/><br/>
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${icomlist }" var="icom">
						<tr style='font-size:0.85em;'>
							<td>${icom.nm }</td>
							<td>${icom.dept_code }</td>
							<td> ${icom.clsf_code }</td>
							<td> <fmt:formatDate value="${icom.attend_time }" pattern="yyyy:MM:dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${icom.lvffc_time }" pattern="yyyy:MM:dd HH:mm:ss"/></td>
							<td> ${icom.sttus_code }</td>
						</tr>
					</c:forEach>	
				</table>
			</div>
            
           </div> 
     </section>      
</body>

<script>
function btnSearch(){
    $('form[name="search"]').submit();
    alert(">>>>>");
}
</script>