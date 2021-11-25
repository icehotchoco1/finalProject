<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }"/>
<%session.setAttribute("path", request.getContextPath() + "/organogram/main"); %>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
#grid{
	display:none;
}
p.title-p {
	display: inline;
	vertical-align: middle;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 20px;
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
.hover-tr:hover {
  background: #D1ECF2;
}
select>option, button{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
.form-control{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
</style>
</head>

<title>조직도</title>

<body>
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">조직도</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">조직도 홈</p> 
	  			</div>
	  		</div>
	  	</div>
	</section>
	
	   	<section class="content">
   		<div>
   			<div class="card-header with-border">
   			<c:if test="${loginUser.author_code eq 'ROLE_MANAGER' or loginUser.author_code eq 'ROLE_DEPTMANAGER' }">
				
   				<button type="button" class="btn btn-basic" onclick="OpenWindow('registForm.do','임직원등록',920,680);" >직원등록</button>
   			</c:if>
   				<button type="button" class="btn btn-basic" onclick="grid.export('xlsx')" >엑셀</button>
   				<div id="keyword" class="card-tools">
   					 <div class="input-group row" style="width:850px; left:-20px;">
   					 	<!-- search bar -->
   					 	<!-- bbsType -->
   					 	 <select class="form-control col-md-2" name="deptType" id="deptType">
					  		<option value="all" ${cri.deptType eq 'all' ? 'selected':'' } >부서전체</option>
					  		<option value="B001" ${cri.deptType eq 'B001' ? 'selected':'' }>경리부</option>
					  		<option value="B002" ${cri.deptType eq 'B002' ? 'selected':'' }>사업부</option>
					  		<option value="B003" ${cri.deptType eq 'B003' ? 'selected':'' }>시설관리부</option>
					  		<option value="B004" ${cri.deptType eq 'B004' ? 'selected':'' }>인사부</option>
					  		<option value="B005" ${cri.deptType eq 'B005' ? 'selected':'' }>홍보부</option>
					  		<option value="B006" ${cri.deptType eq 'B006' ? 'selected':'' }>임원</option>
					  	</select>	 	
   					 	 <!-- sort num -->
					  	<select class="form-control col-md-2" name="perPageNum" id="perPageNum"
					  		onchange="list_go(1);">
					  		<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  	</select>
					  	
					  	  <!-- search bar -->
					 	<select class="form-control col-md-2" name="searchType" id="searchType">
							<option value="np"  ${cri.searchType eq 'np' ? 'selected':''}>검색구분</option>
							<option value="n"  ${cri.searchType eq 'n' ? 'selected':''}>이름</option>
							<option value="p"  ${cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
							<option value="np"  ${cri.searchType eq 'np' ? 'selected':''}>이름+전화번호</option>
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
										placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" 
									id="searchBtn" data-card-widget="search" onclick="list_go3(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
   			<div class="card-body" style="text-align:center;">
		    		<table class="table text-center">
		    			<tr style="font-size:0.95em;">
		                	<th>사번</th>
		                	<th>이름</th>
		                	<th>연락처</th>
		                	<th>팩스번호</th>
		                	<th>부서</th> <!-- yyyy-MM-dd  -->
		                	<th>직급</th>
		                	<th>직책</th> 
		                	<th>이메일주소</th>
		               	</tr>
		            
		               	<c:forEach items="${empList }" var="emp" >
		               	  <tr class="hover-tr" onclick="OpenWindow('detail.do?empno=${emp.empno}','','920','630');" style="cursor:pointer; font-size:0.85em;">
		               		<td>${emp.empno }</td>
		              		<td>${emp.nm }</td>
			              		<c:set var="phone" value="${emp.cttpc.replace('-','') }" />
		              		<td>${phone.substring(0,3) }-${phone.substring(3,7) }-${phone.substring(7) }</td>
			              		<c:set var="fax" value="${emp.fxnum.replace('-','') }" />
		              		<td>${fax.substring(0,3) }-${fax.substring(3,6) }-${fax.substring(6) }</td>
		              		
		              		<td>${emp.dept_code }</td>
		              		<td>${emp.clsf_code }</td>
		              		<td>${emp.rspofc_code }</td>
		              		<td>${emp.email_adres }</td>
		              	  </tr>
		               	</c:forEach>   	
		            </table>

					<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
					<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
					
					<div id="grid" style="max-height: 30rem;"></div>
					<script>
					var data_set = [];
						
						<c:forEach items="${empList }" var="emp">
						var data = {};
						data['empno'] = '${emp.empno}';
						data['nm'] = '${emp.nm}';
						<c:set var="phone" value="${emp.cttpc.replace('-','') }" />
						data['phone'] = '${phone.substring(0,3) }-${phone.substring(3,7) }-${phone.substring(7) }';
						<c:set var="fax" value="${emp.fxnum.replace('-','') }" />
						data['fax'] = '${fax.substring(0,3) }-${fax.substring(3,6) }-${fax.substring(6) }';
						data['dept_code'] = '${emp.dept_code}';
						data['clsf_code'] = '${emp.clsf_code}';
						data['rspofc_code'] = '${emp.rspofc_code}';
						data['email_adres'] = '${emp.email_adres}';
						
						data_set.push(data);
						</c:forEach>
					
						
					
					var Grid = tui.Grid;
					var options = {
					  el: document.getElementById('grid'),
					  pageOptions: {
					    useClient: true,
					    type: 'scroll',
					    perPage: 100
					  },
					  columns: [
					  {
					    header: 'NO',
					    name: 'empno',
					    renderer: {
					      styles: {
					        fontWeight: 'bold',
					      },
					   },
					   copyOptions: {
					      customValue: (value, rowAttrs, column) => `${value}`
					      }
					  },
					  {
					    header: 'NAME',
					    name: 'nm',
					    editor: 'text',
					    copyOptions: {
					      customValue: (value, rowAttrs, column) => `${value}`
					      }
					   },
					   {
					      header: 'PHONE',
					      name: 'phone',
					      editor: 'text'
					  },
					   {
					      header: 'FAX',
					      name: 'fax',
					      editor: {
					      type: 'text',
					      copyOptions: {
					         customValue: (value, rowAttrs, column) => `${value}`
					      }
					    }
					  },
					   {
					      header: 'DEPARTMENT',
					      name: 'dept_code',
					      editor: {
					      type: 'text',
					      copyOptions: {
					         customValue: (value, rowAttrs, column) => `${value}`
					      }
					    }
					  },
					   {
					      header: '직급',
					      name: 'clsf_code',
					      editor: {
					      type: 'text',
					      copyOptions: {
					         customValue: (value, rowAttrs, column) => `${value}`
					      }
					    }
					  },
					   {
					      header: '직책',
					      name: 'rspofc_code',
					      editor: {
					      type: 'text',
					      copyOptions: {
					         customValue: (value, rowAttrs, column) => `${value}`
					      }
					    }
					  },
					   {
					      header: '이메일',
					      name: 'email_adres',
					      editor: {
					      type: 'text',
					      copyOptions: {
					         customValue: (value, rowAttrs, column) => `${value}`
					      }
					    }
					  }
					  ],
					  contextMenu: ({ rowKey, columnName }) => (
					    [
					      [
					        {
					          name: 'export',
					          label: 'Export',
					          subMenu: [
					            // 기본 설정 옵션을 이용한 내보내기
					            {
					              name: 'default',
					              label: 'Default',
					              subMenu: [
					                {
					                  name: 'excelExport',
					                  label: 'Excel export',
					                  action: () => {
					                    grid.export('xlsx');
					                  }
					                },
					              ]
					            },
					          ],
					        }
					      ],
					    ]
					  ),
					  data:data_set,
					  options:{
						  includeHiddenColumns: true,
						  onlySelected: true,
						  fileName: 'myExport'
					  }
					};
					
					var grid = new Grid(options);
					</script>
		           
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/WEB-INF/views/common/treeEmpPagination.jsp" %>
    		</div>
	     </div>
   	</section>


	<script>
	
function list_excelgo(){
	OpenWindow('tui','엑셀',1000,800)
}

function list_go3(page,url){
	if(!url) url="main.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#TreeEmpForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='deptType']").val($('select[name="deptType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>



</body>