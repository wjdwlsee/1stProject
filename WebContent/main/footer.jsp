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
<style>
	body { margin: o auto; }
	footer {
	margin-top :10px;
	padding-top:10px;
	height:100px; background-color:#062925; }
	footer #footer_conts p, footer #footer_conts a {
		font-weight: blod;
		font-size:0.9em;
		text-align: center;
	}
	a{
	text-align: center;
	}
</style>
</head>
<body>
	<footer>
		<div id="footer_conts">
			
			<p>1stProject | <b><a href="${conPath }/adminLoginView.do">관리자 모드</a></b></p>
			<p>Copyright© 2023 tj . All rights reserved.<a href="https://github.com/wjdwlsee/1stProject.git"><img src="${conPath }/img/git.png" width="25"></a></p>
		</div>
	</footer>
</body>
</html>