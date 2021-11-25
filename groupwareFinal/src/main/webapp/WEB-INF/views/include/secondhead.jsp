<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.container {
  text-align: center;
  padding:0; padding-bottom:10px;
}
ul.tabs{
  margin: 0 auto;
  margin-top: 10px;
  padding: 0px;
  list-style: none;
  width: 1000px;
  height: 37px;
}
ul.tabs li{
  text-align: center;
  border: 1px solid lightgrey;
  background-color: white;
  display: inline-block;
  padding: 8px 0;
  cursor: pointer;
  width: 140px;
  font-size: 13px;
  font-weight: bold;

}
li.t1 {
  position: relative;
  left: -5px;
}
li.t2 {
  position: relative;
  left: -10px;
}
li.t3 {
  position: relative;
  left: -15px;
}
li.t4 {
  position: relative;
  left: -20px;
}
li.t5 {
  position: relative;
  left: -24px;
}
li.t6 {
  position: relative;
  left: -24px;
}
li.t7 {
  position: relative;
  left: -28px;
}
li.t8 {
  position: relative;
  left: -32px;
}
li.t9 {
  position: relative;
  left: -36px;
}
ul.tabs li>a{
  color: #556278;
/*   padding-left:5px; */
}
ul.tabs li>span{
  float: right;
  margin-top: 2px;
}
ul.tabs li.current a{
  color: #007bff;
}
.runtu{
/*   display: none;   */
/*   padding: 15px 0; */
  font-size: 13px;
  float: left;
  width: 150px;
}

/* .tab-content.current{ */
/*   display: inherit; */
/* } */
/* 소분류 */
div#main-container{
  margin: 0 auto;
/*   background : white; */
/*   border: 1px solid lightgrey; */
/*   padding: 0;  */
  width:700px; 
  height:30px;
/*   position: relative; */
/*   top: -2px; */
/*   left: -4px; */
 
}
.subsubMlist {
  padding: 20px 25px;
  float : left;
  text-align:center;
}
.category_list>li {

  float: left;
  width: 150px;
}
.runtu a{
	color : white;
	font-weight: bold;	
}

.runtu a:hover{
	color : #007bff;
	
}
.subMenu a{
	padding : 8px 20px;
}
</style>
      

	
  <!-- Content Wrapper. Contains page content -->
<div class="wrapper" id="tbmenu" style="text-align:center; background : #293648;">
	
   <div style="height:8px;"></div>
    <div style="width:1280px; margin:0 auto;">
   <div class="container">
     <ul class="tabs">
     
     </ul>
	 
<%-- 	 <c:if test="${not empty LVThreeList }"> --%>
     <div id="main-container" class="mctiner" style="display:inline-block; padding-top:20px;">
     	<div class = "subsubM" style="display:inline-block;">
     		<div id="asd" class="tab-content " style="padding: 0; display:inline-block;">
 				<!-- 
 				<ul class="subsubMlist">
        		 	 <li class="category_list-{{@index}}">{{menu_nm}}</li>
     			</ul>
     			 -->
 			</div>
     	</div>
	     
	  </div>
<%-- 	  </c:if> --%>
	   </div>
	</div>      
</div>