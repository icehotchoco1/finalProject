<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="rdRcvList" value="${dataMap.rdRcvList }" />

<%session.setAttribute("path", request.getContextPath() + "/approval/rdbox"); %>

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
<title>참조함</title>
<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
					<p class="menu-header">결재</p>
					<p class="menu-header">></p>
					<p class="menu-header this">참조함</p>
				</div>

			</div>
		</div>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width: 540px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="ipcrcode" id="ipcrcode">
							<option value="" ${cri.ipcrcode eq '' ? 'selected':'' }>중요도</option>
							<option value="H001" ${cri.ipcrcode eq 'H001' ? 'selected':'' }>낮음</option>
							<option value="H002" ${cri.ipcrcode eq 'H002' ? 'selected':'' }>보통</option>
						</select>	
						<select class="form-control col-md-3" name="formnm" id="formnm">
							<option value="" ${cri.formnm eq '' ? 'selected':'' }>양식별</option>
							<option value="근태신청서" ${cri.formnm eq '근태신청서' ? 'selected':'' }>근태신청서</option>
							<option value="휴가신청서" ${cri.formnm eq '휴가신청서' ? 'selected':'' }>휴가신청서</option>
							<option value="연장근무신청서" ${cri.formnm eq '연장근무신청서' ? 'selected':'' }>연장근무신청서</option>
							<option value="일반품의서" ${cri.formnm eq '일반품의서' ? 'selected':'' }>일반품의서</option>
							<option value="이의신청서" ${cri.formnm eq '이의신청서' ? 'selected':'' }>이의신청서</option>
							<option value="지출결의서" ${cri.formnm eq '지출결의서' ? 'selected':'' }>지출결의서</option>
							<option value="지출품의서" ${cri.formnm eq '지출품의서' ? 'selected':'' }>지출품의서</option>
						</select>	
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tw" ${cri.searchType eq 'tw' ? 'selected':'' }>검색구분</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>	
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go3(1,'rdbox');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>			
				</div>
			</div>
			<div class="card-body">
				<table class="table text-center">
					<tr style="font-size: 0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:25%;">제 목</th>
						<th style="width:30%;">기안자</th>
						<th style="width:10%;">기안 날짜</th>
						<th style="width:10%;">승인 날짜</th>
						<th style="width:8%;">승인자</th>
					</tr>
					<c:if test="${empty rdRcvList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${rdRcvList}" var="escDbx">
						<tr style='font-size: 0.85em;'>
							<td>${fn:substring(escDbx.sanctn_no,4,1000000000)}</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/approval/ddbox/detail.do?sanctn_no=${escDbx.sanctn_no}','상세보기',900,800);">
							<span class="col-sm-12">${escDbx.sj}</span> 
							</td>
							<td data-target="escDbx-writer">${escDbx.nm}</td>
							<td><fmt:formatDate value="${escDbx.rgsde}"
									pattern="yyyy-MM-dd" /></td>
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
	<!-- /.content -->
<script>
function list_go3(page,url){
	if(!url) url="notice.do";
	
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