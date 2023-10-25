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
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty joinErrorMsg }">
		<script>
			alert('${joinErrorMsg}');
			history.back();
		</script>
	</c:if>
	<header> 
		<div class="gnb">
				<ul>
					<li><a href="${conPath }/member/join.jsp">회원가입</a></li>
					<li><a href="${conPath }/main/main.jsp">홈</a></li>
					
				</ul>
	
		</div>
		<div class="logo" onclick="location.href='${conPath }/main/main.jsp'">
			<p>여행은 개인의 취향이다 </p>

		</div> 
</header>
	<div id="content_form">
		<form action="${conPath }/login.do" method="post">
			<input type="hidden" name="next" value="${param.next }">
			<table>
				<caption>로그인</caption>
				<tr>
					<th>ID</th><td><input type="text" name="mid" value="${mid }" required="required"></td>
				</tr>
				<tr>
					<th>PW</th><td><input type="password" name="mpw" required="required"></td>
				</tr>
				<tr>
					<td colspan="2">
						<p>
							<input type="submit" value="로그인" class="btn">
							<input type="button" value="회원가입" class="btn"
									onclick="history.back()">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>