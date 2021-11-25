<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
</head>
<body>
<c:if test="${from eq 'regist1' }">
	<script>
	
		alert("결재 기안에 성공했습니다.");
		window.opener.parent.location.reload();
		window.close();
		
	
	</script>
</c:if>		
<c:if test="${from eq 'regist2' }">
	<script>
	
		alert("임시 저장에 성공했습니다.");
		window.opener.parent.location.reload();
		window.close();
		
	
	</script>
</c:if>		
<c:if test="${from eq 'modify' }">
	<script>
		
		alert("수정에 성공했습니다.");
		location.href="<%=request.getContextPath()%>/approval/ddbox/modifyForm?sanctn_no=${scno}";
		
	
	</script>
</c:if>		
<c:if test="${from eq 'cancel' }">
	<script>
		
		alert("결재기안이 취소되었습니다.");
		window.opener.parent.location.reload();
		window.close();		
	
	</script>
</c:if>		
<c:if test="${from eq 'approve' }">
	<script>
		
		alert("승인 되었습니다.");
		location.href="<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${sanc_no}";
	
	</script>
</c:if>		
<c:if test="${from eq 'reject' }">
	<script>
		
		alert("반려 되었습니다.");
		location.href="<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${sanc_no}";
	
	</script>
</c:if>		
</body>
