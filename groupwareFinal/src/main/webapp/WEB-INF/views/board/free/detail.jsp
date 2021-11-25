<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_detail.css">
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

<title>ㅇ게시글 상세보기</title>
<body>
	<c:if test="${from eq 'modify'}">
		<script>
			alert("수정되었습니다.");
			window.opener.location.reload();
		</script>
	</c:if>
	<c:if test="${from eq 'remove' }">
		<script>
			alert("삭제되었습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
<div id="yo" class="pop-container" style="min-width:800px;">
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>자유게시판 상세보기</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	
     <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width:960px;">
				<div class="card-outline">
					<div class="card-header">
						<div class="card-tools">
						<c:if test="${loginUser.empno eq free.empno }">
							<button type="button" id="modifyBtn" class="btn btn-regist" onclick="submit_go('modifyForm.do','${free.bbsctt_no}');">수정</button>						
						    <button type="button" id="removeBtn" class="btn btn-remove" onclick="submit_go('remove.do','${free.bbsctt_no}');">삭제</button>
						</c:if>
					    	<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >닫기</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
						  <table class="table" >
						  	<tr class="first-tr">
						  	  <td class="table-th">작성자</td>
						  	  <td>${free.emp_nm}</td>
						  	  <td class="table-th">등록일</td>
						  	  <td>
						  	  	<fmt:formatDate value="${free.rgsde}" pattern="yyyy-MM-dd" />
						  	  </td>
						  	</tr>
						  	<tr>
						  	  <td class="table-th">제목</td>
						  	  <td colspan="3">${free.sj}</td>
						  	</tr>
						  	<tr class="table-content">
						  	  <td class="table-th">내용</td>
						  	  <td colspan="3">${free.cn}</td>
						  	</tr>
						  	<tr class="last-tr">
						  	  <td class="table-th">첨부파일</td>
						  	  <td colspan="3">
						  	    <div class="row">
										<c:forEach items="${free.atchList }" var="atch">
											<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;"
												 onclick="location.href='<%=request.getContextPath()%>/board/free/getFile.do?file_no=${atch.file_no }';">
												<div class="info-box">	
												 	<span class="info-box-icon bg-gw">
														<i class="fa fa-copy"></i>
													</span>
													<div class="info-box-content">
														<span class ="info-box-text">
															<fmt:formatDate value="${free.rgsde }" pattern="yyyy-MM-dd" />	
														</span>
														<span class ="info-box-number">${atch.file_nm }</span>
													</div>
												</div>
											 </div>							
										</c:forEach>
									</div>
								
						  	  </td>
						  	</tr>
						  </table>
						</div>
												
					</div>													
				</div><!-- end card -->	
				
				<!-- top 버튼 -->	
				<div class="top-button">
				    <a href="detail.do?bbsctt_no=${free.bbsctt_no} ">top</a>
				</div>
				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
        
  </div>
  <!-- /.content-wrapper -->

<script>
	function submit_go(url,bbsctt_no){
		//alert(url);
		location.href=url+"?bbsctt_no="+bbsctt_no;
	}
</script>



</body>
