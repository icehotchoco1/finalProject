<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="innnd" value="1"/>
    
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/eccstRgForm.css">
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
p, a {
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 13px;
	font-weight: bold;
}
td {
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  font-size: 13px;
}
th {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
}
div.boxing {
  height: 280px;
}
div#vert-tabs-tab a{
  font-size: 17px;
  padding: 14px 16px;
}
.tab-content a {
  font-size: 16px;
}
div.not_exist {
  margin-top: 100px;
}
</style>

</head>

<title>기안문 작성</title>


<body>
<script>
function click(param){
	
// 	alert("성공");
	
	var renewURL = "";
	var param = param;
	if (param == 'perAttend') {
		renewURL = "http://192.168.45.29/gw/index.do?mCode=M010101";
	} else if (param == 'perVac') {
		renewURL = "http://192.168.45.29/gw/index.do?mCode=M010102";
	}
	
// 	console.log(renewURL);
	
	
	window.top.location.href = renewURL;
}
</script>
<%-- 
<c:if test="${from eq 'regist'}">
      <script>   
         alert('공지사항 등록을 성공했습니다!');
         window.opener.location.
();
         window.close();
      </script>
</c:if>

 --%>	 
    <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">결재</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header">기안함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">기안문 작성</p>  				
	  			</div>

	  		</div>
	  	</div>
	</section>
	 
	 <br/>
	 <!-- Main content -->
    <section class="content">		
		<div class="gw-card">
<!-- 			<div class="card-header with-border"> -->
			
<!-- 				<div class="row"> -->
<!-- 					<div class="col-sm-1"></div> -->
<!-- 					<div class="col-sm-10" style="padding:0;"> -->
					
<!-- 						<div class="card card-outline card-outline-tabs"> -->
<!-- 			              <div class="card-header p-0 border-bottom-0" style="margin:0;"> -->
<!-- 			                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist"> -->
<!-- 			                  <li class="nav-item"> -->
<!-- 			                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">최근 사용 양식</a> -->
<!-- 			                  </li> -->
<!-- 			                  <li class="nav-item"> -->
<!-- 			                    <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">즐겨 찾는 양식</a> -->
<!-- 			                  </li> -->
<!-- 			                </ul> -->
<!-- 			              </div> -->
<!-- 			              <div class="card-body" style="height:120px;"> -->
<!-- 			                <div class="tab-content" id="custom-tabs-four-tabContent"> -->
<!-- 			                  <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab"> -->
<!-- 			                  	최근 사용 양식 -->
<!-- 			                  </div> -->
<!-- 			                  <div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab"> -->
<!-- 			                  	즐겨 찾는 양식 -->
<!-- 			                  </div> -->
<!-- 			                </div> -->
<!-- 			              </div> -->
<!-- 			              /.card -->
<!-- 			            </div> -->

<!-- 					</div> -->
<!-- 					<div class="col-sm-1"></div> -->
<!-- 				</div> -->
				
				
<!-- 			</div> -->
			
			
			<br/>
			<div class="card-body" style="height : 500px;">
				<div class="row" >
				  <div class="col-sm-1"></div>
	              <div class="col-sm-5 boxing" id="boxing_1">
	                <div class="nav flex-column nav-tabs" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
	                  <a class="nav-link active" id="vert-tabs-0-tab" data-toggle="pill" href="#vert-tabs-0" role="tab" aria-controls="vert-tabs-0" aria-selected="true">
	                  <i class="fa fa-archive fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;전체</a>
	                  <a class="nav-link" id="vert-tabs-1-tab" data-toggle="pill" href="#vert-tabs-1" role="tab" aria-controls="vert-tabs-1" aria-selected="false">근태 관련 양식</a>
	                  <a class="nav-link" id="vert-tabs-2-tab" data-toggle="pill" href="#vert-tabs-2" role="tab" aria-controls="vert-tabs-2" aria-selected="false">총무팀 양식</a>
	                  <a class="nav-link" id="vert-tabs-3-tab" data-toggle="pill" href="#vert-tabs-3" role="tab" aria-controls="vert-tabs-3" aria-selected="false">관리팀 양식</a>
	                  <a class="nav-link" id="vert-tabs-4-tab" data-toggle="pill" href="#vert-tabs-4" role="tab" aria-controls="vert-tabs-4" aria-selected="false">기타양식</a>
	                </div>
	              </div>
	              <div class="col-sm-5 boxing" id="boxing_2">
	                <div class="tab-content" id="vert-tabs-tabContent">
	                  <div class="tab-pane text-left fade active show" id="vert-tabs-0" role="tabpanel" aria-labelledby="vert-tabs-0-tab">
	        	          <c:forEach items="${erfList}" var="erf">
		                      <div style="padding:4px 3px;">
		                          <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;
		                          <c:if test="${erf.form_no eq 'erf1' }">
			                          <a href="javascript:click('perAttend');">${erf.form_nm}</a> <br/>
			                          
		                          </c:if>
		                          <c:if test="${erf.form_no eq 'erf2' }">
			                          <a href="javascript:click('perVac');">${erf.form_nm}</a> <br/>
		                          </c:if>
		                          <c:if test="${erf.form_no eq 'erf5' }">
			                          <a href="javascript:click('perAttend');">${erf.form_nm}</a> <br/>
		                          </c:if>
		                          <c:if test="${erf.form_no ne 'erf5' and erf.form_no ne 'erf1' and erf.form_no ne 'erf2'}">
			                          <a href="javascript:return false;" onclick="javascript:OpenWindow('registForm.do?form_no=${erf.form_no}','기안작성',900,890);">${erf.form_nm}</a> <br/>
		                          </c:if>
		                      </div>        
	    	              </c:forEach>
	                  </div>
	                  <div class="tab-pane fade" id="vert-tabs-1" role="tabpanel" aria-labelledby="vert-tabs-1-tab">
		                  <c:forEach items="${erfList}" var="erf">
		                    <c:if test="${erf.se eq '1'}">
		                      <div style="padding:4px 3px;">
		                          <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;
		                          <a href="javascript:return false;" onclick="javascript:OpenWindow('registForm.do?form_no=${erf.form_no}','기안작성',900,890);">${erf.form_nm}</a> <br/>
		                      </div>        
		                    </c:if>
		                  </c:forEach>
	                  </div>
	                  <div class="tab-pane fade" id="vert-tabs-2" role="tabpanel" aria-labelledby="vert-tabs-2-tab">
		                  <c:forEach items="${erfList}" var="erf">
		                    <c:if test="${erf.se eq '2'}">
		                      <div style="padding:4px 3px;">
		                          <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;
		                          <a href="javascript:return false;" onclick="javascript:OpenWindow('registForm.do?form_no=${erf.form_no}','기안작성',900,890);">${erf.form_nm}</a> <br/>
		                      </div>        
		                    </c:if>
		                  </c:forEach>
	                  </div>
	                  <div class="tab-pane fade" id="vert-tabs-3" role="tabpanel" aria-labelledby="vert-tabs-3-tab">
		                  <c:forEach items="${erfList}" var="erf">
		                    <c:if test="${erf.se eq '3'}">
		                   		<c:set var="innnd" value="100"/>
				                      <div style="padding:4px 3px;">
				                          <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;
				                          <a href="javascript:return false;" onclick="javascript:OpenWindow('registForm.do?form_no=${erf.form_no}','기안작성',900,890);">${erf.form_nm}</a> <br/>
				                      </div>        
		                   	
		                   		
		                    </c:if>
		                  	
	                   		<c:if test="${innnd eq  '1' }">
		                   		<c:set var="innnd" value="50"/>
		                   		  <div class="not_exist">
		                   			<i class="fa fa-times fa-lg" aria-hidden="true"></i><br/><br/>
		                   			<span>양식이 존재하지 않습니다.</span>
		                   		  </div>
	                   		</c:if>
									                  
		                  </c:forEach>
	                  </div>
	                  <div class="tab-pane fade" id="vert-tabs-4" role="tabpanel" aria-labelledby="vert-tabs-4-tab">
		                  <c:forEach items="${erfList}" var="erf">
		                    <c:if test="${erf.se eq '100'}">
		                      <div style="padding:4px 3px;">
		                          <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;
		                          <a  href="javascript:return false;" onclick="javascript:OpenWindow('registForm.do?form_no=${erf.form_no}','기안작성',900,890);">${erf.form_nm}</a> <br/>
		                      </div>        
		                    </c:if>
		                  </c:forEach>
	                  </div>
	                </div>
	              </div>
	              <div class="col-sm-1"></div>
	            </div>
			</div>
			  
			  
			  
			
			<div class="card-footer">
				
			</div>
		
		
		
		
			</div>
		
    </section>
    <!-- /.content -->
<script>



</script>
</body>
</html>