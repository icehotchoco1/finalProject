<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
.file-group {
  margin : 0 auto; 
  border: 3px solid lightgrey;
  border-radius: 6px;
}
.file-title-div {
  margin: 10px;
}
.btn-file {
  background: ivory;
  border: 2px solid lightgrey;
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
	  				<p>ㅇ공지사항 수정</p>  				
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
					
						
						<form enctype="multipart/form-data" role="form" method="post" action="modify.do" name="modifyForm">
							<input type="hidden" name="bbsctt_no" value="${notice.bbsctt_no}" />
							<div class="form-group" id="group-2">
								<label for="sj">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label> 
								<input type="text" id="sj" name="sj" style="border:none;" class="form-control" value="${notice.sj }">
							</div>
							
							<div class="form-group">								
								<div class="card card-outline" id="card-file">
									<div class="card-header">
										<p id="file-title">첨부파일</p>
										&nbsp;&nbsp;<button class="btn btn-file"
										type="button" id="addFileBtn">파일첨부</button>
									</div>									
									<div class="card-footer fileInput">
											<c:forEach items="${notice.atchList }" var="atch" >
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											<li class="attach-item">																			
												<div class="mailbox-attachment-info">
													<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${atch.file_nm }" attach-no="${atch.file_no }" href="<%=request.getContextPath()%>/board/notice/getFile.do?file_no=${atch.file_no }"  >													
														<i class="fas fa-paperclip"></i>
														${atch.file_nm }&nbsp;&nbsp;
														<button type="button" style="border:0;outline:0;" class="badge bg-red">X</button>																									
													</a>													
												</div>
											</li>	
										</ul>
											</c:forEach>
									</div>
								</div>
							</div>
													
							<div class="form-group" id="group-3">
							  <div style="margin: 0 auto; ">
								<textarea class="textarea" name="cn" id="cn" rows="20"
									style="display: none;">${notice.cn}</textarea>
							  </div>
							</div>
							
						</form>

					</div><!--end card-body  -->
						
					<div class="card-header">
						<div style="text-align: center; margin-bottom: 20px;">
							<button type="button" class="btn btn-regist" id="registBtn" onclick="modify_go();">수정</button>
							
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
    		Summernote_start($("#cn"));
    		
    		//첨부파일=================================
    		$('a[name="attachedFile"] > button').click(function(event){
    			
    			
//     			alert("remove file btn");
    			
    			var parent = $(this).parent('a[name="attachedFile"]');
    			
//     			alert(parent.attr("attach-fileName")+" 파일을 삭제합니다.");
    			if(!confirm(parent.attr("attach-fileName")+" 파일을 삭제 하시겠습니까?.")){
    				return false;
    			}
    			
    			var ano = parent.attr("attach-no");
    			
    			$(this).parents('li.attach-item').remove();
    			
    			var input = $('<input>').attr({"type":"hidden",
    											"name":"deleteFile",
    											"value":ano
    										  });
    			
    			$('form[role="form"]').prepend(input);
    			
    			return false;
    		});
    		
    		$('#addFileBtn').on('click',function(event){
//     			alert('click add file btn');
    			
    			var attachedFile=$('a[name="attachedFile"]').length;
    			var inputFile=$('input[name="uploadFile"]').length;			
    			var attachCount=attachedFile+inputFile;
    			
    			if(attachCount >= 5){
    				alert('파일추가는 5개까지만 가능합니다.');
    				return;
    			}
    	
    	
    			var input= $('<input>').attr({"type":"file","name":"uploadFile"}).css({"display":"inline", "font-size":"13px"});
    			var div = $('<div>').addClass("inputRow");
    			div.append(input).append("<button style='border:0;'outline:0;' class='badge bg-red' type='button'>X</button>");
//     			$('.fileInput').append(div);
    			div.appendTo('.fileInput');

    		});
    		
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
    	
    	
    	
    	function modify_go(){
			var form=document.modifyForm;
    		
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
    		
    		if($("input[name='sj']").val()==""){ //form.title.value
    			alert("제목은 필수입니다.");
    			$("input[name='sj']").focus();
    			return;
    		}

    		form.submit();	
    	}
    </script>
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
</body>    
    
    
    
    
    
    
    
    
    
    