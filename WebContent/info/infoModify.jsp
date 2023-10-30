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
</head>
<body>
	<div id="content_form">
	<form action="${conPath }/infoModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="iid" value="${info.iid }">
		<input type="hidden" name="dbFileName1" value="${info.ifilename }">
		<input type="hidden" name="dbFileName2" value="${info.ifilename2 }">
		<input type="hidden" name="lno" value="${info.lno }">
		<input type="hidden" name="tno" value="${info.tno }">
		<table>
			<caption>${info.iid }번 글 수정</caption>
			<tr><th>작성자</th>
					<td><input type="text" required="required"
								value="${info.iid }(${info.aid })" readonly="readonly"></td>
			</tr>
			<tr><th>제목</th>
					<td><input type="text" name="ititle" required="required"
								value="${info.ititle }"></td>
			</tr>
			<tr><th>본문</th>
					<td><textarea rows="5" 
							name="icontent">${info.icontent }</textarea></td>
			</tr>
			<tr><th>지역명</th>
					<td><input type="text" required="required"
								value="${info.lno }" readonly="readonly"></td>
			</tr>
			<tr><th>테마명</th>
					<td><input type="text" required="required"
								value="${info.tno }" readonly="readonly"></td>
			</tr>
			<tr><th>첨부파일</th>
					<td><input type="file" name="ifileName" class="btn"> 원첨부파일:
							<c:if test="${not empty info.ifilename }">
						 		<a href="${conPath }/fileBoardUp/${info.ifilename}" target="_blank">${info.ifilename}</a>
						 	</c:if>
						 	<c:if test="${empty info.ifilename }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><th>첨부파일2</th>
					<td><input type="file" name="ifileName" class="btn"> 원첨부파일:
							<c:if test="${not empty info.ifilename }">
						 		<a href="${conPath }/fileBoardUp/${info.ifilename2}" target="_blank">${info.ifilename2}</a>
						 	</c:if>
						 	<c:if test="${empty info.ifilename2 }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="reset" value="이전" class="btn"
						  onclick="history.back()">
						<input type="button" value="목록"  class="btn"
							onclick="location='${conPath}/infoList.do?pageNum=${param.pageNum }'">
					</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>