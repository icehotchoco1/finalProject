<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card-body">
		<table class="table text-center" >					
			<tr style="font-size:0.95em;">
				<th style="width:10%;">번  호</th>
				<th style="width:10%;">휴가코드</th>
				<th style="width:10%;">신청일</th>
				<th style="width:10%;">승인여부</th>
				<th style="width:10%;">시작일</th>
				<th style="width:10%;">종료일</th>
				<th style="width:10%;">총  계</th>
				<th style="width:40%;">비  고</th>
			</tr>			
			<c:if test="${empty noticeList }" > <!-- TODO : vacationlist로 수정 -->
				<tr>
					<td colspan="8">
						<strong>휴가 사용 내역이 없습니다.</strong>
					</td>
				</tr>
			</c:if>						
			<c:forEach items="${noticeList}" var="notice">
				<tr style='font-size:0.85em;'>
					<td>${notice.bbsctt_no}</td>
					<td id="boardTitle" onclick="javascript:OpenWindow('notice/detail.do?bbsctt_no=${notice.bbsctt_no}&from=list','상세보기',900,800);">
						<span class="col-sm-12">${notice.sj}</span>
					</td>			
					<td data-target="notice-emp_nm">${notice.emp_nm}</td>
					<td>
						<fmt:formatDate value="${notice.rgsde}" pattern="yyyy-MM-dd"/>
					</td>							
					<td>${notice.rdcnt}</td>		
				</tr>
			</c:forEach>
		</table>				
	</div>
</body>
</html>