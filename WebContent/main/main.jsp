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
<link rel="stylesheet" href ="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" >
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">	
<link href="${conPath }/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<c:if test="${not empty param.next && empty loginErrorMsg}">
		<script>
			location.href = '${conPath}/${param.next}';
		</script>
	</c:if>
	<c:if test="${not empty loginErrorMsg }">
		<script>
			alert('${loginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty adminLoginResult }">
		<script>
			alert('${adminLoginResult}');
		</script>
	</c:if>
	<c:if test="${not empty adminLoginErrorMsg }">
		<script>
			alert('${adminLoginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<c:if test="${not empty modifyErrorMsg }">
		<script>
			alert('${modifyErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty withdrawalResult }">
		<script>
			alert('${withdrawalResult}');
		</script>
	</c:if>
	<c:if test="${not empty logoutMsg }">
		<script>
			alert('${logoutMsg}');
		</script>
	</c:if>
<jsp:include page="../main/header.jsp"/>
  <div id="content">
  	<div class = "board">
  		<div class="lnb"> 
			<c:if test="${empty member }"><a href="${conPath }/loginView.do?next=infoList.do">정보게시판은 로그인 후 사용가능 합니다</a></c:if>
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location='${conPath }/infoList.do'">정보게시판</button>			
			<button type="button" class="btn btn-outline-dark btn-lg " onclick="location='${conPath }/boardList.do'">자유게시판</button>
			</ul>
  		</div>
 	 </div>
 	 <div id="search">
 	 	<form>
 	 		<a href= "${conPath }/info/info.jsp">
 	 		<img src= "${conPath }/img2/loupe.png" width="50">
 	 		<input type="text"  readonly="readonly" placeholder="가고싶은곳 찾아보기" >
 	 		</a>
 	 	</form>
 	 </div>
    <jsp:include page="../location/asdf.jsp"/>

    
  </div><!-- #content -->
 	<jsp:include page="../main/footer.jsp"/>
</body>
</html>