<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/commute.css">	


</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${from eq 'pwChange'}">
	<script>
		alert("${msg }");
	</script>
</c:if>
<body>

	<div style="width: 1280px; margin: 0 auto;">

		<div id="my_modal">
			<header>
				<h2>출근</h2>
			</header>
			<br>
			<video id="myVideo" width="400" height="300"
				style="border: 1px solid #ddd;"></video>
			<canvas id="myCanvas" width="160" height="140"
				style="border: 1px solid #ddd;"></canvas>
			<br> 
			<div class="row" id="box1">
			<div class="sm col-6">
			<input type=button id="video" value="get Video" onclick="{getVideo()}">
			</div>
			<div class="sm col-6">
			<input type=button  id ="pic" value="get Pic" onclick="{takeSnapshot()}"><br>
				</div>
		<!-- 	Take snapshot every <input type=number id="myInterval" value="3000"> -->
<!-- 			milliseconds <input type=button value="Auto" onclick="{takeAuto()}"> -->
			<input type=button value="서버전송" id="btSub" onclick="server()">

			<form id="frm" method="post" action="http://127.0.0.1:5000/gowork">
				<input type="hidden" value="imgBase64" />
			</form>
			
			</div>
			<script>
				var myVideoStream = document.getElementById('myVideo') // make it a global variable
				var myStoredInterval = 0

				function getVideo() {
					navigator.getMedia = navigator.getUserMedia
							|| navigator.webkitGetUserMedia
							|| navigator.mozGetUserMedia
							|| navigator.msGetUserMedia;
					navigator.getMedia({
						video : true,
						audio : false
					},

					function(stream) {
						myVideoStream.srcObject = stream
						myVideoStream.play();
					},

					function(error) {
						alert('webcam not working');
					});
				}

				function takeSnapshot() {
					var myCanvasElement = document.getElementById('myCanvas');
					var myCTX = myCanvasElement.getContext('2d');
					myCTX.drawImage(myVideoStream, 0, 0, myCanvasElement.width,
							myCanvasElement.height);
				}

				function takeAuto() {
					takeSnapshot() // get snapshot right away then wait and repeat
					clearInterval(myStoredInterval)
					myStoredInterval = setInterval(function() {
						takeSnapshot()
					}, document.getElementById('myInterval').value);
				}

				function server() {
					const canvas = document.getElementById('myCanvas');
					const imgBase64 = canvas.toDataURL('image/png', 1.0);

					//      document.querySelector('input[name=imgBase64]').remove();

					var input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.setAttribute('name', 'imgBase64');
					input.value = imgBase64;

					document.getElementById('frm').append(input);
					document.getElementById('frm').submit();
				};
			</script>
			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg"
				aria-hidden="true"></i></a>
		</div>

</div>

	
	<!-- 모달 스크립트 -->
	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);
			// 만지지마 화면 중앙에 비치하는거임

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = $('<div>').css({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			}).appendTo('body');

			modal
					.css(
							{
								position : 'fixed',
								boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

								// 시꺼먼 레이어 보다 한칸 위에 보이기
								zIndex : zIndex + 1,

								// div center 정렬
								top : '50%',
								left : '50%',
								transform : 'translate(-50%, -50%)',
								msTransform : 'translate(-50%, -50%)',
								webkitTransform : 'translate(-50%, -50%)'
							}).show()
					// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
					.find('.modal_close_btn').on('click', function() {
						bg.remove();
						modal.hide();
					});
		}

		$('#button1').on('click', function() {
			// 모달창 띄우기
			//     alert('message');
			modal('my_modal');
		});
	</script>


</body>
</html>





