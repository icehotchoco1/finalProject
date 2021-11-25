`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
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
	
</head>
<style>

body {
	background: url(<%=request.getContextPath()%>/resources/css/common/img/loginForm.png)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}

#button1:hover {
	background-color: rgba(255, 255, 255, 1);
	color: black;
}

#button2:hover {
	background-color: rgba(255, 255, 255, 1);
	color: black;
}

.pwlogin {
	padding: 130px;
	background: rgba(240, 240, 240, 0.5);
	margin: 0 auto;
	text-align: center;
}

.facelogin {
	padding: 130px;
	background: rgba(240, 240, 240, 0.5);
	margin: 0 auto;
	text-align: center;
}

#button1 {
	margin: 0 auto;
	background-color: #004680;
	border: none;
	color: white;
	padding: 15px 50px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	opacity: 0.8;
	font-family: 'Do Hyeon', sans-serif;
}

#button2 {
	font-family: 'Do Hyeon', sans-serif;
	background-color: #004680;
	border: none;
	color: white;
	padding: 15px 50px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	opacity: 0.8;
}
/* 모달 */
#my_modal {
	display: none;
	width: 400px;
	padding: 30px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal2 {
	display: none;
	width: 500px;
	padding: 30px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal3 {
	display: none;
	width: 500px;
	padding: 30px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}

#my_modal2 .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}

#my_modal3 .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}
/* 비밀번호 로그인폼 */
header {
	display: flex;
	justify-content: center;
}

form {
	padding: 10px;
}

.input-box {
	position: relative;
	margin: 10px 0;
}

.input-box>input {
	background: transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 100%;
}

input::placeholder {
	color: transparent;
}

input:placeholder-shown+label {
	color: #aaa;
	font-size: 18px;
	top: 15px;
}

input:focus+label, label {
	color: #8aa1a1;
	font-size: 14px;
	pointer-events: none;
	position: absolute;
	left: 0px;
	top: 0px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input


:focus
,
input


:not

 

(
:placeholder-shown

 

){
border-bottom


:

 

solid

 

1
px

 

#8aa1a1


;
outline


:

 

none


;
}
input[type=submit] {
	background-color: #004680;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 50px;
	font-size: 16pt;
	margin-top: 100px;
	font-family: 'Do Hyeon', sans-serif;
}

#forgot {
	text-align: right;
	font-size: 15px;
	color: #004680;
	margin: 10px 0px;
	cursor: pointer;
}

header>h2 {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 23px;
	font-weight: bold;
}

label {
	font-size: 13px;
}

.row {
	margin-top: 30%;
}

/* 얼굴인식모달 버튼들  */
#btSub {
	background-color: #004680;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 50px;
	font-size: 13pt;
	margin-top: 14px;
	font-family: 'Do Hyeon', sans-serif;
}

#pic {
	background-color: #004680;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 50px;
	font-size: 13pt;
	margin-top: 14px;
	font-family: 'Do Hyeon', sans-serif;
}

#video {
	background-color: #004680;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 50px;
	font-size: 13pt;
	margin-top: 14px;
	font-family: 'Do Hyeon', sans-serif;
}

#box1 {
	margin-top: 0%;
}

a {
	text-decoration: none !important
}

a:hover {
	text-decoration: none !important
}
</style>

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
		<div class="wrapper">

			<div class="row">
				<section class="col-md-6">
					<div class="pwlogin col-md-10">
						<button id="button1">비밀번호 로그인</button>
					</div>
				</section>
				<section class="col-md-6">
					<div class="facelogin col-md-10">
						<button id="button2">얼굴인식 로그인</button>
					</div>
				</section>
			</div>

		</div>

		<div id="my_modal">
			<header>
				<h2>비밀번호 로그인</h2>
			</header>
			<form action="<%=request.getContextPath()%>/common/login.do"
				method="POST">
				<div class="input-box">
					<input id="empno" type="text" name="id" placeholder="사번"> <label
						for="empno">사번</label>
				</div>
				<div class="input-box">
					<input id="password" type="password" name="pw" placeholder="비밀번호">
					<label for="password">비밀번호</label>
				</div>
				<div id="forgot">
					<a class="modal_pw"><i class="fa fa-key fa-lg"
						aria-hidden="true"></i> &nbsp;비밀번호 찾기</a>
				</div>
				<input type="submit" value="LOGIN" id="login">
			</form>
			<a class="modal_close_btn"><i class="fa fa-window-close fa-lg"
				aria-hidden="true"></i></a>
		</div>


		<!-- 		얼굴인식 -->


		<div id="my_modal2">
			<header>
				<h2>얼굴인식 로그인</h2>
			</header>
			<video id="myVideo" width="400" height="300"
				style="border: 1px solid #ddd;"></video>
			<canvas id="myCanvas" width="160" height="140"
				style="border: 1px solid #ddd;"></canvas>
			<br>
			<div class="row" id="box1">
				<div class="sm col-6">
					<input type=button id="video" value="get Video"
						onclick="{getVideo()}">
				</div>
				<div class="sm col-6">
					<input type=button id="pic" value="get Pic"
						onclick="{takeSnapshot()}"><br>
				</div>
				<!-- 	Take snapshot every <input type=number id="myInterval" value="3000"> -->
				<!-- 			milliseconds <input type=button value="Auto" onclick="{takeAuto()}"> -->
				<input type=button value="서버전송" id="btSub" onclick="server()">

				<form id="frm" method="post" action="http://127.0.0.1:5000/">
					<input type="hidden" value="imgBase64" />
				</form>
			</div>
			<script>
				var myVideoStream = document.getElementById('myVideo') // make it a global variable
				var myStoredInterval = 0

				function getVideo() {
					getUserMedia = navigator.mediaDevices.getUserMedia()
							|| navigator.webkitGetUserMedia
							|| navigator.mozGetUserMedia
							|| navigator.msGetUserMedia;
					getUserMedia({
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


		<div id="my_modal3">
			<header>
				<h2>비밀번호 변경 인증</h2>
			</header>
			<video id="myVideo" width="400" height="300"
				style="border: 1px solid #ddd;"></video>
			<canvas id="myCanvas" width="160" height="140"
				style="border: 1px solid #ddd;"></canvas>
			<br>
			<div class="row" id="box1">
				<div class="sm col-6">
					<input type=button id="video" value="get Video"
						onclick="{getVideo()}">
				</div>
				<div class="sm col-6">
					<input type=button id="pic" value="get Pic"
						onclick="{takeSnapshot()}"><br>
				</div>
				<!-- 	Take snapshot every <input type=number id="myInterval" value="3000"> -->
				<!-- 			milliseconds <input type=button value="Auto" onclick="{takeAuto()}"> -->
				<input type=button value="서버전송" id="btSub" onclick="server()">

				<form id="frm" method="post" action="http://127.0.0.1:5000/">
					<input type="hidden" value="imgBase64" />
				</form>
			</div>
			<script>
				var myVideoStream = document.getElementById('myVideo') // make it a global variable
				var myStoredInterval = 0

				function getVideo() {
					navigator.getMedia = navigator.getUserMedia|| navigator.webkitGetUserMedia|| navigator.mozGetUserMedia|| navigator.msGetUserMedia;
					alert(navigator.getMedia);
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

	<!-- 	이건 얼굴인식 -->

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

		$('#button2').on('click', function() {
			// 모달창 띄우기
			//     alert('message');
			modal('my_modal2');
		});
	</script>


	<!-- 	이건 비밀번호변경 시 얼굴인식 -->
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

		$('.modal_pw').on('click', function() {
			// 모달창 띄우기
			//     alert('message');
			modal('my_modal3');
		});
		
		
	</script>


</body>
</html>





