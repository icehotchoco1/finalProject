<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <c:set var="ntcnCnt" value="${ntcnCnt }" /> --%>
<%-- <c:set var="ntcnList" value="${ntcnList }" /> --%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- notification.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/notification.css">

<script>
 $(document).ready(function(){
	 $(document).on("click",".tabs li",function(){
		 var tab_id = $(this).attr('data-tab');
		 
		    $('.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
	});
	 
	 
	 $(document).on("trigger",".tabs li","click");
	 



	 
// 	  $('ul.tabs li').click(function(){
// 	    var tab_id = $(this).attr('data-tab');
	 
// 	    $('ul.tabs li').removeClass('current');
// 	    $('.tab-content').removeClass('current');
	 
// 	    $(this).addClass('current');
// 	    $("#"+tab_id).addClass('current');
// 	  })
 
  /* 탭 강제 클릭 이벤트 */
// 	 $('ul.tabs li.current').trigger("click");
	  

});
</script>
  <style>
span {
  font-family: 'Do Hyeon', sans-serif;
}
/* dropdown menu */
li.dropdown:hover > ul.dropdown-menu{display:block;margin:0;}
.dropdown-menu {
  position: absolute;
  top: 60px;
  left: -25px;
}
.letter-3{
  position: absolute;
  left: -20px;
}
.dropdown-menu li {
  margin: 8px 0;
}
a.second {
  padding: 10px 27px;
}
.dropdown-menu li:hover a.second {
  color: #1F88D8;
}
.dropdown-menu {
  border: 2px solid #004680;
  font-family: 'Do Hyeon', sans-serif;
  font-size: 18px;
}
.dropdown-menu a{
  color: #556278;
}
/* final-menu */
.final-menu {
  display: none;
  border: 2px solid #004680;
  border-radius: 5px;
  padding: 8px 0;
  width: 150px;
  background: white;
  list-style: none;
}
.final-menu a {
  color: #556278;
}
.final-menu li:hover a {
  color: #1F88D8;
}
.dropdown-menu li:hover .final-menu {
  display: block;
  position:absolute;
  left:157px;
  top:-18px;
}
/* header */
.header-wide {
  background: #f4f6f9;
}
.header-content {
  background: #f4f6f9;
  height:45px;
}
.header-content p{
  margin-bottom:15px;
  position: relative;
  top: 10px;
  font-family: 'Do Hyeon', sans-serif;
  font-weight: bold;
  font-size: 22px;
  color: #556278;
}
/* nav */
.nav-wide {
  background:#004680;
  height:60px;
}
.main-header {
  width:1280px;   
  height:60px; 
  background:#004680;
  border:none;
}
/* content */
.content-wide {
  background: #f4f6f9;
}
.navbar-nav p {
  color: white;
  font-family: 'Do Hyeon', sans-serif;
  font-size: 18px;
}
nav>ul>li {
  padding: 10px 25px;
}
/* 메인메뉴 마우스오버 효과 (흰색 선) */
#index_wrap ul li {position: relative; text-align: center; line-height: 30px; cursor: pointer;} 
#fromInsideOut li::after {position: absolute; content:""; display: block; border-bottom: 3px solid white; transition: all 250ms ease-out; left: 50%; width: 0;} 
#fromInsideOut li:hover::after {transition: all 250ms ease-out; left: 0%; width: 100%;}
.main-footer {
  text-align: center;
  background:#f4f6f9;
}
/* 서브메뉴 > 화살표 */
.i-basic {
  position: absolute;
  left: 120px;
  top: 8px;
  color: #556278;
}

/*메뉴 드롭바*/
#dropbtn {
  color: black;
  padding: 8px;
  font-size: 16px;
  border: none;
}

#dropdown {
  position: relative;
  display: inline-block;
  padding-top: 8px  
}

#dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 10000;
}

#dropdown-content a {
  padding-top: 8px;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

#dropdown-content a:hover {background-color: #ddd;}

#dropdown:hover #dropdown-content {display: block;}

#dropdown:hover #dropbtn {background-color: #3e8e41;}


</style>

      
    <!-- header -->
  <div class="header-wide">
	  <div class="header-content navbar navbar-expand navbar-white navbar-light" style="width:1280px; margin:0 auto;">
	    <p>OA 그룹웨어</p>
	    
	    <!-- Right navbar links -->
	    <ul class="navbar-nav ml-auto">
	      <!-- Navbar Search -->

	      <!-- Notifications Dropdown Menu -->
	      <form role="form" method="post" name="ntcnChkForm" id="ntcnChkForm">
		      <li class="nav-item dropdown" style="z-index: 5500;">
		        <a class="nav-link" data-toggle="dropdown" href="#" onclick="">
		          <i class="far fa-bell" onclick="bellBtn()"></i>
		          <span class="badge badge-warning navbar-badge">${ntcnCnt}</span>
		        </a>
				<!-- allNtcnList 0-3-->
		        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="top: 40px; width: 280px; display: hide" id="ntcnList">
		          
		          
				<c:if test="${empty ntcnList}" >
		          <span class="dropdown-header" style="font-size: 17px;" >수신 알림이 없습니다.</span>
				</c:if>
				
				<c:if test="${not empty ntcnList}">
					<div style="display: block; padding: 10px">
			          <span class="dropdown-header" style="display: inline; position: auto; width: 240px">${ntcnCnt} Notifications</span> 
				      <form role="form" method="post" name="deleteNtcn" action="deleteNtcn">
				          <i class="far fa-trash-alt" style="display: inline; left: 120px" onclick="deleteNtcnBtn()"></i>
				          <i class="fas fa-times" onclick="ntcnCloseBtn()" style="margin: 5px"></i>
				      </form>
					</div>
	
		          <div class="dropdown-divider"></div>
		          
	
		          <c:forEach items="${ntcnList }" var="ntcn" begin="0" end="3">
		          	  <input class="cs" type="checkbox" style="margin: 10px" name="ntcnChk">
<%-- 			          <a href="#" class="dropdown-item" onclick="javascript:OpenWindow('${ntcn.url_adres}','상세보기',900,800); ntcnChkBtn();" style="display: inline; padding: 0.5 rem 1rem;"> --%>
						<input id="ntcnUrlAdr" type="hidden" value="${ntcn.url_adres }">
<%-- 						<input class="ntcnNo" type="hidden" value="${ntcn.ntcn_no }"> --%>
			          <a href="#" class="dropdown-item" onclick="ntcnChkBtn('${ntcn.ntcn_no }');" style="display: inline; padding: 0.5 rem 1rem;">
			          	<c:if test="${ntcn.cnfirm_at eq '1' }">
			            	<i class="far fa-envelope-open mr-2"></i> ${ntcn.ntcn_cn }
			            </c:if>
			          	<c:if test="${ntcn.cnfirm_at eq '0' }">
			            	<i class="fas fa-envelope mr-2"></i> ${ntcn.ntcn_cn }
			            </c:if>
			            <span class="float-right text-muted text-sm" style="margin-right: 10px"><fmt:formatDate value="${ntcn.ntcn_de }" pattern="yy.MM.dd hh:mm" /></span>
			          </a>
			          <div class="dropdown-divider"></div>
		          </c:forEach>
		          
		          
		          <a href="#" class="dropdown-item dropdown-footer" onclick="showAllNtcn()">See All Notifications</a>
				</c:if><!-- ./ ntcn not empty -->
		        </div>
				<!-- ./allNtcnList 0-3-->

				<!-- allNtcnList -->
		        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="top: 40px; width: 280px;" id="allNtcnList">
				<c:if test="${not empty ntcnList}">
					<div style="display: block; padding: 10px">
			          <span class="dropdown-header" style="display: inline; position: auto; width: 240px">${ntcnCnt} Notifications</span> 
				      <form role="form" method="post" name="deleteNtcn" action="deleteNtcn">
				          <i class="far fa-trash-alt" style="display: inline; left: 120px" onclick="deleteNtcnBtn()"></i>
				          <i class="fas fa-times" onclick="ntcnCloseBtn()" style="margin: 5px"></i>
				      </form>
					</div>
	
		          <div class="dropdown-divider"></div>
		          
	
		          <c:forEach items="${ntcnList }" var="ntcn" >
		          	  <input class="cs" type="checkbox" style="margin: 10px" name="ntcnChk">
			          <a href="#" class="dropdown-item" onclick="javascript:OpenWindow('${ntcn.url_adres}','상세보기',900,800);" style="display: inline; padding: 0.5 rem 1rem;">
			          	<c:if test="${ntcn.cnfirm_at eq '1' }">
			            	<i class="far fa-envelope-open mr-2"></i> ${ntcn.ntcn_cn }
			            </c:if>
			          	<c:if test="${ntcn.cnfirm_at eq '0' }">
			            	<i class="fas fa-envelope mr-2"></i> ${ntcn.ntcn_cn }
			            </c:if>
			            <span class="float-right text-muted text-sm" style="margin-right: 10px"><fmt:formatDate value="${ntcn.ntcn_de }" pattern="yy.MM.dd hh:mm" /></span>
			          </a>
			          <div class="dropdown-divider"></div>
		          </c:forEach>
				</c:if><!-- ./ ntcn not empty -->
		        </div>
				<!--./allNtcnList -->
	
		      </li><!-- ./notification -->
	
	      </form>
	      
	      <script>
	      	function ntcnCloseBtn() {
	      		$('#ntcnList').hide();
	      		$('#allNtcnList').hide();
	      	}
	      
	      	function showAllNtcn() {
	      		$('#ntcnList').hide();
	      		$('#allNtcnList').show();
	      	}
	      	
	      	function bellBtn() {
	      		$('#ntcnList').show();
	      		$('#allNtcnList').hide();
	      		$("input:checkbox[name='ntcnChk']").prop("checked", false);
	      	}
	      	
	      	function ntcnChkBtn(ntcnNo) {
	      		$.ajax({
	      			url			: "<%=request.getContextPath()%>/common/ntcnChk",
	      			type		: "post",
	      			data		: {'ntcnNo' : ntcnNo},
	      			success		: function(data){
			      		var ntcnUrlAdr = document.getElementById("ntcnUrlAdr").value;
			      		OpenWindow(ntcnUrlAdr ,'상세보기',900,800); 
	      			},
	      			error		: function(request, status, error){
						alert("error!");
	      			}
	      		});
	      	}	      			
	      	
	      	function deleteNtcnBtn(){
	      		var chkedCnt = $("input[name='ntcnChk']:checked").length;
	      		var chkedId = $("input[name='ntcnChk']:checked");
	      		alert("deleteNtcnBtn");

// 	      		for(prop in chkedId) {
// 					console.log(prop + " : " + chkedId[prop]);
// 				}
	      			
//       			var form = document.deleteNtcn;
// 	      			form.submit();
	      	}
	      </script>
	      
	      <!-- fullscreen -->
	      <li class="nav-item">
		   <a class="nav-link" data-widget="fullscreen" href="#" role="button">
		    <i class="fas fa-expand-arrows-alt"></i>
		   </a>
		  </li>
		  
	     <li class="nav-item" id="dropdown">
	     	<c:if test="${empty loginUser.face_photo  }">
	          <i class="fa fa-user-circle-o fa-lg" aria-hidden="true" style="color:#004680;"></i>
	     	</c:if>
	     	<c:if test="${!empty loginUser.face_photo  }">
		          <img src="<%=request.getContextPath() %>/organogram/getPicture.do?picture=${loginUser.face_photo }" class="img-circle" alt="User Image" style="width : 30px; height : 28px; ">
	     	</c:if>
	     	
	          &nbsp;&nbsp;${loginUser.nm} &nbsp;&nbsp;
	          <button class="fa fa-caret-down fa-lg" aria-hidden="true" id="dropbtn"></button>
	          <div id="dropdown-content" class="dropdown-content">
			    <a href="#">마이페이지</a>
			    <a href="gw/common/logout.do">로그아웃</a>
			  </div>
	        </a>
	      </li> 
	      
	    </ul>
	    <!-- ./navbar-nav ml-auto -->
	    
	  </div>
	  <!-- ./header-content -->
  </div>
  <!-- /header -->
  
  
  
  
  
  <div class="nav-wide">

	  <nav id="index_wrap" class="main-header navbar navbar-expand navbar-white navbar-light" style="margin:0 auto;">
		<ul id ="fromInsideOut" class="navbar-nav nav" style="margin:0 auto;">
		
		<c:forEach items="${menuList }" var="menu">
		  <li class="nav-item d-none d-sm-inline-block dropdown">
	        <a href="javascript:remClass('.runtu');remClass('.tab-link');subMenu('${menu.menu_code }');goPage('${menu.url }','${menu.menu_code }');" class="nav-link"><p>${menu.menu_nm }</p></a>
	      	<c:if test="${menu.menu_code ne 'M000000' }">
		      <ul class="dropdown-menu">
			      <c:forEach items="${TwoMenuList }" var="sMenu">
			      	<c:if test="${menu.menu_code eq sMenu.upper_menu_code }">
				      		 <li>
				      			 <a href="javascript:subMenu('${sMenu.menu_code }');goPage('${sMenu.url }','${sMenu.menu_code }');" class="submenuLink longLink second">${sMenu.menu_nm }</a>
					      			<c:if test="${sMenu.ssmenu_ex eq 1 }"> 
					      				<i class="fa fa-chevron-right i-basic" aria-hidden="true"></i>
					      			 	<ul class="final-menu">
						      			 	<c:forEach items="${ThreeMenuList }" var="ssMenu">
						      			 		<c:if test="${sMenu.menu_code eq ssMenu.upper_menu_code }">
						      			 			<li>
						      			 				<a href="javascript:goPage('${ssMenu.url }','${ssMenu.menu_code }');" class="submenuLink longLink">${ssMenu.menu_nm }</a>
						      			 			</li>	
						      			 		</c:if>
						      			 	</c:forEach>
						      			 </ul>
						      		</c:if>
					         </li>
			      	</c:if>
			      </c:forEach>
		      </ul>
	     	</c:if>
	      </li>
		</c:forEach>
		
	      
	    </ul>

	  </nav>
  </div>
  

  