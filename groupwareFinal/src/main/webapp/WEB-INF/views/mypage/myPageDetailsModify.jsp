<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="clsfName" value="${clsfName }" />
<c:set var="rspofcName" value="${rspofcName }" />
<c:set var="deptName" value="${deptName }" />
<c:set var="cttpc" value="${cttpc }" />
<c:set var="email_adres" value="${email_adres }" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css"> --%>
<!-- myPageDetail.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypage/myPageDetail.css">
</head>
<body>
	 
	 <c:if test="${from eq 'modify'}">
	      <script>
	         alert("수정되었습니다.");
	      window.opener.location.reload();
	   </script>
	</c:if>
	
	<div class="pop-container" style="min-width:800px;">
		<section class="content-header">
			<div class="container-fluid">
				<!-- 상단바 -->
				<div class="row md-2">
					<p class="menu-header" style="display: inline; margin-right: 509px">
						회원 정보 수정
					</p>
					<button type="button" class="btn btn-save" id="saveBtn" style="margin-right: 10px;" onclick="modify_save();">저 장</button>
					<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();">닫 기</button>
				</div><!-- ./row md-2 -->
				<!-- ./상단바 -->
			</div><!-- ./container-fluid -->
		</section><!-- ./content-header -->
		<form role="form" method="post" name="empModifyForm" action="myPageDetailsModify">
			<div class="profile-contents">
				<table style="margin-left: auto; margin-right: auto; width: 600px; line-height: 40px;">
					<tr style="height: 300px; border-top-style: none;"><td colspan="2" style="text-align: center"><img  class="myProfile" src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${loginUser.face_photo }" alt="profile img" style="height: 280px; width: 180px"></td></tr>
					<tr style="border-top-style: none; height: 63px;">
						<td colspan="2" style="text-align: center;">
							<button type="button" class="btn btn-upload" id="uploadBtn">사진 업로드</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-upload" id="uploadBtn" onclick="change_pwd()">비밀번호변경</button>
						</td>
					</tr>
					<tr class="first-tr">
						<th>사  번</th>
						<td>${loginUser.empno }</td>
					</tr>			
					<tr>
						<th>이  름</th>
						<td>${loginUser.nm }</td>
					</tr>			
					<tr>
						<th>부  서</th>
						<td>${deptName }</td>
					</tr>			
					<tr>
						<th>직  급</th>
						<td>${clsfName }</td>
					</tr>			
					<tr>
						<th>직  책</th>
						<td>${rspofcName }</td>
					</tr>			
					<tr>
						<th>입사일</th>
						<td><fmt:formatDate value="${loginUser.encpn}" pattern="yyyy-MM-dd"/></td>
					</tr>			
					<tr>
						<th>퇴사일</th>
						<td>
							<fmt:formatDate value="${loginUser.retire_de}" pattern="yyyy-MM-dd"/>
							<c:if test="${empty loginUser.retire_de}" >
							-
							</c:if>		
						</td>
					</tr>			
					<tr>
						<th>연락처</th>
						<td style="background: #E0F2F7"><input id="cttpc" type="text" value="${cttpc }" class="edit-textbox" name="cttpc"></td>
					</tr>			
					<tr>
						<th>이메일 주소</th>
						<td style="background: #E0F2F7"><input id="email_adres" type="text" value="${email_adres }" class="edit-textbox" name="email_adres"></td>
					</tr>			
					<tr>
						<th>팩스 번호</th>
						<td>${loginUser.fxnum }</td>
					</tr>			
					<tr>
						<th>활성 여부</th>
						<td>${loginUser.actvty_at }</td>
					</tr>			
					<tr class="last-tr">
						<th>IP 주소</th>
						<td>${loginUser.ip_adres }</td>
					</tr>			
				</table>
			</div><!-- ./profile-contents -->
		</form>
	</div><!-- ./pop-container -->
	<br>
	<br>
	
<!-- 모달 -->
    <div id="modal" class="modal-overlay">
        <div class="modal-PwWindow" id="modal-PwWindow">
            <div class="title">
                <h2>비밀번호 변경</h2>
            </div>
				<div class="input-box">
					<form role="form" method="post" name="pwModifyForm" action="pwModify">
						<input class="modal-password" id="password" type="password" name="password" placeholder="새 비밀번호">
					</form>
				</div>
				<div class="input-box">
					<input class="modal-password" id="verifyPassword" type="password" placeholder="비밀번호 확인">
				</div>
				<div id="pwdWarn" style="color: red; height: 30px;"></div>
					<button type="button" class="btn btn-basic" id="editBtn" style="margin-right: 10px;" onclick="pwSave();">저 장</button>
					<button type="button" class="btn modal-close" id="modalClose" style="margin-right: 10px;">닫 기</button>
        </div>
        <input id="pwd" type="hidden" value="${loginUser.password }">
    </div>
<script>
	// 모달 열기
	function change_pwd(){
		modal.style.display = "flex";		
	}
	
	// 모달 닫기
	// 닫기 버튼 사용
	const closeBtn = modal.querySelector("#modalClose")
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	});
	
	// 오버레이 부분 클릭
	modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
	    }
	});
	
	// ESC 키
	window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
	    }
	});
	
	// pw 두개 값 비교
    function pwSave(){
		var inputPwd = document.getElementById("password").value;
		var verifyPwd = document.getElementById("verifyPassword").value;
		var pwdWarnPlace = document.getElementById("pwdWarn");
		
		if (inputPwd == verifyPwd){
			var form = document.pwModifyForm;
			form.submit();
		} else if (inputPwd == ''){
			pwdWarnPlace.innerHTML = "새로 사용할 비밀번호를 입력해주세요.";
		} else if (verifyPwd == ''){
			pwdWarnPlace.innerHTML = "비밀번호 확인을 입력해주세요.";
		} else {
			pwdWarnPlace.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
		
	}
	
	// 수정 정보 저장
	function modify_save(){
// 		alert("modifysave Test");
		
		var form = document.empModifyForm;
		
		form.submit();
	}
	
// 	// 비밀번호 변경 저장
// 	function pwSave(){
// 		alert("pwsaved")

// 		var form = document.pwModifyForm;
		
// 		form.submit();
// 	}
</script>
</body>
</html>