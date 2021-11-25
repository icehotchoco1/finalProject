<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="YYYY" />
</c:set>
<c:set var="sysMonth">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<c:set var="pageMaker" value="${public_dataMap.pageMaker }" />
<c:set var="cri" value="${public_dataMap.pageMaker.cri }" />
<c:set var="dbxpublicList" value="${public_dataMap.dbxPublicList }" />


<c:set var="pageMaker2" value="${individual_dataMap.pageMaker }" />
<c:set var="cri2" value="${individual_dataMap.pageMaker.cri }" />
<c:set var="dbxList" value="${individual_dataMap.dbxList }" />
<%
session.setAttribute("path", request.getContextPath() + "/document");
%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
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
.table td {
  vertical-align: middle;
  padding: 10px;
}
.table th {
  padding: 10px;
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
</style>
</head>
<body>
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
			
				<div class="col-sm-6">
	  				<i class="fa fa-archive fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">문서함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">문서 홈</p>  				
	  			</div>
			
			</div>
		</div>
	</section>
	<br>
	
	<div class="row" style="margin: 0 10px;">
	 
	  <div style="margin-bottom: 10px;">
	  &nbsp;&nbsp;&nbsp;
	    <i class="fa fa-user fa-lg" aria-hidden="true"></i>
		<span class="p_title">개인 문서함</span>
	  </div>

			
		<div class="col-md-12 col-12 card">
			
			<div>
				<div class="info-box-content" style="height:250px; margin-top:10px;">
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:10%;">번 호</th>
							<th style="width:50%;">제 목</th>
							<th style="width:10%;">첨부파일</th>
							<th style="width:15%;">작성자</th>
							<th>등록일</th>
						</tr>
						<c:if test="${empty dbxList }" >
							<tr>
								<td colspan="5">
								<br/><br/><br/><br/>
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${dbxList}" var="dbx" end="4">
							<tr style='font-size:0.85em;'>
								<td>${fn:substring(dbx.dbx_no,4,1000000000) }</td>
								<td id="boardTitle" onclick="javascript:OpenWindow('individual/detail.do?dbx_no=${dbx.dbx_no}','상세보기',900,800);">
									<span class="col-sm-12">${dbx.sj}</span>
								</td>		
								<td>
								</td>
								<td data-target="dbx-emp_nm">${dbx.emp_nm}</td>
								<td>
									<fmt:formatDate value="${dbx.rgsde}" pattern="yyyy-MM-dd"/>
								</td>							
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	
	<br/>
	
	<div class="row" style="margin: 0 10px;">
	
	  <div style="margin-bottom: 10px;">
	  &nbsp;&nbsp;&nbsp;
	    <i class="fa fa-users fa-lg" aria-hidden="true"></i>
		<span class="p_title">공유 문서함</span>
	  </div>
			
		<div class="col-md-12 col-12 card">
			<div>
				<div class="info-box-content" style="height:250px; margin-top:10px;">
					<table class="table text-center" >
						<tr style="font-size:0.85em;">
							<th style="width:10%;">번 호</th>
							<th style="width:50%;">제 목</th>
							<th style="width:10%;">첨부파일</th>
							<th style="width:15%;">작성자</th>
							<th>등록일</th>
						</tr>
						<c:if test="${empty dbxpublicList }" >
							<tr>
								<td colspan="5">
								<br/><br/><br/><br/>
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${dbxpublicList}" var="dbxpublic" end="4">
							<tr style='font-size:0.85em;'>
								<td>${fn:substring(dbxpublic.dbx_no,4,1000000000) }</td>
								<td id="boardTitle" onclick="javascript:OpenWindow('public/detail.do?dbx_no=${dbxpublic.dbx_no}&from=list','상세보기',900,800);">
									<span class="col-sm-12">${dbxpublic.sj}</span>
								</td>		
								<td>
								</td>
								<td data-target="dbx-emp_nm">${dbxpublic.emp_nm}</td>
								<td>
									<fmt:formatDate value="${dbxpublic.rgsde}" pattern="yyyy-MM-dd"/>
								</td>							
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.info-box-content -->
				
				
			</div>
			<!-- /.info-box -->

		</div>
		
	</div>
		
<script>
function list_go3(page,url){
	if(!url) url="main.do";
	
	console.log("url22222222222222 : " + url);
	
	var jobForm=$('#basicForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	
	jobForm.attr({
		action:"main.do",
		method:'get'
	}).submit();
	
}
</script>		
</body>
