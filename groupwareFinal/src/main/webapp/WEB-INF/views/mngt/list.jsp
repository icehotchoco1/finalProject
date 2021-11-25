<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="mngtList" value="${dataMap.mngtList }" />

<%session.setAttribute("path", request.getContextPath() + "/board/management"); %>

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
<title>관리부게시판</title>
<body>

	<c:if test="${from eq 'regist' }">
		<script>
		
			alert("게시글등록에 성공했습니다. \n 관리부게시판  페이지로 이동합니다.");
			
			window.onload=function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/getMcode.do?mName=관리부게시판",
					type:"get",
					success:function(menu){
						window.opener.parent.location.href="<%=request.getContextPath()%>/index.do?mCode="+menu.menu_code;
						window.close();
					}
				});
			}
		
		</script>
	</c:if>		

	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">게시판</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">관리부</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-basic" id="registBtn" onclick="OpenWindow('management/registForm.do','관리부게시글등록',900,800);">등록</button>
				<div id="keyword" class="card-tools" style="width:540px;">	
					<div class="input-group row">
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
						</select>	
										
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1,'ctsn');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>			
			</div>
			<div class="card-body">
				<table class="table text-center">
					<tr style="font-size:0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:45%;">제 목</th>
						<th style="width:8%;">첨부파일</th>
						<th style="width:15%;">작성자</th>
						<th>등록일</th>
						<th style="width:10%;">조회수</th>
					</tr>	
					<c:if test="${empty mngtList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${mngtList }" var="mngt">
						<tr style='font-size:0.85em;'>
							<td>${fn:substring(mngt.bbsctt_no,4,1000000000) }</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('management/detail.do?bbsctt_no=${mngt.bbsctt_no }&from=list','상세보기',900,800);">
									<span class="col-sm-12 ">${mngt.sj }</span>
							</td>
							<td>
								<c:if test="${!empty mngt.atchList }">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							<td data-target="mngt-emp_nm">${mngt.emp_nm }</td>
							<td>
								<fmt:formatDate value="${mngt.rgsde }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${mngt.rdcnt }</td>
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
<script>
function list_go3(page,url){
	if(!url) url="management.do";
	
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
