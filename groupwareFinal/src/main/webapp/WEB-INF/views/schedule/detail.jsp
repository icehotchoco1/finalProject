<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/schedule/schedule_detail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
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
</style>
</head>

<title>일정 상세보기</title>

<body>
   <c:if test="${from eq 'modify' }" >
      <script>
         alert("수정되었습니다.");
         window.opener.location.reload();
      </script>
   </c:if>
   
   
   <c:if test="${from eq 'remove' }" >
      <script>
         alert("삭제되었습니다.");
         window.opener.location.reload();
         window.close();
      </script>
   </c:if>
   
    <!-- Content Header (Page header) -->
    <div class="pop-container" style="min-width:400px;">
   <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>일정 상세보기</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>       
 
    
  <!-- Main content -->
    <section class="content container-fluid">
      <div class="row">
         <div class="col-md-12">
            <div class="card card-outline card-primary">
               <div class="card-header">
               	<div class="card-tools">
               	<c:if test="${loginUser.nm eq sch.nm }">
                     <button type="button" id="modifyBtn" class="btn btn-regist"   onclick="submit_go('modifyForm.do','${sch.schdul_no }');">수정</button>      
                     <button type="button" id="removeBtn" class="btn btn-remove"  onclick="submit_go('remove.do','${sch.schdul_no }');">삭제</button>
                 </c:if>
                  	 <button type="button" id="cancelBtn" class="btn btn-cancle"   onclick="CloseWindow();">닫기 </button>
               </div>
              </div>
               <div class="card-body">
                  <div class="form-group col-sm-12">
                     <label for="schdul_sj">일정명</label>
                     <input type="text" class="form-control" id="schdul_sj " 
                        value="${sch.schdul_sj }" readonly />    
                    </div>                     
                  <div class="form-group col-sm-12">
                     <label for="nm">작성자</label>
                     <input type="text" class="form-control" id="nm " 
                        value="${sch.nm }" readonly />                     
				  </div>  
                     <div class="form-group col-sm-12" >
                        <label for="bgnde">시작일</label>
                        <input type="text" class="form-control" id="bgnde" 
                           value="${sch.bgnde }" readonly />
                     </div>   
                     <div class="form-group col-sm-12" >
                        <label for="endde">종료일</label>
                        <input type="text" class="form-control" id="endde" 
                           value="${sch.endde }" readonly />
                     </div>   
                    
                  <div class="form-group col-sm-12">
                     <label for="schdul_cn">내 용</label>
                     <input type="text" class="form-control" id="bgnde" 
                           value="${sch.schdul_cn }" readonly />
                  </div>
                  
                  <div class="form-group col-sm-12">
                     <label for="schdul_code">일정분류</label>
                     <input type="text" class="form-control" id="bgnde" 
                           value="${sch.schdul_code }" readonly />
                  </div>
                  
                     </div>     
               </div>
                                        
            </div><!-- end card -->            
      	</div><!-- end row  -->   
     </section>   
</div>

    
<script>
    function submit_go(url,schdul_no){
     location.href=url+"?schdul_no="+schdul_no;
   }
 </script>
</body>

















