<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="schList" value="${schList.schList }" />


<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 부트스트랩 -->

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>

<style>
.p_title {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
  margin-left: 5px;
}
p {
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
select>option, button{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
.form-control{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
.fc-toolbar-title{
 font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
@charset "UTF-8";

html, body {
	margin: 0;
	padding: 0;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 14px;
}

#calendar-container {
	position: relative;
	z-index: 1;
	/* margin-left: 200px; */
}

#calendar td.fc-day-sun {
	color: red;
}

#calendar td.fc-day-sat {
	color: blue;
}

#calendar {
	max-width: 1100px;
	margin: 20px auto;
}

#check1 {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 18px;
	font-weight: bold ;
	margin-top: 20px;
    margin-left: 100px;
}



</style>

<script>
document.addEventListener('DOMContentLoaded',function() {
			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendar.Draggable;
			var calendarEl = document.getElementById('calendar');
			var checkbox = document.getElementById('drop-remove');
			// initialize the calendar
			// -----------------------------------------------------------------
			var calendar = new Calendar(
					calendarEl,
					{
						headerToolbar : {
							left : 'prev,next today',
							center : 'title',
							right : 'addEventButton ,dayGridMonth,timeGridWeek,timeGridDay,listWeek' //addEventButton추가해야 일정버튼나옴
						},
						businessHours : true,
						customButtons : {
							addEventButton : {
								text : '일정 추가',
								click : function() {
									window.open('<%=request.getContextPath()%>/schedule/registForm.do',
											'일정등록', 'height=800,width=800');
								}
							}
						},
					
						
						//클릭이벤트
						eventClick : function(info) {
						//	alert(info.event.id);
							window.open('<%=request.getContextPath()%>/schedule/detail.do?schdul_no='+info.event.id,
									'상세보기','height=800,width=800');
						},
						
						//이벤트 드랍
						 eventDrop: function(info) {
							console.log(info.event.id);
							console.log(info.event.title);
							console.log(info.event.content);
							console.log(info.event.start);
							console.log(info.event.end);
						 },
						  eventResize: function(info) {
							console.log(info.event.id);
							console.log(info.event.title);
							console.log(info.event.content);
							console.log(info.event.start);
							console.log(info.event.end);
						  },
						//공휴일
						googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
						eventSources : [
						// 대한민국의 공휴일
						{
							googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
							className : "koHolidays",
							color : "#cc0000",
							textColor : "#FFFFFF"
						} ],
						//일정 등록
						events: function(fetchInfo, successCallback, failureCallback) {
						      successCallback([
							
						<c:if test="${!empty schList }">
							
							<c:forEach var="list" items="${schList }" varStatus="vs">
								<c:if test="${vs.count >1 }">,</c:if>
								
								{
									id : '${list.schdul_no }',
									title : '${list.schdul_sj }',
									start : '${list.bgnde }',
									end : '${list.endde }',
									content : '${list.schdul_cn }',
									writer : '${list.empno }',
									backgroundColor : '${list.bg_color}',
									schdul_code : '${list.schdul_code}',
									allDay : true,
									cid: '${list.schdul_code}'
								}
							</c:forEach>
						</c:if>
							])
						},
						//일정변경 이벤트
						 eventDrop: function(info) {
							var testStart = moment(info.event.start); 
							var testEnd = moment(info.event.end);
							var realStart = testStart.format('YYYY-MM-DD HH-mm ');
							var realEnd = testEnd.format('YYYY-MM-DD HH-mm');
							console.log("testStart: "+testStart.format('YYYY-MM-DD HH-mm'));
							console.log("testEnd: "+testEnd.format('YYYY-MM-DD HH-mm'));
							console.log("realStart: "+realStart);
							console.log("realEnd: "+realEnd);
							console.log(info.event.start);
							console.log(info.event.end);
						 	$.ajax({
								url : '<%=request.getContextPath()%>/schedule/modifyByDrag' ,
								type: 'get',
								dataType : 'json',
								data:{
									schdul_no : info.event.id,
									bgnde : realStart,
									endde : realEnd
								},
								success: function(data){
									alert("");
								},
								error : function(xhr){
									console.log(xhr);
								}
							
							});
						 },
						  eventResize: function(info) {
								var testStart = moment(info.event.start); 
								var testEnd = moment(info.event.end);
								var realStart = testStart.format('YYYY-MM-DD HH-mm');
								var realEnd = testEnd.format('YYYY-MM-DD HH-mm');
								console.log("testStart: "+testStart.format('YYYY-MM-DD HH-mm'));
								console.log("testEnd: "+testEnd.format('YYYY-MM-DD HH-mm'));
								console.log("realStart: "+realStart);
								console.log("realEnd: "+realEnd);
								console.log(info.event.start);
								console.log(info.event.end);
							 	$.ajax({
									url : '<%=request.getContextPath()%>/schedule/modifyByDrag' ,
									type: 'get',
									dataType : 'json',
									data:{
										schdul_no : info.event.id,
										bgnde : realStart,
										endde : realEnd
									},
									success: function(data){
										alert(data);
									},
									error : function(xhr){
										console.log(xhr);
									}
								
								});
						  },
	
					//체크박스 이벤트
					  eventDidMount: function (arg) {
				      var cs = document.querySelectorAll(".cs");
				      cs.forEach(function (v) {
				        if (v.checked) {
				          if (arg.event.extendedProps.cid === v.value) {
				            arg.el.style.display = "block";
				          }
				        } else {
				          if (arg.event.extendedProps.cid === v.value) {
				            arg.el.style.display = "none";
				          }
				        }
				      });
				    },  
						locale : 'ko', //언어 한글로 바꾸기
						selectable : true, // 클릭했을때 색변환 드래그
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar
					});
				  // 일정 변경 이벤트			
				

			calendar.render();
			
			  var csx = document.querySelectorAll(".cs");
			  csx.forEach(function (el) {
			    el.addEventListener("change", function () {
			      calendar.refetchEvents();
			      console.log(el);
			    });
			});
		});

</script>
</head>
<body>
	<c:if test="${from eq 'regist'}">
		<script>
    	alert("일정 등록이 성공했습니다."); 
    	window.opener.location.reload();	
    	window.close();
    	</script>
	</c:if>

<div class="row" style="width:99%;">	
<div class="col-md-8">
</div>
	 <div class="col-md-3" id="check1">
	 	<input class="cs" value="I001" type="checkbox" checked > 개인 &nbsp;&nbsp;
	 	
		<input class="cs" value="I002" type="checkbox" checked> 부서 &nbsp;&nbsp;
		
		<input class="cs" value="I003" type="checkbox" checked> 전사 &nbsp;&nbsp;
		
	 </div>
	 <div class="col-md-1">
</div>
</div>		

	<div id='calendar-container'>	
		

		<div id='calendar'></div>
	</div>

</body>
<script>
/* var test='';
console.log(test); */


</script>
</html>