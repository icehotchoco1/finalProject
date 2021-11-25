<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="jobSendList" value="${jobSendList }" />

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/board/notice_detail.css">
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
<style>
.btn btn-danger{
	border-radius:0;
	font-size:14px;
	font-weight:bold;
}
.table-th{
	height: 20px;
}
td {
	font-size: 15px;
}
.btn btn-regist2{
	font-weight:bold;
}
p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
}
</style>

</head>
<title>지시 업무 상세보기</title>
<body>

	<c:if test="${from eq 'remove'}">
		<script>
   		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
	</c:if>
	<!-- Content Wrapper. Contains page content -->
		<div id="yo" class="pop-container" style="min-width: 800px;">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row md-2">
						<div class="col-sm-6">
							 <i class="fa fa-tasks fa-lg" aria-hidden="true" style="vertical-align: middle;"></i>&nbsp;
	  						<p class="title-p">업무 상세보기</p> 
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="row justify-content-center">
					<div class="col-md-12" style="max-width: 960px;">
						<form role="form">
						<div class="card-outline">
							<div class="card-header">
								<div class="card-tools">
							      <c:forEach items="${jobRcvList}" var="jRcv">
								         <c:if test = "${loginUser.empno eq jRcv.rcver_empno}">
								         	<button type="button" id="modifyBtn" class="btn btn-regist" onclick="modify_go();">수정</button>
								         </c:if>
						         	</c:forEach>
									<c:choose>
										<c:when test = "${loginUser.empno eq job.drctr_empno}">
											<button type="button" id="modifyBtn" class="btn btn-regist" onclick="modify_go();">수정</button>
											<button type="button" id="removeBtn" class="btn btn-remove" onclick="remove_go();">삭제</button>
										</c:when>
							      </c:choose>
									<button type="button" class="btn btn-cancle" id="cancelBtn"
										onclick="CloseWindow();">닫기</button>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group col-sm-12">
									<table class="table">
										<tr class="first-tr">
											<td class="table-th" style="width:100px;">작성자</td>
											<td>${job.emp_nm}</td>
											<td class="table-th" style="width:90px;">등록일</td>
											<td style="width:100px;"><fmt:formatDate value="${job.regist_de}" pattern="yyyy-MM-dd" /></td>
											<td class="table-th" style="width:90px;">업무 기한</td>
											<td style="width:100px;"><fmt:formatDate value="${job.end_de}" pattern="yyyy-MM-dd" /></td>
											
										</tr>
										<tr>
											
											<td class="table-th" style="width:100px;">
												담당자 진행도
											</td>
											
											<c:if test="${empty jobRcvList}">
												<td>
													<strong>담당자가 지정되지 않았습니다.</strong>
												</td>
											</c:if>
											
											<td colspan="3">
											<c:forEach items="${jobRcvList }" var="jRcv">
													${jRcv.rcver_nm} :&nbsp;&nbsp; ${jRcv.rcver_progrs } &emsp;
											</c:forEach>
											</td>
											<td class="table-th" style="width:100px;">
												평균
											</td>
											
											<td>
												${job.rcver_progrs}
											</td>
											
										</tr>
										<tr>
											<td class="table-th">제목</td>
											<td colspan="12">${job.sj}</td>
										</tr>
										
										<!-- 첨부파일 -->
										
										<c:choose>
										<c:when test="${!empty job.atchList}">
										<tr class="last-tr">
											<td class="table-th">첨부파일</td>
											<td colspan="3">
												<div class="row">
													<c:forEach items="${job.atchList }" var="atch">
														<div class="col-md-12 col-sm-12 col-xs-12"  style="cursor:pointer;"
															 onclick="location.href='<%=request.getContextPath()%>/work/getFile.do?file_no=${atch.file_no }';">
															<div>
																<img style="width:30px; height:30px; overflow:hidden;" 
																	src="<%=request.getContextPath() %>/resources/fileIcon/${fn:toLowerCase(atch.file_type)}.png" 
																	onError="this.src='<%=request.getContextPath() %>/resources/fileIcon/default.png'">
																<span class="info-box-content">
																	<span class ="info-box-number">${atch.file_nm }</span>
																</span>
															</div>
														 </div>
													</c:forEach>
												</div>

											</td>
										</tr>
										</c:when>
										<c:when test="${empty job.atchList }">
										</c:when>
										</c:choose>
										<tr class="table-content">
											<td colspan="6">${job.cn}</td>
										</tr>
										
									</table>
								</div>
							</div>
						</div>
						</form>
						<!-- end card -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row  -->
			</section>
			<!-- /.content -->
		    
		    <!-- Reply content -->
    <section class="content container-fluid">
    	<!-- reply component start --> 
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">					
					<div class="card-body">
						<!-- The time line -->
						<div class="timeline">
							<!-- timeline time label -->
							<div class="time-label" id="repliesDiv">
							</div>
							
							
						</div>
						<c:if test="${ansList != null}">
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0">
								
							</ul>
						</div>
						</c:if>
					</div>
					<div class="card-footer">
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newEmpno" readonly value="${loginUser.empno }"> 
						<input class="form-control" type="hidden" placeholder="USER NM"	 id="newEmpnm" readonly value="${loginUser.nm }"> 
						<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newCn">
						<br/>
						<button type="button" class="btn btn-regist" id="replyAddBtn" onclick="replyRegist_go();">ADD REPLY</button>
					</div>				
				</div>			
				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
		<!-- top 버튼 -->
						<div class="top-button" id="toTop">
							<a href="detail.do?job_no=${job.job_no} ">top</a>
							<!-- <a id="toTop" href="#">TOP</a> -->
						</div>
    </section>
		
		
		</div>
	<!-- /.content-wrapper -->

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display: none;"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="acn" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-regist" id="replyModBtn"
						onclick="replyModify_go();">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn"
						onclick="replyRemove_go();">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<form role="form">
		<input type="hidden" name="job_no" value="${job.job_no}" />
	</form>

	<script>

	function modify_go(){
		var formObj = $("form[role='form']");
		//alert("click modify btn");
		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		//alert("click remove btn");
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}
 	
</script>


<%@ include file="../reply_js.jsp" %>

</body>










