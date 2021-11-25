<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="allBbsList" value="${dataMap.allBbsList }" />

<%session.setAttribute("path", request.getContextPath() + "/board/main"); %>


<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

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
<title>통합검색</title>
<body>


	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">게시판</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">통합검색</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
<!-- 				<button type="button" class="btn btn-basic" id="registBtn" onclick="OpenWindow('ctsn/registForm.do','게시글등록',900,800);">게시글등록</button> -->
				<div id="keyword" class="card-tools">	
					<div class="input-group row" style="width:750px; left:-20px;">
 						<select class="form-control col-md-2" name="bbsType" id="bbsType">
					  		<option value="all" ${cri.bbsType eq 'all' ? 'selected':'' } >전체게시판</option>
					  		<option value="bn" ${cri.bbsType eq 'bn' ? 'selected':'' }>회사소식게시판</option>
					  		<option value="ctsn" ${cri.bbsType eq 'ctsn' ? 'selected':'' }>경조사게시판</option>
					  		<option value="Free" ${cri.bbsType eq 'Free' ? 'selected':'' }>자유게시판</option>
					  		<option value="mngt" ${cri.bbsType eq 'mngt' ? 'selected':'' }>관리부게시판</option>
					  		<option value="nt" ${cri.bbsType eq 'nt' ? 'selected':'' }>공지사항게시판</option>
					  	</select>	 	
 						<select class="form-control col-md-2" name="perPageNum" id="perPageNum">
					  		<option value="10" ${cri.perPageNum==10 ? 'selected':'' } >정렬개수</option>
					  		<option value="20" ${cri.perPageNum==20 ? 'selected':'' }>20개씩</option>
					  		<option value="30" ${cri.perPageNum==30 ? 'selected':'' }>30개씩</option>
					  		<option value="50" ${cri.perPageNum==50 ? 'selected':'' }>50개씩</option>
					  		
					  	</select>	 	
						<select class="form-control col-md-2" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tw' ? 'selected':'' }>검색구분</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>	
										
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go2(1,'main');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>						
				</div>			
			</div>
			<div class="card-body">
				<table class="table text-center">
					<tr style="font-size:0.95em;">
						<th style="width:15%;">게시판</th>
						<th style="width:10%;">번 호</th>
						<th style="width:30%;">제 목</th>
						<th style="width:8%;">첨부파일</th>
						<th style="width:15%;">작성자</th>
						<th>등록일</th>
						<th style="width:10%;">조회수</th>
					</tr>	
					<c:forEach items="${allBbsList }" var="allbbs">
						<tr style='font-size:0.85em;'>
							<c:choose>
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'ctsn' }">
									<td id="boardAt">
											<span class="col-sm-12 ">경조사</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'bnbd' }">
									<td id="boardAt" >
											<span class="col-sm-12 ">회사소식</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'ntbd' }">
									<td id="boardAt" >
											<span class="col-sm-12 ">공지사항</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'mngt' }">
									<td id="boardAt" >
											<span class="col-sm-12 ">관리부</span>
									</td>
								</c:when>
								<c:otherwise>
									<td id="boardAt">
											<span class="col-sm-12 ">자유</span>
									</td>
								</c:otherwise>	
							</c:choose>
							
									
							<td>${fn:substring(allbbs.bbsctt_no,4,1000000000) }</td>
							<c:choose>
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'ctsn' }">
									<td id="boardTitle" onclick="javascript:OpenWindow('ctsn/detail.do?bbsctt_no=${allbbs.bbsctt_no }&from=list','상세보기',900,800);">
											<span class="col-sm-12 ">${allbbs.sj }</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'bnbd' }">
									<td id="boardTitle" onclick="javascript:OpenWindow('news/detail.do?bbsctt_no=${allbbs.bbsctt_no }&from=list','상세보기',900,800);">
											<span class="col-sm-12 ">${allbbs.sj }</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'ntbd' }">
									<td id="boardTitle" onclick="javascript:OpenWindow('notice/detail.do?bbsctt_no=${allbbs.bbsctt_no }&from=list','상세보기',900,800);">
											<span class="col-sm-12 ">${allbbs.sj }</span>
									</td>
								</c:when>
								
								<c:when test="${fn:substring(allbbs.bbsctt_no,0,4) eq 'mngt' }">
									<td id="boardTitle" onclick="javascript:OpenWindow('management/detail.do?bbsctt_no=${allbbs.bbsctt_no }&from=list','상세보기',900,800);">
											<span class="col-sm-12 ">${allbbs.sj }</span>
									</td>
								</c:when>
								<c:otherwise>
									<td id="boardTitle" onclick="javascript:OpenWindow('Free/detail.do?bbsctt_no=${allbbs.bbsctt_no }&from=list','상세보기',900,800);">
											<span class="col-sm-12 ">${allbbs.sj }</span>
									</td>
								</c:otherwise>								
							</c:choose>
							<td>
								<c:if test="${!empty allbbs.atchList }">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							<td data-target="ctsn-emp_nm">${allbbs.emp_nm }</td>
							<td>
								<fmt:formatDate value="${allbbs.rgsde }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${allbbs.rdcnt }</td>
						</tr>
					</c:forEach>	
				</table>
			</div>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/allbbsPagination.jsp" %>	
					</ul>
				</nav>
			</div>
		</div>
	</section>

<script>

function list_go2(page,url){
	if(!url) url="list.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#allbbsForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='bbsType']").val($('select[name="bbsType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>





</body>