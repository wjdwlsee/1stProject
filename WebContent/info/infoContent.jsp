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
<link href="${conPath}/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div id="content_form">
		<table>
			<caption>${info.iid }글 상세보기</caption>
			<tr>	 <td>${info.ititle }</td>
							<td>
					<c:if test="${not empty info.ifilename }">
						<a href="${conPath }/infoFileUp/${info.ifilename}" target="_blank">
							<img src="${conPath }/infoFileUp/${info.ifilename}"	alt="${info.iid }사진" width="300" >
						</a>
					</c:if>
					<c:if test="${empty info.ifilename }">
						첨부파일없음
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${not empty info.ifilename2 }">
						<a href="${conPath }/infoFileUp/${info.ifilename2}" target="_blank">
							<img src="${conPath }/infoFileUp/${info.ifilename2}"	alt="${info.iid }사진" width="300" >
						</a>
					</c:if>
					<c:if test="${empty info.ifilename2 }">
						첨부파일없음
					</c:if>
				</td>
			</tr>
			<tr><td>본문</td>	 <td><pre>${info.icontent}</pre></td></tr>
			<tr><th>조회수</th><td>${info.ihit }</td></tr>
			<tr>
				<td colspan="2">
					<c:if test="${info.aid eq info.aid }">
				 	<button onclick="location='${conPath}/infoList.do?pageNum=${param.pageNum }'">목록</button>
				 	</c:if>
				 	<c:if test="${not empty admin}">
				 		<button onclick="location='${conPath}/infoModifyView.do?iid=${info.iid }&pageNum=${param.pageNum }'">수정</button>
						<button onclick="location='${conPath}/infoDelete.do?pageNum=${param.pageNum }'">삭제</button>
			 		</c:if>
		</table>
	</div>
</body>
</html>