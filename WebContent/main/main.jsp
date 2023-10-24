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
<jsp:include page="../main/header.jsp"/>
  <div id="content">
  	<div class = "board">
  		<div class="lnb"> 
  		 	<ul>
				<li>자유게시판 가기<ol class="subMenu">
							<li><a href="${conPath }/boardList.do">자유게시판 글</a></li>
							<li><a href="#">메뉴1-2</a></li>
							<li><a href="#">메뉴1-3</a></li>
							</ol>
				</li>
			</ul>
  		</div>
 	 </div>
    <div class="section1">
      <div class="slide_banner">slide banner</div>
      <div class="side_banner">side banner</div>
    </div> <!-- .section1 -->
    <div class="section2">
      <div class="hit_product">
        <ul>
          <li><a href="#">hit_product1</a></li>
          <li><a href="#">hit_product2</a></li>
          <li><a href="#">hit_product3</a></li>
          <li><a href="#">hit_product4</a></li>
        </ul>
      </div> <!-- .hit_product -->
      <div class="md_product">
        <ul>
          <li><a href="#">md_product1</a></li>
          <li><a href="#">md_product1</a></li>
          <li><a href="#">md_product1</a></li>
          <li><a href="#">md_product1</a></li>
        </ul>
      </div><!-- .md_product -->
    </div><!-- .section2 -->
  </div><!-- #content -->
  <footer>
    <div class="office_logo">office logo</div>
    <div class="office_address">office address</div>
    <div class="shopping_info">shopping info</div>
    <div class="copyright">Copyright ⓒ Joeun System Corp. All rights reserved.</div>
  </footer>
</body>
</html>