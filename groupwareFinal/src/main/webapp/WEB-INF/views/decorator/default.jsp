<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><sitemesh:write property="title" /></title>
<jsp:include page="/WEB-INF/views/include/style.jsp" />	
  
  <sitemesh:write property="head" />
</head>
<body>
<div class="wrapper">

  <!-- navigation -->
  <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
  	
  <!-- secondNav -->
  <%@ include file="/WEB-INF/views/include/secondhead.jsp" %>



  <sitemesh:write property="body" />


  <!-- Main Footer -->
  <footer class="main-footer" style="margin:0; padding:8px;">
    <!-- Default to the left -->
    <strong><span>Copyright &copy; 202104_405_4team <a href="https://adminlte.io"><span>GW 그룹웨어.io</span></a></span></strong>
  </footer>
</div>
<!-- ./wrapper -->

<jsp:include page="/WEB-INF/views/include/js.jsp" /> 
  
</body>
</html>