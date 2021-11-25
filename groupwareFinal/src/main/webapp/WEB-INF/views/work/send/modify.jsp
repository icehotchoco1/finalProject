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
.content-header {
  margin-bottom: 20px;
}
label {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
  background: #EFEFEF;
  color: black;
  width: 90px;
  text-align: center;
  padding: 8px 10px;
}
#im_code, #end_de, #rcver_progrs {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
  border: 2px solid lightgrey;
  border-radius: 5px;
  height: 35px;  
}
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
#sj {
  border: 2px solid lightgrey;
  border-radius: 5px;
  font-weight: bold;
}
#cn2, #cn {
  border: 2px solid lightgrey;
  border-radius: 5px;
  font-weight: bold;
  height: 400px;
}
.fileInput {
  overflow-y: scroll;
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
	  				 <i class="fa fa-tasks fa-lg" aria-hidden="true" style="vertical-align: middle;"></i>&nbsp;
	  				<p class="title-p">업무 수정</p> 				
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
						<div style="display:inline;">
						</div>
						<div class ="card-tools" style="display:inline;">
							<button type="button" class="btn btn-regist" id="registBtn" onclick="modify_go();">수정</button>
							<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="history.go(-1);" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
					
						
						<form enctype="multipart/form-data" role="form" method="post" action="modify.do" name="modifyForm">
							<input type="hidden" id="drctr_empno" readonly name="drctr_empno" value="${job.drctr_empno }">
							<input type="hidden" name="job_no" value="${job.job_no}" />
							<input type="hidden" id="emp_nm" readonly name="emp_nm" class="form-control" value="${job.emp_nm }">
							<input type="hidden" id="sttus_code" name="sttus_code" value="${job.sttus_code}">
							
<!-- 지시자일때는 중요도, 진행도, 업무기한 수정할수 있게 -->
			<c:if test="${loginUser.empno eq job.drctr_empno}"> 
							<div class="row" style="margin-bottom:10px;">
								<div class="col-md-3">
									<label for="im_code">중요도</label>
									<select id="im_code" name="im_code">
										<option value="낮음" <c:if test="${job.im_code eq 'H001' }">selected="selected"</c:if>>낮음</option>
										<option value="보통" <c:if test="${job.im_code eq 'H002' }">selected="selected"</c:if>>보통</option>
										<option value="긴급" <c:if test="${job.im_code eq 'H004' }">selected="selected"</c:if>>긴급</option>
									</select>
								</div>
								<div class="col-md-3">
									<label for="rcver_progrs2">진행도</label>
									<span>${job.rcver_progrs}</span>
								</div>
								<div class="col-md-6">
									<label for="end_de">업무 기한</label>
									<input type="date" name="end_de" id="end_de" value="<fmt:formatDate value="${job.end_de}" pattern="yyyy-MM-dd"/>">
								</div>
							</div>
							
							<div style="float: left; width: 100%; min-height:50px">
								<label for="sj">제목</label> 
								<input type="text" id="sj" name="sj" class="form-control" value="${job.sj }">
							</div>							
							<div class="form-group" id="group-3">
							  <div style="margin: 0 auto; ">
								<textarea class="textarea" name="cn" id="cn" rows="20"
									style="display: none;">${job.cn}</textarea>
							  </div>
							</div>
			</c:if>
<!-- 로그인유저가 받은 업무리스트에 포함되 있으면 중요도, 업무기한은 수정 불가 (텍스트로 출력) // 개인 진척도 셀렉트 옵션 선택후 수정 -->		
			<c:forEach items="${jobRcvList}" var="jRcv">
				<c:if test = "${loginUser.empno eq jRcv.rcver_empno}">
							<input type="hidden" name="job_index" id="job_index" value="${jRcv.job_index}" />
							<input type="hidden" name="cn" value="${job.cn}"/>
							<%-- <input type="hidden" id="rcver_progrs" name="rcver_progrs" value="${jRcv.rcver_progrs}"> --%>
							
							<div class="row" style="margin-bottom:10px;">
								<div class="col-md-3">
									<label for="im_code">중요도</label>
									<select id="im_code" name="im_code" onclick="noClick()">
										<option value="낮음" <c:if test="${job.im_code eq 'H001' }">selected="selected"</c:if>>낮음</option>
										<option value="보통" <c:if test="${job.im_code eq 'H002' }">selected="selected"</c:if>>보통</option>
										<option value="긴급" <c:if test="${job.im_code eq 'H004' }">selected="selected"</c:if>>긴급</option>
									</select>
								</div>
								<div class="col-md-3">
									<label for="rcver_progrs">진행도</label>
									<select id="rcver_progrs" name="rcver_progrs">
										<option value="0" <c:if test="${jRcv.rcver_progrs eq '0' }">selected="selected"</c:if>>0%</option>
										<option value="10" <c:if test="${jRcv.rcver_progrs eq '10' }">selected="selected"</c:if>>10%</option>
										<option value="30" <c:if test="${jRcv.rcver_progrs eq '30' }">selected="selected"</c:if>>30%</option>
										<option value="50" <c:if test="${jRcv.rcver_progrs eq '50' }">selected="selected"</c:if>>50%</option>
										<option value="70" <c:if test="${jRcv.rcver_progrs eq '70' }">selected="selected"</c:if>>70%</option>
										<option value="90" <c:if test="${jRcv.rcver_progrs eq '90' }">selected="selected"</c:if>>90%</option>
										<option value="100" <c:if test="${jRcv.rcver_progrs eq '100' }">selected="selected"</c:if>>100%</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="end_de">업무 기한</label>
									<input type="date" name="end_de" id="end_de" value="<fmt:formatDate value="${job.end_de}" pattern="yyyy-MM-dd"/>" readonly>
								</div>
							</div>
							<div style="float: left; width: 100%; min-height:50px">
								<label for="sj">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label> 
								<input type="text" id="sj" name="sj" value="${job.sj }" readonly>
							</div>
							<div>
								<input style="width:100%; min-height:120px;" type="text" id="cn2" name="cn2" value="${fn:substringBefore(fn:substringAfter(job.cn,'<p>'),'</p>')}" readonly>
							</div>
							<%-- 
							<div class="form-group" id="group-3">
								<div style="margin: 0 auto;">
									<textarea class="textarea" name="cn" id="cn" rows="20" style="display: none;" readonly>
										${job.cn}
									</textarea>
								</div>
							</div> --%>
				</c:if>
			</c:forEach>
							
							
							
							
							<div class="form-group">								
								<div class="card card-outline"  id="card-file">
									<div class="card-header">
										<p id="file-title">첨부파일</p>
										&nbsp;&nbsp;<button class="btn btn-basic" 
										type="button" id="addFileBtn">파일첨부</button>
									</div>									
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											<c:if test="${empty job.atchList }">
												<div>
													<strong>첨부파일이 없습니다.</strong>
												</div>
											</c:if>
											<c:forEach items="${job.atchList }" var="atch" >
											<li class="attach-item">																			
												<div class="mailbox-attachment-info">
													<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${atch.file_nm }" attach-no="${atch.file_no }" href="<%=request.getContextPath()%>/work/getFile.do?file_no=${atch.file_no }"  >													
														<i class="fas fa-paperclip"></i>
														${atch.file_nm }&nbsp;&nbsp;
														<button type="button" style="border:0;outline:0;" class="badge bg-red">X</button>																									
													</a>													
												</div>
											</li>	
											</c:forEach>
										</ul>
										<br/>														
									</div>
								</div>
							</div>

						</form>
					</div><!--end card-body  -->
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
		//     	alert('click add file btn');
		    	
		    	var attachedFile=$('a[name="attachedFile"]').length;
		    	var inputFile=$('input[name="uploadFile"]').length;			
		    	var attachCount=attachedFile+inputFile;
		    	
		    	if(attachCount >= 5){
		    		alert('파일추가는 5개까지만 가능합니다.');
		    		return;
		    	}
		    	
		    	
		    	var input= $('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		    	var div = $('<div>').addClass("inputRow");
		    	div.append(input).append("<button style='border:0;'outline:0;' class='badge bg-red' type='button'>X</button>");
		//     	$('.fileInput').append(div);
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
    		
    		var im_code = document.getElementById('im_code').options[document.getElementById('im_code').selectedIndex].selected = 'selected';
    		if(im_code){
    			form.im_code = im_code;
    		}
    		var end_de = document.getElementById('end_de').value;
    		if(end_de){
    			form.end_de = end_de;
    		}
    		
    		if($("input[name='sj']").val()==""){ //form.title.value
    			alert("제목은 필수입니다.");
    			$("input[name='sj']").focus();
    			return;
    		}else if($("input[name='jrcv']").val()==""){
    			swal("담당자 지정은 필수입니다.");
    			return;
    		}else if($("input[name='end_de']").val()==""){
    			swal("업무 기한을 설정해주세요.");
    			return;
    		}else if($("textarea[name='cn']").val()==""){
    			swal("내용을 입력해주세요.");
    			$("textarea[name='cn']").focus();
    			return;
    		}

    		form.submit();	
    	}
    	function noClick(){
    		alert("담당자는 중요도를 변경할수 없습니다.");
    		return;
    	}
    	
    </script>
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
</body>    
    
    
    
    
    
    
    
    
    
    