<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
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
p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
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
.top-button>a, button{
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

<title>공지사항 상세보기</title>

<body>
	<c:if test="${from eq 'modify'}">
		<script>
			alert("수정되었습니다.");
			window.opener.location.reload();
		</script>
	</c:if>
	<c:if test="${from eq 'remove'}" >
    <script>
   		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
   </c:if>
   
   	
  <!-- Content Wrapper. Contains page content -->
  <div class="pop-container" style="min-width:800px;">
   
   
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text fa-2x" style="vertical-align: middle;"  aria-hidden="true"></i>&nbsp;
	  				<p class="title-p">공지사항 상세보기</p>  				
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
						  <c:if test="${loginUser.empno eq notice.empno }">
							<button type="button" id="modifyBtn" class="btn btn-regist" 
								onclick="modify_go();">수정</button>						
						    <button type="button" id="removeBtn" class="btn btn-remove" 
						    	onclick="remove_go();">삭제</button>
					      </c:if>
					    	<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >닫기</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
						  <table class="table" >
						  	<tr class="first-tr">
						  	  <td class="table-th">작성자</td>
						  	  <td>${notice.emp_nm}</td>
						  	  <td class="table-th">등록일</td>
						  	  <td>
						  	  	<fmt:formatDate value="${notice.rgsde}" pattern="yyyy-MM-dd" />
						  	  </td>
						  	</tr>
						  	<tr>
						  	  <td class="table-th">제목</td>
						  	  <td colspan="3">${notice.sj}</td>
						  	</tr>
						  	<tr class="table-content">
						  	  <td colspan="4">${notice.cn}</td>
						  	</tr>
						  	<tr class="last-tr">
						  	  <td class="table-th">첨부파일</td>
						  	  <td colspan="3" style="height:106px; overflow-y:scroll">
						  	    
									<div class="row">
									  <c:forEach items="${notice.atchList }" var="atch">
										<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;"
											 onclick="location.href='<%=request.getContextPath()%>/board/notice/getFile.do?file_no=${atch.file_no }';">
											<div class="info-box" style="margin:0;">	
											 	<span class="info-box-icon bg-gw">
													<i class="fa fa-copy"></i>
												</span>
												<div class="info-box-content">
													<span class ="info-box-text">
													  <fmt:formatDate value="${notice.rgsde }" pattern="yyyy-MM-dd" />	
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
				    <a href="detail.do?bbsctt_no=${notice.bbsctt_no} ">top</a>
				</div>
				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
        
  </div>
  <!-- /.content-wrapper -->

	<form role="form">
		<input type="hidden" name="bbsctt_no" value="${notice.bbsctt_no}" />
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


</body>
 
 
 
 
 
 
 
 
 
 
 