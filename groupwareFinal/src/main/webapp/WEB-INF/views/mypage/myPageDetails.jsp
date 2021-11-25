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
	<div class="pop-container" style="min-width:800px;">
		<section class="content-header">
			<div class="container-fluid">
				<!-- 상단바 -->
				<div class="row md-2">
					<p class="menu-header" style="display: inline; margin-right: 509px">
						회원 정보 상세
					</p>
					<button type="button" class="btn btn-basic" id="editBtn" style="margin-right: 10px;" onclick="modify_go();">수 정</button>
					<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();">닫 기</button>
				</div><!-- ./row md-2 -->
				<!-- ./상단바 -->
			</div><!-- ./container-fluid -->
		</section><!-- ./content-header -->
		<div class="profile-contents">
			<table style="margin-left: auto; margin-right: auto; width: 600px; line-height: 40px;">
				<tr style="height: 320px; border-top-style: none;"><td colspan="2" style="text-align: center"><img  class="myProfile" src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${loginUser.face_photo }" alt="profile img" style="height: 280px; width: 180px"></td></tr>
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
					<td>${cttpc }</td>
				</tr>			
				<tr>
					<th>이메일 주소</th>
					<td>${email_adres }</td>
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
	</div><!-- ./pop-container -->
	<br>
	<br>
	<form role="form">
		<input type="hidden" name="bbsctt_no" value="${notice.bbsctt_no}" />
	</form>

<!-- 모달 -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>비밀번호 확인</h2>
            </div>
				<div class="input-box">
					<input class="modal-password" id="password" type="password" name="pw" placeholder="비밀번호">
				</div>
				<div id="pwdWarn"></div>
					<button type="button" class="btn btn-basic" id="editBtn" style="margin-right: 10px;" onclick="pwchk();">확 인</button>
					<button type="button" class="btn modal-close" id="modalClose" style="margin-right: 10px;">닫 기</button>
        </div>
        <input id="pwd" type="hidden" value="${loginUser.password }">
    </div>
    
<script>
	// 모달 생성 버튼 (수정)
 	function modify_go() {
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

// 	window.addEventListener("keyup", e => {
//     	if(e.key === 13){ 
//     		pwchk();
//     		alert("enter");
//     	}
// 	});
           
    // 모달에서 pwd 체크
    function pwchk(){
		var pwd = document.getElementById("pwd").value;
		var inputPwd = document.getElementById("password").value;
		var pwdWarnPlace = document.getElementById("pwdWarn");
		
		if(pwd == inputPwd){
			var formObj = $("form[role='form']");
			formObj.attr({
				'action':'myPageDetailsModifyForm',
				'method':'post'
			});
			formObj.submit();
		} else if (inputPwd == ''){
			pwdWarnPlace.innerHTML = "비밀번호를 입력해주세요.";
		} else {
			pwdWarnPlace.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
		
	}
    
    // 엔터키로 확인버튼 동작
// 	window.addEventListener("keyup", 13 => {
//     		pwchk();
// 	});
//     function press(f){
//     	if(f.keyCode == 13){ 
//     		pwchk();
//     	}
//     }
</script>
</body>
</html>