<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
</c:set>
<c:set var="dbxList" value="${dataMap.dbxList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="dbxAllList" value="${dataMap.dbxAllList }" />

<head>
<!-- notice_registForm.css -->
<%
	OrgnztEmpMngtVO empvo = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
	int empno = empvo.getEmpno();
%>
<%
session.setAttribute("path", request.getContextPath() + "/document/public/share");
%>
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.css">

<!-- notice_registForm.css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/notice_registForm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/notice.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/document/share.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style>
.notShareBtn {
	background: #EFEFEF;
	color: #556278;
	border: 2px solid #EFEFEF;
	cursor: default;
}

.notShareBtn:hover {
	background: #EFEFEF;
	color: #556278;
	border: 2px solid #EFEFEF;
	cursor: default;
}
.btn-cancle, .btn-regist  {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  height: 37px;
}
</style>
</head>

<body>

	<!-- ==================================================================================== -->
	<div id="share_doc">
		<header>
			<p>공유할 문서</p>
			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg"
				aria-hidden="false"></i></a>
		</header>


		<div class="container-div" style="height:300px; overflow-y:scroll;">

			<form name="chxForm" action="modalDoc.do" method="POST">

				<div class="wrapper" >

					<table class="table text-center">
						<tr>
							<th style="width: 8%;"></th>
							<th style="width: 8%;">번 호</th>
							<th>제 목</th>
							<th style="width: 15%;">첨부파일</th>
							<th style="width: 15%;">구분</th>
						</tr>
						<c:if test="${empty dbxAllList }">
							<tr>
								<td colspan="5"><br />
								<br />
								<br />
								<br />
								<br /> <i class="fa fa-times fa-2x" aria-hidden="true"></i><br />
								<br /> <p>공유할 문서가 없습니다.</p></td>
							</tr>
						</c:if>
						<c:if test="${not empty dbxAllList }">
							<c:forEach items="${dbxAllList}" var="dbxAll">
<%-- 							  <c:if test="${dbxAll.empno eq loginUser.empno }"> --%>
								<tr style='font-size: 0.85em;'>
									<td><input type="checkbox" name="chx"
										value="${dbxAll.dbx_no}"></td>
									<td>${fn:substring(dbxAll.dbx_no,4,1000000000) }</td>
									<td id="modal_boardTitle"><span class="col-sm-12">${dbxAll.sj}</span>
									</td>
									<td></td>
							  	<c:if test="${dbxAll.dbx_se eq 'E001'}">
									<td style="color:blue">개인</td>
							  	</c:if>
							  	<c:if test="${dbxAll.dbx_se eq 'E002'}">
									<td style="color:tomato">공유</td>
							  	</c:if>
								</tr>
<%-- 							  </c:if> --%>
							</c:forEach>
						</c:if>
					</table>

				</div>
				
			</form>


		</div>

		<div class="container-footer">
			<button class="btn btn-regist docModal" type="button"
				onclick="modalDoc_go()">
				<p>확인</p>
			</button>
			<button class="btn btn-cancle docModal" type="button">취소</button>
		</div>


	</div>
	<!-- ==================================================================================== -->
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
									<i class="fa fa-star fa-xs" aria-hidden="true"></i> <span>즐겨찾는
										주소록 </span>
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
	<!-- ==================================================================================== -->
	<div class="pop-container" style="min-width: 800px;">
		<!-- Main content -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<i class="fa fa-share-alt-square fa-2x" aria-hidden="true" style="vertical-align: middle;" ></i>&nbsp;
						&nbsp;
						<p class="title-p">공유하기</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-12" style="max-width: 960px;">
					<div class="card-outline">

						<div class="card-body pad">
							<div class="share-doc-div">
								<button type="button" class="btn btn-regist" id="shareDocBtn"
									onclick="sanctner();">
									<i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;공유할
									문서
								</button>
							</div>

							<br />
							<br />
							
							<form enctype="multipart/form-data" role="form" method="post"
								action="" name="">
								<input type="hidden" id="empno" readonly name="empno"
									class="form-control" value="${loginUser.empno }">
								<div class="scroll-div">
									<table class="table text-center" id="docTable">
										<tr>
											<th style="width: 8%;">번 호</th>
											<th style="width: 45%;">제 목</th>
											<th style="width: 10%;">구분</th>
											<th style="width: 15%;">작성자</th>
											<th style="width: 10%;">비고</th>
										</tr>

										<!-- handlebars 들어올 자리 -->
										<tr class="noList">
											<td colspan="5"><br />
											<br /> <i class="fa fa-times fa-2x" aria-hidden="true"></i><br />
											<br /> <p>공유할 문서가 없습니다.</p></td>
										</tr>

									</table>
								</div>

							</form>

							<br />
							<div class="share-doc-div">
								<button type="button" class="btn btn-regist" id="shareManBtn"
									onclick="shareManBtn();">
									<i class="fa fa-user-plus fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;공유할
									사람
								</button>
							</div>

							<br />
							<br />

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


						</div>
						<!--end card-body  -->

						<br />
						<br />

						<div class="card-header">
							<div style="text-align: center; margin-bottom: 20px;">
								<button type="button" class="btn btn-regist notShareBtn"
									id="notShareBtn">공유하기</button>

								<button type="button" class="btn btn-cancle" id="cancelBtn"
									onclick="CloseWindow();">취 소</button>
							</div>
						</div>
						<!--end card-header  -->


						<div class="card-footer" style="display: none"></div>
						<!--end card-footer  -->
					</div>
					<!-- end card -->
				</div>
				<!-- end col-md-12 -->
			</div>
			<!-- end row -->
		</section>
		<!-- /.content -->

	</div>

	<!-- ==================================================================================== -->
	<%@ include file="/WEB-INF/views/common/summernote.jsp"%>
	<!-- ==================================================================================== -->
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

</script>
	<!-- ==================================================================================== -->
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
function sanctner(){
	modal("share_doc");
}
function shareManBtn(){
	var dt = document.getElementById('docTable');
	var dtCount = dt.childElementCount;
 		 if(dtCount == 1){ 
			window.alert('공유할 문서를 먼저 선택하세요.');
			return;
 	 } 
  	console.log(dtCount);
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
	<!-- ==================================================================================== -->
	<script>

</script>
	<!-- ==================================================================================== -->
	<!-- handlebars  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script type="text/x-handlebars-template" id="modalDoc-list-template">
 {{#each .}}

 		<tr style='font-size:0.85em;' class="noList" id="elem1">
			<td>{{#dbxNum dbx_no}}{{/dbxNum}}</td>
			
			<td id="modal_boardTitle" >
				<span class="col-sm-12">{{sj}}</span>
			</td>
			<td>{{#dbxSe dbx_se}}{{/dbxSe}}</td>
			<td>{{emp_nm}}</td>							
			<td>
				<button type="button" class="btn btn-remove removeBtn" 
						onclick="">삭제</button>
			</td>		
		</tr>

 {{/each}}
</script>

<script>

Handlebars.registerHelper({
	"dbxNum" : function(dbx_no){
           return dbx_no.substr(4,100000000);
        },
	"dbxSe" : function(dbx_se){
		 if (dbx_se == 'E001') {
	         return "개인";
	      }else if (dbx_se == 'E002'){
	         return "공유";
	      } else {
	    	  return dbx_se;
	      }
        }
});

//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass){
	
	var template=Handlebars.compile(templateObject.html());
	

	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}

function remClass(data){
	$(data).remove();	
}

function modalDoc_go(){
	
	var docArr = [];
	
	$("input:checkbox[name=chx]:checked").each(function(){
		
		// checked 된 input의 dbx_no 가져오기
		var chxNum = $(this).val();
 		// console.log(chxNum);
		
		docArr.push(chxNum); // 배열에 담음
	});
	
	// 배열 저장
	var obj = {
			"docList" : docArr
	};
	
	
	// 데이터 출력 확인용 변수
	var doc_chk = 0;
	var man_chk = 0;
	
	// ajax 호출
	$.ajax({
		url			: "<%=request.getContextPath()%>/document/public/modalDoc",
		dataType	: "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type		: "post",
		data		: obj,
		success		: function(data){
			printData(data,$('#docTable'),$('#modalDoc-list-template'),'.noList');
			
			doc_chk = 1;
			
			if (document.getElementById('elem2')) {
				man_chk = 1;
				console.log("man_chk : " + man_chk);
				console.log("doc_chk : " + doc_chk);
			} else {
				man_chk = 0;
				console.log("man_chk : " + man_chk);
				console.log("doc_chk : " + doc_chk);
			}
			
			if (doc_chk + man_chk == 2) {
				check();
			}
		},
		error		: function(request, status, error){
			console.log("docAjax_error!!!");
		}
	});
	
}

//공유하기 버튼 활성화
function check(){
   
   $('#notShareBtn').attr("onclick" , "share_go();");
   $('#notShareBtn').attr("class" , "btn btn-regist");
//    $('#notShareBtn').attr("id" , "");
}

</script>
	<!-- ==================================================================================== -->
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
		
	
	// 데이터 출력 확인용 변수
	var doc_chk = 0;
	var man_chk = 0;
	
	if (document.getElementById('elem2')) {
		man_chk = 1;
	} else {
		man_chk = 0;
		$('#notShareBtn').attr("onclick" , "1");
	}	
	
	if (document.getElementById('elem1')) {
		doc_chk = 1;
			console.log("doc_chk : " + doc_chk);
			console.log("man_chk : " + man_chk);
	} else {
		doc_chk = 0;
			console.log("doc_chk : " + doc_chk);
			console.log("man_chk : " + man_chk);
	}
	
	if (doc_chk + man_chk == 2) {
		check();
	}
}
</script>

    <form role="form" id="shareForm">
		<input id="doc_input" type="hidden" name="dbx_no" />
		<input id="man_input" type="hidden" name="rcvr_empno" />
		<input type="hidden" name="cocnr_nm" value="${loginUser.nm }"/>
		<input type="hidden" name="cocnr_empno" value="${loginUser.empno}" />
		
	</form>

<script>
function share_go(){
	
    var shareForm = $("#shareForm");
	
	$("input:checkbox[name=chx]:checked").each(function(){
		
		// checked 된 input의 dbx_no 가져오기
		var chxNum = $(this).val();
 		console.log("chxNum1" + chxNum);
		
    	shareForm.find("[name='dbx_no']").val($("#doc_input").val()+chxNum+",");
	});

//============================================================================

	var ap = document.querySelectorAll('.sanctner');
	
    for (var i=0; i<ap.length; i++) {
		var sid = ap[i].getAttribute('id');  
		console.log("sid" + sid);

    	shareForm.find("[name='rcvr_empno']").val($("#man_input").val()+sid+",");
    }
	
//     alert($("#doc_input").val());
//     alert($("#man_input").val());
    shareForm.attr({
    	action:"share.do",
	    method:'post'
    }).submit();
    
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
<script>
function list_go3(page,url){
	if(!url) url="shareForm.do";
	
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




