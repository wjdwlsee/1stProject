
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/header.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Grandiflora+One&display=swap" rel="stylesheet">

</head>

<body>
 	<header> 
 	<c:if test="${empty member and empty admin}"> <%-- 로그인 전 화면 --%>
		<div class="gnb">
				<ul>
					<li><a href="${conPath }/member/login.jsp">로그인</a></li>
					<li><a href="${conPath }/member/join.jsp">회원가입</a></li>
					
				</ul>
	
		</div>
		<div class="logo" onclick="location.href='${conPath }/main/main.jsp'">
			<p>여행은 개인의 취향이다</p>

		</div>
		
	</c:if>   
    <c:if test="${not empty member and empty admin}"> <%-- 사용자 모드 로그인 화면--%>
		<div class="gnb">
				<ul>
					<li><a href="${conPath }/member/join.jsp">회원가입</a></li>
					<li><a href="${conPath }/member/login.jsp">로그인</a></li>
					<li><a href="${conPath }/info/info.jsp">정보</a></li>
				</ul>
	
		</div>
		<div class="logo" onclick="location.href='${conPath }/main/main.jsp'">
			<p>여행은 개인의 취향이다</p>

		</div>
	</c:if>
	<c:if test="${empty member and not empty admin}"> <%-- 관리자 모드 로그인 화면--%>
		<div class="gnb">
				<ul>
					<li><a href="${conPath }/member/join.jsp">회원가입</a></li>
					<li><a href="${conPath }/member/login.jsp">로그인</a></li>
					<li><a href="${conPath }/member/mAllView.jsp">회원모두 보기</a></li>
					<li><a href="${conPath }/info/infoList.jsp">정보게시판</a></li>
				</ul>
	
		</div>
		<div class="logo" onclick="location.href='${conPath }/main/main.jsp'">
			<p>여행은 개인의 취향이다</p>

		</div>
	</c:if>  
	</header>
</body>
</html>