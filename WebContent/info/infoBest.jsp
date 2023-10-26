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
<link href="${conPath}/css/board.css" rel="stylesheet">
<script>
function tdClicked(fid){
	if(!isNaN(fid)){
		location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
	}
}
</script>
</head>
<body>
	<header> 
		<div class="gnb">
				<ul>
					<li><a href="${conPath }/member/login.jsp">로그인</a></li>
					<li><a href="${conPath }/member/join.jsp">회원가입</a></li>
					
				</ul>
	
		</div>
		<div class="logo" onclick="location.href='${conPath }/main/main.jsp'">
			<p>여행은 개인의 취향이다 </p>

		</div> 
</header>
		<c:if test="${not empty infoModiResult}">
			<script>alert('${infoModiResult}')
					hitory.back();
			</script>
		</c:if>
		<div id="content_form">
		<form action="${conPath }/listInsert.do">
		<br>
		<div id="content">
		 	<div class = "board">
		 		<div class="lnb"> 
		 		 	<ul>
					<li>자유게시판 가기<ol class="subMenu">
								<li><a href="${conPath }/boardList.do">자유게시판 글</a></li>
								<li><a href="${conPath }/infoList.do">정보게시판</a></li>
								<li><a href="#">메뉴1-3</a></li>
								</ol>
					</li>
				</ul>
		 		</div>
			 </div>
		   <div class="section1">
		     <div class="slide_banner">slide banner</div>
		   </div> <!-- .section1 -->
		   <div class="section2">
		     <div class="hit_product">  
		<table>
			<tr>
			<c:if test="${totCnt==0 }">
				<tr><td colspan="6">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:if test="${totCnt!=0 }">
				<c:forEach items="${infoBestList }" var="info">
					<tr>
						<td onclick="tdClicked('${info.iid }')">
							<h1>${info.ititle }</h1>
							<h3>${info.icontent }</h3>
							<p>${info.ihit }</p>
							<img src="${conPath }/infoFileUp/${info.ifilename}"
									alt="${info.iid }사진" width="200">
						</td>
						<td>
							<input type="checkbox" name ="iid" value="${info.iid}">  					
						</td>
					</tr>
				</c:forEach>
				</c:if>
		</table>
		<input type="submit" value="다음"  class="btn btn-outline-secondary">
	 </div> <!-- .hit_product -->
    </div><!-- .section2 -->
  </div><!-- #content -->
  </form>
  </div>
</body>
</html>