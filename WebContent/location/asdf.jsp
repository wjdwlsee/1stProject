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
     height: 300px;
     overflow-x: scroll;
     overflow-y: hidden;
     white-space:nowrap
   }
   .wrap img{
       width:300px;
       height:100%;
   }
 </style>
</head>
<body>
	  <div class="wrap">
      <img src = "${conPath }/img/ocean-5843810_640.jpg">
      <img src = "${conPath }/img/mt-seolark-4674425_640.jpg">
      <img src = "${conPath }/img/nature-5278915_640.jpg">
	  <img src = "${conPath }/img/seoul-7423593_640.jpg">
      <img src = "${conPath }/img/city-7459162_640.jpg">
      <img src = "${conPath }/img/ssa.jpg">
	</div>
</body>
</html>