<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>


.btn-basic {
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

.box1{
	border-bottom: red;
	

}

#box{
	margin:0 auto; 
	text-align: center;
	padding:50px;
}


#modal .title {
	display: block;
/*     padding-left: 10px; */
	padding-top: 20px;
	padding-bottom: 20px;
	text-align: center;
    text-shadow: 1px 1px 2px gray;
   	color: black;
}

#modal .title h2 {
	font-family: 'Do Hyeon', sans-serif;
    display: inline;
    font-size: 23px;
   	text-align: center;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

.modal_close_btn {
	display: inline;
	padding-right: 10px;
}

.input-box {
	margin-left: auto;
	margin-right: auto;
	font-family: 'Do Hyeon', sans-serif;
	background: transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 40%;
}
.modal-password {
	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	width: 257.78px;
}

#pwdWarn {
	color: red; 
	height: 30px;
	margin-top: 18px;
	margin-bottom: 8px;
	text-align: center;
}
</style>
<div class="row">

<div class="col-sm-2" >
</div>
<!--  <div class="col-sm-8" style="float: left; width:100%; padding:0;"> -->
<div class="col-sm-8"  id ="box">
<form id="pwForm" name="pwForm" action="<%=request.getContextPath()%>/approval/settings/approvalPassword" method="POST"> 
 <input type="hidden" id="empno" name="empno" value="${loginUser.empno }">

    <div id="modal" class="modal-overlay">
        <div class="modal-PwWindow" id="modal-PwWindow">
            <div class="title">
                <h2>비밀번호 변경</h2>
            </div>
				<div class="input-box">
					<input class="modal-password" id="password" type="password" name="sanctn_password"  placeholder="새 비밀번호">
				</div>
				<div class="input-box">
					<input class="modal-password" id="verifyPassword" type="password" name="password2" placeholder="비밀번호 확인">
					<input type="hidden" id="empno" name="empno" value="${loginUser.empno }">
				</div>
				<div id="pwdWarn" style="color: red; height: 30px;"></div>
        </div>
   
    </div>
</form>
					<button type="button" class="btn btn-basic" id="editBtn"  onclick="approvalPassword();">변경</button>
</div>
<div class="col-sm-2" >
</div>
</div><!-- row -->

<script>
	function approvalPassword(){
		var form=document.pwForm;
		if(${msg ne null}){
			alert('${msg}');
		};
		
			if($("#password").val() !== $("#verifyPassword").val()){
				alert("비밀번호가 다릅니다.");
				$("#password").val("").focus();
				$("#verifyPassword").val("");
				return false;
			}else if ($("#password").val().length < 4) {
				alert("비밀번호는 4자 이상으로 설정해야 합니다.");
				$("#password").val("").focus();
				return false;
			}else if($.trim($("#password").val()) !== $("#password").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}else{
				alert("결재비밀번호 변경 성공");
			}
		form.submit();	
	}
</script>
