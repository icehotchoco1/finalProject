<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.gw.dto.EccstSanctnMngtVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<!-- notice_registForm.css -->
  <%OrgnztEmpMngtVO empvo =  (OrgnztEmpMngtVO)session.getAttribute("loginUser");
	   int empno = empvo.getEmpno();
	   
	   Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		
		String nowDate = sf.format(nowTime);
	   
		
		EccstSanctnMngtVO regEccstVO = (EccstSanctnMngtVO)request.getAttribute("esc");
		
		Date RegDate = regEccstVO.getRgsde();
		
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");

		String regDateSL = format.format(RegDate);

	   %>
	 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/eccstRgForm_registForm.css">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
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
#rejecReason {
	display: none;
	width: 350px;
	height: 250px;
	padding: 0;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
.container-div {
  height: 170px;
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
  height: 150px;
  width : 220px;
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
</style>

<style>
td {
  font-size: 13px;
}
.form-table9-tr-2{
	height : 70px;
	width: 70px;
}
</style>
</head>

<body>

<c:set var="nowemp" value="<%=empno %>"/>
  <div id="rejecReason" >
		<header>
			<p>반려사유입력</p>
<!-- 			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg" aria-hidden="false"></i></a> -->
		</header>
		
		
		<div class="container-div">
				    <div class="container-fluid">
						<textarea id="RRson" rows="4" cols="35"></textarea>
			    	</div>
				
			<div class="container-footer">
				<button class="btn btn-regist modal_chk_btn1" type="button" onclick="goReject();">
				  <p>확인</p>
				</button>
				<button class="btn btn-cancle modal_close_btn" type="button" onclick="">
				  취소
				</button>
			</div>
		</div>
		
		
		
	</div>
	
	
	
	
	

	${style}
  <!-- Content Wrapper. Contains page content -->
  <div class="pop-container" style="min-width:800px;  margin-left: 25px; ">
  	<div>
		<div class="form-box">
			<div class="form-box-header">
 				<button type="button" class="form-btn close-btn" onclick="go_exit();">닫기</button>
 				 <c:forEach items="${sanctners}" var="sc" varStatus="status">
		 	          <c:forEach items="${sncDetail}" var="scd" varStatus="status2">
		 				<c:if test="${scd.sanctn_sttus eq 'L001' and scd.sanctner_empno eq loginUser.empno and status.index eq status2.index}">
			 				<button type="button" class="form-btn close-btn" onclick="rejectGO();">반려</button>
			 				<button type="button" class="form-btn close-btn" onclick="approveGO();">승인</button>
		 				</c:if>
		 				<c:if test="${scd.sanctn_sttus eq 'L001' and scd.replace_empno eq loginUser.empno and status.index eq status2.index}">
			 				<button type="button" class="form-btn close-btn" onclick="reprejectGO();">반려</button>
			 				<button type="button" class="form-btn close-btn" onclick="repapproveGO();">승인</button>
		 				</c:if>
		 			</c:forEach>
		 		</c:forEach>
 				<c:if test="${chckCn eq 1 and nowemp eq esc.empno }">
	 				<button type="button" class="form-btn close-btn" onclick="cancelEccst('${esc.sanctn_no}');">결재취소</button> 
 				</c:if> 
<!--  				<button type="button" class="form-btn basic-btn" onclick="referrer111();">참조자지정</button>  -->
<!--  				<button type="button" class="form-btn basic-btn" onclick="sanctner();">결재선지정</button>  -->
<!--  				<button type="button" class="form-btn basic-btn" onclick="sanctnModi_go('G004');">임시저장</button>  -->
<!--  				<button type="button" class="form-btn request-btn" onclick="sanctnModi_go('G001');">결재요청</button>  -->
			</div>
			
<!-- 			 <div class="form-box-body"> -->
<!-- 				<div class="form-box-body-header"> -->
 <!-- 					<button type="button" class="form-btn star" onclick="">참조자 즐겨찾기</button> --> 
 <!-- 					<button type="button" class="form-btn star" onclick="">자주 쓰는 결재선</button> --> 
<!-- 			    </div> -->
				
				 <table class="form-table1">
			        <tr id="form-table1-first-tr">
			          <td id="form-table1-first-td">${formNm}</td> 
			          <td>
			          		<table class="form-table2">
			          		  <tr>
			          		    <td class="form-table2-th" rowspan="4">
			          		    결<br/>재<br/>선
			          		    </td>
			          		  </tr>
			          		  <tr class="form-table2-tr-1">
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td></td> -->
			          		  </tr>
			          		  <tr class="form-table2-tr-2">
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td></td> -->
			          		  </tr>
			          		  <tr class="form-table2-tr-3">
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td class="td-border"></td> -->
<!-- 			          		    <td></td> -->
			          		  </tr>
			          		  <c:if test="${not empty repSanc }">
				          		  <tr class="form-table9-tr-1">
				          		  	<td rowspan="4" class="form-table2-th">
				          		  		    대<br/>결<br/>자
				          		  	</td>
				          		  	<td></td>
				          		  </tr>
				          		  <tr class="form-table9-tr-2">
				          		  	<td></td>
				          		  </tr>
				          		  <tr class="form-table9-tr-3">
				          		  	<td></td>
				          		  </tr>
			          		  </c:if>
			          		</table>
			          </td>

			        </tr>
			      </table>
			
				      
				      <table class="form-table3">
				        <tr>
				          <td class="form-table3-th">기안부서</td>
				          <td class="userDept"></td>
				          <td class="form-table3-th">기안자</td>
				          <td class="userName"></td>
				          <td class="form-table3-th">기안일자</td>
				          <td>
				         	 <fmt:formatDate value="${esc.rgsde }" pattern="yyyy-MM-dd"/>
				          </td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">보존기한</td>
				          <td id="prsrv">${esc.prsrv_pd }</td>
				          <td class="form-table3-th">문서번호</td>
				          <td>${fn:substring(esc.sanctn_no,4,99999) }</td>
				          <td class="form-table3-th">보안수준</td>
				          <td id="scrty">${esc.scrty_grad }</td>
				        </tr>
				        <tr>
				        	<td class="form-table3-th">결재기한</td>
				        	<td colspan="2">
				        		<c:if test="${not empty esc.sanctn_tmlmt }">
					        		<fmt:formatDate value="${esc.sanctn_tmlmt }" pattern="yyyy-MM-dd"/>
				        		</c:if>
				        		<c:if test="${empty esc.sanctn_tmlmt }">
				        			없음
				        		</c:if>
				        	</td>
				        	<td class="form-table3-th">중요도</td>
				        	<td colspan="2" id="ipcrrrr">
								
				        	</td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">참조자</td>
				          <td colspan="5" id="refff"></td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">제목</td>
				          <td colspan="5">
				            <input type="text" class="form-box-input" id="form-box-title" name="sj" value="${esc.sj }">
				          </td>
				        </tr>
				      </table>
				      
				      
				      
			      	<c:if test="${not empty esc.return_reason }">
					      <div>
					      		<div>
										<c:forEach items="${sanctners }" var="sc" varStatus="status">
												<c:forEach items="${sancdtl }" var="scd" varStatus="status2">
									      			<table class="form-table3">
													<c:if test="${scd.sanctn_sttus eq 'L003' and status.index eq status2.index}">
									      				<tr>
									      					<td class="form-table3-th">
									      						반려자 
									      					</td>
									      					<td style="width : 675px;">
									      						${scd.sanctner_nm }
									      					</td>
									      				</tr>
									      				<tr>
									      					<td class="form-table3-th">
									      						반려사유
									      					</td>
									      					<td style="height : 100px; vertical-align: baseline;">
									      						${esc.return_reason }
									      					</td>
									      				</tr>
														</c:if>					
									      			</table>
												</c:forEach>
											</c:forEach>
					      		</div>
					      </div>
			      	</c:if>
				      
				      <form action="sancHandle.do" method="post" id="sancGoForm">
				      	<input type="hidden" name="sanctn_code" id="sanc_code"/>
				      	<input type="hidden" name="snerEmpno" value="${loginUser.empno }"/>
				      	<input type="hidden" name="sanc_no" value="${esc.sanctn_no }"/>
				      	<input type="hidden" name="repCheck" value="N"/>
				      	<input type="hidden" name="erf1val" value="N"/>
				      	<input type="hidden" name="yearVacval" value="N"/>
				      	<textarea style="display: none;" name="ReturnReason" id="returnReason"></textarea>
				      	
				      </form>
				      
				      <div id="cngo">
					  	${esc.cn}
				      </div>
					      
			  
  
							<c:if test="${fileatc_at eq '1'}">			  	      
						      <table class="form-table4">
						        <tr class="form-box-file">
						          <td class="form-table4-th"> 첨부파일 <br/>
						          </td>
						          <td style="width: 677px;" id="Files">
						          		<ul style="list-style:none; padding-left:0px;">
											<c:forEach items="${esc.atchList }" var="atch" >
												<li class="attach-item">																			
													<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${atch.file_nm }" attach-no="${atch.file_no }" href="<%=request.getContextPath()%>/approval/ddbox/getFile.do?file_no=${atch.file_no }">													
														<i class="fas fa-paperclip"></i>
															${atch.file_nm }&nbsp;&nbsp;
														<button type="button" style="border:0;outline:0;" class="badge bg-red">X</button>																									
													</a>
												</li>	
											</c:forEach>
										</ul>
						          </td>
						        </tr>
						      </table>
						      </c:if>
				
				   <div class="form-box-last">
							<input class="form-btn" type="button" value="TOP" onClick="javascript:window.scrollTo(0,0)" style="text-align: center;" />
				      	<br/>
				      </div>
				      <br/>
				
						 
			 </div>
		</div>  
  	</div>
  	
  </div>
  
  
  
  
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>


  
<script>


// $(document).on("click", "#approveBtn", function() {
// 	$('input[name="sanctn_code"]').val('L004');

	
// 	var form = $('#sancGoForm');
// 	 form=form.get(0);
//     form.submit();
// });

// $(document).on("click", "#rejectBtn", function() {
//     modal('rejecReason');
// });

function approveGO(){
	$('input[name="sanctn_code"]').val('L004');
	
	//시차출퇴근제용
// 	<c:if test="${esc.form_no eq 'erf1'}">
// 		var a = $('.selectedDate').text();
// 		console.log(a);
// 	</c:if>
	
	if($('.vacSum').text() != 'undefined' || $('.vacSum').text() != ''){
		$('input[name="yearVacval"]').val($('.vacSum').text());
	}
	
	var form = $('#sancGoForm');
	 form=form.get(0);
    form.submit();
	
}
function repapproveGO(){
	$('input[name="sanctn_code"]').val('L004');
	$('input[name="repCheck"]').val('Y');
	
	
	var form = $('#sancGoForm');
	 form=form.get(0);
    form.submit();
	
}

function rejectGO(){
	modal('rejecReason');
}
function reprejectGO(){
	$('input[name="repCheck"]').val('Y');
	modal('rejecReason');
}


function goReject(){
	$('input[name="sanctn_code"]').val('L003');
	var cn = $('#RRson').val();
	$('textarea[name="ReturnReason"]').val(cn);
	
// 	console.log(cn);
// 	console.log($('textarea[name="ReturnReason"]').val());
	var form = $('#sancGoForm');

	 form=form.get(0);
   form.submit();
}


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


function go_exit(){
	window.opener.location.reload();
	CloseWindow();
}
function cancelEccst(param){
	
	var con = confirm("정말로 취소하시겠습니까?");
	if(con == true){
		location.href="<%=request.getContextPath()%>/approval/ddbox/changeSttus.do?sanctn_no="+param
	}else{
		return;
	}
	
}  
</script>



<script>
window.onload=function(){
		var nm = '<c:out value="${regEmp.nm}"/>'; //기안자 이름
		var empno = '<c:out value="${regEmp.empno}"/>'; //기안자사번
		var empnm = '<c:out value="${loginUser.nm}"/>'; //록인유저 이름
		var luserno = '<c:out value="${loginUser.empno}"/>'; //록인유저 이름
		var uclsf = '<c:out value="${regEmp.clsf_code}"/>'; //기안자 직급
		var phone = '<c:out value="${regEmp.cttpc}"/>'; //록인유저전번
		var scr = '<c:out value="${esc.ipcr_code }"/>'
		
		if(scr == 'H001'){
			scr = '낮음';
		}else if(scr == 'H002'){
			scr = '보통';
		}else if(scr == 'H003'){
			scr = '높음';
		}else if(scr == 'H004'){
			scr = '긴급';
		}
		
		
		if(phone.length < 13){
			var a = phone.substring(0,3);
			var b = phone.substring(3,7);
			var c = phone.substring(7,11);
			
			phone = a+"-"+b+"-"+c
		}
		
// 		if(uclsf == 'C001'){
// 			uclsf = '사원';
// 		}else if(uclsf == 'C002'){
// 			uclsf = '대리';
// 		}else if(uclsf == 'C003'){
// 			uclsf = '기사';
// 		}else if(uclsf == 'C004'){
// 			uclsf = '계장';
// 		}else if(uclsf == 'C005'){
// 			uclsf = '과장';
// 		}else if(uclsf == 'C006'){
// 			uclsf = '차장';
// 		}else if(uclsf == 'C007'){
// 			uclsf = '팀장';
// 		}else if(uclsf == 'C008'){
// 			uclsf = '부장';
// 		}else if(uclsf == 'C009'){
// 			uclsf = '이사';
// 		}else if(uclsf == 'C010'){
// 			uclsf = '이사장';
// 		}else if(uclsf == 'C011'){
// 			uclsf = '사장';
// 		}else{
// 			uclsf = '회장';
// 		}
	    
		var dept = '<c:out value="${regEmp.dept_code}"/>';
		
		if(dept == 'B001'){
			dept="경리부";
		}else if(dept='B002'){
			dept="사업부"
		}else if(dept='B003'){
			dept="시설관리부"
		}else if(dept='B004'){
			dept="인사부"
		}else if(dept='B005'){
			dept="홍보부"
		}else{
			dept="임원"
		}
		
		
		//결재양식파라미터 넣기//
		$(".userName").text(nm);
		$(".userNum").text(empno);
		$(".userClsf").text(uclsf);
		$(".userDept").text(dept);
		$("#ipcrrrr").text(scr);
		
		//근태신청서 날짜
		if($('.selectedDate').length > 0){
			if($('.selectedDate').val() != ""){
				var data = '<c:out value="${selDate}"/>';
				$(".selectedDate").text(data);
			}
		}
	      
	      
          <c:forEach items="${sanctners}" var="sc" varStatus="status">
          	  if(${status.index} == 0){
		       	  var userDeptVar = "<td class='td-border'>"+uclsf+"</td>";
		 	      var temp03 = "<td class='td-border' sid='"+empno+"'></br>";
		 	      var UsernmVar = "<td class='td-border'>"+nm+"</td>";
		 	      $('.form-table2-tr-1').append(userDeptVar);
		 	      $('.form-table2-tr-2').append(temp03);
		 	      $('.form-table2-tr-3').append(UsernmVar);
          	  }
          	  
          	  
		          var scnersshow = "<span class='sanctner LN${status.index+1}' line='${status.index+1}' name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='${sc.empno}'>${sc.nm}/${sc.dept_code}/${sc.clsf_code}<br/></span>";
		       	  $('#selectedContainer').append(scnersshow);
		       	  
	          <c:forEach items="${sncDetail}" var="scd" varStatus="status2">
		 	     <c:if test="${scd.sanctn_sttus eq 'L001' and scd.sanctner_empno eq loginUser.empno and status.index eq status2.index}">
			       	  var depttd = "<td class='td-border'>${sc.clsf_code}</td>";
// 		 		      var temp02 = "<td class='td-border' sid='${sc.empno}' style='text-align:center;'><input type='button' id='approveBtn' value='승인'/></br><input type='button' id='rejectBtn' value='반려'/></td>";
		 		      var temp02 = "<td class='td-border' sid='${sc.empno}' style='text-align:center;'></td>";
		 	    	  var snctnm = "<td class='td-border'>${sc.nm}</td>";
		 	      	$('.form-table2-tr-1').append(depttd);
		 	      	$('.form-table2-tr-2').append(temp02);
		 	      	$('.form-table2-tr-3').append(snctnm);
				  </c:if>
		 	     <c:if test="${scd.sanctn_sttus eq 'L001' and scd.sanctner_empno ne loginUser.empno and status.index eq status2.index}">
			       	  var depttd = "<td class='td-border'>${sc.clsf_code}</td>";
		 		      var temp02 = "<td class='td-border' sid='${sc.empno}'><br/></td>";
		 	    	  var snctnm = "<td class='td-border'>${sc.nm}</td>";
		 	      	$('.form-table2-tr-1').append(depttd);
		 	      	$('.form-table2-tr-2').append(temp02);
		 	      	$('.form-table2-tr-3').append(snctnm);
				  </c:if>
		 	     <c:if test="${scd.sanctn_sttus ne 'L001' and status.index eq status2.index}">
			       	  $('#selectedContainer').append(scnersshow);
			       	  var depttd = "<td class='td-border'>${sc.clsf_code}</td>";
		 		      var temp02 = "<td class='td-border' sid='${sc.empno}'></td>";
		 	    	  var snctnm = "<td class='td-border'>${sc.nm}</td>";
		 	      	$('.form-table2-tr-1').append(depttd);
		 	      	$('.form-table2-tr-2').append(temp02);
		 	      	$('.form-table2-tr-3').append(snctnm);
				  	$('#sanctners').val($('#sanctners').val()+"${sc.empno},");
				 </c:if>
		      </c:forEach>
		      
		  	$('#sanctners').val($('#sanctners').val()+"${sc.empno},");
	      </c:forEach>
		  
          <c:forEach items="${reff}" var="rf" varStatus="status">
	          var refsshow = "<span class='reff' onclick='selfRemove(this)' name='saveReff' id='${rf.empno}'>${rf.nm}/${rf.dept_code}/${rf.clsf_code}<br/></span>";
	       	  $('#selectedContainer2').append(refsshow);
		  		$('#refff').append("${rf.nm}/${rf.dept_code}/${rf.clsf_code},");
			    $('#refferers').val($('#refferers').val()+"${rf.empno},");
	      </c:forEach>
		  
	     var RegDate = '<c:out value="<%=regDateSL%>"/>'
	     var RdateTag = '<span style="font-size:8px;">기안:'+RegDate+'</span>'
	     
	     <c:if test="${not empty regEmp.sanctn_sign}">
		     var RegSign = '<c:out value="${regEmp.sanctn_sign }"/>'
		     var SignTag = '<img src="'+RegSign+'" alt="결재서명" style="width:70px; height:60px;">';
		     $('td[sid="'+empno+'"]').html(RdateTag+'<br/>'+SignTag);
	     </c:if>
		     
	     <c:if test="${empty regEmp.sanctn_sign}">
		     var SignTag = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/reg.png" alt="결재서명" style="width:70px; height:60px;">';
		     $('td[sid="'+empno+'"]').html(RdateTag+'<br/>'+SignTag);
		</c:if>	
		
		
		
        <c:forEach items="${sncDetail}" var="snc" varStatus="status">
	        <c:forEach items="${sanctners}" var="sc" varStatus="status2">
			     <c:if test="${snc.sanctn_sttus eq 'L004' and status.index eq status2.index}">
			     	 <c:if test="${snc.resanc_at eq 'Y'}">
			        	var Tag = '<span style="font-size:8px;">대결:${snc.sanctn_date }</span>'
			     	 </c:if>
			         <c:if test="${empty snc.resanc_at}">
			        	var Tag = '<span style="font-size:8px;">승인:${snc.sanctn_date }</span>'
			         </c:if>
			   	     <c:if test="${not empty sc.sanctn_sign and status.index eq status2.index}">
						var SignPic = '<c:out value="${sc.sanctn_sign }"/>'
						var Sign = '<img src="'+SignPic+'" alt="결재서명" style="width:70px; height:60px;">';
					 </c:if>
			     	<c:if test="${empty sc.sanctn_sign and status.index eq status2.index and snc.resanc_at eq 'Y'}">
						var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/rep.png" alt="결재서명" style="width:70px; height:60px;">';
					</c:if>	
			     	<c:if test="${empty sc.sanctn_sign and status.index eq status2.index and empty snc.resanc_at}">
						var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/go.png" alt="결재서명" style="width:70px; height:60px;">';
					</c:if>	
					
					     $('td[sid="${snc.sanctner_empno}"]').html(Tag+'<br/>'+Sign);
				 </c:if>
			     <c:if test="${snc.sanctn_sttus eq 'L003' and status.index eq status2.index}">
				     <c:if test="${snc.resanc_at eq 'Y'}">
			        	var Tag = '<span style="font-size:8px;">대결:${snc.sanctn_date }</span>'
			     	 </c:if>
				     <c:if test="${empty snc.resanc_at}">
			        	var Tag = '<span style="font-size:8px;">반려:${snc.sanctn_date }</span>'
			     	 </c:if>
			   	     <c:if test="${not empty sc.sanctn_sign and status.index eq status2.index}">
						var SignPic = '<c:out value="${sc.sanctn_sign }"/>'
						var Sign = '<img src="'+SignPic+'" alt="결재서명" style="width:70px; height:60px;">';
					 </c:if>
			     	<c:if test="${empty sc.sanctn_sign }">
						var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/reject.png" alt="결재서명" style="width:70px; height:60px;">';
					</c:if>	
			     	<c:if test="${empty sc.sanctn_sign and snc.resanc_at eq 'Y'}">
						var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/rep.png" alt="결재서명" style="width:70px; height:60px;">';
					</c:if>	
			     	<c:if test="${empty sc.sanctn_sign and empty snc.resanc_at}">
						var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/reject.png" alt="결재서명" style="width:70px; height:60px;">';
					</c:if>	
					
					     $('td[sid="${snc.sanctner_empno}"]').html(Tag+'<br/>'+Sign);
				 </c:if>
		    </c:forEach>
	    </c:forEach>
	    
	    <c:if test="${repSanc != null}">
		    <c:forEach items="${repSanc}" var="re" varStatus="status">
		    	<c:if test="${empty re}">
		    	  var reclsf = "<td class='td-border'></td>";
	 		      var retemp = "<td class='td-border'></td>";
	 	    	  var renm = "<td class='td-border'></td>";
	    	 	$('.form-table9-tr-1').append(reclsf);
		      	$('.form-table9-tr-2').append(retemp);
		      	$('.form-table9-tr-3').append(renm);
		    	</c:if>
		    	<c:if test="${not empty re}">
		    	 var reclsf2 = "<td class='td-border'>${re.clsf_code}</td>";
			      var retemp2 = "<td class='td-border' rid='${re.empno}'><br/></td>";
		    	  var renm2 = "<td class='td-border'>${re.nm}</td>";
	    	 	$('.form-table9-tr-1').append(reclsf2);
		      	$('.form-table9-tr-2').append(retemp2);
		      	$('.form-table9-tr-3').append(renm2);
		    	</c:if>
		    </c:forEach>
	    </c:if>
	    
	    
	    <c:if test="${repSanc != null}">
	        <c:forEach items="${sncDetail}" var="snc2" varStatus="status">
			    <c:forEach items="${repSanc}" var="re" varStatus="status2">
				    <c:if test="${snc2.sanctn_sttus eq 'L004' and status.index eq status2.index}">
				    	<c:if test="${not empty re}">
			        		var Tag = '<span style="font-size:8px;">승인:${snc2.sanctn_date }</span>'
				    	</c:if>
				   	     <c:if test="${not empty re.sanctn_sign and status.index eq status2.index}">
							var SignPic = '<c:out value="${re.sanctn_sign }"/>'
							var Sign = '<img src="'+SignPic+'" alt="결재서명" style="width:70px; height:60px;">';
						 </c:if>
				     	<c:if test="${empty re.sanctn_sign and status.index eq status2.index}">
							var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/go.png" alt="결재서명" style="width:70px; height:60px;">';
						</c:if>	
						  $('td[rid="${snc2.replace_empno}"]').html(Tag+'<br/>'+Sign);
				    </c:if>
				     <c:if test="${snc2.sanctn_sttus eq 'L003' and status.index eq status2.index}">
				    	<c:if test="${not empty re}">
			        		var Tag = '<span style="font-size:8px;">반려:${snc2.sanctn_date }</span>'
				    	</c:if>
				   	     <c:if test="${not empty re.sanctn_sign and status.index eq status2.index}">
							var SignPic = '<c:out value="${re.sanctn_sign }"/>'
							var Sign = '<img src="'+SignPic+'" alt="결재서명" style="width:70px; height:60px;">';
						 </c:if>
				     	<c:if test="${empty re.sanctn_sign and status.index eq status2.index}">
							var Sign = '<img src="<%=request.getContextPath() %>/resources/BasicEccstSign/go.png" alt="결재서명" style="width:70px; height:60px;">';
						</c:if>	
						  $('td[rid="${snc2.replace_empno}"]').html(Tag+'<br/>'+Sign);
				    </c:if>
				</c:forEach>
		    </c:forEach>
	    </c:if>
	    
}
</script>

</body>

    
    
    