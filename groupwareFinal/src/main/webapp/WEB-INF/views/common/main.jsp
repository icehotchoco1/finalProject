<%@page import="java.util.Date"%>
<%@page import="kr.or.gw.dto.OrgnztEmpMngtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="deptInfo" value="${deptInfo.deptInfo }" /> 

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />

<c:set var="schMap" value="${schMap.schDdayList }" />
<c:set var="adboxMap" value="${adboxMap.eccWaitList }" />
<c:set var="myCommute" value="${myCommute }" />
<c:set var="mngtList" value="${mngtMap.mngtList }" />

<c:set var="pageMaker" value="${public_dataMap.pageMaker }" />
<c:set var="cri" value="${public_dataMap.pageMaker.cri }" />
<c:set var="dbxpublicList" value="${public_dataMap.dbxPublicList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- tab style -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">
<script>
  $(function() {
    $(".column").sortable({
      // 드래그 앤 드롭 단위 css 선택자
      connectWith: ".column",
      // 움직이는 css 선택자
      handle: ".card-header",
      // 이동하려는 location에 추가 되는 클래스 (드래그할 경우 뒤에 생기는 노란 배경)
      placeholder: "card-placeholder"
    });
    // 해당 클래스 하위의 텍스트 드래그를 막는다.
    $( ".column .card" ).disableSelection();
  });
</script>
<style>
/* 마우스 포인터을 손가락으로 변경 */
.card:not(.no-move) .card-header{
  cursor: pointer;
}
/* 이동 타켓 */
.card-placeholder {
   border: 2px dotted grey; 
   margin: 0 1em 1em 0; 
   height: 50px; 
   margin-left:auto; 
   margin-right:auto; 
/*  노란색으로 표신되는 것이 주요 포인트  */
   background-color: #FCF4C9;
}
p {
  font-family: 'Gowun Dodum', sans-serif;
  color:grey;
  font-size: 13px;
  font-weight: bold;
}
.card-header {
  margin-top: 0;
}
.card-body {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 12px;
  font-weight: bold;
}
.card-title {
  font-size: 12px;
  font-weight: bold;
}
.font-basic{
  font-size: 14px;
  font-weight: bold;
}
.widget-body {
  width: 65px;
  height: 85px;
  background: #E4E9E8;
  border-radius: 8px;
  text-align: center;
  cursor: pointer;
  color: black;
  margin: 0 auto;
  margin-top: 10px;
}
.widget-body p {
  font-family: 'Gowun Dodum', sans-serif;
  color: black;
  margin-top: 10px;
  font-size: 13px;
}
.widget-body:hover, .widget-body:focus, .widget-body:active{
  background: #C4C7CD;
  color: #007bff;
}
.widget-body i {
  color: black;
}

.fix {
  padding:4px 0; 
  border-top: 5px solid #293648;
  border-bottom: 5px solid #293648;
  border-radius: 5px;
  text-align: center;
  background: #C7B492;
}
.card-outline-sm {
  background: #293648;
  height: 105px;
  text-align: center;
  border-radius: 8px;
} 
.col-sm-4 {
  padding: 0 5px;
}
p.main_img_p {
  font-family: 'Raleway Dots', cursive;
  color: ivory;
  font-size: 25px;
}
p.up {
  position: absolute;
  top: 30px;
  left: 350px;
}
p.down {
  position: absolute;
  top: 70px;
  left: 430px;
}
#icon-div {
  height: auto;
  margin: 0 auto;
}
.fa-user-circle-o {
  color: white;
}
#profil {
  width: 300px;
  height:270px; 
  margin:0 auto;
  padding-top: 10px;
}
.profil-info {
  padding-top: 10px;
}
.profil-info p#info-name {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 18px;
  color: black;
  margin-bottom: 5px;
}
.btn-tool {
  padding: 4px;
}
#info-ip {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
  color: #3B3F3D;
  background: powderblue;
  border-radius: 6px;
  padding: 2px 7px;
}
#ip_adres {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
  color: #3B3F3D;
}
.commute-div {
  margin: 8px;
}
.info-commute {
  font-weight: bold;
  font-size: 11px;
  color: white;
  background: #41875A;
  border-radius: 6px;
  padding: 2px 6px;
  float: left;
}
a {
  display: block;
  height: 85px;
  padding-top:13px; 
}
.table th {
  padding: 8px;
}
.table td {
  padding: 8px;
}
.last-tr2 {
  border-bottom: 1px solid #EFEFEF;
  height: 40px;
}
/*  */
.dday-table {
  border: 1px solid #EFEFEF;
  text-align: center;
}
.dday-table2 {
  border: 1px solid #EFEFEF;
  text-align: center;
  margin-top: 25px;
}
.td1 {
  width: 40px;
  border-right: 1px solid #EFEFEF;
}
.td2 {
  width: 160px;
  border-right: 1px solid #EFEFEF;
}
.td3 {
  width: 80px;
}
.td4 {
  width:100px;
}
.d {
  margin: 0 auto;
  height: 20px;
  font-size: 13px;
  font-weight: bold;
  background: #004680;
  color: white;
  width: 70px;
  text-align: center;
}
.plus-btn {
  border: none;
  float: right;
}
</style>
</head>
<body style="background:#f4f6f9;">
<script>
function click(param){
	
// 	alert("성공");
	
	var renewURL = "";
	var param = param;
	
	if (param == 'attendance') {
		renewURL = "http://localhost/gw/index.do?mCode=M010100";
	} else if (param == 'commute') {
		renewURL = "http://localhost/gw/commute/main";
	} else if (param == 'approval') {
		renewURL = "http://localhost/gw/index.do?mCode=M020200";
	} else if (param == 'return') {
		renewURL = "http://localhost/gw/index.do?mCode=M020303";
	} else if (param == 'news') {
		renewURL = "http://localhost/gw/index.do?mCode=M050500";
	} else if (param == 'wait') {
		renewURL = "http://localhost/gw/index.do?mCode=M030400";
	} 
	
// 	console.log(renewURL);
	
	
	window.top.location.href = renewURL;
}
</script>
<div class="wrapper">

  	<div class="container-fluid">
	<div class="row" style="background:ivory; margin-bottom: 10px;">
      <div class="col-md-3">
      <div class="container-fluid" style="padding: 0; padding-top:5px;">

		  <div>
            <div class="card card-outline fix">

              <div id="profil" class="card-body">
                <div id="icon-div">
                <c:forEach items="${deptInfo}" var="deptInfo" varStatus="status">
	                <c:if test="${not loginUser.face_photo eq deptInfo.face_photo}" >
		              	<i class="fa fa-address-card-o fa-4x" aria-hidden="true"></i>
	                </c:if>
	                <c:if test="${loginUser.face_photo eq deptInfo.face_photo}" >
	                <img src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${deptInfo.face_photo}" 
	                     class="img-circle" alt="User Image" style="width:100px; height:100px; margin-top:5px;">
	                </c:if>
	                
                </c:forEach>
                </div>
                
                <div class="profil-info">
	              	<p id="info-name">${loginUser.nm }</p>
	              	<span id="info-ip">IP</span>&nbsp;&nbsp;<span id="ip_adres">${loginUser.ip_adres}</span>
	              	<hr/>
	              	<div class="commute-div">
		              	<span class="info-commute">출근</span>&nbsp;
							
			              	<c:if test="${empty myCommute.attend_time}" >
			              		<span>-</span>
			              	</c:if>

		              		<span style="vertical-align: revert;">
              					<fmt:formatDate type="both" value="${myCommute.attend_time }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
		              		</span>
		              		
		            </div>
	              	<div class="commute-div">
		              	<span class="info-commute">퇴근</span>&nbsp;

						
			              	<c:if test="${empty myCommute.lvffc_time}" >
			              		<span>-</span>
			              	</c:if>
			              	
			              	<span style="vertical-align: revert;">
			              		<fmt:formatDate type="both" value="${myCommute.lvffc_time }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
			              	</span>
		              	
	              	</div>
                </div>
                
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
          </div>
      </div><!-- /.container-fluid -->
	</div>
	
	
    <div class="col-md-6" style="margin-top:8px;">
      <div class="container-fluid">
        <img src="<%=request.getContextPath() %>/resources/css/common/img/main_img.jpg" style="width:100%; height: 280px;">
        <p class="main_img_p up">Office Anywhere,</p>
        <p class="main_img_p down">Work Anything</p>
	  </div>
	</div>
	
	
    <div class="col-md-3">
		  <div class="container-fluid" style="padding: 0; padding-top:5px;">
	
			<div>
	            <div class="card card-outline fix">

	              <div class="card-body" style="height:270px;">
	              <div class="row" style="margin-top:5px;">
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="javascript:click('attendance');">
						         <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i><br>
						         <p>개인근태</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="javascript:click('commute');">
						         <i class="fa fa-check fa-2x" aria-hidden="true"></i><br>
						         <p>출퇴근</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="javascript:click('approval');">
						         <i class="fa fa-pencil fa-2x" aria-hidden="true"></i><br>
						         <p>기안작성</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
								 <a href="javascript:click('return');">
						         <i class="fa fa-retweet fa-2x" aria-hidden="true"></i><br>
						         <p>반려문서함</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="javascript:click('news');">
						         <i class="fa fa-newspaper-o fa-2x" aria-hidden="true"></i><br>
						         <p>회사소식</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="javascript:click('wait');">
						         <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i><br>
						         <p>대기업무함</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						</div>
	              </div>
	              <!-- /.card-body -->
	              
	            </div>
	            <!-- /.card -->
	         </div>
	      </div><!-- /.container-fluid -->  	
	</div>	
	</div>
		
	</div>
	<!-- 메인 홈 위젯 시작 -->  
  	<div class="container-fluid">
      <div class="row" style="background:#f4f6f9;">
      <!-- 세로 리스트 박스 -->
        <div class="col-4 column">

	      <div class="container-fluid" style="padding: 0;">
	
		  <div>
            <div class="card card-outline">
              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
                <p class="card-title" style="color:#004680; padding-top:4px;">일정 D-DAY</p>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M040000';">
                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="height:250px;">

                <table class="dday-table">
	                <tr>
	                  <td class="td1"></td>
	                  <td class="td2"></td>
	                  <td class="td3"></td>
	                  <td class="td4"></td>
	                </tr>
	                
	                <c:if test="${empty schMap }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>			
					
					<c:forEach items="${schMap}" var="sch">
						<tr class="last-tr2" style='font-size:0.85em;'>
							<td>ㅇ</td>
							<td style="text-align: left;">
								<span class="col-sm-12">${sch.schdul_sj}</span>
							</td>
							<td>${sch.bgnde}</td>
							<td><div class="d">D - ${sch.dday}</div></td>						
						</tr>
					</c:forEach>			
                </table>
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
	      </div>
	      </div><!-- /.container-fluid -->
	      <div class="container-fluid" style="padding: 0;">
			<div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <p class="card-title" style="color:#004680; padding-top:4px;">경조사 게시판</p>
	
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M070000';">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:250px;">
	              	
		              <table class="table text-center">
		                <tr style="font-size:0.95em;">
		                	<th style="width:20%;">번 호</th>
							<th style="width:45%;">제 목</th>
							<th style="width:15%;">작성자</th>
							<th>등록일</th>
		                </tr>
		                
		                <c:if test="${empty mngtList }" >
							<tr class="empList">
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
		                </c:if>
							
						<c:forEach items="${mngtList}" var="mngt" end="4">
							<tr class="" style='font-size:0.85em;'>
								<td>${fn:substring(mngt.bbsctt_no,4,1000000000) }</td>
								<td id="boardTitle" 
									onclick="javascript:window.open('<%=request.getContextPath()%>/board/management/detail.do?bbsctt_no=${mngt.bbsctt_no }&from=list','상세보기','width = 900, height = 800, top = 100, left = 400');">
									<span class="col-sm-12 ">${mngt.sj }</span>
								</td>
								<td data-target="mngt-emp_nm">${mngt.emp_nm }</td>
								<td>
									<fmt:formatDate value="${mngt.rgsde }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>		
							
	                </table>
	                
	                
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	        </div>
	      </div><!-- /.container-fluid -->
        </div>
        
        
        
        <div class="col-4 column">   
	      <!-- 메인 가운데 제일 큰 화면 -->
	      <div class="container-fluid" style="padding: 0;">
	
			  <div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">공지사항</h3>
	
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M050200';">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:250px;">
	                <table class="table text-center" >					
						<tr style="font-size:0.95em;">
							<th style="width:20%;">번 호</th>
							<th style="width:50%;">제 목</th>
							<th style="width:30%;">등록일</th>
						</tr>			
						<c:if test="${empty noticeList }" >
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${noticeList}" var="notice">
							<tr  class="last-tr" style='font-size:0.85em;'>
								<td>${fn:substring(notice.bbsctt_no,4,1000000000) }</td>
								<td id="boardTitle" 
									onclick="javascript:window.open('<%=request.getContextPath()%>/board/notice/detail.do?bbsctt_no=${notice.bbsctt_no}&from=list','상세보기','width = 900, height = 800, top = 100, left = 400');">
									<span class="col-sm-12">${notice.sj}</span>
								</td>
								<td>
									<fmt:formatDate value="${notice.rgsde}" pattern="yyyy-MM-dd"/>
								</td>							
							</tr>
						</c:forEach>
					</table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
	        
         </div>


         <div class="col-4 column">
	
	        <div class="container-fluid" style="padding: 0;">
	
			<div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">결재대기함</h3>
	
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M020302';">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:250px;">
	                 <table class="table text-center" >					
						<tr style="font-size:0.95em;">
							<th style="width:20%;">번 호</th>
							<th style="width:40%;">제 목</th>
							<th style="width:20%;">기안자</th>
							<th style="width:20%;">중요도</th>
						</tr>			
						<c:if test="${empty adboxMap }" >
							<tr>
								<td colspan="5">
								    <br/><br/><br/>
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${adboxMap}" var="eccWait">
							<tr class="last-tr" style='font-size:0.85em;'>
								<td>${fn:substring(eccWait.sanctn_no,4,1000000000) }</td>
								<td id="boardTitle" 
									onclick="javascript:window.open('<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${eccWait.sanctn_no }&from=list','상세보기','width = 900, height = 890, top = 100, left = 400');">
									<span class="col-sm-12">${eccWait.sj}</span>
								</td>
								<td>
									<span class="col-sm-12">${eccWait.nm}</span>
								</td>
								<c:if test="${eccWait.ipcr_code eq '낮음'}">
									<td>${eccWait.ipcr_code}</td>							
								</c:if>
								<c:if test="${eccWait.ipcr_code eq '보통'}">
									<td style="color:blue;">${eccWait.ipcr_code}</td>							
								</c:if>
								<c:if test="${eccWait.ipcr_code eq '높음'}">
									<td style="color:tomato;">${eccWait.ipcr_code}</td>							
								</c:if>
							</tr>
						</c:forEach>
					</table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
	        
	        <div class="container-fluid" style="padding: 0;">
	
			  <div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">공유 문서함</h3>
	
	                <div class="card-tools">
					  <button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M060300';">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:250px;">
	                <table class="table text-center" >
						<tr style="font-size:0.95em;">
							<th style="width:20%;">번 호</th>
							<th style="width:40%;">제 목</th>
							<th style="width:15%;">작성자</th>
							<th>등록일</th>
						</tr>
						<c:if test="${empty dbxpublicList }" >
							<tr>
								<td colspan="4">
								<br/><br/><br/><br/>
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>						
						<c:forEach items="${dbxpublicList}" var="dbxpublic">
							<tr style='font-size:0.85em;'>
								<td>${fn:substring(dbxpublic.dbx_no,4,1000000000) }</td>
								<td id="boardTitle" onclick="javascript:OpenWindow('public/detail.do?dbx_no=${dbxpublic.dbx_no}&from=list','상세보기',900,800);">
									<span class="col-sm-12">${dbxpublic.sj}</span>
								</td>		
								<td>${dbxpublic.emp_nm}</td>
								<td>
									<fmt:formatDate value="${dbxpublic.rgsde}" pattern="yyyy-MM-dd"/>
								</td>							
							</tr>
						</c:forEach>
					</table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
	        <div class="container-fluid" style="padding: 0;">
	        </div><!-- /.container-fluid -->      
         </div>
             
      </div>
    </div>	
</div>  <!-- ./wrapper -->


</body>
</html>