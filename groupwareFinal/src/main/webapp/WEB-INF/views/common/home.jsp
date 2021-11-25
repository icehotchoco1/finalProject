<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.gw.dto.MenuVO"%>
<%@page import="java.util.List"%>


<head>
<style>
#tt {
  position: absolute;
  top: 105px;
  background: #293648;
  width: 100%;
  height: 109px;
  color: white;
}
</style>

</head>
  <title>GW 그룹웨어</title>


<body class="hold-transition sidebar-mini">

  <div id="tt"></div>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wide">
	  <div style="margin:0 auto; width:1280px;">
  		<iframe name="ifr" src="" frameborder="0" style="width:100%; height:130vh; margin-top:10px;"></iframe>
	  </div>
	  <!-- /.content-wrapper -->
  </div>

 <!-- REQUIRED SCRIPTS -->
<script>
function subMenu(mCode){
	//alert("function call sumMenu()"+mCode);	
	if(mCode!="M000000"){
		
		document.getElementById("tt").style.display="none";
		
		$.getJSON("subMenu.do?mCode="+mCode,function(data){
			//console.log(data);
			printData(data[1],$('.tabs'),$('#subMenu-list-template'),'.tab-link');
// 			printData(data.LVThreeMenuListByMcode,$('.mctiner'),$('#subsubMenu-list-template'),'.tab-content');
			var mcid = '<c:out value="${mmCode}"/>'
			var mcd = mCode
				console.log(mcid);
			if (mCode.substring(3,8) == '0000'){
				mcid = mCode.substring(0,3)+'0100';
				mcd = mCode.substring(0,3)+'0100';
			}
			
				console.log(mcid);
				console.log(mCode);
// 				console.log(mCode.substring(3,8));
				
			$("#A"+mcd).addClass('current');
			
			if(mCode == "M010000"){
				mCode = "M010100";
			}
     			subsubMenu(mCode);
		});
	}else{
		document.getElementById("tt").style.display="block";
		$('.subMenuList').html("");		
// 		$('.mctiner').html("");
	}
}

function subsubMenu(mCode){
	//alert("function call sumMenu()"+mCode);	
	if(mCode!="M000000"){
		$.getJSON("subMenu.do?mCode="+mCode,function(data){
// 			console.log(data);
			printData(data[3],$('.subsubM'),$('#subsubMenu-list-template'),'.runtu');
			
		});
	}else{
		$('.subMenuList').html("");		
	}
}

function goPage(url,mCode){                             
	  // HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
	    
	    if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);
	 
	} else {
	    location.hash = "#"+mCode;
	}
	  
	$('iframe[name="ifr"]').attr("src","<%=request.getContextPath()%>"+url);
}
//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass){
	
	var template=Handlebars.compile(templateObject.html());
	

	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}

function remClass(data){
	$(data).remove();	
}

</script>



<!-- handlebars  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="subMenu-list-template" >
 {{#each .}}
 	{{#zeroli @index}}
 	<li class="tab-link t{{@index}} subMenu" id="A{{menu_code}}" data-tab="tab-{{@index}}">
		<a href="javascript:subsubMenu('{{menu_code}}'); goPage('{{url}}','{{menu_code}}');" >{{menu_nm}}</a>
 	</li>
 	{{else}}
 	<li class="tab-link t{{@index}} subMenu" id="A{{menu_code}}" data-tab="tab-{{@index}}">
 		<a href="javascript:subsubMenu('{{menu_code}}'); goPage('{{url}}','{{menu_code}}');" >{{menu_nm}}</a>
 	</li>
 	{{/zeroli}}
 {{/each}}
</script>

<!-- handlebars  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="subsubMenu-list-template" >
 	{{#each .}}
         	 <li class="runtu" style="list-style:none;"><a href="javascript:goPage('{{url}}','{{menu_code}}');">{{menu_nm}}</a></li>
 	{{/each}}
 </script>

<script>
window.onload=function(){
	Handlebars.registerHelper('zeroli', function(p1,options) {
	  if (p1 == 0) {
	    return options.fn(this);
	  } else {
	    return options.inverse(this);
	  }
	});
	
	var mcid = '<c:out value="${mmCode}"/>'
	
	goPage('${menu.url}','${menu.menu_code}');
	subMenu(mcid);
	
	console.log(location.href);


}
</script>


</body>
