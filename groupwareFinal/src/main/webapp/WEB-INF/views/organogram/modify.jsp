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
  margin-top: 5px;
}
.input-group-addon {
  font-size: 13px;
}
.input-group {
  width: 350px;
  text-align: center;
  margin: 0 auto;
  margin-bottom: 5px;
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
#inputFileName {
  font-size: 12px;
}
</style>
</head>


<title>임직원상세수정하기</title>
<body>

  <!-- Content Wrapper.123 Contains page content -->
  <div class="pop-container" style="min-width:800px;">
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-address-card fa-2x" style="vertical-align: middle;" aria-hidden="true"></i>&nbsp;
	  				<p class="title-p">임직원 상세정보 변경</p>  				
	  			</div>
	  		</div>
	  	</div>
  	</section>
  	
    <!-- Main content -->
    <section class="content container-fluid">       
		<div style="margin: 20px">    
		
		     
	    	<form role="form" class="form-horizontal"  method="post" action="modify.do"  enctype="multipart/form-data">
	        	<div>
	        	
	        	<input type="hidden" name="oldPicture"  value="${emp.face_photo }"/>
					<input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
	        	
		        	<table>
		        		<tr>
		        		  <td rowspan="5">
								<div class="mailbox-attachments clearfix col-md-12" style="text-align: center;">
									<div class="has-img" id="pictureView" data-id="${emp.empno }"></div>														
								</div>
								<div class="input-group input-group-sm">
								<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled
									value="${emp.face_photo.split('\\$\\$')[1] }"/>
								<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
								<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
								</div>	
		        		  </td>
		        		  <td>
			        		  <div class="form-group row col-md-12">
		                  		<label for="dept_code" class="col-sm-4">부서</label>
		
		                  		<div class="col-sm-8">
								<select name="dept_code" class="form-control" >
									<option value="B001" ${emp.dept_code eq '경리부' ? 'selected' : '' }>경리부</option>
									<option value="B002" ${emp.dept_code eq '사업부' ? 'selected' : '' }>사업부</option>
									<option value="B003" ${emp.dept_code eq '시설관리부' ? 'selected' : '' }>시설관리부</option>
									<option value="B004" ${emp.dept_code eq '인사부' ? 'selected' : '' }>인사부</option>
									<option value="B005" ${emp.dept_code eq '홍보부' ? 'selected' : '' }>홍보부</option>
									<option value="B006" ${emp.dept_code eq '임원' ? 'selected' : '' }>임원</option>
								</select>
							</div>
		               		 </div>
		        		  </td>
		        		</tr>
		        		
		        		
		        		<tr>
		        		  <td>
							<div class="form-group row col-md-12">
								<label for="clsf_code" class="col-sm-4">
								직급</label>
								<div class="col-sm-8">
									<select name="clsf_code" class="form-control" >
										<option value="C001" ${emp.clsf_code eq '사원' ? 'selected' : '' }>사원</option>
										<option value="C002" ${emp.clsf_code eq '대리' ? 'selected' : '' }>대리</option>
										<option value="C003" ${emp.clsf_code eq '기사' ? 'selected' : '' }>기사</option>
										<option value="C004" ${emp.clsf_code eq '계장' ? 'selected' : '' }>계장</option>
										<option value="C005" ${emp.clsf_code eq '과장' ? 'selected' : '' }>과장</option>
										<option value="C006" ${emp.clsf_code eq '차장' ? 'selected' : '' }>차장</option>
										<option value="C007" ${emp.clsf_code eq '팀장' ? 'selected' : '' }>팀장</option>
										<option value="C008" ${emp.clsf_code eq '부장' ? 'selected' : '' }>부장</option>
										<option value="C009" ${emp.clsf_code eq '이사' ? 'selected' : '' }>이사</option>
										<option value="C010" ${emp.clsf_code eq '이사장' ? 'selected' : '' }>이사장</option>
										<option value="C011" ${emp.clsf_code eq '사장' ? 'selected' : '' }>사장</option>
										<option value="C012" ${emp.clsf_code eq '회장' ? 'selected' : '' }>회장</option>
									</select>
								</div>
							</div>		
		        		  </td>
		        		</tr>
		        		
		        		<tr>
		        		  <td>
		        		  	<div class="form-group row col-md-12">
			                  <label for="rspofc_code" class="col-sm-4">직책</label>
			
			                  <div class="col-sm-8">
								<select name="rspofc_code" class="form-control" >
									<option value="D001" ${emp.rspofc_code eq '경리부사원' ? 'selected' : '' }>경리부사원</option>
									<option value="D002" ${emp.rspofc_code eq '경리부팀장' ? 'selected' : '' }>경리부팀장</option>
									<option value="D003" ${emp.rspofc_code eq '경리부부장' ? 'selected' : '' }>경리부부장</option>
									<option value="D004" ${emp.rspofc_code eq '사업부사원' ? 'selected' : '' }>사업부사원</option>
									<option value="D005" ${emp.rspofc_code eq '사업부팀장' ? 'selected' : '' }>사업부팀장</option>
									<option value="D006" ${emp.rspofc_code eq '사업부부장' ? 'selected' : '' }>사업부부장</option>
									<option value="D007" ${emp.rspofc_code eq '시설관리부사원' ? 'selected' : '' }>시설관리부사원</option>
									<option value="D008" ${emp.rspofc_code eq '시설관리부팀장' ? 'selected' : '' }>시설관리부팀장</option>
									<option value="D009" ${emp.rspofc_code eq '시설관리부부장' ? 'selected' : '' }>시설관리부부장</option>
									<option value="D010" ${emp.rspofc_code eq '인사부사원' ? 'selected' : '' }>인사부사원</option>
									<option value="D011" ${emp.rspofc_code eq '인사부팀장' ? 'selected' : '' }>인사부팀장</option>
									<option value="D012" ${emp.rspofc_code eq '인사부부장' ? 'selected' : '' }>인사부부장</option>
									<option value="D014" ${emp.rspofc_code eq '홍보부사원' ? 'selected' : '' }>홍보부사원</option>
									<option value="D015" ${emp.rspofc_code eq '홍보부팀장' ? 'selected' : '' }>홍보부팀장</option>
									<option value="D016" ${emp.rspofc_code eq '홍보부부장' ? 'selected' : '' }>홍보부부장</option>
									<option value="D017" ${emp.rspofc_code eq '임원' ? 'selected' : '' }>임원</option>
								</select>
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
				                  	<input name="cttpc" type="text" class="form-control" id="cpptc" value="${cttpc.substring(0,3) }-${cttpc.substring(3,7) }-${cttpc.substring(7) }">	                
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
			                  	
			                  	<input name="fxnum" type="text" class="form-control" id="fxnum" value="${fxnum.substring(0,3) }-${fxnum.substring(3,6) }-${fxnum.substring(6) }">	                
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
										<input name="ip_adres" type="text" class="form-control" id="ip_adres" value="${emp.ip_adres }">
									</div>
								</div>
						  </td>
		        		</tr>
		        		
		        		<tr>
		        		  <td>
		        		    <div class="form-group row col-md-12">
			                  <label for="nm" class="col-sm-4">이  름</label>
			
			                  <div class="col-sm-8">
			                    <input name="nm" type="text" class="form-control" id="nm" value="${emp.nm }" >
			                  </div>
			                </div>
		        		  </td>
		        		  <td>
								<div class="form-group row col-md-12">
									<label for="email_adres" class="col-sm-4" >이메일</label>
									<div class="col-sm-8 input-group-sm">
										<input name="email_adres" type="email" class="form-control" id="email" value="${emp.email_adres }" 
												placeholder="example@naver.com">
									</div>
								</div>
						  </td>
		        		  
		        		</tr>
		        		
		        	
		        	</table>
	                
			          <div style="text-align:center; padding: 20px 0;">
				          		
							<button type="button" class="btn btn-regist" id="registBtn" onclick="modify_go();">변경완료</button>
							
							<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
				          	
			          </div>
		          
		          
	              </div>  
		         
		         
		         
		         
	      	  
	      	  
	      	  
	      	  </form>
	      	  
	      	  
	      	  
      	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<script>

</script>

<%@ include file="./js/modify_js.jsp" %>  
  
 </body>