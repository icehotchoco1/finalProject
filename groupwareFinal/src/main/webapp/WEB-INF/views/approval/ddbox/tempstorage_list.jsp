<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="escMngtList" value="${dataMap.escMngtList }" />
<%
session.setAttribute("path", request.getContextPath() + "/approval/ddbox/tempstorage");
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
p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
}
p, a {
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
<style>
#removeBtn {
  border: 2px solid lightgrey;
  font-size: 10px;
  font-weight: bold;
  padding: 2px 5px;
}
.table td {
  vertical-align: middle;
}
</style>

</head>

<title>임시보관함</title>


<body>
	<c:if test="${from eq 'remove'}" >
    <script>
   		alert("삭제되었습니다.");
	</script>
   </c:if>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">결재</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header">기안함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">임시보관함</p>  					
	  			</div>

	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">		
		<div class="gw-card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:540px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="erfType" id="erfType">
					  		<option value="all" ${cri.erfType eq 'all' ? 'selected':'' } >양식 전체</option>
					  		<option value="erf1" ${cri.erfType eq 'erf1' ? 'selected':'' }>근태신청서</option>
					  		<option value="erf2" ${cri.erfType eq 'erf2' ? 'selected':'' }>휴가신청서</option>
					  		<option value="erf3" ${cri.erfType eq 'erf3' ? 'selected':'' }>연장근무신청서</option>
					  		<option value="erf4" ${cri.erfType eq 'erf4' ? 'selected':'' }>품의서</option>
					  		<option value="erf5" ${cri.erfType eq 'erf5' ? 'selected':'' }>이의신청서</option>
					  		<option value="erf6" ${cri.erfType eq 'erf6' ? 'selected':'' }>지출결의서</option>
					  		<option value="erf7" ${cri.erfType eq 'erf7' ? 'selected':'' }>지출품의서</option>
					  		
					  	</select>					
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
						</select>					
						<input  class="form-control search-bar" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" onclick="list_go3(1,'tempstorage');" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:8%;">번 호</th>
						<th style="width:10%;">양식명</th>
						<th style="width:45%;">제 목</th>
						<th style="width:10%;">작성자</th>
						<th>등록일</th>
						<th style="width:8%;">중요도</th>
						<th style="width:8%;">비고</th>
					</tr>			
					<c:if test="${empty escMngtList }" >
						<tr>
							<td colspan="7">
							<br/><br/><br/><br/><br/>
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${escMngtList}" var="escMngt">
						<tr style='font-size:0.85em;' >
							<td>${fn:substring(escMngt.sanctn_no,4,1000000000) }</td>
							
							<td>${escMngt.form_no}</td>
							
							<td id="boardTitle" onclick="javascript:OpenWindow('/gw/approval/ddbox/modifyForm.do?sanctn_no=${escMngt.sanctn_no}','상세보기',900,960);">
								<span class="col-sm-12">${escMngt.sj}</span>
							</td>
							<td>${escMngt.nm}</td>
							<td>
								<fmt:formatDate value="${escMngt.rgsde}" pattern="yyyy-MM-dd"/>
							</td>
							<c:choose>
							  <c:when test="${escMngt.ipcr_code eq '낮음'}">
								<td>${escMngt.ipcr_code}</td>	
							  </c:when>
							  <c:when test="${escMngt.ipcr_code eq '보통'}">
								<td style="color: blue;">${escMngt.ipcr_code}</td>	
							  </c:when>
							  <c:otherwise>
								<td style="color: tomato;">${escMngt.ipcr_code}</td>		
							  </c:otherwise>
							</c:choose>
							<td>
							<c:if test="${loginUser.empno eq escMngt.empno }">
								<button type="button" id="removeBtn" class="btn btn-remove" 
						    		onclick="remove_go('${escMngt.sanctn_no}');">삭제</button>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/tempstorage_pagination.jsp" %>	
					</ul>
				</nav>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
	<form role="form">
		<input id="form-input" type="hidden" name="sanctn_no" />
	</form>

<script>
function list_go3(page,url){
	if(!url) url="tempstorage.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#tempstorageForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='erfType']").val($('select[name="erfType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

function remove_go(value){
	var formObj = $("form[role='form']");
	//alert("click remove btn");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){		
		$("#form-input").attr("value", value);
		formObj.attr("action", "tempstorage/remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
}
</script>
</body>
</html>