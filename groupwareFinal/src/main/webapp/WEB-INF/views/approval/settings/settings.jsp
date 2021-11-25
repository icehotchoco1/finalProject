<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/approvalSetting.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

   <script>
 $(document).ready(function(){
    
     $('ul.tabs li').click(function(){
       var tab_id = $(this).attr('data-tab');
    
       $('ul.tabs li').removeClass('current');
       $('.tab-content').removeClass('current');
    
       $(this).addClass('current');
       $("#"+tab_id).addClass('current');
     })
 
  /* 탭 강제 클릭 이벤트 */
    $('ul.tabs li.current').trigger("click");
});
 
 
</script>

<style>
.tab-link {
  border: 1px solid lightgrey;
}
.tab-link>a {
  position: relative;
  left: -4px;
}
</style>

</head>


      
    <!-- Main content -->
   
   <section class="content-header">
        <div class="container-fluid">
           <div class="row md-2">
              <div class="col-sm-6">
                 <i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
                 <p class="menu-header">결재</p>
                 <p class="menu-header">></p>
                 <p class="menu-header this">결재설정</p>              
              </div>

           </div>
        </div>
   </section>
   
    <!-- Main content -->
    <section class="content">      
      <div class="gw-card">
         <div class="card-header with-border">
         
                           
         </div>
         <div class="card-body">
          <div class="container col-sm-12" style="float: left; width:100%; padding:0;">
      <div class="ttt">
     <ul class="tabs" style="text-align:center; padding:0;">
       <li class="tab-link current" data-tab="tab-5"><a href="#tabs-5"> 결재서명관리</a></li>
      <!--  <li class="tab-link " data-tab="tab-7"><a href="#tabs-7"> 결재비밀번호</a></li> -->
       <li class="tab-link " data-tab="tab-8"><a href="#tabs-8"> 부재중설정</a></li>
     </ul>
     </div>   
     <br>
     <div id="main-container" style="padding: 0; width:100%; height:933px; "><!-- height 바꾸지 말것 -->
     
     <!-- 결재서명관리 -->
     <div id="tab-5" class="tab-content current" style="padding: 80px; overflow-x: hidden; overflow-y: hidden; align: middle;">
     <iframe src="<%=request.getContextPath()%>/approval/settings/sign" frameborder="0" style="width:1012.5px; height:350px;"></iframe>
     </div>

   <%--   
       <!-- 결재비밀번호 -->
     <div id="tab-7" class="tab-content current" >
  <%@ include file="./approvalPassword.jsp" %>
     </div> --%>
     
     <!-- 부재중설정 -->
     <div id="tab-8" class="tab-content current">
         <%@ include file="./instead.jsp" %>
     </div>
    </div>
  </div>

      
      </div>                     
      
      </div>   
    </section>
    <!-- /.content -->

<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script>

</body>





	 



