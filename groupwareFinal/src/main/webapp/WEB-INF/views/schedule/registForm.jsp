<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_registForm.css">
<!-- 부트스트랩 -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet' />

<!-- Date Range Picker  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


<meta charset="UTF-8">
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
.form-control,.form-group{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}

/* 버튼 */
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
.btn-regist:hover {
  background: white;
  color: #59BEE9;
}
.btn-cancle:hover {
  background: #F7F6ED;
  color: tomato;
}

</style>
<title></title>
</head>
<body>

<div class="pop-container" >
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>일정 등록</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	
	
  <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" >
				<div class="card-outline">
				
				
					<div class="card-body pad">
		<!-- form start -->
		<form method="post" action="<%=request.getContextPath()%>/schedule/regist.do" name="registForm">
			<input type="hidden" id="empno" readonly name="empno" class="form-control" value="${loginUser.empno }">
			<input type="hidden" id="nm" readonly name="nm" class="form-control" value="${loginUser.nm }">
			<input type="hidden" name="dept_code" value="${loginUser.dept_code }"/>
		
			
			<div class="card-body">
				<div class="form-group">
					<label for="schdul_sj">일정명</label> <input type="text"
						class="form-control" name="schdul_sj" id="schdul_sj"
						placeholder="일정명">
				</div>
				<div class="form-group">
					<label for="bgnde">시작 날짜</label>  <input type="text"
						class="form-control" name="bgnde" id="bgnde">
				</div>
				<div class="form-group">
					<label for="endde">종료 날짜</label> <input type="text"
						class="form-control" name="endde" id="endde">
				</div>
				<div class="form-group">
					<label>일정 색상</label> <select class="form-control" name="bg_color"
						id="bg_color">
						<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
						<option value="#D25565" style="color: #D25565;">빨간색</option>
						<option value="#9775fa" style="color: #9775fa;">보라색</option>
						<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
						<option value="#f06595" style="color: #f06595;">핑크색</option>
						<option value="#63e6be" style="color: #63e6be;">연두색</option>
						<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
						<option value="#4d638c" style="color: #4d638c;">남색</option>
						<option value="#495057" style="color: #495057;">검정색</option>
					</select>
				</div>
				<div class="form-group">
					<label>일정 분류</label> <select class="form-control" name="schdul_code"
						id="schdul_code">
						<option value="개인" >개인</option>
						<option value="부서" >부서</option>
						<option value="전사" >전사</option>
						
					</select>
				</div>
					
				<div class="form-group">
					<label for="schdul_cn">설명</label>
					<textarea class="form-control" id="schdul_cn" name="schdul_cn"></textarea>
				</div>

			</div>
			<!-- /.card-body -->
			<div style="text-align: center; margin-bottom: 20px;">
				<button type="button" class="btn btn-regist" id="registBtn"
					onclick="regist_go();">등 록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-cancle" id="cancelBtn"
					onclick="CloseWindow();">취 소</button>
			</div>
			<div class="card-footer"  style="display:none">
				</div>
		</form>
		</div>
	</div>
	</div><!-- end card -->				
	</div><!-- end col-md-12 -->
    </section>
    </div>
    <!-- /.content -->
	<script>
		//날짜 선택
		$(function() {
			$('input[name="bgnde"]').daterangepicker(
					{
						timePicker : true,
						timePicker24Hour : true,
						singleDatePicker : true,
						timePickerIncrement : 10,
						startDate : moment().startOf('hour'),
						endDate : moment().startOf('hour').add(32, 'hour'),
						locale : {
							format : 'YYYY-MM-DD HH-mm', // 일시 노출 포맷
							applyLabel : "확인", // 확인 버튼 텍스트
							cancelLabel : "취소", // 취소 버튼 텍스트
							daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ]
						}
					});

			$('input[name="endde"]').daterangepicker(
					{
						timePicker : true,
						timePicker24Hour : true,
						singleDatePicker : true,
						timePickerIncrement : 10,
						startDate : moment().startOf('hour'),
						endDate : moment().startOf('hour').add(32, 'hour'),
						locale : {
							format : 'YYYY-MM-DD HH-mm', // 일시 노출 포맷
							applyLabel : "확인", // 확인 버튼 텍스트
							cancelLabel : "취소", // 취소 버튼 텍스트
							daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ]
						}
					});

		});

		function regist_go() {
// 	 	 var m = moment($("input[name='endde']").val());
// 	 	 var s = moment($("input[name='bgnde']").val());
// 			var startDate = s.format();
// 			//var endDate = m.format();
// 			var endDate = m.add('days').format();
// 			var realStartDate = startDate.substr(0, 10);
// 			var realEndDate = endDate.substr(0, 10);
// 			console.log(m);
// 			console.log(endDate);
// 			console.log(realEndDate);
// 			if ($("input[name='schdul_sj']").val() == "") {
// 				alert("일정명은 필수입니다.");
// 				$("input[name='schdul_sj']").focus();

// 				return;
// 			}
// 			if ($("input[name='bgnde']").val() > $("input[name='endde']").val()) {
// 				alert('끝나는 날짜가 앞설 수 없습니다.');
// 				return;
// 			}
// 			document.registForm.endde.value = realEndDate;
// 			console.log(document.registForm.endde.value);  

			document.registForm.submit();
		}
	</script>
</body>
</html>