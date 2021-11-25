<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_registForm.css">
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
  border: 2px solid lightgrey; 
  
}
td {
  border: 2px solid lightgrey; 
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
select>option {
  font-weight: bold;
  font-size: 13px;
  color: black;
}
input#id {
  font-size: 13px;
  height: 38px;
  border-radius: 3px;
}
input#nm, input#ip_adres, input#email {
  height: 38px;
}
.has-img {
  border: 2px solid #004680; 
  height: 190px; 
  width: 150px; 
  margin: 0 auto; 
  margin-bottom: 5px;
}
.input-group-addon {
  margin-bottom: 5px;
  font-size: 13px;
}
.encpn {
  font-size: 13px;
  padding-left: 10px;
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  border: 1px solid lightgrey;
  border-radius: 3px;
  width: 240px;
  height: 38px;
  vertical-align: text-top;
}
.btn-append {
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  font-size: 13px;
  border: 1px solid #004680; 
  background: #004680;
  color: white;
  padding: 6px 12px;
}
.btn-cancle, .btn-regist  {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  height: 37px;
}
.btn-remove {
  background: tomato;
  color: white;
  width: 90px;
  padding: 6px;
  border: 2px solid tomato;
  border-radius: 0;
  height: 37px;
  font-size: 13px;
  font-weight: bold;
}
.btn-remove:hover {
  background: white;
  color: tomato;
}
</style>
</head>


<title>임직원상세보기</title>

<body>

  <!-- Content Wrapper.123 Contains page content -->
  <div class="pop-container" style="min-width:800px;">
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-address-card fa-2x" style="vertical-align: middle;" aria-hidden="true"></i>&nbsp;
	  				<p class="title-p">임직원 상세정보</p>  				
	  			</div>
	  		</div>
	  	</div>
  	</section>
  	
    <!-- Main content -->
    <section class="content container-fluid">       
		<div style="margin: 20px">    
		
		     
	    	<form role="form" class="form-horizontal"  method="post">

	        	<div>
	        	
		        	<table>
		        		<tr>
		        		  <td rowspan="5">
								<div class="mailbox-attachments clearfix col-md-12" style="text-align: center;">
								<br/>							
									<div class="has-img" id="pictureView" data-id="${emp.empno }"></div>														
								</div>
								<br/>							
		        		  </td>
		        		  <td>
			        		  <div class="form-group row col-md-12">
		                  		<label for="dept_code" class="col-sm-4">부서</label>
		
		                  		<div class="col-sm-8">
		                    	  <input name="dept_code" type="text" class="form-control" id="dept_code" value="${emp.dept_code}"  readonly>
		                  		</div>
		               		 </div>
		        		  </td>
		        		</tr>
		        		
		        		
		        		<tr>
		        		  <td>
		        		  	<div class="form-group row col-md-12">
			                  <label for="clsf_code" class="col-sm-4">직급</label>
			
			                  <div class="col-sm-8">
			                    <input name="email" type="text" class="form-control" id="clsf_code" value="${emp.clsf_code}"  readonly>
			                  </div>
			                </div>
		        		  </td>
		        		</tr>
		        		
		        		<tr>
		        		  <td>
		        		  	<div class="form-group row col-md-12">
			                  <label for="rspofc_code" class="col-sm-4">직책</label>
			
			                  <div class="col-sm-8">
			                    <input name="rspofc_code" type="text" class="form-control" id="rspofc_code" value="${emp.rspofc_code}"  readonly>
			                  </div>
			                </div>
		        		  </td>
		        		</tr>
		        		
		        		<tr>
		        			<td>
		        		    <div class="form-group row col-md-12">
			                  <label for="cpptc" class="col-sm-4">전화번호</label>
			                  <div class="col-sm-8">   
			                  	<c:set var="cttpc" value="${emp.cttpc.replace('-','') }" />
			                  	<input name="cttpc" type="text" class="form-control" id="cpptc" readonly
			                  	       value="${cttpc.substring(0,3) }-${cttpc.substring(3,7) }-${cttpc.substring(7) }">	                
			                  </div>                  
			                </div> 
		        		  </td>
		        		</tr>
		        		
		        		<tr>
		        			<td>
		        		    <div class="form-group row col-md-12">
			                  <label for="fxnum" class="col-sm-4">팩스번호</label>
			                  <div class="col-sm-8 ">   
			                  	<c:set var="fxnum" value="${emp.fxnum.replace('-','') }" />
			                  	
			                  	<input name="fxnum" type="text" class="form-control" id="fxnum" readonly
			                  	       value="${fxnum.substring(0,3) }-${fxnum.substring(3,6) }-${fxnum.substring(6) }">	                
			                  </div>                  
			                </div>
		        		  </td>
		        		</tr>
		        		
		        		<tr>
		        		  <td>
		        		    <div class="form-group row col-md-12" >
			                  <label for="empno" class="col-sm-4">사원번호</label>
			                  <div class="col-sm-8">
			                    <input name="empno" type="text" class="form-control" id="empno" value="${emp.empno }" readonly>
			                  </div>
			                </div>	
		        		  </td>
		        		  <td>
								<div class="form-group row col-md-12">
									<label for="ip_adres" class="col-sm-4" >아이피주소</label>
									<div class="col-sm-8 input-group-sm">
										<input name="ip_adres" type="text" class="form-control" id="ip_adres" value="${emp.ip_adres }" readonly>
									</div>
								</div>
						  </td>
		        		</tr>
		        		
		        		<tr>
		        		  <td>
		        		    <div class="form-group row col-md-12">
			                  <label for="nm" class="col-sm-4">이  름</label>
			
			                  <div class="col-sm-8">
			                    <input name="nm" type="text" class="form-control" id="nm" value="${emp.nm }" readonly>
			                  </div>
			                </div>
		        		  </td>
		        		  <td>
								<div class="form-group row col-md-12">
									<label for="email_adres" class="col-sm-4" >이메일</label>
									<div class="col-sm-8 input-group-sm">
										<input name="email_adres" type="email" class="form-control" id="email" value="${emp.email_adres }" readonly
												placeholder="example@naver.com">
									</div>
								</div>
						  </td>
		        		</tr>
		        		
		        	
		        	</table>
	                
			          <div style="text-align:center; padding: 20px 0;">
				          		
				          	<c:choose>
				          	  <c:when test="${loginUser.author_code eq 'ROLE_MANAGER' or loginUser.author_code eq 'ROLE_DEPTMANAGER' }">
				          	    <div>
				          			<button type="button" onclick="location.href='modifyForm.do?empno=${emp.empno}';" id="modifyBtn" class="btn btn-regist ">수 정</button>
				          			<button type="button" onclick="location.href='remove.do?empno=${emp.empno}';" id="deleteBtn" class="btn btn-remove" >삭 제</button>
				          			<c:if test="${emp.actvty_at ne 0 }">
				          				<button type="button" onclick="location.href='stop.do?empno=${emp.empno}';" id="stopBtn" class="btn btn-cancle" >비활성</button>
				          			</c:if>
				          			<c:if test="${emp.actvty_at ne 1 }">
				          				<button type="button" onclick="location.href='active.do?empno=${emp.empno}';" id="stopBtn" class="btn btn-cancle" >활성</button>
				          			</c:if>
					            	<button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-cancle">닫 기</button>
					            	
				          		</div>
				          	  </c:when>
				          	  
				          	  <c:otherwise>
				          	  	 <div>
					            	<button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-cancle">닫 기</button>
					            </div>
				          	  </c:otherwise>
				          	  
				          	</c:choose>
				          	
			          </div>
		          
		          
	              </div>  
		         
		         
		         
		         
	      	  
	      	  
	      	  
	      	  </form>
	      	  
	      	  
	      	  
      	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <script>
  	window.onload=function(){
  		MemberPictureThumb(document.querySelector('[data-id="${emp.empno}"]'),'${emp.face_photo}','<%=request.getContextPath()%>');
  		
  		<c:if test="${param.from eq 'modify'}">
	  		alert("${emp.nm}님의 정보가 수정되었습니다.");
	  		location.href='detail.do?empno=${emp.empno}';
	  		
	  		if(${parentReload}){
	  			if(confirm('로그인 사용자의 정복가 수정되었습니다.\n 현재 화면을 닫고 새로고침 하시겠습니까?')){
	  				window.opener.parent.location.reload(true);
	  				window.close();
	  			}
	  		}
  		</c:if>
  		<c:if test="${param.from eq 'remove'}">
  			alert("${emp.nm}님의 정보가 삭제되었습니다.")
  			<c:if test="${empty loginUser}">
  				window.opener.parent.location.href="<%=request.getContextPath()%>";
  			</c:if>
  			window.close();
  		</c:if>
  	}
  </script>
  
  
 </body>