<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>title</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
#save{
  background: #004680;
  color: white;
  width: 20%;
  border: 2px solid #004680;
  border-radius: 0;
  height: 38px;
  font-size: 14px;
  font-weight: bold;
}

#reset{
  background: #004680;
  color: white;
  width: 20%;
  border: 2px solid #004680;
  border-radius: 0;
  height: 38px;
  font-size: 14px;
  font-weight: bold;
  display: inline;
}
.canvas-div1 {
  text-align: center;
  margin: 0 auto;
}
.canvas-div2 {
  text-align: center;
  margin-top: 20px;
}
.row {
  width: 100%;
}
</style>


<!-- 서명 공간 -->

	<div class="canvas-div1" style="width:400px; height:250px;">
		<canvas id="canvas" style="border: 3px solid black;"></canvas>
	</div>
	<img src="">
	


	<div class="canvas-div2">
		<!-- 저장 버튼 -->
		<button id="save">저장</button>
		<!-- 초기화 버튼 -->
		<button id="reset">초기화</button>
	</div>



<!-- <div style="width: 70px; height: 70px;"></div> -->
<script>
	$("#save").click(function() {
		alert("저장되었습니다.");
	});
</script>
<script>
	(function(obj) {
		obj.init();
		$(obj.onLoad);
	})((function() {
		var canvas = $("#canvas");
		var div = canvas.parent("div");
		// 캔버스의 오브젝트를 가져옵니다.
		var ctx = canvas[0].getContext("2d");
		var drawble = false;

		// 이제 html 버그인지는 모르겠는데 canvas의 style의 height와 width를 수정하게 되면 그림이 이상하게 그려집니다.
		function canvasResize() {
			canvas[0].height = div.height();
			canvas[0].width = div.width();
		}
		// pc에서 서명을 할 경우 사용되는 이벤트입니다.
		function draw(e) {
			function getPosition() {
				return {
					X : e.pageX - canvas[0].offsetLeft,
					Y : e.pageY - canvas[0].offsetTop
				}
			}
			switch (e.type) {
			case "mousedown": {
				drawble = true;
				ctx.beginPath();
				ctx.moveTo(getPosition().X, getPosition().Y);
			}
				break;
			case "mousemove": {
				if (drawble) {
					ctx.lineTo(getPosition().X, getPosition().Y);
					ctx.stroke();
				}
			}
				break;
			case "mouseup":
			case "mouseout": {
				drawble = false;
				ctx.closePath();
			}
				break;
			}
		}

		// 참고로 mousedown은 touchstart와 mousemove는 touchmove, mouseup은 touchend와 같습니다.
		// mouseout와 touchcancel은 서로 다른 동작인데, mouseout은 canvas 화면을 벗어났을 때이고 touchcancel는 모바일에서 터치가 취소, 즉 에러가 났을 때 입니다.
		return {
			init : function() {
				// 캔버스 사이즈 조절
				$(window).on("resize", canvasResize);

				canvas.on("mousedown", draw);
				canvas.on("mousemove", draw);
				canvas.on("mouseup", draw);
				canvas.on("mouseout", draw);

				// save 버튼을 누르면 imageupload.php로 base64코드를 보내서 이미지로 변환합니다.
				$("#save").on("click", function() {
					/* console.log(canvas[0].toDataURL("image/png")); */
					
				    $.ajax({
				        type: "post", 
				        url: "<%=request.getContextPath()%>/sign/upload",
						dataType : "text",
						//contentType : "text/plain",
						data : {
							"sanctn_sign" : canvas[0].toDataURL("image/png")
						}
					});

					// a 태그를 만들어서 다운로드를 만듭니다.
					// 							var link = document.createElement('a');
					// base64데이터 링크 달기
					// 						 	link.href = canvas[0].toDataURL("image/png"); 
					// 다운로드시 파일명 지정
					// 							link.download = ${loginUser.empno}+".png";
					// body에 추가
					// 							document.body.appendChild(link);
					// 							link.click();
					// 							document.body.removeChild(link);
					// 다운로드용 a 태그는 다운로드가 끝나면 삭제합니다.
					// 							form.remove();
				});
			},
			onLoad : function() {
				// 캔버스 사이즈 조절
				canvasResize();
			}

		}
	})());
</script>
<script>
	$("#reset").click(function reset() {
		/* alert("테스트 클릭 성공"); */
		var canvas = document.getElementById("canvas");
		// 캔버스의 오브젝트를 가져옵니다.
		var ctx = canvas.getContext("2d");
		// 픽셀 정리
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		// 컨텍스트 리셋
		ctx.beginPath();
	});
</script>

<script>
function select(){
    $.ajax({
    	 url: "<%=request.getContextPath()%>/sign/select",
         type : "post",
         dataType : "text",
         data : {"sanctn_sign" : $("#sanctn_sign").val()},
         success : function(data){
        	 $("#div signaa").html(data);
         }
     })
}
        	 console.log($("#sanctn_sign").val());

</script>



