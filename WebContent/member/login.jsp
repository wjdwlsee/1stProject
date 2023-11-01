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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
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
	<div class="logo" onclick="location.href='${conPath }/freeBoard/boardList2.jsp'">
		<h3>여행은 개인의 취향이다</h3>
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
							<input type="submit" value="로그인" class="btn"><br>
							<a href="${conPath }/member/join.jsp">아직 회원이 아니세요?</a> 
							<input type="button" value="회원가입" class="btn"
									onclick="location='${conPath }/member/join.jsp'">
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
				<p>sns 간편 로그인 </p>
				<hr>
						<p>
						<a href="https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fwww.google.com%2F%3Fptid%3D19027681%26ptt%3D8%26fpts%3D0&ec=futura_hpp_co_si_001_p&ifkv=AVQVeyxPl01zxTaJs8xDA-JafJTtmTjZTv3n-fwzIk6AbUR8zx7MPs5uIvM1znIAX7nIvshRWW-4uw&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S721810539%3A1698574574658001&theme=glif" >
							<img src ="${conPath }/img/281764.png" width="50">
						</a>
						<a href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/" >
							<img src ="${conPath }/img/naver_btn.f60c41fb.png" width="50">
							
						</a>
						<a href="https://www.instagram.com/accounts/login/?source=auth_switcher" >
							<img src ="${conPath }/img/2111463.png" width="50">
						</a>
						</p>
					</td>
				</tr>
				
			</table>
			
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>