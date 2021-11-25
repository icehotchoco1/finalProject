<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">


<script>
window.onload = function(){
	  /* 1영역, 2영역 크기 확인 

	  $('#container') : 2영역 컨텐츠를 감싸고 있는 div 

	  (window.outerWidth - window.innerWidth) : 1영역 width 

	  (window.outerHeight - window.innerHeight) : 1영역 height 

	  */ 

//	  var strWidth = $('#container').outerWidth() + (window.outerWidth - window.innerWidth);

//	  var strHeight = $('#container').outerHeight() + (window.outerHeight - window.innerHeight);

	 

	  //resize 

	  window.resizeTo(500, 300);
	
}
</script>
<style>
.container {
  padding:12px;
  background: #004680;
  height: 20px;
  font-family: 'Do Hyeon', sans-serif;
  font-size: 16px;
  color: white;
}
.saveTable{
	width : 480px;
}
.lineNamelbl{
	 font-family: 'Do Hyeon', sans-serif;
  font-size: 16px; 
	background: #EFEFEF;
}
.lineInfolbl{
	font-family: 'Do Hyeon', sans-serif;
  	font-size: 16px; 
	background: #EFEFEF;
}
#inT{
	width:370px;
}
#textA{
	width:370px;
	height : 100px;
}
.btn-regist:hover {
  background: white;
  color: #59BEE9;
}
.btn-cancle:hover {
  background: #F7F6ED;
  color: tomato;
}
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
</style>
</head>
<body>


<form id="LNsbmit" action="saveSanctn.do" method="POST">
 <c:forEach items="${empList }" var="emp" varStatus="status" >
 	<input type="hidden" name="empno" value="${emp.empno }"/>
 </c:forEach>	
 	<input type="hidden" name="form_no" value="${erfId }"/>
 	<input type="hidden" name="saveUser" value="${saver }"/>
	
<table class="saveTable">
	<tr>
		<td colspan="2" class="container">
			<i class="fas fa-address-book"></i>
			결재선지정
		</td>
	</tr>
	<tr>
		<td class="lineNamelbl">
		 	결재선 제목
		 </td>
		 <td>
		 	<input id="inT" type="text" name="lineName"/>
		 </td>
	</tr>
	<tr>
		<td class="lineInfolbl">
			결재선 설명
		</td>
		<td>
			<textarea id="textA" name="lineInfo" style="resize: none;"></textarea>
		</td>
	</tr>
	<tr>
		<td class="buttons" colspan="2" style="text-align: center;">
			<button class="btn btn-regist modal_chk_btn1" type="button" onclick="saveSanctnerLN();">저장</button>
			<button class="btn btn-cancle modal_close_btn" type="button" onclick="CloseWindow();">취소</button>
		</td>
	</tr>
</table>

</form>

<script>
function saveSanctnerLN(){
	var form = $('#LNsbmit');
	
	if($('#inT').val()==""){
		alert("제목을 입력해주세요.")
		return;
	}
	if($('#textA').val()==""){
		alert("설명을 입력해주세요.")
		return;
	}
	
	form.submit();
}
</script>

</body>

