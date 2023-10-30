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
<style>
#content_form {
	bolder:1px solid #99ccff;
	overflow: hidden;
}

#content_form table {
	width:1000px;  margin: 0px auto; background-color :#ffffff; height: 600px;
}
#content_form #join{
	margin : 50px;
}			
#content_form table tr { 
	background-color: #ffffff;  overflow: hidden; height: 100px;
}
#content_form table tr:hover { 
	background-color: #ffffff; cursor: pointer;
}
#content_form td, #content_form th {
	text-align: center; padding:3px; float:left; 
}
#content_form caption {
	font-size: 25px; padding:10px;
}
#content_form h2, #content_form b ,#content_form p {text-align: center; color:black;}
#content_form a { text-decoration: none; color:black}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form td input:not(.btn), #content_form td textarea{
	width: 90%;
}

/* * * * * #content .section2 * * * * */
.section2 .hit_product {
    text-align: center;
    margin: 10px ;
    width: 1000px;
    float: left;
}

</style>
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
<script>
	/* $(document).ready(function(){
		$('tr').click(function(){
			var fid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
			//alert(fid);
			if(!isNaN(fid)){
				location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
			}
		});
	}); */
	function tdClicked(fid){
		if(!isNaN(fid)){
			location.href = '${conPath}/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
		}
	}
</script>
</head>
<body>
<div id="content_form">
		   <div class="section2">
		     <div class="hit_product">
		       <table >
					<tr>
		     		<c:forEach items="${boardList }" var="board">
							<td onclick="tdClicked('${board.fid }')">
								<img src="${conPath }/freeBoardup/${board.ffileName}"
										alt="${board.mid }사진" width="251">						
								<h1> ${board.ftitle } </h1>
								<h3>${board.fcontent }</h3>
							</td>
					</c:forEach>
					</tr>
		     	</table>
		     	<table >
		      		<tr>
					<td>
						<c:if test="${not empty member }"><a href="${conPath }/boardWriteView.do">글쓰기</a></c:if>
						<c:if test="${empty member }"><a href="${conPath }/loginView.do?next=boardWriteView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
					</td>
				<tr>
		      		<c:if test="${totCnt==0 }">
					<tr><td colspan="6">등록된 글이 없습니다</td></tr>
				</c:if>
		      </table>
	 </div> <!-- .hit_product -->
    </div><!-- .section2 -->
		<p class="paging">
			<a href="${conPath }/boardList.do?pageNum=1">&lt;&lt;</a>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${BLOCKSIZE < startPage}">
				<a href="${conPath }/boardList.do?pageNum=${startPage-1}">&lt;</a>
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
					[ <a href="${conPath }/boardList.do?pageNum=${i }"> ${i } </a> ]
				</c:if>
			</c:forEach>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/boardList.do?pageNum=${endPage+1 }">&gt;</a>
			</c:if>
			<c:if test="${endPage == pageCnt }">
				&gt;
			</c:if>
			&nbsp; &nbsp; &nbsp;
			<a href="${conPath }/boardList.do?pageNum=${pageCnt }">&gt;&gt;</a>
		</p>
  </div>
</body>
</html>