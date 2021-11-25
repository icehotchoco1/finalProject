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
  width : 230px;
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
  width: 230px;
  height: 27px;
  border: 2px solid #004680;
  border-radius: 3px;
  font-size: 13px;
  margin-bottom: 10px;
}
#input-search2 { 
	width: 230px; 
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
</style>
</head>

<body>

  <div id="sel_sanctner" >
		<header>
			<p>결재선 지정</p>
<!-- 			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg" aria-hidden="false"></i></a> -->
		</header>
		
		
		<div class="container-div">
		
			
				<div class="wrapper">
				    <div class="container-fluid">
				  		<div class=row>
					
							<div class="col-md-5">
								<input type="text" id="input-search" placeholder="임직원 검색"> 
								<br/>
								<div class="form_1">
									<div id="Treecontainer">
										
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
								  <i class="fa fa-caret-square-o-up fa-lg" aria-hidden="true" onclick="sanctnerUP()"></i>
								  <i class="fa fa-caret-square-o-down fa-lg" aria-hidden="true" onclick="sanctnerDOWN()"></i>
								  &nbsp;&nbsp;
								<button class="btn btn-basic2" type="button" onclick="selectSanctners()">
								  <i class="fa fa-hand-pointer-o fa-xs" aria-hidden="true"></i>
								  <span>결재선 선택</span>
								</button>
							  	<button class="btn btn-basic2" type="button" onclick="saveSanctners()">
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
			<button class="btn btn-regist modal_chk_btn1" type="button" onclick="goSanctnLine();">
			  <p>확인</p>
			</button>
			<button class="btn btn-cancle modal_close_btn" type="button" onclick="">
			  취소
			</button>
		</div>
		
		
	</div>
	

  <div id="sel_referrer" >
		<header>
			<p>참조자 지정</p>
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
<!-- 								  <i class="fa fa-caret-square-o-up fa-lg" aria-hidden="true"></i> -->
<!-- 								  <i class="fa fa-caret-square-o-down fa-lg" aria-hidden="true"></i> -->
								  &nbsp;&nbsp;
<!-- 								<button class="btn btn-basic2" type="button" onclick=""> -->
<!-- 								  <i class="fa fa-hand-pointer-o fa-xs" aria-hidden="true"></i> -->
<!-- 								  <span>참조자 선택</span> -->
<!-- 								</button> -->
<!-- 							  	<button class="btn btn-basic2" type="button" onclick=""> -->
<!-- 							  	  <i class="fa fa-star fa-xs" aria-hidden="true"></i> -->
<!-- 								  <span>저장</span> -->
<!-- 								</button>								     -->
								
								<div class="form_2">
									<div id="selectedContainer2">
										
										
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
	
	
	
	

	${style}
  <!-- Content Wrapper. Contains page content -->
  <div class="pop-container" style="min-width:800px;  margin-left: 25px; ">
  	<div>
		<div class="form-box">
			<div class="form-box-header">
				<button type="button" class="form-btn close-btn" onclick="go_exit();">닫기</button>
				<button type="button" class="form-btn basic-btn" onclick="referrer111();">참조자지정</button>
				<button type="button" class="form-btn basic-btn" onclick="sanctner();">결재선지정</button>
				<button type="button" class="form-btn basic-btn" onclick="sanctnModi_go('G004');">임시저장</button>
				<button type="button" class="form-btn request-btn" onclick="sanctnModi_go('G001');">결재요청</button>
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
				          <td><%=nowDate %></td>
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
				        	<td colspan="2"><input type="date" id="tmlmt" value="<fmt:formatDate value="${esc.sanctn_tmlmt }" pattern="yyyy-MM-dd"/>"/></td>
				        	<td class="form-table3-th">중요도</td>
				        	<td colspan="2">
						        <select name="ipcr" id="ipcr">
									<option value="H001" ${esc.ipcr_code eq 'H001' ? 'selected' : '' }>낮 음</option>
									<option value="H002" ${esc.ipcr_code eq 'H002' ? 'selected' : '' }>보 통</option>
									<option value="H003" ${esc.ipcr_code eq 'H003' ? 'selected' : '' }>높 음</option>
									<option value="H004" ${esc.ipcr_code eq 'H004' ? 'selected' : '' }>긴 급</option>
								</select>	
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
				      
				      
				      <div id="cngo">
					  	${esc.cn}
				      </div>
				  	  <form id="eccstSaveForm" enctype="multipart/form-data" method="POST" action="modify.do" role="form">
			  		      <input type="hidden" name="scno" id="scno" value="${esc.sanctn_no }" />
			  		      <input type="hidden" name="userNum" id="userNum" />
					      <input type="hidden" name="userNm" id="userNm" />
					      <input type="hidden" name="sanctners" id="sanctners" />
					      <input type="hidden" name="refferers" id="refferers" />
					      <input type="hidden" name="formNo" id="formNo" value="${esc.form_no }" />
					      <input type="hidden" name="formSj" id="formSj" />
					      <input type="hidden" name="scrty" id="scrtyGD" />
					      <input type="hidden" name="prsrv" id="prsrvDE" />
					      <input type="hidden" name="limit" id="limit" />
					      <input type="hidden" name="ipcr" id="ipcr" />
					      <input type="hidden" name="sttus" id="sttus" />
					      
					      
					      <textarea style="display: none;" name="cn" id="formCn"></textarea>
					      
					      
					      <input type="hidden" name="startDate" id="startDate" value="no"/>
					      <input type="hidden" name="endDate" id="endDate" value="no"/>
					      
			  
  
							<c:if test="${fileatc_at eq '1'}">			  	      
						      <table class="form-table4">
						        <tr class="form-box-file">
						          <td class="form-table4-th"> 첨부파일 <br/>
<!-- 						            <button type="button" class="file-add" onclick="addFile_go();" id="addFileBtn">add</button> -->
										<input type="file" name="uplFile" style="display:inline" multiple="multiple" id="upFiles"/>
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
									<span id="FileUp2">
									</span>
						          </td>
						        </tr>
						      </table>
						      </c:if>
				   </form>
				
				   <div class="form-box-last">
				      	<br/>
				      </div>
				      <br/>
				
						 
			 </div>
				
		</div>  
  	</div>
  	
  </div>
  
  
  
  
  <form id="saveSanctner">
<!--   	<input type = "hidden" name="saveSanc" value=""/> -->
  	<input type = "hidden" name="saveSancID" value=""/>
  	<input type = "hidden" name="erfID" value="${esc.form_no }"/>
  	<input type = "hidden" name="saver" value="<%=empno%>"/>
  </form>
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>


  
<script>
function go_exit(){
	window.opener.location.reload();
	CloseWindow();
}


function sanctnModi_go(status){
	
	var sj = $('input[name="sj"]').val();
	var cn = $('#cngo').html();
	var limit = $('#tmlmt').val();
	if(limit==""){
		limit = null;
	}
	var ipcr = $('#ipcr').val();
// 	console.log(limit);
// 	console.log(ipcr);
// 	console.log(cn);
// 	console.log(sj);
	
	if(sj ==""){
		alert('제목을 입력해 주세요');
		return;
	}
	if($('input[name="sanctners"]').val()=="" && status == 'G001'){
		alert('결재자를 지정해주세요');
		return;
	}
	
	
	$('input[name="formSj"]').val(sj);
	$('input[name="limit"]').val(limit);
	$('input[name="ipcr"]').val(ipcr);
	$('textarea[name="cn"]').html(cn);
	$('input[name="sttus"]').val(status);
	
	

	// 휴가생각하기	
	
	
	//전송
	
	var form = $('#eccstSaveForm');
	
	
	 form=form.get(0);
     form.submit();
}



function getFromChild(count,empno,dept,clsf,nm,size){
// 	console.log('받아옴')

	console.log(size);
	console.log(count[0].innerText);
	console.log(empno[0].innerText);
	console.log(dept[0].innerText);
	console.log(clsf[0].innerText);
	console.log(nm[0].innerText);


	$('.sanctner').remove();
	
	for (var i = 0; i < size; i++){
	    var show = "<span class='sanctner LN"+count[i].innerText+"' line="+count[i].innerText+" name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='"+empno[i].innerText+"'>"+nm[i].innerText+"/"+dept[i].innerText+"/"+clsf[i].innerText+"<br/></span>";

	    
	    $('#selectedContainer').append(show);
	}
	
	
	// 필요한거 count:순서 , id:저장된놈아이디 ,text : 이름/부서/직책	
	
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

function selectSanctners(){
	var _width= '600';
	var _height = '460';
	
	var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
    
	window.open("selectSancForm.do","결재선 즐겨찾기 선택",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top)
}

function saveSanctners(){
	
	
	if($('span[name="saveSanc"]').length == 0){
		alert("결재선을 선택해주세요");
		return;
	}
	if($('span[name="saveSanc"]').length == 1){
		alert("1명은 등록할 수 없습니다.");
		return;
	}
	
	var pop_title = "결재선 즐겨찾기 저장";
	
	var _width= '500';
	var _height = '200';
	
	var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
	
	window.open("",pop_title,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
	
	 var form = $('#saveSanctner');
	 form.find("[name='saveSancID']").val('');
	 
// 	 form.find("[name='saveSanc']").val($('span[name="saveSanc"]').text());
// 	 form.find("[name='saveSancID']").val($('span[name="saveSanc"]').attr('id'));
// 	 for(var i = 0; i < $('span[name="saveSanc"]').length; i++){
// 		 console.log($('span[name="saveSanc"]').attr('id'));
// 	 }
	 $('span[name="saveSanc"]').each(function(){
// 		 console.log($(this).attr('id'));
		 form.find("[name='saveSancID']").val(form.find("[name='saveSancID']").val()+$(this).attr('id')+",");
	 });
	 
	 
	 
//      var show = "<span class='sanctner LN"+count+"' line="+count+" name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";
	 
	 form=form.get(0);
     form.target = pop_title;
     form.method = 'POST';
     form.action = "saveSancForm.do";
     console.log(form);
     form.submit();


	
}

function sanctner(){
	modal('sel_sanctner');
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


function sanctnerUP(){
	var nowel = $(".sanctner[sme='selected']");
	var line = nowel[0].getAttribute('line');
	var prevline = line-1;
	var prevel = $(".sanctner[line='"+prevline+"']")
	
// 	var prevline = line-1;

	
	
// 	var b = $(".sanctner[line='"+prevline+"']")
	
// 		var nextel = $(".sanctner[line='"+nextline+"']")
	
	if (line > 1){
		
		$(".LN"+line).insertBefore(".LN"+prevline);
		
		nowel[0].setAttribute('class','');
		nowel[0].setAttribute('class','sanctner LN'+prevline);
		nowel[0].setAttribute('line',prevline);
		
		prevel[0].setAttribute('class','');
		prevel[0].setAttribute('class','sanctner LN'+line);
		prevel[0].setAttribute('line',line);
		
		
	}
}
function sanctnerDOWN(){
	var nowel = $(".sanctner[sme='selected']");
	var line = nowel[0].getAttribute('line');
	var nextline = +line+1;
	var nextel = $(".sanctner[line='"+nextline+"']")
	
// 	console.log(nowel);
// 	console.log(nextel);
	
// 	var prevline = line-1;

	
	
// 	var b = $(".sanctner[line='"+prevline+"']")
	
	
	if (line < 4){
		
		
		$(".LN"+line).insertAfter(".LN"+nextline);
		
		nowel[0].setAttribute('class','');
		nowel[0].setAttribute('class','sanctner LN'+nextline);
		nowel[0].setAttribute('line',nextline);
		
		nextel[0].setAttribute('class','');
		nextel[0].setAttribute('class','sanctner LN'+line);
		nextel[0].setAttribute('line',line);
			
	}
}

function goSanctnLine(){
	var modal = $('#sel_sanctner');
    var going = document.querySelectorAll('.sanctner');
    var uid = <%=empno%>
	var uclsf = "<c:out value='${loginUser.clsf_code}'/>";
	var unm = "<c:out value='${loginUser.nm}'/>";
	
    $('#sanctners').val("");

	
    $('.td-border').remove();
	if(uclsf == 'C001'){
		uclsf = '사원';
	}else if(uclsf == 'C002'){
		uclsf = '대리';
	}else if(uclsf == 'C003'){
		uclsf = '기사';
	}else if(uclsf == 'C004'){
		uclsf = '계장';
	}else if(uclsf == 'C005'){
		uclsf = '과장';
	}else if(uclsf == 'C006'){
		uclsf = '차장';
	}else if(uclsf == 'C007'){
		uclsf = '팀장';
	}else if(uclsf == 'C008'){
		uclsf = '부장';
	}else if(uclsf == 'C009'){
		uclsf = '이사';
	}else if(uclsf == 'C010'){ 
		uclsf = '이사장';
	}else if(uclsf == 'C011'){
		uclsf = '사장';
	}else{
		uclsf = '회장';
	}
    
	 var uclsftd = "<td class='td-border'>"+uclsf+"</td>";
	 var tempo = "<td class='td-border' sid="+uid+"></br>";
	 var unm = "<td class='td-border'>"+unm+"</td>";
	    $('.form-table2-tr-1').append(uclsftd);
	    $('.form-table2-tr-2').append(tempo);
	    $('.form-table2-tr-3').append(unm);
	    
	
    for(var i =0; i < going.length; i++){
		var sid = going[i].getAttribute('id');    
		var temp= going[i].innerText
	    var spl = temp.split('/');
	    console.log(spl[0]);
	    console.log(spl[2]);
	    
	    var depttd = "<td class='td-border'>"+spl[2]+"</td>";
	    var temp02 = "<td class='td-border' sid="+sid+"></br>";
	    var snctnm = "<td class='td-border'>"+spl[0]+"</td>";
	    $('.form-table2-tr-1').append(depttd);
	    $('.form-table2-tr-2').append(temp02);
	    $('.form-table2-tr-3').append(snctnm);
	    
	    $('#sanctners').val($('#sanctners').val()+sid+",");
    
    }
    
	$('.sanctner').removeAttr("style");
	$('.sanctner').removeAttr('sme');
    
    $('#bg').remove();
    modal.hide();
    
}

function goRegReferrer(){
	var modal = $('#sel_referrer');
	var going = document.querySelectorAll('.reff');
// 	console.log(going[0].getAttribute('id'));
// 	console.log(going[0].innerText);
	
	$('#refff').empty();
    $('#refferers').val("");

	for(var i =0; i < going.length; i++){
		var sid = going[i].getAttribute('id');
		$('#refff').append(going[i].innerText+",");
	    $('#refferers').val($('#refferers').val()+sid+",");
	}
	
    
    $('#bg').remove();
    modal.hide();
}





// 검색!
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
	  var count = apcount+1;
	
	  
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
      
      
      
      if(apc == 5){
    	  alert('결재선은 최대 4명까지 지정가능합니다.')
      }else{
    	  var show =  "<span class='sanctner LN"+count+"' line="+count+" name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>"
// 	          var show = "<span class='sanctner' ondblclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>";
	       	  $('#selectedContainer').append(show);
      }
      
   	  
	
	
	
	
	

    }
  });


  
  
</script>



<script>
window.onload=function(){
		var nm = '<c:out value="${loginUser.nm}"/>';
		var empno = '<c:out value="${loginUser.empno}"/>';
		var empnm = '<c:out value="${loginUser.nm}"/>';
		var empno = '<c:out value="${loginUser.empno}"/>';
		var clsf = '<c:out value="${loginUser.clsf_code}"/>';
		var phone = '<c:out value="${loginUser.cttpc}"/>';
		
		if(phone.length < 13){
			var a = phone.substring(0,3);
			var b = phone.substring(3,7);
			var c = phone.substring(7,11);
			
			phone = a+"-"+b+"-"+c
		}
		
		if(clsf == 'C001'){
			clsf = '사원';
		}else if(uclsf == 'C002'){
			clsf = '대리';
		}else if(uclsf == 'C003'){
			clsf = '기사';
		}else if(uclsf == 'C004'){
			clsf = '계장';
		}else if(uclsf == 'C005'){
			clsf = '과장';
		}else if(uclsf == 'C006'){
			clsf = '차장';
		}else if(uclsf == 'C007'){
			clsf = '팀장';
		}else if(uclsf == 'C008'){
			clsf = '부장';
		}else if(uclsf == 'C009'){
			clsf = '이사';
		}else if(uclsf == 'C010'){
			clsf = '이사장';
		}else if(uclsf == 'C011'){
			clsf = '사장';
		}else{
			clsf = '회장';
		}
	    
		var dept = '<c:out value="${loginUser.dept_code}"/>';
		
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
		$("#userNum").val(empno);
		$(".userNum").text(empno);
		$(".userClsf").text(clsf);
		$(".userDept").text(dept);
		$(".userPhone").text(phone);
		$("#userNm").val(empnm);
		
		var scrty = $('#scrty').html();
// 		console.log(scrty);
		var prsrv = $('#prsrv').html();
// 		console.log(prsrv);
		
		$('#scrtyGD').val(scrty);
		$('#prsrvDE').val(prsrv);
		
		//근태신청서 날짜
		if($('.selectedDate').length > 0){
			if($('.selectedDate').val() != ""){
				var data = '<c:out value="${selDate}"/>';
				$(".selectedDate").text(data);
			}
		}
	      
		//
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
	      
	          
	      $('#Treecontainer').bind("select_node.jstree", function (NODE, REF_NODE) {
	    	  var ap = document.getElementById('selectedContainer');
	    	  var apcount = ap.childElementCount;
	    	  var apc = apcount+1
	    	  var count = apcount+1;
	    	  
	    	  var uid = <%=empno%>
	    	  
// 	    	  var userCheck = uid.getAttribute('empno');
// 	    	  console.log(userCheck);
	    	  
	          var a = $('#Treecontainer').jstree('get_selected',true)
// 	    	  console.log(uid+"사용자사번");
// 	    	  console.log(a[0].id+"지정한사람사번");
	          
	    	  if(a[0].id == uid){
        		  alert('자기자신은 지정할 수 없습니다.');		        		
        		  return;			        		  
        	  }
	    	  
	          if(a[0].id.indexOf('B') == -1 && a[0].id.indexOf('GW') == -1 ){
		          
		          var matches = document.querySelectorAll('.sanctner');
		          
		          if(matches.length > 0){
			          for (var i=0; i<matches.length; i++) {
			        	  if(matches[i].getAttribute('id') == a[0].id){
			        		  alert('이미 지정된 사람입니다.');		        		
			        		  return;
			        	  }
			        	}
		          }
		          
		          
		          
		          if(apc == 5){
		        	  alert('결재선은 최대 4명까지 지정가능합니다.')
		          }else{
			          var show = "<span class='sanctner LN"+count+"' line="+count+" name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";
			       	  $('#selectedContainer').append(show);
		          }
		          
		       	  
	          }
	      });
	      
	      $('#Treecontainer2').bind("select_node.jstree", function (NODE, REF_NODE) {
	    	  var ap = document.getElementById('selectedContainer2');
	    	  var apcount = ap.childElementCount;
	    	  var apc = apcount+1
	    	  
	    	  
	    	  var uid = <%=empno%>
	    	  console.log(uid);
// 	    	  var userCheck = uid.getAttribute('empno');
// 	    	  console.log(userCheck);
	    	  
	          var a = $('#Treecontainer2').jstree('get_selected',true)
	          if(a[0].id.indexOf('B') == -1 && a[0].id.indexOf('GW') == -1 ){
		          
		          var matches = document.querySelectorAll('.reff');
		          
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
		          
		          
          
	          var show = "<span class='reff' onclick='selfRemove(this)' name='saveReff' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";

	       	  $('#selectedContainer2').append(show);
          
       	  
	          }
	      });
	      
	      
	      
	      
	      ////다중파일선택//////
	      
	      if ($('input[name="uplFile"]').length != 0) {
	        target = document.getElementById('upFiles');
	        target.addEventListener('change', function(){
	            fileList = "";
	            for(i = 0; i < target.files.length; i++){
	                fileList += '<i class="fas fa-paperclip"></i>'+target.files[i].name + '<br>';
	            }
	            target2 = document.getElementById('FileUp2');
	            target2.innerHTML = fileList;
	        });
	      }
	      
          <c:forEach items="${sanctners}" var="sc" varStatus="status">
          	  if(${status.index} == 0){
		       	  var userDeptVar = "<td class='td-border'>"+clsf+"</td>";
		 	      var temp03 = "<td class='td-border' sid='"+empno+"'></br>";
		 	      var UsernmVar = "<td class='td-border'>"+nm+"</td>";
		 	      $('.form-table2-tr-1').append(userDeptVar);
		 	      $('.form-table2-tr-2').append(temp03);
		 	      $('.form-table2-tr-3').append(UsernmVar);
          	  }
          	  
	          var scnersshow = "<span class='sanctner LN${status.index+1}' line='${status.index+1}' name='saveSanc' onclick='selectme(this)' ondblclick='selfRemove(this)' id='${sc.empno}'>${sc.nm}/${sc.dept_code}/${sc.clsf_code}<br/></span>";
	       	  $('#selectedContainer').append(scnersshow);
	       	  var depttd = "<td class='td-border'>${sc.clsf_code}</td>";
	 	      var temp02 = "<td class='td-border' sid='${sc.empno}'></br>";
	 	      var snctnm = "<td class='td-border'>${sc.nm}</td>";
	 	      $('.form-table2-tr-1').append(depttd);
	 	      $('.form-table2-tr-2').append(temp02);
	 	      $('.form-table2-tr-3').append(snctnm);
			  $('#sanctners').val($('#sanctners').val()+"${sc.empno},");

	      </c:forEach>
		  
          <c:forEach items="${reff}" var="rf" varStatus="status">
	          var refsshow = "<span class='reff' onclick='selfRemove(this)' name='saveReff' id='${rf.empno}'>${rf.nm}/${rf.dept_code}/${rf.clsf_code}<br/></span>";
	       	  $('#selectedContainer2').append(refsshow);
		  		$('#refff').append("${rf.nm}/${rf.dept_code}/${rf.clsf_code},");
			    $('#refferers').val($('#refferers').val()+"${rf.empno},");
	      </c:forEach>
		  
	      
	    
  		//첨부파일=================================
  		$('a[name="attachedFile"] > button').click(function(event){
  			
  			
//   			alert("remove file btn");
  			
  			var parent = $(this).parent('a[name="attachedFile"]');
  			
//   			alert(parent.attr("attach-fileName")+" 파일을 삭제합니다.");
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
  		})
	      
	      
	      
}
</script>

</body>

    
    
    