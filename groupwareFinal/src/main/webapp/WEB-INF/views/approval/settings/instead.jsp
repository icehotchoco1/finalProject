<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
 
<%
	OrgnztEmpMngtVO empvo = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
	int empno = empvo.getEmpno();
%>

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

#sel_referrer{
	display: none;
	width: 300px;
	height: 500px;
	padding: 0;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
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
  width: 198px;
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
  overflow-y: scroll;
  height: 90px;
}
.file-title-div {
  margin: 10px;
}
.btn-file {
  background: ivory;
  border: 2px solid lightgrey;
}
.form-group{
	
}
</style>



  <div class="pop-container" style="min-width:800px;">
	 <!-- Main content -->
	   <!-- Main content -->
    <section class="content container-fluid" id="content">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width:960px;">
				<div class="card-outline">
					
					<div class="card-body pad" style="min-height:300px">
						<button type="button" class="btn btn-regist2" onclick="referrer111();">대결자 지정</button>
						<button type="button" class="btn btn-regist2" onclick="submit_repl();">저장</button>
						<span class="col-md-6" id="refff">
						</span>
						
					<div>
							
							<input type="hidden" name="checked" id="checker" value="${EcsSetting.drsc_setup}">
							<input type="hidden" name="replc_empno" id="replacer" value="${EcsSetting.replc_sanctner_empno}">
							
							<div class="hr_line"></div>	
							
							<div class="form-group"  >
								<div class="col-xs-12 col-sm-10 g_value">
									<input type="checkbox" name="chkgone" id="chkgone" ${EcsSetting.drsc_setup eq '1' ? 'checked="checked"':'' }> 부재설정여부
								</div>
							</div>  
							
							<div class="form-group">
								<label for="bbs.writerName" class="col-xs-12 col-sm-2 control-label no-padding-right bolder g_label">
									대결자 정보
								</label>
								<c:if test="${not empty Remp  }">
									<div class="col-xs-12 col-sm-10 g_value">
										<input type="text" id="refff2"  style="width:92%;border: 1 solid; border-color: gray " value="${Remp.nm }/${Remp.dept_code}/${Remp.clsf_code}" readonly>			
									</div>
								</c:if>
								<c:if test="${empty Remp  }">
									<div class="col-xs-12 col-sm-10 g_value">
										<input type="text" id="refff2"  style="width:92%;border: 1 solid; border-color: gray "  readonly>			
									</div>
								</c:if>
														
							</div>
							
							<table width="510" cellspacing="0" cellpadding="0" border="0" ></table><!-- 이게 있어야 UI가 잘 나온다 ㅜㅜ -->
						<div>
						
						<div id="sel_referrer" >
							<header>
								<p>대결자 지정</p>
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
					</div>
				</div>
						
						
					</div><!--end card-body  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
  </div> 
  
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>

  


<script>

function submit_repl(){
	var chk = $('#checker').val();
	var remp = $('#replacer').val();
	
	$.ajax({
		url:'<%=request.getContextPath()%>/approval/settings/registReplcSetting',
		type:'post',
		data: {'checker':chk,'rempno':remp},
		success:function(data){
			alert("결재설정 저장을 성공했습니다.")
		},
		error:function(){
			alert("결재설정 저장을 실패했습니다.");
		},
	})
	
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

		var sid = going[0].getAttribute('id');
		$('#refff2').val(going[0].innerText);
	    $('#jrcv').val($('#jrcv').val()+sid);
	
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

		 var sp = suggestion.value.split("/")
		  
		  var uid = <%=empno%>
		  var uclsf = '<c:out value="${loginUser.clsf_code}"/>';
    	  var udept = '<c:out value="${loginUser.dept_code}"/>';
	      
    	  uclsf = parseInt(uclsf.substring(1,9999));
    	  udept = parseInt(udept.substring(1,9999));
    	  
    	  if(sp[1] == '경리부'){
    		  sp[1] = 1
    	  }else if(sp[1] == '사업부'){
    		  sp[1] = 2
    	  }else if(sp[1] == '시설관리부'){
    		  sp[1] = 3
    	  }else if(sp[1] == '인사부'){
    		  sp[1] = 4
    	  }else if(sp[1] == '홍보부'){
    		  sp[1] = 5
    	  }else{
    		  sp[1] = 6
    	  }
    	  
    	  
    	  if(sp[2] == '사원'){
    		  sp[2] = 1
    	  }else if(sp[2] == '대리'){
    		  sp[2] = 2
    	  }else if(sp[2] == '기사'){
    		  sp[2] = 3
    	  }else if(sp[2] == '계장'){
    		  sp[2] = 4
    	  }else if(sp[2] == '과장'){
    		  sp[2] = 5
    	  }else if(sp[2] == '차장'){
    		  sp[2] = 6
    	  }else if(sp[2] == '팀장'){
    		  sp[2] = 7
    	  }else if(sp[2] == '부장'){
    		  sp[2] = 8
    	  }else if(sp[2] == '이사'){
    		  sp[2] = 9
    	  }else if(sp[2] == '이사장'){
    		  sp[2] = 10
    	  }else if(sp[2] == '사장'){
    		  sp[2] = 11
    	  }else if(sp[2] == '회장'){
    		  sp[2] =  12
    	  }
	      
	       	if(suggestion.data == uid){
	       		  alert('본인은 지정할 수 없습니다.');		        		
	       		  return;			        		  
	       	  }
	       	
	        if(udept != sp[1]){
      		  alert('다른부서의 사람은 대결자로 지정할 수 없습니다.')
      		  return;
      	  }
      	  
      	  if(uclsf < sp[2] || uclsf-sp[2] > 1){
      		  alert('자기자신과 지급이 동일하거나 한단계 <br/> 낮은사람만  대결자로 지정가능합니다.');
      		  return;
      	  }
      	  
      	  $('#refff2').val(suggestion.value);
      	  $('#replacer').val(suggestion.data);
      	  
    	  var modal = $('#sel_referrer');

      	  $('#bg').remove();
      	   modal.hide();     
		          
// 		          var show = "<span class='reff' onclick='selfRemove(this)' id='"+suggestion.data+"'>"+suggestion.value+"<br/></span>";
// 		       	  $('#selectedContainer').append(show);
	    }
	  });
</script>

<script>
//
window.onload=function(){
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
	    	  
	    	  var modal = $('#sel_referrer');
	    	  var uclsf = '<c:out value="${loginUser.clsf_code}"/>';
	    	  var udept = '<c:out value="${loginUser.dept_code}"/>';
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
	        	  
	        	  console.log(parseInt(uclsf.substring(1,9999))); //유저직급
	        	  console.log(parseInt(udept.substring(1,9999))); //유저부서
	        	  
	        	  uclsf = parseInt(uclsf.substring(1,9999));
	        	  udept = parseInt(udept.substring(1,9999));
	        	  
	        	  if(sp[1] == '경리부'){
	        		  sp[1] = 1
	        	  }else if(sp[1] == '사업부'){
	        		  sp[1] = 2
	        	  }else if(sp[1] == '시설관리부'){
	        		  sp[1] = 3
	        	  }else if(sp[1] == '인사부'){
	        		  sp[1] = 4
	        	  }else if(sp[1] == '홍보부'){
	        		  sp[1] = 5
	        	  }else{
	        		  sp[1] = 6
	        	  }
	        	  
	        	  
	        	  if(sp[2] == '사원'){
	        		  sp[2] = 1
	        	  }else if(sp[2] == '대리'){
	        		  sp[2] = 2
	        	  }else if(sp[2] == '기사'){
	        		  sp[2] = 3
	        	  }else if(sp[2] == '계장'){
	        		  sp[2] = 4
	        	  }else if(sp[2] == '과장'){
	        		  sp[2] = 5
	        	  }else if(sp[2] == '차장'){
	        		  sp[2] = 6
	        	  }else if(sp[2] == '팀장'){
	        		  sp[2] = 7
	        	  }else if(sp[2] == '부장'){
	        		  sp[2] = 8
	        	  }else if(sp[2] == '이사'){
	        		  sp[2] = 9
	        	  }else if(sp[2] == '이사장'){
	        		  sp[2] = 10
	        	  }else if(sp[2] == '사장'){
	        		  sp[2] = 11
	        	  }else if(sp[2] == '회장'){
	        		  sp[2] =  12
	        	  }
	        	  
	        	  if(a[0].id == uid){
	        		  alert('자기자신은 지정할 수 없습니다.');		        		
	        		  return;			        		  
	        	  }
	        	  if(udept != sp[1]){
	        		  alert('다른부서의 사람은 대결자로 지정할 수 없습니다.')
	        		  return;
	        	  }
	        	  
	        	  if(uclsf < sp[2] || uclsf-sp[2] > 1){
	        		  alert('자기자신과 직급이 동일하거나 \n한단계  낮은사람만  대결자로 지정가능합니다.');
	        		  return;
	        	  }
	        	  
	        	  $('#refff2').val(a[0].text);
	        	  $('#replacer').val(a[0].id);
	        	  
	        	  
	        	  $('#bg').remove();
	        	   modal.hide();     
       
// 	          var show = "<span class='reff' onclick='selfRemove(this)' name='saveReff' id='"+a[0].id+"'>"+a[0].text+"<br/></span>";
// 	       	  $('#selectedContainer').append(show);
          
       	  
	          }
	      });
	
	      
	      

	      $("#chkgone").change(

	       function() {

	        // 체크박스 값에 따라 히든 값 변경

	        if ( $("#chkgone").is(":checked") ){

	            $("#checker").val('1');

	        } else {

	            $("#checker").val('0');

	        }

	       }

	      );
	      
	      
	      
	      
	      
}
</script>


<script>

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
	
	document.registForm.submit();
	
	
}

</script>




    
    
    
    