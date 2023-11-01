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
<<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">
<link href="${conPath}/css/list.css" rel="stylesheet">
<style>
#content_form .lnb {
  height : 100px;
  text-align :center;
  margin :10px;
  padding:10px 0 10px 0; 
}
#content_form .lnb ul{
	overflow: hidden;
	width:300px;
	margin: 0 auto;
}
#content_form .lnb ul li {
	margin: 5px;
	float:right;
	padding:5px 40px;
	line-height: 15px;
}
button{
	margin-top: 50px;
	margin-left:300px; 
}
 input {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  color :black;
  background-color: #94CEF2;
 
}
input::placeholder {
  color: white;
  font-style: italic;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	function tdClicked(fid){
		if(!isNaN(fid)){
			location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
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
	<c:if test="${not empty boardResult }">
		<script>alert('${boardResult}');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
  	 <div >
 	 	<form class="search">
 	 		<a href= "${conPath }/info/info.jsp">
 	 		<img src= "${conPath }/img2/loupe.png" width="50">
 	 		<input type="text"  readonly="readonly" placeholder="가고싶은곳 찾아보기" >
 	 		</a>
 	 	</form>
 	 	<jsp:include page="../main/scroll.jsp"/>
 	 </div>
			   <div class="section2">
			   <button type="button" class="btn btn-dark" onclick="location='${conPath }/boardList.do'">자유 게시판 가기</button>
			     <div class="hit_product">
			       <table >
						<tr>
			     		<c:forEach items="${boardList }" var="board">
								<td onclick="tdClicked('${board.fid }')">
									<img src="${conPath }/freeBoardup/${board.ffileName}"
											alt="${board.mid }사진" width="251">						
									<p> ${board.fcontent } </p>
								</td>
						</c:forEach>
						</tr>
			     	</table>
		 </div> <!-- .hit_product -->
	    </div><!-- .section2 -->
			<p class="paging">
				<a href="${conPath }/boardList2.do?pageNum=1">&lt;&lt;</a>
				&nbsp; &nbsp; &nbsp;
				<c:if test="${BLOCKSIZE < startPage}">
					<a href="${conPath }/boardList2.do?pageNum=${startPage-1}">&lt;</a>
				</c:if>
				<c:if test="${BLOCKSIZE >= startPage }">
					&lt;
				</c:if>
				&nbsp; &nbsp; &nbsp;
				<c:if test="${endPage < pageCnt }">
					<a href="${conPath }/boardList2.do?pageNum=${endPage+1 }">&gt;</a>
				</c:if>
				<c:if test="${endPage == pageCnt }">
					&gt;
				</c:if>
				&nbsp; &nbsp; &nbsp;
				<a href="${conPath }/boardList2.do?pageNum=${pageCnt }">&gt;&gt;</a>
			</p>
	  </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>