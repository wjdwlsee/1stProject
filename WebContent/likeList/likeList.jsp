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
<link href="${conPath}/css/board.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<script>
	function tdClicked(iid){
		if(!isNaN(iid)){
			location.href = '${conPath}/infoContent.do?iid='+iid+'&pageNum=${pageNum}';
		}
	}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
		<c:if test="${not empty likeListResult}">
			<script>alert('${likeListResult}')
					hitory.back();
			</script>
		</c:if>
		<div id="content_form">
		   <div class="section2">
		     <div class="hit_product">
		      
		<table>
			<tr>
			<c:if test="${totCnt==0 }">
				<tr><td colspan="6">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:if test="${totCnt!=0 }">
				<c:forEach items="${infoList }" var="info">
					<tr>
						<td onclick="tdClicked('${info.iid }')">
							<h1>${info.ititle }</h1>
							<h3>${info.icontent }</h3>
							<p>${info.ihit }</p>
							<img src="${conPath }/infoFileUp/${info.ifilename}"
									alt="${info.iid }사진" width="200">
						</td>
					</tr>
				</c:forEach>
				</c:if>
		</table>
		 <table >
      		
      </table>
		
	 </div> <!-- .hit_product -->
    </div><!-- .section2 -->
  </div><!-- #content -->
</body>
</html>