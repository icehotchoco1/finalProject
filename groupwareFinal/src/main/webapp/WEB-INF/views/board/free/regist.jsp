<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
<head>
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">

<!-- notice_registForm.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_registForm.css">
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
<style>
.btn-basic {
  background: #004680;
  color: white;
  width: 90px;
  padding: 8px;
  border: 2px solid #004680;
  border-radius: 0;
  height: 38px;
  font-size: 14px;
  font-weight: bold;
}
.btn-basic:hover {
  background: white;
}
</style>
<style>
.file-group {
  margin : 0 auto; 
  border: 3px solid lightgrey;
  border-radius: 6px;
  height: 132px;
}
.file-title-div {
  margin: 5px 10px;
  font-size: 13px;
}
.btn-file {
  font-size: 11px;
  background: ivory;
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  border: 2px solid lightgrey;
}
#file-div {
  height: 90px;
  background: #EFEFEF;
  overflow-y: scroll;
}
.inputRow {
  font-size: 12px;
}
#addFileBtn {
  padding: 2px 4px;
}
</style>
</head>
<body>

  <div class="pop-container" style="min-width:800px;">
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>ㅇ자유게시판 게시글 등록</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width:960px;">
				<div class="card-outline">
					
					<div class="card-body pad">
					
					
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<input type="hidden" id="empno" readonly name="empno" class="form-control" value="${loginUser.empno }">
							<input type="hidden" id="emp_nm" readonly name="emp_nm" class="form-control" value="${loginUser.nm }">

							<div class="form-group" id="group-2">
								<label for="sj">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label> 
								<input type="text" id="sj" style="border:none;"
									name="sj" class="form-control" placeholder="제목을 입력하세요">
							</div>
							
							<div class="form-group">								
								<div class="file-group">
									<div class="file-title-div">
										<p id="file-title">첨부파일</p>
										&nbsp;&nbsp;<button class="btn btn-file" onclick="addFile_go();" type="button" id="addFileBtn">파일첨부</button>
									</div>									
									<div class="card-footer fileInput" id="file-div">
									</div>
								</div>
							</div>
										
							<div class="form-group" id="group-3">
							  <div style="margin: 0 auto; ">
								<textarea class="textarea" name="cn" id="cn" rows="20"
									style="display: none;"></textarea>
							  </div>
							</div>
							
						</form>
						
						
					</div><!--end card-body  -->
					<div class="card-header">
						<div style="text-align: center; margin-bottom: 20px;">
							<button type="button" class="btn btn-regist" id="registBtn" onclick="regist_go();">등 록</button>
							
							<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					
					
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->

  </div>  
<script>
window.onload=function(){
	Summernote_start($('#cn')); 
	$('.fileInput').on('change','input[type="file"]',function(event){
		if(this.files[0].size>1024*1024*40){
			alert("파일용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).click();
			return false;
		}
	});
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){
		$(this).parent('div.inputRow').remove();
	});
	
	
}
</script>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<script>
function addFile_go(){
//		alert("add file btn");

	if($('input[name="uploadFile"]').length >= 5){ //선택자가 동일한 ㅁ ㅏ크업이있으면 제이쿼리는 배열로 가져온다... 그리고 이건 태그갯수확인
		alert("파일추가는 5개까지만 가능합니다.");
		return
	}


	var input= $('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	var div = $('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;'outline:0;' class='badge bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
}	

function regist_go(){
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}else if($("textarea[name='cn']").val()==""){
		swal("내용을 입력해주세요.");
		$("textarea[name='cn']").focus();
		return;
	}

	document.registForm.submit();	
}
</script>



</body>