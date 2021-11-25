<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
 
<c:set var="jobRcvList" value="${dataMap.jobRcvList }" />


<head>
<!-- notice_registForm.css -->
<%
	OrgnztEmpMngtVO empvo = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
	int empno = empvo.getEmpno();
%>

<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.css">

<!-- notice_registForm.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board/notice_registForm.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">

<style>
.autocomplete-suggestions { 
font-size : 13px;
border: 1px solid #999; 
background: #FFF; 
overflow: auto;
}
.autocomplete-suggestion { 
padding: 2px 5px; 
white-space: nowrap; 
overflow: hidden; 
cursor: pointer; 
}
.autocomplete-selected {
 background: #004680; 
color: white;
 }
.autocomplete-suggestions strong { 
font-weight: bold; 
color: black; 
}
.autocomplete-group {
 padding: 2px 5px;
  }
.autocomplete-group strong {
 display: block; 
border-bottom: 1px solid #000; 
}
</style>

<style>
/* 모달 */
#sel_sanctner {
	display: none;
	width: 550px;
	height: 500px;
	padding: 0;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
/* #sel_sanctner .modal_close_btn { */
/* 	position: absolute; */
/* 	top: 13px; */
/* 	right: 10px; */
/* 	cursor: pointer; */
/* 	color: white; */
/* } */
#sel_referrer{
	display: none;
	width: 550px;
	height: 500px;
	padding: 0;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
/* #sel_referrer .modal_close_btn { */
/* 	position: absolute; */
/* 	top: 13px; */
/* 	right: 10px; */
/* 	cursor: pointer; */
/* 	color: white; */
/* } */
.container-div {
  height: 360px;
  margin: 20px 15px;
  padding: 20px 10px;
  background: #EFEFEF;
}
header {
  padding:12px;
  background: #004680;
  height: 45px;
  font-family: 'Do Hyeon', sans-serif;
  font-size: 16px;
  color: white;
}
.form_1 {
  background: white;
  border: 2px solid #004680; 
  font-size: 11px;
  font-weight: bold;
  overflow:scroll;
  overflow-x:hidden;
  height: 250px;
}
.form_2 {
  height: 250px;
  margin-top: 10px;
  background: white;
  border: 2px solid #004680; 
  font-size: 13px;
  font-weight: bold;
  overflow:scroll;
  overflow-x:hidden; 
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
.btn:hover {
  background: white;
  border: 2px solid #004680;
}
.container-footer {
  text-align: center;
}
/* 버튼 */
.btn-regist {
  background: #004680;
  color: white;
  width: 90px;
  padding: 6px;
  border: 2px solid #004680;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.btn-cancle {
  background: #EFEFEF;
  color: #556278;
  width: 90px;
  padding: 6px;
  border: 2px solid #EFEFEF;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.btn-regist:hover {
  background: white;
  color: #59BEE9;
}
.btn-cancle:hover {
  background: #F7F6ED;
  color: tomato;
}

.btn-regist2 {
  background: #004680;
  color: white;
  width: 130px;
  padding: 6px;
  border: 2px solid #004680;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.btn-regist2:hover {
  background: white;
  color: #59BEE9;
}
.btn-cancle:hover {
  background: #F7F6ED;
  color: tomato;
}
</style>

<style>
td {
  font-size: 13px;
}

.file-group {
  margin : 0 auto; 
  border: 3px solid lightgrey;
  border-radius: 6px;
  height: 135px;
}
.file-title-div {
  margin: 10px;
}
.btn-file {
  background: ivory;
  border: 2px solid lightgrey;
}

p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
}
p, button, label, select, input {
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 13px;
	font-weight: bold;
}
label {
  color : black;
  background: #EFEFEF;
}
#end_de, #im_code {
  height: 35px;
  border: 2px solid lightgrey;
  border-radius: 5px;
}
.fileInput {
  height: 80px;
  overflow-y : scroll;
  font-size: 12px;
}
.form-group {
  margin-top : 0;
}
#fbutton{
background: #EFEFEF;
border: 2px solid #EFEFEF;
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
	  				<p class="title-p">업무 지시 등록</p>
	  				<input id="fbutton" style="display: inline; width: 20px; vertical-align: bottom;" type="button" onclick="insertF()">
	  			</div>
	  		</div>
	  	</div>
	</section>
	   <!-- Main content -->
    <section class="content container-fluid" id="content">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width:960px;">
				<div class="card-outline">
					
					<div class="card-body pad" style="min-height:700px">
						<button type="button" class="btn btn-regist2" onclick="referrer111();">업무 담당자 지정</button>
						<span class="col-md-6" id="refff">
						</span>
						<div id="sel_referrer" >
							<header>
								<p>담당자 지정</p>
					<!-- 			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg" aria-hidden="false"></i></a> -->
							</header>
							
							
							<div class="container-div">
							
								
									<div class="wrapper">
									    <div class="container-fluid">
									  		<div class=row>
										
												<div class="col-md-5">
													<input type="text" id="input-search2" placeholder="임직원 검색" > 
													<br/>
													<div class="form_1">
														<div id="Treecontainer2">
															
														</div>
													</div>
												</div>
												
												<div class="col-md-2" style="text-align:center; margin-top:130px;">
					<!-- 								<button class="btn btn-basic" type="button" onclick=""> -->
					<!-- 								  <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> -->
					<!-- 								</button> -->
					<!-- 								<br/><br/> -->
					<!-- 								<button class="btn btn-basic" type="button" onclick=""> -->
					<!-- 								  <i class="fa fa-arrow-circle-left" aria-hidden="true"></i> -->
					<!-- 								</button> -->
												</div>
												
												<div class="col-md-5">
												  	<!-- <i class="fa fa-caret-square-o-up fa-lg" aria-hidden="true" onclick="sanctnerUP()"></i>
								  					<i class="fa fa-caret-square-o-down fa-lg" aria-hidden="true" onclick="sanctnerDOWN()"></i> -->
													  &nbsp;&nbsp;
													<button class="btn btn-basic2" type="button" onclick="">
													  <i class="fa fa-hand-pointer-o fa-xs" aria-hidden="true"></i>
													  <span>담당자 선택</span>
													</button>
												  	<button class="btn btn-basic2" type="button" onclick="">
												  	  <i class="fa fa-star fa-xs" aria-hidden="true"></i>
													  <span>저장</span>
													</button>
													
													<div class="form_2">
														<div id="selectedContainer">
															
															
														</div>
													</div>
													
												</div> <!-- ./col-md-5 -->
										
								 		 	</div>
								    	</div>
									</div>
								
							</div>
							
							<div class="container-footer">
								<button class="btn btn-regist" type="button" onclick="goRegReferrer();">
								  <p>확인</p>
								</button>
								<button class="btn btn-cancle modal_close_btn" type="button" onclick="">
								  취소
								</button>
							</div>
							
							
						</div>
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<input type="hidden" id="drctr_empno" readonly name="drctr_empno" class="form-control" value="${loginUser.empno }">
							<input type="hidden" id="emp_nm" readonly name="emp_nm" class="form-control" value="${loginUser.nm }">
							<input type="hidden" name="jrcv" id="jrcv" />
							
							<div style="float: left; width: 20%;">
								<label for="im_code">중요도</label>
								<select id="im_code" name="im_code">
									<option value="낮음">낮음</option>
									<option value="보통">보통</option>
									<option value="긴급">긴급</option>
								</select>
							</div>
							<div style="float: left; width: 40%;">
								<label for="end_de">업무 기한</label>
								<input type="date" name="end_de" id="end_de">
							</div>
							<div style="float: left; width: 100%; min-height:50px">
								<label for="sj">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label> 
								<input type="text" id="sj"
									name="sj" class="form-control" placeholder="제목을 입력하세요">
							</div>
							<div class="form-group" style="float:left; width:100%">								
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
					<div>
						<div style="text-align: center; margin-bottom: 10px;">
							<button type="button" class="btn btn-regist" id="registBtn" onclick="regist_go();">등 록</button>
							<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->

  </div> 
  
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>

  
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function modal(id) {
	var zIndex = 0;
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
			.find('.modal_close_btn').on('click', function() {
				bg.remove();
				modal.hide();
				$('#selectedContainer').empty();
				$('#selectedContainer2').empty();
			});
	
	}
function referrer111(){
	modal('sel_referrer');
}
function selfRemove(el) {
	  var element = el;
	  element.remove();
	}

function selectme(el){
	
	$('.sanctner').removeAttr("style");
	$('.sanctner').removeAttr('sme');
	
	
	el.setAttribute('sme', 'selected')
	el.style.color='blue';
	
}
function goRegReferrer(){
	var modal = $('#sel_referrer');
	var going = document.querySelectorAll('.reff');
// 	console.log(going[0].getAttribute('id'));
 //	console.log(going[0].innerText);
	
	$('#refff').empty();
    $('#jrcv').val("");

	for(var i =0; i < going.length; i++){
		var sid = going[i].getAttribute('id');
		$('#refff').append(going[i].innerText+",");
	    $('#jrcv').val($('#jrcv').val()+sid+",");
	}
	
    
    $('#bg').remove();
    modal.hide();
}

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

		  var ap = document.getElementById('selectedContainer');
		  var apcount = ap.childElementCount;
		  var apc = apcount+1
		  
		
		  
		  var uid = <%=empno%>
		  
	      
	      var matches = document.querySelectorAll('.reff');
	      
	      if(matches.length > 0){
		          for (var i=0; i<matches.length; i++) {
		        	  if(matches[i].getAttribute('id') == suggestion.data){
		        		  swal('이미 지정된 사람입니다.');		        		
		        		  return;
		        	  }else if(suggestion.data == uid){
		        		  swal('본인은 지정할 수 없습니다.');		        		
		        		  return;
		        	  }
		        	}
	      }
	      
	      
	      if(apc == 4){
        	 swal('담당자 지정은 최대 3명까지 지정가능합니다.')
          }
          else{
	          var show = "<span class='reff' onclick='selectme(this)' ondblclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>";
	       	  $('#selectedContainer').append(show);
          }
		
		
	    }
	  });
</script>

<script>
//
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
		
    	$('#Treecontainer2').jstree({ 
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
	 
    	
          
	      $('#Treecontainer2').bind("select_node.jstree", function (NODE, REF_NODE) {
	    	  var ap = document.getElementById('selectedContainer');
	    	  var apcount = ap.childElementCount;
	    	  var apc = apcount+1
	    	  
	    	  
	    	  var uid = <%=empno%>
	    	  console.log(uid);
// 	    	  var userCheck = uid.getAttribute('empno');
// 	    	  console.log(userCheck);
	    	  
	          var a = $('#Treecontainer2').jstree('get_selected',true)
	          if(a[0].id.indexOf('B') == -1 && a[0].id.indexOf('GW') == -1 ){
		          
	          var sp = a[0].text.split("/")
                console.log(sp[0]); //이름
                console.log(sp[1]); //부서
                console.log(sp[2]); //직책
                
            	var uclsf = "<c:out value='${loginUser.clsf_code}'/>";
            	var udept = "<c:out value='${loginUser.dept_code}'/>";
            	
                console.log(parseInt(uclsf.substring(1,9999))); //유저직급
                console.log(parseInt(udept.substring(1,9999))); //유저부서
                
                uclsf = parseInt(uclsf.substring(1,9999));
                udept = parseInt(udept.substring(1,9999));
                
				var matches = document.querySelectorAll('.reff');
				
				if(matches.length > 0){
					for (var i=0; i<matches.length; i++) {
						if(matches[i].getAttribute('id') == a[0].id){
							swal('이미 지정된 사람입니다.');		        		
							return;
						}else if(a[0].id == uid){
							swal('자기자신은 지정할 수 없습니다.');		        		
							return;
						}
					}
				}
                
	          if(apc == 4){
	        	  swal('담당자 지정은 최대 3명까지 지정가능합니다.')
	          }
	          else{
		          var show = "<span class='reff' onclick='selectme(this)' ondblclick='selfRemove(this)' name='saveReff' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";
		       	  $('#selectedContainer').append(show);
	          }
          }
      });
	
}


</script>

<script>
function insertF(){
	  var sj1 = $('input[name="sj"]');

	  var text = "프로젝트 게시판";
	  
	  sj1.val(text);
	  $('#cn').summernote('insertText', '프로젝트 게시판입니다.');
	  document.getElementById("end_de").value = "2021-11-25";
}
function addFile_go(){
//		alert("add file btn");

	if($('input[name="uploadFile"]').length >= 5){ //선택자가 동일한 ㅁ ㅏ크업이있으면 제이쿼리는 배열로 가져온다... 그리고 이건 태그갯수확인
		swal("파일추가는 5개까지만 가능합니다.");
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
			swal("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	
	if($("input[name='sj']").val()==""){ //form.title.value
		swal("제목은 필수입니다.");
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
		
	
	document.registForm.submit();
	
	
}

</script>



</body>

    
    
    
    