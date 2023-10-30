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
 <style media="screen">
   .wrap{
     width: 1000px;
     height: 400px;
     overflow-x: scroll;
     overflow-y: hideen;
     white-space:nowrap
     
   }
   .wrap img{
       width:350px;
       height:300px;
   }
 

/* 스크롤바의 폭 너비 */
.wrap::-webkit-scrollbar {
    margin-top:20px;
    width: 10px;  
}

.wrap::-webkit-scrollbar-thumb {
    background: silver; /* 스크롤바 색상 */
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
}

.wrap::-webkit-scrollbar-track {
    background: white;  /*스크롤바 뒷 배경 색상*/
}
 </style>
</head>
<body>
	  <div class="wrap">
	      <img src = "${conPath }/img2/city-7459162_640.jpg">
	      <img src = "${conPath }/img2/korea-1095361_640.jpg">
	      <img src = "${conPath }/img2/hair-983602_640.jpg"> 
		  <img src = "${conPath }/img2/ocean-999811_640.jpg">
	      <img src = "${conPath }/img2/pohang-1613923_640.jpg">
		  <img src = "${conPath }/img2/republic-of-korea-5131925_640.jpg">	
	   	  <img src = "${conPath }/img2/seoraksan-7366041_640.jpg">
		  <img src = "${conPath }/img2/tree-3302802_640.jpg">
		  <img src = "${conPath }/img2/words-1686229_640.jpg"> 
	</div>
</body>
</html>