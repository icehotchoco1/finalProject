<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>
<c:set var="cri" value="${pageMaker.cri }" />
<%-- <c:set var="clsfName" value="${dataMap.codeDc }" /> --%>
<c:set var="clsfName" value="${clsfName }" />
<c:set var="eccWaitList" value="${eccWaitListDataMap.eccWaitList }" />
<c:set var="eccRequestList" value="${eccRequestListDataMap.eccRequestList }" />
<c:set var="jobSendList" value="${jobSendListDataMap.jobSendList }" />
<c:set var="jobRecList" value="${jobRecListDataMap.jobRecList }" />
<c:set var="checkInOut" value="${checkInOut }" />
<c:set var="lateCnt" value="${lateCnt }" />
<c:set var="AbsentCnt" value="${AbsentCnt }" />
<c:set var="ECkOutCnt" value="${ECkOutCnt }" />
<c:set var="MissingCnt" value="${MissingCnt }" />
<c:set var="workedHrs" value="${workedHrs }" />
<c:set var="workedMin" value="${workedMin }" />
<c:set var="workingDays" value="${workingDays }" />
<c:set var="avgWorkedHrs" value="${avgWorkedHrs }" />
<c:set var="avgWorkedMin" value="${avgWorkedMin }" />
<c:set var="totVacCnt" value="${totVacCnt }" />

<style>
.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.Profile {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 15px;
	margin-bottom : 20px;
	width: 100px;
	height: 100px;
}
.table-right td {
	width: 50px;
    text-align: center; 
    vertical-align: middle;
}
.table-left{
	margin-left: auto;
	margin-right: auto;
}
.table-left > tbody > tr > td:nth-child(1) {
	width: 70px;
}
.table-left > tbody > tr > td:nth-child(1) > small {
	width: 40px;
}
</style>
<script>
 	function myPageDetails() {
 		var empno = document.getElementById('empNo').value;
 		window.open('<%=request.getContextPath()%>/organogram/detail.do?empno=' + empno, '???????????????', 20, 20);
	}  
</script>
<style>
	* {
		font-family : 'Gowun Dodum', sans-serif;
	  font-weight: bold;
	}
</style>
<head>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/notice.css">
	
	<!-- ?????? -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>my page</title>
<body>
<div class="wrapper">
	<div class="container-fluid">
	    <div class="row">
	      <div class="col-md-3">
		    <div class="col-md-12" style="background-color: #EFF7FB; height: 250px; margin-top: 25px; text-align: center; padding-top: 15px">
<!-- 	    		<img  class="profile" src="https://bit.ly/3nyy9rC" alt="profile img"> --><!-- ????????? ????????? -->
<!-- 	    		<img  class="Profile" src="https://bit.ly/3pCT0g0" alt="profile img" style="border-radius: 50%;"> -->
	    		<img  class="Profile" src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${loginUser.face_photo }" alt="profile img" style="border-radius: 50%;">
<!-- 	    		<img  class="Profile" src="https://bit.ly/3pCT0g0" alt="profile img" style="border-radius: 50%;"> -->
	    		<p class="center" style="display: inline; text-align: center;">${loginUser.nm}</p>
<!-- 	    		<button type="button" class="btn btn-primary" style="display: inline; position: absolute; left: 180px; font-size: 11px; padding: 3px 8px;">??????</button> -->
	    		<small class="badge badge-secondary" style="padding: 4px 8px; background: #419EDD"> ${clsfName } </small>
	    		<br><br>
				<button type="button" class="btn btn-primary" onclick="myPageDetails()" style="font-size: 12px; padding: 4px 8px; background: gray; border: none;">?????? ?????? ????????????</button>
			</div><!-- end profile div --> 
			<br>
			<div style="text-align: center;">
				<table class="table-left">
					<tr>
						<td><small class="badge badge-secondary" style="padding: 5px 8px;"> IP </small></td>
						<td>${loginUser.ip_adres}</td>
					</tr>				
					<tr>
						<td><small class="badge badge-secondary" style="padding: 5px 8px;"> ?????? </small></td>
						<td>
							<fmt:formatDate value="${ checkInOut.attend_time }" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
					</tr>				
					<tr>
						<td><small class="badge badge-secondary" style="padding: 5px 8px;"> ?????? </small></td>
						<td>
							<fmt:formatDate value="${ checkInOut.lvffc_time }" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
					</tr>				
				</table>
			</div>
	      </div><!--end left div -->
	      <div class="col-md-9">
	      	<br>
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH) + 1;
			%>
	      	<p style="color: #2a9df4; font-weight:bold; display: inline;">${loginUser.nm}</p>?????? <p style="color: #2a9df4; font-weight:bold; display: inline;"><%=month%></p>??? ?????? ??????
	      	<input type="hidden" value="${loginUser.empno }" disabled="none" id="empNo">
	      	<br><br>
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M010101';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
			      		</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>
						                <span class="info-box-text">??????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${lateCnt } </p> ???</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">??????</span>
						                <span class="info-box-number"><p style="color: #dc143c; font-weight:bold; display: inline;">${AbsentCnt}</p> ???</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">????????????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${ECkOutCnt}</p> ???</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">?????? ?????????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${MissingCnt }</p> ???</span>
			              			</td>
			              		</tr>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">?????? ??????</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>
						                <span class="info-box-text">??? ????????????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${workingDays}</p> ???</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">??? ?????? ??????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${workedHrs}</p>??????  <p style="color: #2a9df4; font-weight:bold; display: inline;">${workedMin }</p>???</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">?????? ?????? ??????</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${avgWorkedHrs}</p>??????  <p style="color: #2a9df4; font-weight:bold; display: inline;">${avgWorkedMin }</p>???</span>
			              			</td>
			              		</tr>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? -->
		      	</div><!-- end right 1st row -->
		      	<div class="row">
		      		<div class="col-md-12">
				      	<p style="color: gray; font-weight:bold;">?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M010102';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
				      	</p>
				      	<div class="info-box">
				              <div class="info-box-content">
				              	<table class="table-right">
				              		<tr>
				              			<td>
							                <span class="info-box-text">?????? ??????</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${totVacCnt }</p> ???</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">?????? ??????</span>
							                <span class="info-box-number"><p style="color: #dc143c; font-weight:bold; display: inline;">${totUsedVacDays }</p> ???</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">?????? ??????</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${vacLeftCnt }</p> ???</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">??????</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${totUsedDayOff }</p> ???</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">??????</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${totUsedHalfDayOffDays }</p> ???</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">??????</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">${totUsedSickDayOff }</p> ???</span>
				              			</td>
				              		</tr>
				              	</table>
				              </div><!-- /.info-box-content -->
				        </div><!-- /.info-box -->
				     </div><!-- /.col-md-12 -->
		      	</div><!-- end right 2nd row -->
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">
			      			?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M030500';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
			      		</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>??? ??????</td>
			              			<td>?????? ??????</td>
			              			<td>?????????</td>
			              		</tr>
            					<c:if test="${empty jobSendList}" > 
									<tr>
										<td colspan="5">
						              		<br>
											<strong>?????? ????????? ????????????.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${jobSendList }" var="job" begin="0" end="2">
									<tr style='font-size: 0.85em;'>
										<td id="boardTitle" onclick="javascript:OpenWindow('work/send/detail.do?job_no=${job.job_no}','??????',900,800);">
											<span class="col-sm-12">${job.sj}</span>
										</td>
										<td>
											<fmt:formatDate value="${job.end_de}" pattern="yyyy-MM-dd" />
										</td>
										<td>?????????</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M030300';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
			      		</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>??? ??????</td>
			              			<td>?????? ??????</td>
			              			<td>?????????</td>
			              		</tr>
            					<c:if test="${empty jobRecList }" > 
									<tr>
										<td colspan="5">
						              		<br>
											<strong>?????? ????????? ????????????.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${jobRecList }" var="job" begin="0" end="2">
									<tr style='font-size: 0.85em;'>
										<td id="boardTitle" onclick="javascript:OpenWindow('work/send/detail.do?job_no=${job.job_no}','????????????',900,800);">
											<span class="col-sm-12">${job.sj}</span>
										</td>
										<td>
											<fmt:formatDate value="${job.end_de}" pattern="yyyy-MM-dd" />
										</td>
										<td data-target="send-writer">${job.emp_nm}</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? -->
		      	</div><!-- end right 3rd row -->
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">?????? ?????? ?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M020302';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
			      		</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>??? ???</td>
			              			<td>?????????</td>
			              			<td>?????????</td>
			              		</tr>
              					<c:if test="${empty eccWaitList }" > 
									<tr>
										<td colspan="5">
						              		<br>
											<strong>?????? ?????? ?????? ????????? ????????????.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${eccWaitList }" var="waitList" begin="0" end="2">
									<tr style='font-size:0.85em;'>
										<td id="boardTitle" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${waitList.sanctn_no }&from=list','????????????',900,960);">
											<span class="col-sm-12">${waitList.sj }</span>
										</td>
										<td>
											<fmt:formatDate value="${waitList.sanctn_tmlmt }" pattern="yyyy-MM-dd" />
										</td>			
										<td>${waitList.nm}</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? ?????? ?????? -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">?????? ?????? ??????
							<button type="button" class="btn btn-tool" onclick="window.top.location.href='http://localhost/gw/index.do?mCode=M020301';">
                    			<i class="fas fa-external-link-square-alt" aria-hidden="true"></i>
                  			</button>
			      		</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table class="table-right">
			              		<tr>
			              			<td>??? ???</td>
			              			<td>?????????</td>
			              			<td>?????? ??????</td>
			              		</tr>
            					<c:if test="${empty eccRequestList }" > <!-- TODO : ?????? -->
									<tr>
										<td colspan="5">
						              		<br>
											<strong>?????? ?????? ????????? ????????????.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${eccRequestList }" var="requestList" begin="0" end="2">
									<tr style='font-size:0.85em;'>
										<td id="boardTitle" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/approval/ddbox/detail?sanctn_no=${requestList.sanctn_no }&from=list','????????????',900,960);">
											<span class="col-sm-12">${requestList.sj }</span>
										</td>
										<td>
											<fmt:formatDate value="${requestList.sanctn_tmlmt }" pattern="yyyy-MM-dd" />
										</td>			
										<td>${requestList.sttus_code}</td>
									</tr>
								</c:forEach>
			              	</table>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end ?????? ?????? -->
		      	</div><!-- end right 4th row -->
<!--        			<div class="col-md-12 col-12"style="text-align:center; background: #293648; color: white;"> -->
<!-- 					<span style="font-weight:bold; font-size:16px;">?????? ?????? ??????</span> -->
<!-- 				</div> -->
<!-- 	      		<div class="info-box"> -->
<!-- 	            	<div class="info-box-content"> -->
<%-- 		    			<%@ include file="/WEB-INF/views/mypage/vacationList.jsp" %> --%>
<!-- 		      		</div>end right 5th row -->
<!-- 		      	</div> -->
	      </div><!--end right div -->
	    </div><!-- end row -->
	</div><!-- content container-fluid end -->
</div><!-- end wrapper -->
<script>
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
								+"height="+ WinHeight +", top="+ wintop +", left=" 
								+ winleft +", resizable=yes, status=yes"  );
		win.focus() ; 
	}
</script>
</body>
</html>