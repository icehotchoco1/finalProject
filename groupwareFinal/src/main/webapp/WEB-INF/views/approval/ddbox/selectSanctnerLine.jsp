<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.list-header {
  background: #EFEFEF;
  margin-bottom: 10px;
}

/* 테이블 */
table {
 
}
.table-th, th {
  background: #EFEFEF;
  padding: 6px 12px;
  font-size: 12px;
  text-align: center;
}
.hdbars > tr > td{
  text-align: center;
}
.removeBtn {
  background: #EFEFEF;
  color: tomato;tomato
  width: 50px;
  padding: 6px;
  border: 2px solid #EFEFEF;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.removeBtn:hover {
  background: #F7F6ED;
  color: #556278;
}
.commitBtn {
  background: #004680;
  color: white;
  width: 90px;
  padding: 6px;
  border: 2px solid #004680;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.cancelBtn {
  background: #EFEFEF;
  color: #556278;
  width: 90px;
  padding: 6px;
  border: 2px solid #EFEFEF;
  border-radius: 0;
  height: 34px;
  font-size: 13px;
  font-weight: bold;
}
.commitBtn:hover {
  background: white;
  color: #59BEE9;
}
.cancelBtn:hover {
  background: #F7F6ED;
  color: tomato;
}
</style>
</head>
<body>

 <div class="card" style="margin:20px; padding:10px;">
	<div class="wrapper">
	  <div class="list-header">
			<i class="fas fa-address-book"></i> <b>결재선리스트</b>
	  </div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-3 column">
					<div>
					<select class="form-control" multiple style="height:340px;" onchange="javascript:showDtls(this);" >
						 <c:forEach items="${ebkmkList }" var="ebkm" varStatus="status">
						 	<option class="sancOp" id="${status.index}" onclick='javascript:selectMe(this)' value=${ebkm.bkmk_no } sj=${ebkm.bkmk_sj } info=${ebkm.bkmk_info } formN=${ebkm.form_no }>${ ebkm.bkmk_sj}</option>
						 </c:forEach>
					</select>
					</div>
				</div>
				<div class="col-9 column">
					<div>
						<div style="margin-bottom:8px;">
							<table>
								<tr>
									<td class="table-th">
										결재선 제목
									</td>
									<td id="Lsj">
										
									</td>
								
										
								</tr>
								<tr>
									<td class="table-th">
									 	결재선 설명
									</td>
									<td id="Linfo" colspan="1">
									
									</td>
								</tr>
								<tr>
									<td class="table-th">
										결재양식명
									</td>
									<td id="Lfno" colspan="1">
									
									</td>
								</tr>
							</table>
						</div>
						
						<div>
							<table style="width:400px;" class="hdbars">
<!-- 								<tr> -->
<!-- 									<th> -->
<!-- 										순서 -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										유형 -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										부서 -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										직급 -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										이름 -->
<!-- 									</th> -->
<!-- 								</tr> -->
								
								<!-- handlerbars 들어갈곳 -->
							</table>
						</div>
					</div>
				</div>	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 	<button type="button" class="commitBtn" onclick="javascript:goParent();">확인</button>&nbsp;&nbsp;
						 	<button type="button" class="cancelBtn" onclick="javascript:window.close();">취소</button>&nbsp;&nbsp;
						 	<button type="button" class="removeBtn" onclick="javascript:removeLN();">즐겨찾기 삭제</button>
			</div>
		</div>
	</div>
</div>
<script>

function goParent(){

	var count =	$('.count')
	var empno = $('.empno')
	var dept = $('.dept')
	var clsf = $('.clsf')
	var nm = $('.nm')
	var size = count.length
	
// 	console.log(size);
// 	console.log(count[0].innerText);
// 	console.log(empno[0].innerText);
// 	console.log(dept[0].innerText);
// 	console.log(clsf[0].innerText);
// 	console.log(nm[0].innerText);

	window.opener.getFromChild(count,empno,dept,clsf,nm,size);
// 	console.log('부모호출!!')
	window.close();
}

function removeLN(){
	var rmel = $('option[sme="selected"]');
	console.log(rmel[0].value);
	var bkno = rmel[0].value;
	var check = confirm('결재선을 삭제하시겠습니까?');
	
	if(check == true){
		$.ajax({
			url:"<%=request.getContextPath()%>/approval/ddbox/removeLine.do?bkmk_no="+bkno,
			type:"get",
			contentType:'application/json',
			success:function(data){
// 				console.log(data);
				if(data == 'good'){
					alert('즐겨찾기가 삭제되었습니다.');
					location.reload();
				}
			},
			error:function(){
				alert("즐겨찾기 삭제를 실패했습니다.")
			}
		})
	}else{
		return;
	}
}

function showDtls(el){
// 	console.log(el.value);
	
}
function selectMe(el){
		
		$('.sancOp').removeAttr('sme');
		el.setAttribute('sme', 'selected')
		
		var sj = el.getAttribute('sj');
		var info = el.getAttribute('info');
		var formN = el.getAttribute('formN');
		
		 console.log(sj);
		 console.log(info);
		 console.log(formN);
		 
		$('#Lsj').text(sj); 
		$('#Linfo').text(info);
		$('#Lfno').text(formN);
		
		var bkmkNo = el.getAttribute('value');
		
// 		var data = {"bkmk_no" : bkmkNo}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/approval/ddbox/selectSancDtls.do?bkmk_no="+bkmkNo,
			type:"get",
			contentType:'application/json',
			success:function(data){
				printData(data,$('.hdbars'),$('#dtls-template'),'.dtls');
			},
			error:function(){
				alert("즐겨찾기 가져오기를 실패했습니다.")
// 				window.close();
			}
		})
		
}
window.onload=function(){
	var a = $('#0')
	console.log(a[0]);
	selectMe(a[0]);
	
	Handlebars.registerHelper("inc", function(value, options)
			{
			    return parseInt(value) + 1;
			});
}

//handle바스 print
function printData(dataArr,target,templateObject,removeClass){
	
	var template=Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}
</script>	

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="dtls-template" >
	<tr class="dtls">
		<th>
			순서
		</th>
		<th>
			사번
		</th>
		<th>
			이름
		</th>
		<th>
			직급
		</th>
		<th>
			부서
		</th>
	</tr>
{{#each .}}
	<tr class="dtls">
		<td class="count">
			{{inc @index}}
		</td>
		<td class="empno">
			{{empno}}
		</td>
		<td class="nm">
			{{nm}}
		</td>
		<td class="clsf">
			{{clsf_code}}
		</td>
		<td class="dept">
			{{dept_code}}
		</td>
	</tr>
{{/each}}								
</script>


</body>
