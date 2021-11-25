<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="eccRequestList" value="${dataMap.eccRequestList }" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/approvalRequest.css">

<%session.setAttribute("path", request.getContextPath() + "/approval/adbox/request"); %>
	 <!-- Main content -->
<head>
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
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">결재함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">기안문서함</p>  				
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
					<input type="hidden" name="perPageNum" id="perPageNum" value="10">
					
						<select class="form-control col-md-3" name="ipcrcode" id="ipcrcode">
							<option value="" ${cri.ipcrcode eq '' ? 'selected':'' }>중요도</option>
							<option value="H001" ${cri.ipcrcode eq 'H001' ? 'selected':'' }>낮음</option>
							<option value="H002" ${cri.ipcrcode eq 'H002' ? 'selected':'' }>보통</option>
							<option value="H003" ${cri.ipcrcode eq 'H003' ? 'selected':'' }>높음</option>
							<option value="H004" ${cri.ipcrcode eq 'H004' ? 'selected':'' }>긴급</option>
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
							<option value="tcw" ${cri.searchType eq 'tw' ? 'selected':'' }>검색구분</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>	
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go5(1,'request');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>						
				</div>			
			</div>
			<div class="card-body">
				<table class="table text-center">
				
					<tr style="font-size:0.95em;">
					
						<th style="width:8%;">번 호</th>
						<th style="width:15%;">양 식 명</th>
						<th style="width:40%;">제 목</th>
						<th style="width:10%;">상 태</th>
						<th style="width:8%;">중 요 도</th>
						<th style="width:10%;">등 록 일</th>
						<th style="width:15%;">결 재 기 한</th>
					</tr>	
					<c:if test="${empty eccRequestList }" >
						<tr>
							<td colspan="7">
							<br/><br/><br/><br/><br/>
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${eccRequestList }" var="requestList">
						<tr style='font-size:0.85em;'>
							<td>
							${fn:substring(requestList.sanctn_no,4,1000000000) }
							</td>
							<td >
							 <span class="col-sm-12 ">${requestList.form_nm }</span>
							</td>
							<td id="title" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${requestList.sanctn_no }&from=list','상세보기',900,890);">
							${requestList.sj }
							</td>
							<td>
							${requestList.sttus_code }
							</td>
							<c:choose>
							  <c:when test="${requestList.ipcr_code eq '낮음'}">
								<td>${requestList.ipcr_code}</td>	
							  </c:when>
							  <c:when test="${requestList.ipcr_code eq '보통'}">
								<td style="color: blue;">${requestList.ipcr_code}</td>	
							  </c:when>
							  <c:otherwise>
								<td style="color: tomato;">${requestList.ipcr_code}</td>		
							  </c:otherwise>
							 </c:choose>
							<td>
							<fmt:formatDate value="${requestList.rgsde }" pattern="yyyy-MM-dd"/> 
							
							</td>
							<td>
							<fmt:formatDate value="${requestList.sanctn_tmlmt }" pattern="yyyy-MM-dd"/> 
							</td>
						</tr>
					</c:forEach>	
					
				</table>
			</div>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/approvalAdBoxPagination.jsp" %>	
					</ul>
				</nav>
			</div>
		</div>
	</section>

<script>

function list_go5(page,url){
	if(!url) url="approval/adbox/request.do";
	
	console.log("url : " + url);
	
	var approvalAdBoxForm=$('#approvalAdBoxForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	
	//var pageNum = ($('select[name="perPageNum"]').val() == "" ? 10 : $('select[name="perPageNum"]').val()); 
	approvalAdBoxForm.find("[name='page']").val(page);
	approvalAdBoxForm.find("[name='perPageNum']").val($('input[name="perPageNum"]').val());
	approvalAdBoxForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	approvalAdBoxForm.find("[name='ipcrcode']").val($('select[name="ipcrcode"]').val());
	approvalAdBoxForm.find("[name='formnm']").val($('select[name="formnm"]').val());
	approvalAdBoxForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	approvalAdBoxForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>
	