<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<c:set var="dclzMonth" value="${dataMap.dclzMonth }" /> 
<c:set var="deptInfo" value="${deptInfo.deptInfo }" /> 
<c:set var="oneCha" value="${cha.oneCha.oneCha }" /> 
<c:set var="twoCha" value="${cha.twoCha.twoCha }" /> 
<c:set var="threeCha" value="${cha.threeCha.threeCha }" /> 
<c:set var="fourCha" value="${cha.fourCha.fourCha }" /> 
<c:set var="fiveCha" value="${cha.fiveCha.fiveCha }" /> 
<c:set var="tardy" value="${count.tardy.tardy }" /> 
<c:set var="earlyLeave" value="${count.earlyLeave.earlyLeave }" /> 
<c:set var="absenteeism" value="${count.absenteeism.absenteeism }" /> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/attendance/icommute.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


<style>
body {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  font-weight: bold;
}
.inpType {
  font-weight: bold;
  height: 28px;
}
.boxSearch {
  padding: 0;
}
.searchBox {
  margin: 0 auto;
}
.dd {
  padding: 15px;
}
button {
  border: 2px solid white;
}

td, th {
  border: 1px solid lightgrey;
}
.table td {
  vertical-align: middle;
}
.table th {
  vertical-align: middle;
  background: #EFEFEF;
  padding: 6px 12px;
}
.info {
  text-align: left;
}
.hover-tr:hover {
  background: #D1ECF2;
}
</style>
</head>
<body>
<script>
window.onload=function(){
	
	<c:forEach items="${deptInfo}" var="deptInfo" varStatus="status">
	var show = '<div class="row"><div class="col-md-6">'+
			   '<img src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${deptInfo.face_photo}" class="img-circle" alt="User Image" style="width:55px; height:55px; margin-top:5px;"></div>'+
				'<div class="col-md-6 info">사번: ${deptInfo.empno}<br/>이름: ${deptInfo.nm}<br/>부서: ${deptInfo.dept_code}<br/>'+
				'직급: ${deptInfo.clsf_code} </div></div> ';
		$('#abc${status.index}').append(show);
		console.log(show);
	</c:forEach>

	<c:forEach items="${oneCha}" var="oneCha" varStatus="status">
	var one = '${oneCha.one_h}시간 ${oneCha.one_m}분';
		$('#one_cha${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${twoCha}" var="twoCha" varStatus="status">
	var one = '${twoCha.two_h}시간 ${twoCha.two_m}분';
		$('#two_cha${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${threeCha}" var="threeCha" varStatus="status">
	var one = '${threeCha.three_h}시간 ${threeCha.three_m}분';
		$('#three_cha${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${fourCha}" var="fourCha" varStatus="status">
	var one = '${fourCha.four_h}시간 ${fourCha.four_m}분';
		$('#four_cha${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${fiveCha}" var="fiveCha" varStatus="status">
	var one = '${fiveCha.five_h}시간 ${fiveCha.five_m}분';
		$('#five_cha${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${tardy}" var="tardy" varStatus="status">
	var one = '${tardy.tardy}';
		$('#tardy${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${earlyLeave}" var="earlyLeave" varStatus="status">
	var one = '${earlyLeave.earlyLeave}';
		$('#earlyLeave${status.index}').append(one);
	</c:forEach>

	<c:forEach items="${absenteeism}" var="absenteeism" varStatus="status">
	var one = '${absenteeism.absenteeism}';
		$('#absenteeism${status.index}').append(one);
	</c:forEach>
}
</script>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<i class="fa fa-building fa-lg" aria-hidden="true"></i>
					<p class="menu-header"> 전사 출퇴근 현황</p> <span style="font-size:16px; color:#48a2de;">${sysYear}월</span>
				</div>
			</div>
		</div>
	</section>
	
	<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.95em;">
						<th>인적사항</th>
						<th style="width:13%;">이번달 <br/>총 누적시간</th>
						<th style="width:13%;">1주차</th>
						<th style="width:13%;">2주차</th>
						<th style="width:13%;">3주차</th>
						<th style="width:13%;">4주차</th>
						<th style="width:13%;">5주차</th>
					</tr>			
					
					<c:forEach items="${dclzMonth}" var="dclzMonth" varStatus="status">
					<tr class="hover-tr" >
					    <td id="abc${status.index }">
<!-- 						    <div class="row"> -->
<!-- 						      <div class="col-md-4"> -->
<!-- 						      	사진 -->
<!-- 						      </div> -->
<!-- 						      <div class="col-md-8"> -->
						      						    
<%-- 							    이름: <br/> --%>
<!-- 							    부서: <br/> -->
<!-- 							    직급:  -->
						      	
<!-- 						      </div> -->
<!-- 						    </div> -->
					    </td>
					    <td>
					    	총 ${dclzMonth.month_h}시간 ${dclzMonth.month_m}분 <br/><br/>
					    	<span id="tardy${status.index }" style="font-size:12px; color:orange;">지각:</span>
					    	<span id="earlyLeave${status.index }" style="font-size:12px; color:green;">조퇴: </span>
					    	<span id="absenteeism${status.index }" style="font-size:12px; color:tomato;">결근: </span>
					    </td>
					    <td id="one_cha${status.index }">
					    
					    </td>
					    <td id="two_cha${status.index }"></td>
					    <td id="three_cha${status.index }"></td>
					    <td id="four_cha${status.index }"></td>
					    <td id="five_cha${status.index }"></td>
					</tr>
					</c:forEach>
				</table>				
			</div>
              
</body>


</html>