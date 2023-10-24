<%@page import="com.lec.ex.dto.InfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.ex.dao.InfoDao"%>
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
	$(document).ready(function(){
		$('tr').click(function(){
			var aid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
			//alert(aid);
			if(!isNaN(aid)){
				location.href = '${conPath}/infoContent.do?aid='+aid+'&pageNum=${pageNum}';
			}
		});
	});
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
		<div id="content_form">
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
				<c:forEach items="${infoList }" var="info">
					<tr>
						<td>${info.aid } </td>	
						<td>
							<img src="${conPath }/infoFileUp/${info.ifilename}"
									alt="${info.iid }사진" width="120">
							<h1>${info.ititle }</h1> <br>
							<h3>${info.icontent }</h3>
						</td>
						<td>${info.ihit }</td>
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

























