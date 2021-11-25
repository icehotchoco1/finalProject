<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>임직원등록</title>
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
}
</style>
</head>
<body>

	<!-- Content Wrapper. Contains page content -->
<div class="pop-container" style="min-width:800px;">
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  			    <i class="fa fa-user-plus fa-2x" aria-hidden="true" style="vertical-align: middle;" ></i>&nbsp;
	  				<p class="title-p">임직원등록</p> 
	  			</div>
	  		</div>
	  	</div>
  	</section>
	<!-- Main content -->
	<section class="content container-fluid">
		<div style="margin: 20px">
			<!-- form start -->
			<div>				
				<div>
					<form role="form" class="form-horizontal" action="regist.do" method="post">						
						<input type="hidden" name="face_photo" />
						<table>
						  <tr>
						    <td rowspan="6">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								
								<br/>
								
								<!-- 사진 들어가는 네모 박스 -->
								<div class="has-img" id="pictureView"></div>
								<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진첨부</label>
								<p>* 사진첨부를 한 뒤에 반드시 <span style="color: tomato;">업로드</span> 버튼을 눌러주세요.</p>

								<div class="mailbox-attachment-info"  style="margin:8px;">
									<div class="input-group input-group-sm">
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
										&nbsp;&nbsp;
										<span class="input-group-append-sm">							
											<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>											
										</span>
									</div>
								</div>
								
								
								
							</div>
						    
						    </td>
						  
						    <td>
								  
								  
								  
							<div class="form-group row col-md-12">
							<label for="dept_code" class="col-sm-4" >
							부서</label>
							<div class="col-sm-8">
								<select name="dept_code" class="form-control" >
									<option value="B001">경리부</option>
									<option value="B002">사업부</option>
									<option value="B003">시설관리부</option>
									<option value="B004">인사부</option>
									<option value="B005">홍보부</option>
									<option value="B006">임원</option>
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
									<option value="C001">사원</option>
									<option value="C002">대리</option>
									<option value="C003">기사</option>
									<option value="C004">계장</option>
									<option value="C005">과장</option>
									<option value="C006">차장</option>
									<option value="C007">팀장</option>
									<option value="C008">부장</option>
									<option value="C009">이사</option>
									<option value="C010">이사장</option>
									<option value="C011">사장</option>
									<option value="C012">회장</option>
								</select>
							</div>
						</div>		
								
								
								
								
								
								
						  </td>
						  </tr>
						  
						  
						  <tr>
						    <td>
						    	<div class="form-group row col-md-12">
							<label for="rspofc_code" class="col-sm-4"  >
							직책</label>
							<div class="col-sm-8">
								<select name="rspofc_code" class="form-control" >
									<option value="D001">경리부사원</option>
									<option value="D002">경리부팀장</option>
									<option value="D003">경리부부장</option>
									<option value="D004">사업부사원</option>
									<option value="D005">사업부팀장</option>
									<option value="D006">사업부부장</option>
									<option value="D007">시설관리부사원</option>
									<option value="D008">시설관리부팀장</option>
									<option value="D009">시설관리부부장</option>
									<option value="D010">인사부사원</option>
									<option value="D011">인사부팀장</option>
									<option value="D012">인사부부장</option>
									<option value="D014">홍보부사원</option>
									<option value="D015">홍보부팀장</option>
									<option value="D016">홍보부부장</option>
									<option value="D017">임원</option>
								</select>
							</div>
						</div>
						    </td>
						  </tr>
					
						  
						
						  
						  <tr>
						  <td>
						  
								<div class="form-group row col-md-12">
									<label for="cttpc" class="col-sm-4 control-label">
									전화번호</label>
									<div class="col-sm-8">	
										<div>
											<select style="width:80px;" name="cttpc" id="cttpc" class="form-control">
												<option value="">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="017">017</option>
												<option value="018">018</option>
											</select>
											&nbsp;
											<input style="width:72px;" name="cttpc" type="text" class="form-control" />
											&nbsp;
											<input style="width:72px;" name="cttpc" type="text" class="form-control" />						
										</div>
									</div>
								</div>
						  </td>
						  </tr>
						  
						    <tr>
						  <td>
								
								<div class="form-group row col-md-12">
									<label for="fxnum" class="col-sm-4 control-label">팩스번호</label>
									<div class="col-sm-8">	
										<div>
											<select style="width:80px" name="fxnum" id="fxnum" class="form-control">
												<option value="">선택</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
											</select>
											&nbsp;
											<input style="width:72px;" name="fxnum" type="text" class="form-control" />
											&nbsp;
											<input style="width:72px;" name="fxnum" type="text" class="form-control" />						
										</div>
									</div>
								</div>
						  </td>
						  </tr>
								
							
						  
						  
						  <tr>
						  <td>
								
								<div class="form-group row col-md-12">
									<label for="encpn" class="col-sm-4" >
									입사일</label>
									<div class="col-sm-8 input-group-sm">
										<input name="encpn" type="date" class="encpn">
									</div>
								</div>
						  </td>
						  </tr>
						  
						  
						  <tr>
						  <td>
						  		<div class="form-group row col-md-12">
									 <label for="id" class="col-sm-4"  > 
									 	사원번호</label>	
									<div class="col-sm-8 input-group input-group-sm">
										<input name="empno" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
												type="text" class="form-control" id="id" placeholder="숫자만 입력하세요 ">
										&nbsp;&nbsp;
										<span class="input-group-append-sm">
											<button type="button" onclick="idCheck_go();" style="margin-top:3px;" class="btn btn-info btn-sm btn-append">중복확인</button>
										</span>								
									</div>								
								</div>
						  </td>
						  <td>
								<div class="form-group row col-md-12">
									<label for="ip_adres" class="col-sm-4" >
									아이피주소</label>
									<div class="col-sm-8 input-group-sm">
										<input name="ip_adres" type="text" class="form-control" id="ip_adres">
									</div>
								</div>
						  </td>
						  </tr>
						  
						  <tr>
						  <td>
						  	<div class="form-group row col-md-12">
									<label for="nm" class="col-sm-4" >
										이름</label>
									<div class="col-sm-8 input-group-sm">								
										<input class="form-control" name="nm" type="text" class="form-control" id="nm" />
									</div>
									
								</div>
						  </td>
						  <td>
								<div class="form-group row col-md-12">
									<label for="email_adres" class="col-sm-4" >
									이메일</label>
									<div class="col-sm-8 input-group-sm">
										<input name="email_adres" type="email" class="form-control" id="email"
												placeholder="example@naver.com">
									</div>
								</div>
						  </td>
						  </tr>
<!-- 							</div> -->
						   
						   
						   
						   
						   
						   
						</table>
						
						
						
						
					  
					  
					  
						<div style="text-align:center; padding: 20px 0;">


								<div>
									<button type="button" id="registBtn" onclick="regist_go(); return false;" class="btn btn-regist">가입하기</button>
									<button type="button" id="cancelBtn" onclick="CloseWindow();"
										class="btn btn-cancle">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
							 	</div>
							 	
							
						</div>
						
						
					</form>					
					
					
				</div><!-- register-card-body -->
			</div>
		</div>
	</section>		<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<form role="imageForm" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();"
			style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>



<jsp:include page="./js/regist_js.jsp" />

</body>