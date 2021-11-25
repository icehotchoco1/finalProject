<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<!-- notice_registForm.css -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/eccstRgForm_registForm.css">

<style>
td {
  font-size: 13px;
}

</style>
</head>

<body>
	<c:if test="${from eq 'modify'}">
		<script>
			alert("저장 되었습니다.");
			window.opener.location.reload();
		</script>
	</c:if>

   
   
  <!-- Content Wrapper. Contains page content -->
  <div class="pop-container" style="min-width:800px;  margin-left: 25px; ">
  	<div>
  		
	  	${escMngt.erf.form_cn }
	  	
  	</div>
  	
  </div>


<script>
window.onload=function(){
	var sj = '<c:out value="${escMngt.sj}"/>';
	$("#form-box-title").val(sj);
	

	var nm = '<c:out value="${loginUser.nm}"/>';
	var empno = '<c:out value="${loginUser.empno}"/>';
	var clsf = '<c:out value="${loginUser.clsf_code}"/>';
	
	$(".userName").text(nm);
	$(".userNum").text(empno);
	$(".userClsf").text(clsf);
	
}
</script>
<script>
  function tempstorage_go(){
//     var sj = $("#form-box-title").val();
//     console.log(sj2);
// 	var input = $("#form-box-title").val(sj2);
	
	
	var form=document.modifyForm;
	var sanctn_no = '<c:out value="${escMngt.sanctn_no}"/>';
	$("#sanctn_no").val(sanctn_no);

	form.submit();
  }
</script>
</body>

    
    
    