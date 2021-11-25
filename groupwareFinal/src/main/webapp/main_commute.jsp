<%@ page language="java" contentType="text/html; charset=UTF-8"
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

.btn-basic{
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

#my_modal .modal_close_btn1 {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}
#my_modal .modal_close_btn2    {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}

#my_modal2 .modal_close_btn2 {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	color: #004680;
}
#my_modal3 .modal_close_btn3 {
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
	font-family: 'Do Hyeon', sans-serif;
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
#box1{
margin-top: 0%;

}

</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>

	<div style="width: 1280px; margin: 0 auto;">
		<div class="wrapper">

			<div class="row">
				<section class="col-md-6">
					<div class="pwlogin col-md-10">
						<button id="button1">출근</button>
					</div>
				</section>
				<section class="col-md-6">
					<div class="facelogin col-md-10">
						<button id="button2">퇴근</button>
					</div>
				</section>
			</div>

		</div>
	
		<div id="my_modal2">
			<header>
				<h2>출근</h2>
			</header>
		  <video id="myVideo1" width="400" height="300"
            style="border: 1px solid #ddd;"></video>
         <canvas id="myCanvas1" width="160" height="140"
            style="border: 1px solid #ddd;"></canvas>
         <br>
         <div class="row" id="box1">
            <div class="sm col-6">
               <input type=button id="video1" value="get Video"
                  onclick="{getVideo1()}">
            </div>
            <div class="sm col-6">
               <input type=button id="pic" value="get Pic"
                  onclick="{takeSnapshot1()}"><br>
            </div>
            <!--    Take snapshot every <input type=number id="myInterval" value="3000"> -->
            <!--          milliseconds <input type=button value="Auto" onclick="{takeAuto()}"> -->
            <input type=button value="서버전송" id="btSub" onclick="server1()">

            <form id="frm" method="post" action="http://127.0.0.1:5000/">
               <input type="hidden" value="imgBase64" />
            </form>
         </div>
               <a class="modal_close_btn2" onClick="window.location.reload()"><i class="fa fa-window-close fa-lg"
            aria-hidden="true"></i></a>
      </div>
         <script>
            var myVideoStream1 = document.getElementById('myVideo1') // make it a global variable
            console.log(myVideoStream)
            var myStoredInterval = 0

            function getVideo1() {
               if (navigator.mediaDevices === undefined) {
                    navigator.mediaDevices = {};
                  }

                  // Some browsers partially implement mediaDevices. We can't just assign an object
                  // with getUserMedia as it would overwrite existing properties.
                  // Here, we will just add the getUserMedia property if it's missing.
                  if (navigator.mediaDevices.getUserMedia === undefined) {
                    navigator.mediaDevices.getUserMedia = function(constraints) {

                      // First get ahold of the legacy getUserMedia, if present
                      var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

                      // Some browsers just don't implement it - return a rejected promise with an error
                      // to keep a consistent interface
                      if (!getUserMedia) {
                        return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
                      }

                      // Otherwise, wrap the call to the old navigator.getUserMedia with a Promise
                      return new Promise(function(resolve, reject) {
                        getUserMedia.call(navigator, constraints, resolve, reject);
                      });
                    }
                  }

                  navigator.mediaDevices.getUserMedia({ audio: false, video: true })
                  .then(function(stream) {
                    var video = document.getElementById('myVideo1');
                    console.log(video1);
                    // Older browsers may not have srcObject
                    if ("srcObject" in video) {
                      video.srcObject = stream;
                    } else {
                      // Avoid using this in new browsers, as it is going away.
                      video.src = window.URL.createObjectURL(stream);
                    }
                    video.onloadedmetadata = function(e) {
                      video.play();
                    };
                  })
                  .catch(function(err) {
                    console.log(err.name + ": " + err.message);
                  });
            }

            function takeSnapshot1() {
               var myCanvasElement = document.getElementById('myCanvas1');
               var myCTX = myCanvasElement.getContext('2d');
               myCTX.drawImage(myVideoStream1, 0, 0, myCanvasElement.width,
                     myCanvasElement.height);
            }

            function server1() {
               const canvas = document.getElementById('myCanvas1');
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
   

<!-- ====================================================================================================================================  -->
	
		<div id="my_modal3">
			<header>
				<h2>퇴근</h2>
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
            <!--    Take snapshot every <input type=number id="myInterval" value="3000"> -->
            <!--          milliseconds <input type=button value="Auto" onclick="{takeAuto()}"> -->
            <input type=button value="서버전송" id="btSub" onclick="server()">

            <form id="frm" method="post" action="http://127.0.0.1:5000/password">
               <input type="hidden" value="imgBase64" />
            </form>
         </div>
         <script>
            var myVideoStream = document.getElementById('myVideo') // make it a global variable
            var myStoredInterval = 0
            
            function getVideo() {
               if (navigator.mediaDevices === undefined) {
                    navigator.mediaDevices = {};
                  }

                  // Some browsers partially implement mediaDevices. We can't just assign an object
                  // with getUserMedia as it would overwrite existing properties.
                  // Here, we will just add the getUserMedia property if it's missing.
                  if (navigator.mediaDevices.getUserMedia === undefined) {
                    navigator.mediaDevices.getUserMedia = function(constraints) {

                      // First get ahold of the legacy getUserMedia, if present
                      var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

                      // Some browsers just don't implement it - return a rejected promise with an error
                      // to keep a consistent interface
                      if (!getUserMedia) {
                        return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
                      }

                      // Otherwise, wrap the call to the old navigator.getUserMedia with a Promise
                      return new Promise(function(resolve, reject) {
                        getUserMedia.call(navigator, constraints, resolve, reject);
                      });
                    }
                  }

                  navigator.mediaDevices.getUserMedia({ audio: false, video: true })
                  .then(function(stream) {
                    var video = document.getElementById('myVideo');
                    // Older browsers may not have srcObject
                    if ("srcObject" in video) {
                      video.srcObject = stream;
                    } else {
                      // Avoid using this in new browsers, as it is going away.
                      video.src = window.URL.createObjectURL(stream);
                    }
                    video.onloadedmetadata = function(e) {
                      video.play();
                    };
                  })
                  .catch(function(err) {
                    console.log(err.name + ": " + err.message);
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
         <a class="modal_close_btn3" onClick="window.location.reload()"><i class="fa fa-window-close fa-lg"
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
         var bg = $('<div id="modalback1">').css({
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
//                .find('.modal_close_btn1').on('click', function() {
//                   console.log("fewsfd");
//                   bg.remove();
//                   modal.hide();
//                });
               
      }

$(function(){
      $('.modal_close_btn1').on('click', function() {
         $("#modalback1").remove();
         $("#my_modal").hide();
      });
      $('#button1').on('click', function() {
         // 모달창 띄우기
         //     alert('message');
         modal('my_modal');
      });
   
})   
   </script>

   <!--    이건 얼굴인식 -->

   <script>
      function modal2(id) {
         var zIndex = 9999;
         var modal = $('#' + id);
         // 만지지마 화면 중앙에 비치하는거임

         // 모달 div 뒤에 희끄무레한 레이어
         var bg = $('<div id="modalback2">').css({
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
//             .find('.modal_close_btn2').on('click', function() {
//                console.log("버튼2");
//                   bg.remove();
//                   modal.hide();
//                }); 
      }

      
$(function(){
   
      $('.modal_close_btn2').on('click', function() {
         console.log("버튼2");
            $("#modalback2").remove();
            $("#my_modal2").hide();
         }); 

      $('#button2').on('click', function() {
         // 모달창 띄우기
         //     alert('message');
         modal2('my_modal2');
         
      });
});      
   </script>
   <script>
      function modal3(id) {
         var zIndex = 9999;
         var modal = $('#' + id);
         // 만지지마 화면 중앙에 비치하는거임

         // 모달 div 뒤에 희끄무레한 레이어
         var bg = $('<div id="modalback3">').css({
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
//             .find('.modal_close_btn2').on('click', function() {
//                console.log("버튼2");
//                   bg.remove();
//                   modal.hide();
//                }); 
      }

      
$(function(){
   
      $('.modal_close_btn3').on('click', function() {
         console.log("버튼3");
            $("#modalback3").remove();
            $("#my_modal3").hide();
         }); 

      $('.modal_pw').on('click', function() {
         // 모달창 띄우기
         //     alert('message');
         modal3('my_modal3');
         $("#modalback1").remove();
         $("#my_modal1").hide();
      });
});      
   </script>




</body>
</html>



