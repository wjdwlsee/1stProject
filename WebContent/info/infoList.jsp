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
<style>
	#content_form {
		height:470px;
		margin: 30px auto 0px;
	}
	#content_form table tr { height: 10px;}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<script>
	function tdClicked(iid){
		if(!isNaN(iid)){
			location.href = '${conPath}/infoContent.do?iid='+iid+'&pageNum=${pageNum}';
		}
	}
</script>
</head>
<body>
<c:if test="${not empty param.next && empty loginErrorMsg}">
	<script>
		location.href = '${conPath}/${param.next}';
	</script>
</c:if>
<c:if test="${empty member }">
	<script>
		location.href = '${conPath}/loginView.do?next=lnfoList.do';
	</script>
</c:if>
<header> 
	
		<div class="gnb">
				☰<ul>
					<li><a href="${conPath }/main/main.jsp">홈</a></li>
					<li><a href="${conPath }/member/logout.do">로그아웃</a></li>	
					
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
		<%-- <c:if test="${empty member}">
			<script>alert('로그인 후 사용할수 있습니다');
				location.href = '${conPath}/member/loginView.do?next=infoList.do';
			</script>
		</c:if> --%>
		<div id="content_form">
		<br>
		<div id="content">
		 	<div class = "board">
		 		<div class="lnb"> 
		 		 	<ul>
					<li>자유게시판 가기<ol class="subMenu">
								<li><a href="${conPath }/boardList.do">자유게시판 글</a></li>
								<li><a href="${conPath }/infoView.do">여행 정보 추천받기</a></li>
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
      		<tr>
				<td>
					<c:if test="${not empty admin }"><a href="${conPath }/infoWriteView.do">글쓰기</a></c:if>
					<c:if test="${empty admin }"><a href="${conPath }/adminLoginView.do?next=infoWriteView.do">글쓰기는 관리자 로그인 이후에만 가능합니다</a></c:if>
				</td>
			</tr>
      </table>
		<p class="paging">
			<a href="${conPath }/infoList.do?pageNum=1">&lt;&lt;</a>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${BLOCKSIZE < startPage}">
				<a href="${conPath }/infoList.do?pageNum=${startPage-1}">&lt;</a>
			</c:if>
			<c:if test="${BLOCKSIZE >= startPage }">
				&lt;
			</c:if>
			&nbsp; &nbsp; &nbsp;
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/infoList.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/infoList.do?pageNum=${endPage+1 }">&gt;</a>
			</c:if>
			<c:if test="${endPage == pageCnt }">
				&gt;
			</c:if>
			&nbsp; &nbsp; &nbsp;
			<a href="${conPath }/infoList.do?pageNum=${pageCnt }">&gt;&gt;</a>
		</p>
	 </div> <!-- .hit_product -->
    </div><!-- .section2 -->
  </div><!-- #content -->
</body>
</html>

























