<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link href="${conPath}/css/board2.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	/* $(document).ready(function(){
		$('tr').click(function(){
			var fid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
			//alert(fid);
			if(!isNaN(fid)){
				location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
			}
		});
	}); */
	function tdClicked(fid){
		if(!isNaN(fid)){
			location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
		}
	}
</script>
</head>
<body>
	<c:if test="${not empty boardResult }">
		<script>alert('${boardResult}');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<br>
		   <div class="section2">
		     <div class="hit_product">      
		       <table>
		     		<c:forEach items="${boardList }" var="board">
					<tr onclick="tdClicked('${board.fid }')">
								<td>
								<img src="${conPath }/freeBoardup/${board.ffileName}"
										alt="${board.mid }사진" width="300">
								</td>	
								<td class="left">
								<c:forEach var="i" begin="1" end="${board.findent }">
									<c:if test="${i==board.findent }">└─</c:if>
									<c:if test="${i!=board.findent }"> &nbsp; &nbsp; </c:if>
								</c:forEach>
								</td>
								<td>													
								<h1>${board.ftitle } </h1>
								<h2>${board.fcontent }</h2>
								</td>
								<td>${board.mname }</td>
								<td>${board.fhit }</td>
							<td><fmt:formatDate value="${board.frdate }" type="date" dateStyle="short"/></td>
							<td>${board.fip }</td>
					</tr>
					</c:forEach>
		     	</table>
		     	<table >
		      		<tr>
					<td>
						<c:if test="${not empty member }"><a href="${conPath }/boardWriteView.do">글쓰기</a></c:if>
						<c:if test="${empty member }"><a href="${conPath }/loginView.do?next=boardWriteView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
					</td>
				<tr>
		      		<c:if test="${totCnt==0 }">
					<tr><td colspan="6">등록된 글이 없습니다</td></tr>
				</c:if>
		      </table>
	 </div> #F9F3ED<!-- .hit_product -->
    </div><!-- .section2 -->
  </div><!-- #content -->
		<p class="paging">
			<a href="${conPath }/boardList.do?pageNum=1">&lt;&lt;</a>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${BLOCKSIZE < startPage}">
				<a href="${conPath }/boardList.do?pageNum=${startPage-1}">&lt;</a>
			</c:if>
			<c:if test="${BLOCKSIZE >= startPage }">
				&lt;
			</c:if>
			&nbsp; &nbsp; &nbsp;
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/boardList.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/boardList.do?pageNum=${endPage+1 }">&gt;</a>
			</c:if>
			<c:if test="${endPage == pageCnt }">
				&gt;
			</c:if>
			&nbsp; &nbsp; &nbsp;
			<a href="${conPath }/boardList.do?pageNum=${pageCnt }">&gt;&gt;</a>
		</p>
</body>
</html>