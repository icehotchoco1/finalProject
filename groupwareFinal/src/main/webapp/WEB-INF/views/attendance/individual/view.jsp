<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>
<c:set var="dclzLists" value="${dataMap.dclzLists }" />
<c:set var="avgWorkedHrs" value="${avgWorkedHrs }" />
<c:set var="avgWorkedMin" value="${avgWorkedMin }" />

<%-- <c:set var="dclz" value="${dclzList.dclz }" /> --%>

 <%
	session.setAttribute("path", request.getContextPath() + "/attendance/individual");
%> 


<head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/attendance/individual.css">

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
#textname{
 font-weight:bold; 
 text-align:center;
}
#bt1, button {
  border: none;
  font-size: 15px;
  font-weight: bold;
  font-family: 'Gowun Dodum', sans-serif;
  padding: 2px 10px;
  border-radius: 5px;
  background: #004680;
  color: white;
}
select {
  border: 2px solid lightgrey;
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
  height: 30px;
}
p, span, strong {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
}
th {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  font-weight: bold;
}
</style>

<script>


//결재선!---
function goEccst(){
   var title='기안작성';
   
   
   var _width= '900';
   var _height = '960';
   
   var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
   
   var abc = window.open("",title,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
   var form =  document.getElementById('selDate');
//    form=form.get(0);
   console.log(form);
   form.target=title;
   form.method='POST';
   form.action='<%=request.getContextPath()%>/approval/ddbox/erf1regist.do';
   form.submit();
   
}

// function goEccst1(){
// 	var str = ""
// 	var tdArr = new Array();	// 배열 선언
// 	var checkBtn = $(this);
// 	var tr = checkBtn.parent().parent();
// 	var td = tr.children();
	
// 	console.log("클릭한 Row의 모든 데이터 : "+tr.text());


//         var checkBtn = $(this);

	
// 	   var check = .parent().parent();
// 	   var title='기안작성';
	   
	   
// 	   var _width= '900';
// 	   var _height = '960';
	   
// 	   var _left = Math.ceil(( window.screen.width - _width )/2);
// 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	 
	   
// 	   var abc = window.open("",title,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
// 	   var form =  document.getElementById('selDate');
// //	    form=form.get(0);
// 	   console.log(form);
// 	   form.target=title;
// 	   form.method='POST';
<%-- 	   form.action='<%=request.getContextPath()%>/approval/ddbox/erf1regist.do'; --%>
//	    form.submit();
	   
// 	}
</script>


<script>
	$(document).ready(function() {
		
		
		$(".checkBtn").click(function(){ 
					
					var str = ""
					var tdArr = new Array();	// 배열 선언
					var checkBtn = $(this);
					
					// checkBtn.parent() : checkBtn의 부모는 <td>이다.
					// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkBtn.parent().parent();
					var td = tr.children();
					
// 					console.log("클릭한 Row의 모든 데이터 : "+tr.text());
					var rgsde = td.eq(0).text();
					var worktime= td.eq(1).text();
					var hometime = td.eq(2).text();
					var status = td.eq(3).text();
					
					console.log(rgsde);
					console.log(worktime);
					console.log(hometime);
					console.log(status);
					
				   $('input[name="rgsde"]').val(rgsde);
				   $('input[name="worktime"]').val(worktime);
				   $('input[name="hometime"]').val(hometime);
				   $('input[name="status"]').val(status);
				   
				   var title='기안작성';
				   
				   
				   var _width= '900';
				   var _height = '960';
				   
				   var _left = Math.ceil(( window.screen.width - _width )/2);
				    var _top = Math.ceil(( window.screen.height - _height )/2); 
				 
				   
				   var abc = window.open("",title,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
				   
				   var form = $('#selectatt');
					
				   form=form.get(0);
				   form.target=title;
				   form.method='POST';
				   form.action='<%=request.getContextPath()%>/approval/ddbox/erf5regist.do';
				   form.submit();
					
				});
		
		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// Datepicker            
		$(".datepicker").datepicker({
			showButtonPanel : true,
			dateFormat : "yy-mm-dd",
			onClose : function(selectedDate) {

				var eleId = $(this).attr("id");
				var optionName = "";

				if (eleId.indexOf("StartDate") > 0) {
					eleId = eleId.replace("StartDate", "EndDate");
					optionName = "minDate";
				} else {
					eleId = eleId.replace("EndDate", "StartDate");
					optionName = "maxDate";
				}

				$("#" + eleId).datepicker("option", optionName, selectedDate);
				$(".searchDate").find(".chkbox2").removeClass("on");
			}
		});

		$(".dateclick").dateclick(); // DateClick
		$(".searchDate").schDate(); // searchDate

	});

	// Search Date
	jQuery.fn.schDate = function() {
		var $obj = $(this);
		var $chk = $obj.find("input[type=radio]");
		$chk.click(function() {
			$('input:not(:checked)').parent(".chkbox2").removeClass("on");
			$('input:checked').parent(".chkbox2").addClass("on");
		});
	};

	// DateClick
	jQuery.fn.dateclick = function() {
		var $obj = $(this);
		$obj.click(function() {
			$(this).parent().find("input").focus();
		});
	}

	function setSearchDate(start) {

		var num = start.substring(0, 1);
		var str = start.substring(1, 2);

		var today = new Date();

		//var year = today.getFullYear();
		//var month = today.getMonth() + 1;
		//var day = today.getDate();

		var endDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#endDate').val(endDate);

		if (str == 'd') {
			today.setDate(today.getDate() - num);
		} else if (str == 'w') {
			today.setDate(today.getDate() - (num * 7));
		} else if (str == 'm') {
			today.setMonth(today.getMonth() - num);
			today.setDate(today.getDate() + 1);
		}

		var startDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#startDate').val(startDate);

		// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		$("#endDate").datepicker("option", "minDate", endDate);

		// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		$("#startDate").datepicker("option", "maxDate", startDate);
	
		

	}
</script>

</head>
<style>
</style>
<body>
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<p class="menu-header">
						<span class=attcolor>${loginUser.nm}</span>님의 <span class=attcolor>${sysYear}</span>월
						근태 정보
					</p>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<!-- 단순정보차트 -->
	<div class="row">
		<p class="col-md-3 col-sm-6 col-12" id="textname" >근태현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname" >근무현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname" >출/퇴근 현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname"  >시차출퇴근제 신청</p>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table>
						<tr style="font-size:0.85em;">
						
							<th style="width:25%;">정상출근</th>
							<th style="width:15%;">조퇴</th>
							<th style="width:15%;">결근</th>
							<th style="width:30%;">퇴근미입력</th>
							<th style="width:15%;">지각</th>
						</tr>
						<c:forEach items="${dclzCount}" var="dclz">
						<td>${dclz.sttus_code}</td>
						</c:forEach>
					</table>
					<!-- 						<span class="info-box-number"> -->
					<!-- 						</span> -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table>
						<tr style="font-size:0.85em;">
							<th style="width:33%;">총 근무일수</th>
							<th style="width:33%;">총 근무 시간</th>
							<th style="width:33%;">평균 근무시간</th>
						</tr>
						<c:forEach items="${dclzdaycount}" var="dclz">
						<td>${dclz.day}</td>
						</c:forEach>
						
						<c:forEach items="${dclztotalcount}" var="dclz">
						<td>${dclz.time}</td>
						</c:forEach>
						
<%-- 						<c:forEach items="${dclztotalcount},${dclzdaycount}" var="dclz"> --%>
<%-- 						</c:forEach> --%>
						<td style="font-family: 'Gowun Dodum', sans-serif; font-size: 13px; font-weight: bold;">${avgWorkedHrs} 시간  ${avgWorkedMin } 분</td>
					</table>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box" style="text-align:center;">

				<!-- 타이머 -->
				<div class="info-box-content " style=" padding: 0px 77px;">
					<div id="countdown" style="text-align: center; margin: 0px;">
						<!-- 히든걸려있음 -->
						<div class="day">
							<span class="days" id="day"></span>
						</div>
						<!-- 여기서 부터 보임 -->
						<div class= "col-md-12" >
						<span class="hours " id="hour"></span>
						<div class="text">&nbsp;시&nbsp;</div>
						</div>
						<span class="minutes" id="minute"></span>
						<div class="text">&nbsp;분&nbsp;</div>
						<span class="seconds" id="second"></span>
						<div class="text">&nbsp;초&nbsp;</div>
					</div>	
						<span id="timer" ></span>
					</div>
				</div>	
					<!-- 타이머끝 -->
			
				<!-- /.info-box-content -->
			<!-- </div> -->
			<!-- /.info-box -->
		</div>
		<!-- 시차출퇴근제 신청 -->
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">

				<!-- 시차출퇴근제 신청 컨텐츠 -->
				<div class="info-box-content">
					<div id="optionbox">
					   <form name="erf1" id="selDate">
	                     <select name="selDate">
	                       <option value="오전1(09시 ~ 18시)">오전1(09시 ~ 18시)</option>
	                       <option value="오전2(11시 ~ 20시)">오전2(11시 ~ 20시)</option>
	                       <option value="오후1(13시 ~ 22시)">오후1(13시 ~ 22시)</option>
	                     </select>
	                        <input type="button"  id = "bt1" value="결재신청"  onclick="javascript:goEccst()">
	                   </form>
					</div>
					<!-- 타이머끝 -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<!-- 차트정보 -->
	<!-- 정보차트 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		<!-- 차트 -->
			<div class="card-body">
				<canvas id="deptYearChart" width="1000vh" height="350"></canvas>
					<script>
					var labels = [];
					<c:forEach items="${dclzchart}" var="dclz">
					labels.push('${dclz.datee}');
					</c:forEach>
					
					var data = [];
					<c:forEach items="${dclzchart}" var="dclz">
					data.push('${dclz.data}');
					</c:forEach>
					
					var ctx = document.getElementById("deptYearChart");
					var deptYearChart = new Chart(ctx,{	//차트 선언
						type: 'bar',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: labels,	//라벨 배열
							datasets: [{//데이터 object 배열
								label: '나의 초과근무 현황',
								data: data,	//데이터 넣는 곳
								backgroundColor: [
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)'
								],
								borderColor: [
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '나의 초과근무 현황',
								fontSize: 18
							},
							layout:{
								padding:20
							},
							scales:{
								yAxes:[{
									ticks:{
										beginAtZero:true
									}
								}]
							}
						}
					});
						
					</script>
			</div>
			<!-- /.card-body -->
			
			

			
			
	<section class="content">
		<div class="gw-card">
			<div class="boxSearch">
				<form name="search"
					action="<%=request.getContextPath()%>/attendance/individual/list"
					method="GET">
					<!-- search -->
					<table class="searchBox">
						<caption></caption>
						<colgroup>
							<col width="123px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th class="whghl">조회기간</th>
								<td>
									<ul class="searchDate">
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
												<label for="dateType1">당일</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
												<label for="dateType3">1주</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
												<label for="dateType5">1개월</label>
										</span></li>
										<li>
											<div class="btnnn">
												<button type="submit" id="btnSearch" onclick="btnSearch()">검색</button>
												
											</div>
										</li>
									</ul>

									<div class="clearfix">
										<!-- 시작일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="startDate" id="startDate">
											<a href="#none" class="btncalendar dateclick">달력</a>
										</span> <span class="demi">~ </span>
										<!-- 종료일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="endDate" id="endDate">
											<a href="#none" class="btncalendar dateclick">달력</a>
										</span>
									</div>
								</td>
							</tr>
						<tbody>
					</table>
				</form>
			</div>
		</div>
	</section>
	
<script>
	
	$(document).ready(function(){
		if  (${startDate != null && startDate != "" && endDate != null && endDate != "" }){
			$("startDate").val("${startDate}");
			$("endDate").val("${endDate}");
		}
	})
	
    function btnSearch(){
        $('form[name="search"]').submit();
        alert(">>>>>");
	}

</script>
	

	<div class="card-body">
		<table class="table text-center">
			<tr style="font-size: 0.95em;">
				<th style="width: 20%;">등록일</th>
				<th style="width: 20%;">출근시간</th>
				<th style="width: 15%;">퇴근시간</th>
				<th style="width: 15%;">근무시간</th>
				<th style="width: 15%;">상태</th>
				<th style="width: 15%;"></th>
			</tr>
			<c:if test="${empty dclzLists }">
				<tr>
					<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
				</tr>
			</c:if>
			<c:forEach items="${dclzLists }" var="dclz">
				<tr style='font-size: 0.85em;'>
					<td><fmt:formatDate value="${dclz.rgsde }"
							pattern="yyyy/MM/dd" /></td>
					<td><fmt:formatDate value="${dclz.attend_time }"
							pattern="yyyy/MM/dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${dclz.lvffc_time }"
							pattern="yyyy/MM/dd HH:mm:ss" /></td>
					<td>${dclz.time }</td>
					<td>${dclz.sttus_code }</td>
					<td><c:if test="${dclz.sttus_code != '정상출근'}">
 					  <form name="selectatt" id="selectatt" type="hidden"> 
 					  	<input type="hidden" name="rgsde" id="rgsde" />
					    <input type="hidden" name="worktime" id="worktime" />
					    <input type="hidden" name="hometime" id="hometime" />
					    <input type="hidden" name="status" id="status" />
	                  </form> 
						<input type="button" class="checkBtn" value="이의신청" />
					</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
                    
	<script>
		var today = new Date();
		<c:forEach items="${dclzbackfront}" var="dclz">
		var deadline = new Date(today.getFullYear(), today.getMonth(), today.getDate(), "${dclz.front}", "${dclz.back}");
		</c:forEach>
		var x = setInterval(function() {
														var now = new Date().getTime();
			var rt = now - deadline;
			var t = Math.abs(rt);
			var days = Math.floor(t / (1000 * 60 * 60 * 24));
			var hours = Math.floor((t % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((t % (1000 * 60)) / 1000);
			document.getElementById("day").innerHTML = days;
			document.getElementById("hour").innerHTML = hours;
			document.getElementById("minute").innerHTML = minutes;
			document.getElementById("second").innerHTML = seconds;
			if (rt == 0) {
				document.getElementById("timer").innerHTML = "퇴근";
			}
			if (rt < 0) {
				document.getElementById("timer").innerHTML = "근무중";
			}
			if (rt > 0) {
				document.getElementById("timer").innerHTML = "추가근무중";
			}
		}, 1000);
	</script>
</body>
