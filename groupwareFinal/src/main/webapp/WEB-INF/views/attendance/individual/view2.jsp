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

<%-- <c:set var="dclz" value="${dclzList.dclz }" /> --%>

<%
	session.setAttribute("path", request.getContextPath() + "/attendance/individual");
%>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/attendance/individual.css">
<script>
	$(document).ready(function() {
		
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
		<p class="col-md-4 col-sm-6 col-12" id="textname">근태현황</p>
		<p class="col-md-4 col-sm-6 col-12" id="textname">근무현황</p>
		<p class="col-md-4 col-sm-6 col-12" id="textname">출/퇴근 현황</p>
	</div>
	<div class="row">
		<div class="col-md-4 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<span class="info-box-text">지각 &nbsp;&nbsp; 결근
						&nbsp;&nbsp;조기퇴근 &nbsp;&nbsp; 퇴근</span>
					<!-- 						<span class="info-box-number"> -->
					<c:forEach items="${dclzCount}" var="dclz">
					</c:forEach>
					<!-- 						</span> -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-4 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<span class="info-box-text">총 근무일수 &nbsp;&nbsp;총 근무시간
						&nbsp;&nbsp;평균 근무시간</span> <span class="info-box-number">7일
						&nbsp;&nbsp; &nbsp;&nbsp; 65시간 &nbsp;&nbsp; &nbsp;&nbsp; 8시간 23분</span>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-4 col-sm-6 col-12">
			<div class="info-box">

				<!-- 타이머 -->
				<div class="info-box-content">
					<div id="countdown">
						<!-- 히든걸려있음 -->
						<div class="day">
							<span class="days" id="day"></span>
						</div>
						<!-- 여기서 부터 보임 -->
						<span class="hours" id="hour"></span>
						<div class="text">&nbsp;시&nbsp;</div>

						<span class="minutes" id="minute"></span>
						<div class="text">&nbsp;분&nbsp;</div>

						<span class="seconds" id="second"></span>
						<div class="text">&nbsp;초&nbsp;</div>
						<br> <span id="timer"></span>
					</div>
					<!-- 타이머끝 -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<!-- 차트정보 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<!-- 차트 -->
		<div class="card atte">
			<div class="card-header">
				<h3 class="card-title">올해 나의 근태 통계</h3>
			</div>
			<div class="card-body">
				<div class="chartjs-size-monitor">
					<div class="chartjs-size-monitor-expand">
						<div class=""></div>
					</div>
					<div class="chartjs-size-monitor-shrink">
						<div class=""></div>
					</div>
				</div>
				<canvas id="donutChart"
					style="height: 230px; min-height: 230px; display: block; width: 764px;"
					width="764" height="230" class="chartjs-render-monitor"></canvas>
			</div>
			<!-- /.card-body -->
		</div>
	</div>
	</div>
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
		if(${startDate != null && startDate != "" && endDate != null && endDate != "" }){
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
				<th style="width: 20%;">이 름</th>
				<th style="width: 20%;">출 퇴근 시간</th>
				<th style="width: 15%;">직 급</th>
				<th style="width: 15%;">출 근 시 간</th>
				<th style="width: 15%;">퇴 근 시 간</th>
				<th style="width: 15%;">상 태</th>
			</tr>
			<c:if test="${empty dclzLists }">
				<tr>
					<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
				</tr>
			</c:if>
			<c:forEach items="${dclzLists }" var="dclz">
				<tr style='font-size: 0.85em;'>
					<td>${dclz.rgsde }</td>
					<td><fmt:formatDate value="${dclz.attend_time }"
							pattern="yyyy:MM:dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${dclz.lvffc_time }"
							pattern="yyyy:MM:dd HH:mm:ss" /></td>
					<td>${dclz.time }</td>
					<td>${dclz.sttus_code }</td>
				</tr>
			</c:forEach>
		</table>
 		<div class="card-footer">
			<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
		</div>

	</div>


	<script>
		var deadline = new Date("Nov 10, 2021 18:00:00").getTime();
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
			console.log(rt)
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
