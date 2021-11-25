<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<head>
<%
	OrgnztEmpMngtVO empvo = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
	int empno = empvo.getEmpno();
%>
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">

<!-- notice_registForm.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_registForm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap"	rel="stylesheet">
<style>
p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
}
p {
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 13px;
	font-weight: bold;
}
.form-group {
  margin: 8px 0;
}
table {
  margin: 0 auto;
  font-size: 12px;
}
td {
  width: 400px;
  text-align: center;
}
label {
  background: #EFEFEF;
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  color: black;
}
.form-control {
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  font-size: 13px;
  display: inline;
  color: black;
}
.btn-cancle, .btn-regist  {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  height: 37px;
}




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
  
}
.inputRow {
  font-size: 12px;
}
#addFileBtn {
  padding: 2px 4px;
}
#shareManBtn {
	width: 100px;
	height: 32px;
	font-size: 11px;
	margin-left: 20px;
}
.scroll-div {
	overflow: scroll;
	height: 220px;
	overflow-x: hidden;
	border: 2px solid #EFEFEF;
	font-size: 12px;
	margin: 5px 20px;
}
.removeBtn {
  border: 2px solid lightgrey;
  font-size: 10px;
  padding: 2px 5px;
}
</style>
<style>
/* 모달 2 */
header {
	padding: 12px;
	background: #004680;
	height: 45px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 16px;
	color: white;
}

.container-footer {
	text-align: center;
}
#share_man {
	display: none;
	width: 700px;
	height: 500px;
	padding: 0;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#share_man .modal_close_btn {
	position: absolute;
	top: 13px;
	right: 10px;
	cursor: pointer;
	color: white;
}

#shareManBtn {
	width: 100px;
	height: 32px;
	font-size: 11px;
}

.container-div2 {
	height: 360px;
	margin: 20px 15px;
	padding: 20px 10px;
	background: #EFEFEF;
}

.form_1 {
	background: white;
	border: 2px solid #004680;
	font-size: 11px;
	font-weight: bold;
	overflow: scroll;
	overflow-x: hidden;
	height: 250px;
}

.form_2 {
	height: 250px;
	margin-top: 10px;
	background: white;
	border: 2px solid #004680;
	font-size: 13px;
	font-weight: bold;
	overflow: scroll;
	overflow-x: hidden;
}

#input-search {
	width: 198px;
	height: 27px;
	border: 2px solid #004680;
	border-radius: 3px;
	font-size: 13px;
	margin-bottom: 10px;
}

#input-search2 {
	width: 198px;
	height: 27px;
	border: 2px solid #004680;
	border-radius: 3px;
	font-size: 13px;
	margin-bottom: 10px;
}

.btn-basic {
	border: 2px solid #004680;
	padding: 0 4px;
	background: #004680;
	color: white;
}

.btn-basic2 {
	border: 2px solid #004680;
	padding: 0 4px;
	background: white;
	font-size: 12px;
}

.btn-basic span {
	font-size: 12px;
}

.col-md-5 {
	height: 320px;
	padding: 15px 5px;
}

.col-md-5 .fa-lg {
	vertical-align: middle;
	background: white;
	color: #004680;
	cursor: pointer;
}
.fileInput {
  height: 80px;
  overflow-y : scroll;
  font-size: 12px;
}
.form-group {
  margin-top : 0;
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
	  			    <i class="fa fa-clipboard fa-2x" aria-hidden="true" style="vertical-align: middle;" ></i>&nbsp;
	  				<p class="title-p">공유문서 등록</p>  				
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
										&nbsp;&nbsp;<button class="btn btn-file"
										 onclick="addFile_go();" type="button" id="addFileBtn">파일첨부</button>
									</div>									
									<div class="card-footer fileInput"  id="file-div">
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
					
					<br/><br/>
					
					
					<div class="share-doc-div">
						<button type="button" class="btn btn-regist" id="shareManBtn"
							onclick="shareManBtn();">
							<i class="fa fa-user-plus fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;공유할사람
						</button>
					</div>

					<div class="scroll-div">
						<table class="table text-center" id="manTable">
							<tr>
								<th style="width: 8%;">사 번</th>
								<th style="width: 25%;">이 름</th>
								<th style="width: 20%;">부 서</th>
								<th style="width: 25%;">직 급</th>
								<th style="width: 10%;">비 고</th>
							</tr>


							<tr class="notList">
								<td colspan="5"><br />
								<br /> <i class="fa fa-times fa-2x" aria-hidden="true"></i><br />
								<br /> <p>공유할 사람이 없습니다.</p></td>
							</tr>


						</table>
					</div>
					
					
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
  
  
<!-- ====================================================================================================================================== -->
	<div id="share_man">
		<header>
			<p>공유할 사람</p>
			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg"
				aria-hidden="false"></i></a>
		</header>


		<div class="container-div2">

			<form action="" method="POST">

				<div class="wrapper">
					<div class="container-fluid">
						<div class=row>

							<div class="col-md-5">
								<input type="text" id="input-search" placeholder="임직원 검색">
								<br />
								<div class="form_1">
									<div id="Treecontainer"></div>
								</div>
							</div>

							<div class="col-md-2"
								style="text-align: center; margin-top: 130px;">
								<i class="fa fa-arrow-circle-right fa-lg" aria-hidden="true"></i>
								<br />
								<br /> <i class="fa fa-arrow-circle-left fa-lg"
									aria-hidden="true"></i>
							</div>

							<div class="col-md-5">
								<!-- 								  <i class="fa fa-caret-square-o-up fa-lg" aria-hidden="true"></i> -->
								<!-- 								  <i class="fa fa-caret-square-o-down fa-lg" aria-hidden="true"></i> -->
								&nbsp;&nbsp;
								<button class="btn btn-basic2" type="button" onclick="">
									<!-- 								  <i class="fa fa-hand-pointer-o fa-xs" aria-hidden="true"></i> -->
									<i class="fa fa-star fa-xs" aria-hidden="true"></i> <span>즐겨찾는 주소록 </span>
								</button>
								<!-- 							  	<button class="btn btn-basic2" type="button" onclick=""> -->
								<!-- 							  	  <i class="fa fa-star fa-xs" aria-hidden="true"></i> -->
								<!-- 								  <span>저장</span> -->
								<!-- 								</button>								     -->

								<div class="form_2">
									<div id="selectedContainer"></div>
								</div>

							</div>
							<!-- ./col-md-5 -->

						</div>
					</div>
				</div>

			</form>


		</div>

		<div class="container-footer">
			<button class="btn btn-regist" type="button" onclick="modalMan_go();">
				<p>확인</p>
			</button>
			<button class="btn btn-cancle docModal" type="button" onclick="">
				취소</button>
		</div>


	</div>
	
<script>
function modal(id) {
	var zIndex = 9999;
	var modal = $('#' + id);
	// 만지지마 화면 중앙에 비치하는거임

	// 모달 div 뒤에 희끄무레한 레이어
	var bg = $('<div id="bg">').css({
		position : 'fixed',
		zIndex : zIndex,
		left : '0px',
		top : '0px',
		width : '100%',
		height : '100%',
		overflow : 'auto',
		// 레이어 색갈은 여기서 바꾸면 됨
		backgroundColor : 'rgba(0,0,0,0.4)'
	}).appendTo('body');

	modal
		.css(
			{
			position : 'fixed',
			boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

			// 시꺼먼 레이어 보다 한칸 위에 보이기
			zIndex : zIndex + 1,

			// div center 정렬
			top : '50%',
			left : '50%',
			transform : 'translate(-50%, -50%)',
			msTransform : 'translate(-50%, -50%)',
			webkitTransform : 'translate(-50%, -50%)'
			}).show()
			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			.find('.modal_close_btn, .docModal').on('click', function() {
				bg.remove();
				modal.hide();
				$('#selectedContainer').empty();
				$('#selectedContainer2').empty();
			});
	}

// ==============================================================================================
function shareManBtn(){
	modal('share_man');
}
function selfRemove(el) {
	var element = el;
	element.remove();
}
// ==============================================================================================
//검색!
var currencies = [
  <c:forEach items="${empList}" var="emp" >
  { value: '${emp.nm}/${emp.dept_code}/${emp.clsf_code}', data: '${emp.empno}' },
  </c:forEach>
];

$('#input-search2').autocomplete({
    lookup: currencies,
    onSelect: function (suggestion) {
      var content = '선택: ' + suggestion.value + ' 데이터 ' + suggestion.data;
	console.log(content)
	$('#input-search2').val('');

	  var ap = document.getElementById('selectedContainer2');
	  var apcount = ap.childElementCount;
	  var apc = apcount+1
	  var uid = <%=empno%>
      var matches = document.querySelectorAll('.reff');
      
      if(matches.length > 0){
	          for (var i=0; i<matches.length; i++) {
	        	  if(matches[i].getAttribute('id') == suggestion.data){
	        		  alert('이미 지정된 사람입니다.');		        		
	        		  return;
	        	  }else if(suggestion.data == uid){
	        		  alert('자기자신은 지정할 수 없습니다.');		        		
	        		  return;			        		  
	        	  }
	        	}
      }
	          var show = "<span class='reff' onclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>";
	       	  $('#selectedContainer2').append(show);
    }
});

$('#input-search').autocomplete({
    lookup: currencies,
    onSelect: function (suggestion) {
      var content = 'sel: ' + suggestion.value + ' data ' + suggestion.data;
	console.log(content)
		$('#input-search').val('');

	  var ap = document.getElementById('selectedContainer');
	  var apcount = ap.childElementCount;
	  var apc = apcount+1
	  
	  var uid = <%=empno%>
	  
      var matches = document.querySelectorAll('.sanctner');
      
      if(matches.length > 0){
	          for (var i=0; i<matches.length; i++) {
	        	  if(matches[i].getAttribute('id') == suggestion.data){
	        		  alert('이미 지정된 사람입니다.');		        		
	        		  return;
	        	  }else if(suggestion.data == uid){
	        		  alert('자기자신은 지정할 수 없습니다.');		        		
	        		  return;			        		  
	        	  }
	        	}
      }
      
      if(apc == 11){
       	  alert('최대 공유자 수는 10명까지 지정가능합니다.')
      }else{
	          var show = "<span class='sanctner' onclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>";
	       	  $('#selectedContainer').append(show);
      }

    }
});
</script>
<script>
function modalMan_go(){
	var ap = document.getElementById('selectedContainer');
	var num = 1;
	var modal = $('#share_man');
	
	
	if(ap.childElementCount > 0){
	$("#manTable tr.notList").hide();
	}else{
	$("#manTable tr.notList").show();	
	}
	
	
	$("#manTable tr.again").remove();

   	$('#bg').remove();
	modal.hide();
	
   	var ap = document.querySelectorAll('.sanctner');
	
    for (var i=0; i<ap.length; i++) {
		var sid = ap[i].getAttribute('id');    
		var temp = ap[i].innerText.split('/');
// 		console.log(temp[0]);
// 		console.log(temp[1]);
// 		console.log(temp[2]);
		
		var no = "<td>" + sid + "</td>";
	    var name = "<td>" + temp[0] + "</td>";
	    var dept = "<td>" + temp[1] + "</td>";
	    var part = "<td>" + temp[2] + "</td>";
	    var empty = "<td>" + '<button type="button" class="btn btn-remove removeBtn" onclick="">삭제</button>' + "</td>";
	    	
		

	    $('#manTable').append("<tr class='man-tr" + i + " again' id='elem2' style='font-size:0.85em;'></tr>");
	    $(".man-tr" + i).append(no);
	    $(".man-tr" + i).append(name);
	    $(".man-tr" + i).append(dept);
	    $(".man-tr" + i).append(part);
	    $(".man-tr" + i).append(empty);
		
    } // for문 끝
		
	
}
</script>
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
	
	
	//===============================================================================================	
	$('#Treecontainer').jstree({ 
	    'core' : 
	     { 'data' : [ 
	        { "id" : "GW", "parent" : "#", "text" : "임직원목록" , "icon" : "fas fa-clipboard-list" ,"state" : {"opened" : true } }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '임원'}">
	                 { "id" : "${emp.empno}", "parent" : "GW", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        { "id" : "B001", "parent" : "GW", "text" : "경리부","icon" : "fas fa-users" }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '경리부'}">
	                 { "id" : "${emp.empno}", "parent" : "B001", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        { "id" : "B002", "parent" : "GW", "text" : "사업부","icon" : "fas fa-users" }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '사업부'}">
	              { "id" : "${emp.empno}", "parent" : "B002", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        { "id" : "B003", "parent" : "GW", "text" : "시설관리부","icon" : "fas fa-users" }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '시설관리부'}">
	                 { "id" : "${emp.empno}", "parent" : "B003", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        { "id" : "B004", "parent" : "GW", "text" : "인사부","icon" : "fas fa-users" }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '인사부'}">
	                 { "id" : "${emp.empno}", "parent" : "B004", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        { "id" : "B005", "parent" : "GW", "text" : "홍보부","icon" : "fas fa-users" }, 
	           <c:forEach items="${empList}" var="emp" >
	              <c:if test="${emp.dept_code eq '홍보부'}">
	                 { "id" : "${emp.empno}", "parent" : "B005", "text" : "${emp.nm}/${emp.dept_code}/${emp.clsf_code}" , "icon" : "fas fa-user" }, 
	              </c:if>
	          </c:forEach>
	        ] 
	       },
	       
	       
	});
	 
	 
	$('#Treecontainer').bind("select_node.jstree", function (NODE, REF_NODE) {
		  var ap = document.getElementById('selectedContainer');
		  var apcount = ap.childElementCount;
		  var apc = apcount+1
		  
		  var uid = <%=empno%>
		  console.log(uid);
//		  var userCheck = uid.getAttribute('empno');
//		  console.log(userCheck);
		  
	     var a = $('#Treecontainer').jstree('get_selected',true)
	     if(a[0].id.indexOf('B') == -1 && a[0].id.indexOf('GW') == -1 ){
	         
	         var matches = document.querySelectorAll('.sanctner');
	         
	         if(matches.length > 0){
		          for (var i=0; i<matches.length; i++) {
		        	  if(matches[i].getAttribute('id') == a[0].id){
		        		  alert('이미 지정된 사람입니다.');		        		
		        		  return;
		        	  }else if(a[0].id == uid){
		        		  alert('자기자신은 지정할 수 없습니다.');		        		
		        		  return;			        		  
		        	  }
		        	}
	         }
	         
	         
	         
	         if(apc == 11){
	       	  alert('최대 공유자 수는 10명까지 지정가능합니다.')
	         }else{
		          var show = "<span class='sanctner' onclick='selfRemove(this)' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";
		       	  $('#selectedContainer').append(show);
	         }
	         
	      	  
	     }
	});
	
	
	
}
</script>
<%@ include file="/WEB-INF/views/common/summernote2.jsp" %>

<script>
function addFile_go(){
//	alert("add file btn");

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
	
	if($("input[name='sj']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='sj']").focus();
		return;
	}

	if($("textarea[name='cn']").val()==""){ //form.cn.value
		alert("내용은 필수입니다.");
		$("textarea[name='cn']").focus();
		return;
	}

	
	var dbxNext = '<c:out value="${dbxNext}"/>';
	
	if (document.getElementById('elem2')) {
		if (confirm('공유가 완료되면 공유한 사람은 변경할 수 없습니다. 그대로 진행하시겠습니까?')) {
	        // 확인 버튼 클릭 시 동작

	        // 공유 시작
	        var shareForm = $("#shareForm");
	        
	        var ap = document.querySelectorAll('.sanctner');
	    	
	        for (var i=0; i<ap.length; i++) {
	    		var sid = ap[i].getAttribute('id');  
	    		console.log("sid" + sid);

	        	shareForm.find("[name='rcvr_empno']").val($("#man_input").val()+sid+",");
	        }
	        	shareForm.find("[name='dbx_no']").val(dbxNext);

	        	
	        	shareForm.find("[name='empno']").val($('#empno').val());
	        	shareForm.find("[name='emp_nm']").val($('#emp_nm').val());
	        	shareForm.find("[name='sj']").val($('#sj').val()); 
	        	shareForm.find("[name='cn']").text($('#cn').val());
	    	
// 	         alert(shareForm.find("[name='sj']").val($('#sj').val()).val());
// 	         alert(shareForm.find("[name='cn']").text($('#cn').val()).val());
// 	         alert(dbxNext);
	         
	        shareForm.attr({
	        	action:"share.do",
	    	    method:'post'
	        }).submit();
	        
	    } else {
	        // 취소 버튼 클릭 시 동작
	        return;
	    }
	} else {
		if (confirm('공유할 사람을 선택하지 않았습니다. 그대로 진행하시겠습니까?')) {
	        // 확인 버튼 클릭 시 동작
			document.registForm.submit();
	    } else {
	        // 취소 버튼 클릭 시 동작
	        return;
	    }
	}
	
}
</script>

    <form role="form" id="shareForm">
		<input id="doc_input" type="hidden" name="dbx_no" />
		<input id="man_input" type="hidden" name="rcvr_empno" />
		<input type="hidden" name="cocnr_nm" value="${loginUser.nm }"/>
		<input type="hidden" name="cocnr_empno" value="${loginUser.empno}" />
		
		<input type="hidden" name="empno" class="form-control" value="${loginUser.empno }">
		<input type="hidden" name="emp_nm" class="form-control" value="${loginUser.nm }">
		<input type="hidden" style="border:none;" name="sj" class="form-control" placeholder="제목을 입력하세요">
		<textarea class="textarea" name="cn" rows="20" style="display: none;"></textarea>
		
	</form>

</body>

    
    
    
    