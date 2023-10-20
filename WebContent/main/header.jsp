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
	*{padding:0; margin: 0;}
	header { 
		background-color: #white; font-size: 10pt;
	}
	header a {text-decoration: none; font-weight: bold;}
	header li { list-style: none;}
	header .gnb{width: 100%;	background-color: #f0f8ff;}
	header .gnb ul {
		overflow: hidden;
		width:700px;
		height: 30px;
		line-height: 30px;
		margin: 0 auto;
	}
	header .gnb ul li {	float: right;	margin-right: 30px;}
	header .gnb a { 
		color : #blue;
		font-size: 0.9em;
		display: block;
		padding-left:15px;
		padding-right:15px;
	}
	header .logo{
		width:120px; text-align:center;
		margin: 20px auto; font-size:2em;
		cursor: pointer;
	}
	header .lnb {
	  width: 100%; height: 40px;
	  border-top: 1px dashed #003300;
		border-bottom: 1px dashed #003300;
		position:relative; /*서브메뉴가 main영역 위로 */
	}
	header .lnb ul{
		overflow: hidden;
		width:750px;
		margin: 0 auto;
	}
	header .lnb ul>li {
		margin: 5px;
		float:left;
		padding:5px 40px;
		line-height: 25px;
	}
	header .lnb li a {color: #003300;}
	header .lnb li {color: #003300;}
	header .lnb ul li .subMenu {display:none;}
	header .lnb ul li:hover .subMenu {display: block; margin: 10px 0 0 0;}
	#inp_search_mo {}
	#gnbCommon .input a {top: 0;width: 100px;height: 35px;background: url(../images/common/btn_header_m_search.png) 50% 50% / 16px auto no-repeat;}
	#gnbCommon .form{position:static;padding:0 15px;}	
	#gnbCommon .page_back{position:absolute;left:15px;top:17px;display:inline-block;width:17px;height:16px;text-indent: -9999px;background: url(../images/common/btn_page_back.png) 0 0 / 100% 100% no-repeat;}
	
</style>
</head>
<body>
	<header id = "gnbCommon" class = "service_gnb up">
	<div class="gnd">
		<div class="gnb">
			<h1 class="search">
				<a class = "svgLogo" href="main/main.do">
				여행
				--
				</a>
			 </h1>
			 <div class = "mo">
			 	<ul>
					<li><a href="${conPath }/boardList.do">고객센터</a></li>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
					<li><a href="${conPath }/infoList.do">정보</a></li>
				</ul>
			 </div> 
			 <input type= "text" placeholder= "어디로 어떤여행을  떠날 예정인가요?" title="검색" id="inp_search_mo" autocomplete="off">
			<input type="text" aria-hidden="true" tabindex="-1" style="width:0 ;height:0; position:absolute; top:-9999px" >	
		</div>
	</div>
 	<c:if test="${empty member and empty admin}"> <%-- 로그인 전 화면 --%>
		<div class="gnb">
			<ul>
				<li><a href="${conPath }/boardList.do">고객센터</a></li>
				<li><a href="${conPath }/joinView.do">회원가입</a></li>
				<li><a href="${conPath }/loginView.do">로그인</a></li>
			</ul>
		</div>
		<div class="logo" onclick="location.href='${conPath}/main.do'">
			LOGO
		</div>
		<div class="lnb">
			<ul>
				
				<li>로그인전메뉴3<ol class="subMenu">
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">정보게시판</a></li>
							<li><a href="#">메뉴3-3</a></li>
						</ol>
				</li>
				
			</ul>
		</div>
	</c:if>
	<c:if test="${not empty member and empty admin}"> <%-- 사용자 모드 로그인 화면--%>
		<div class="gnb">
			<ul>
				<li><a href="${conPath }/boardList.do">고객센터</a></li>
				<li><a href="${conPath }/logout.do">로그아웃</a></li>
				<li><a href="${conPath }/modifyView.do">정보수정</a></li>
				<li><a>${member.mname }님 &nbsp; ▶</a></li>	
			</ul>
		</div>
		<div class="logo" onclick="location.href='${conPath}/boardList.do'">
			LOGO
		</div>
		<div class="lnb">
			<ul>
				<li>로그인후메뉴1<ol class="subMenu">
							<li><a href="#">메뉴1-1</a></li>
							<li><a href="#">메뉴1-2</a></li>
							<li><a href="#">메뉴1-3</a></li>
						</ol>
				</li>
				<li>로그인후메뉴2<ol class="subMenu">
							<li><a href="#">메뉴2-1</a></li>
							<li><a href="#">메뉴2-2</a></li>
							<li><a href="#">메뉴2-3</a></li>
						</ol>
				</li>
				<li>로그인후메뉴3<ol class="subMenu">
							<li><a href="#">메뉴3-1</a></li>
							<li><a href="#">메뉴3-2</a></li>
							<li><a href="#">메뉴3-3</a></li>
						</ol>
				</li>
				<li>로그인후메뉴4<ol class="subMenu">
							<li><a href="#">메뉴4-1</a></li>
							<li><a href="#">메뉴4-2</a></li>
							<li><a href="#">메뉴4-3</a></li>
						</ol>
				</li>
			</ul>
		</div>
	</c:if>
	<c:if test="${empty member and not empty admin}"> <%-- 관리자 모드 로그인 화면--%>
		<div class="gnb">
			<ul>
				<li><a href="${conPath }/boardList.do">고객센터</a></li>
				<li><a href="${conPath }/logout.do">관리자모드나가기</a></li>
				<li><a>${admin.aname }님 &nbsp; ▶</a></li>	
			</ul>
		</div>
		<div class="logo" onclick="location.href='${conPath}/allView.do'">
			LOGO
		</div>
		<div class="lnb">
			<ul>
				<li>관리자의메뉴1<ol class="subMenu">
							<li><a href="#">메뉴1-1</a></li>
							<li><a href="#">메뉴1-2</a></li>
							<li><a href="#">메뉴1-3</a></li>
						</ol>
				</li>
				<li>관리자의메뉴2<ol class="subMenu">
							<li><a href="#">메뉴2-1</a></li>
							<li><a href="#">메뉴2-2</a></li>
							<li><a href="#">메뉴2-3</a></li>
						</ol>
				</li>
				<li>관리자의메뉴3<ol class="subMenu">
							<li><a href="#">메뉴3-1</a></li>
							<li><a href="#">메뉴3-2</a></li>
							<li><a href="#">메뉴3-3</a></li>
						</ol>
				</li>
				<li>관리자의메뉴4<ol class="subMenu">
							<li><a href="#">메뉴4-1</a></li>
							<li><a href="#">메뉴4-2</a></li>
							<li><a href="#">메뉴4-3</a></li>
						</ol>
				</li>
			</ul>
		</div>
	</c:if>
</header>
</body>
</html>