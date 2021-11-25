<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
var formData="";

function picture_go(){
	
	formData = new FormData($('form[role="imageForm"]')[0]);

   var form = $('form[role="imageForm"]');
   var picture = form.find('[name=pictureFile]')[0];
   
   //이미지 확장자 jpg 확인
   var fileFormat=
	      picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
   if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
      alert("이미지는 jpg/jpeg 형식만 가능합니다.");
      picture.value="";      
      return;
   } 
   
   //이미지 파일 용량 체크
   if(picture.files[0].size>1024*1024*1){
      alert("사진 용량은 1MB 이하만 가능합니다.");
      picture.value="";
      return;
   };
   
   
   //업로드 확인변수 초기화 (사진변경)
   form.find('[name="checkUpload"]').val(0);
   
   document.getElementById('inputFileName').value=picture.files[0].name;
   
   if (picture.files && picture.files[0]) {
	      var reader = new FileReader();
	       reader.onload = function (e) {
	           $('div#pictureView')
	              .css({'background-image':'url('+e.target.result+')',
	                 'background-position':'center',
	                 'background-size':'cover',
	                 'background-repeat':'no-repeat'
	                 });
	        }
	      reader.readAsDataURL(picture.files[0]);
	      
	   }

}

function upload_go(){
	//alert("upload btn");
  if($('input[name="pictureFile"]').val()==""){
      alert("사진을 선택하세요.");
      $('input[name="pictureFile"]').click();
      return;
   };   
   
   
   if($('input[name="checkUpload"]').val()==1){
      alert("이미업로드 된 사진입니다.");
      return;      
   }
   
   $.ajax({
	      url:"picture.do",
	      data:formData,
	      type:'post',
	      processData:false,
	      contentType:false,
	      success:function(data){
	    	  //업로드 확인변수 세팅
	          $('input[name="checkUpload"]').val(1);
	          //저장된 파일명 저장.
	          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
	          $('form[role="form"]  input[name="face_photo"]').val(data);	    	  
	    	  alert("사진이 업로드 되었습니다.");
	      },
	      error:function(error){
	          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	       }
	    });	      
	
}

var checkedID="";

function idCheck_go(){
	//alert("아이디체크버튼눌름");
	var input_ID=$('input[name="empno"]');
	
	if(input_ID.val()==""){
		alert("사원번호를 입력하세요");
		input_ID.focus();
		return;
		
	}else{
		//아이디는 4~12자의 영문자와 숫자로만 입력
		var reqID=/[0-9]/;
		if(!reqID.test($('input[name="empno"]').val())){
			alert("사원번호는 숫자로만 입력해야 합니다.")
			$('input[name=empno]').focus();
			return;
		}
		
	}
	
	$.ajax({
		url: "empnoCheck.do?empno="+input_ID.val().trim(),
		method : "get",
		success : function(result){
			if(result == "duplicated"){
				alert("중복된 사원번호 입니다.");
				$('input[name=empno]').focus();
			}else{
				alert("사용가능한 사원번호 입니다.");
				checkedID=input_ID.val().trim();
				$('input[name="empno"]').val(input_ID.val().trim());
			}
		},
		error : function(error){
			alert("시스템 장애로 가입이 불가합니다.");
		}
	});
	
}

function regist_go(){
	// 	alert("regist btn");
	 var uploadCheck = $('input[name="checkUpload"]').val();
	   alert
	   if(uploadCheck==0){
	      alert("사진업로드는 필수 입니다.");
	      return
	   }
	   
	   if($('input[name="empno"]').val() == ""){
	      alert("사원번호는 필수입니다.");
	      return;
	   }

	   if($('input[name="empno"]').val()!=checkedID){
	      alert("사원번호는 중복 확인이 필요합니다.");
	      return;
	   }
	   if($('input[name="nm"]').val() == ""){
	      alert("이름은 필수입니다.");
	      return;
	   }
	   if($('input[name="cttpc"]').val() == ""){
	      alert("전화번호는 필수입니다.");
	      return;
	   }
	   if($('input[name="fxnum"]').val() == ""){
	      alert("팩스번호는 필수입니다.");
	      return;
	   }
	   if($('input[name="dept_code"]').val() == ""){
	      alert("부서는 필수입니다.");
	      return;
	   }
	   if($('input[name="clsf_code"]').val() == ""){
	      alert("직급은 필수입니다.");
	      return;
	   }
	   if($('input[name="rspofc_code"]').val() == ""){
	      alert("직책은 필수입니다.");
	      return;
	   }
	   if($('input[name="encpn"]').val() == ""){
	      alert("입사일은 필수입니다.");
	      return;
	   }
	   if($('input[name="id_adres"]').val() == ""){
	      alert("아이피주소는 필수입니다.");
	      return;
	   }
	   
	   if($('input[name="email_adres"]').val() == ""){
	      alert("dlapdlf주소는 필수입니다.");
	      return;
	   }
	   
	   var form = $('form[role="form"]');
	   form.submit();

		
	
	
	
}
</script>