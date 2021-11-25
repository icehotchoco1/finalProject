<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>

<form id="tempstorageForm">
	<input type="hidden" name="page" value="" />
	<input type="hidden" name="searchType" value="" />
	<input type="hidden" name="erfType" value="" />
	<input type="hidden" name="keyword" value="" />
</form>

<!-- pagenation -->
<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item"><a class="page-link"
			href="javascript:list_go3(1,' <%=session.getAttribute("path")%>');"> <i
				class="fas fa-angle-double-left"></i>
		</a></li>
		<li class="page-item"><a class="page-link"
			href="javascript:list_go3('${pageMaker.prev ? pageMaker.startPage-1 : cri.page }',' <%=session.getAttribute("path")%>');");">
				<i class="fas fa-angle-left"></i>
		</a></li>
		<c:forEach var="pageNum" begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }">
			<li
				class="page-item ${pageMaker.cri.page == pageNum ? 'active' : '' }">
				<a class="page-link" href="javascript:list_go3('${pageNum }',' <%=session.getAttribute("path")%>');">
					${pageNum } </a>
			</li>
		</c:forEach>
		<li class="page-item"><a class="page-link"
			href="javascript:list_go3('${pageMaker.next ? pageMaker.endPage+1 : cri.page }',' <%=session.getAttribute("path")%>');");">
				<i class="fas fa-angle-right"></i>
		</a></li>
		<li class="page-item"><a class="page-link"
			href="javascript:list_go3('${pageMaker.realEndPage }',' <%=session.getAttribute("path")%>');");"> <i
				class="fas fa-angle-double-right"></i>
		</a></li>
	</ul>
</nav>