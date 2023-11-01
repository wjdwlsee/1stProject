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
<link href="${conPath}/css/info.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="stylesheet" href ="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" >	
</head>
<body>
		<form action="${conPath }/info.do" method="get">
			<h1><p>정보 검색 </p>어디로 여행갈래 ?</h1>
		<div class="select_area">
			<ul id="areaul">
				<li>
					<input type="radio" id="area_chk1" name="lno" value="1">
					<label for="area_chk1">
						<span>서울</span>
					</label>
				</li>
				<li>
					<input type="radio" id="area_chk15" name="lno" value="15">
					<label for="area_chk15">
						<span>부산</span>
					</label>
				</li>
				<li>
				    <input type="radio" id="area_chk13" name="lno" value="13">
		        	<label for="area_chk13">
		        		<span>대구</span>
	        		</label>
        		</li>
        		<li>    
        			<input type="radio" id="area_chk3" name="lno" value="3">
       			    <label for="area_chk3">
       			    	<span>인천</span>
    			    </label>
   			    </li>
   			    <li>   
   			    	<input type="radio" id="area_chk5" name="lno" value="5">
   			    	<label for="area_chk5">
   			    		<span>광주</span>
   			    	</label>
   			    </li>
   			    <li>    
   			    	<input type="radio" id="area_chk7" name="lno" value="7">
	    	  		<label for="area_chk7">
	    	  			<span>대전</span>
	    	  		</label>
    	  		</li>
    	  		<li>   
    	  			 <input type="radio" id="area_chk14" name="lno" value="14">   
    	  			 <label for="area_chk14">
    	  			 	<span>울산</span>
   	  			 	 </label>
  			 	 </li>
 	         	<li>
 	         	    <input type="radio" id="area_chk2" name="lno" value="2">
         	        <label for="area_chk2">
         	        	<span>경기</span>
        	        	</label>
   	        	</li>
    	        <li>    
  	        		<input type="radio" id="area_chk4" name="lno" value="4">
 	        		<label for="area_chk4">
 	        			<span>강원</span>
        			</label>
 	        	</li>
   		       	<li>
     	       	    <input type="radio" id="area_chk6" name="lno" value="6">
     	            <label for="area_chk6">
	           		   		<span>충남</span>
     	           </label>
     	       	</li>
        		<li>
        		    <input type="radio" id="area_chk5" name="lno" value="5">
     		        <label for="area_chk5">
    		        	<span>충북</span>
     		       	</label>
  		       	</li>
     	       	<li>
     	       	    <input type="radio" id="area_chk11" name="lno" value="11"> 
     	       	    <label for="area_chk11">
     	       	    	<span>전북</span>
     	       	    </label>
     	       	</li>
    	       	<li>
    	       	    <input type="radio" id="area_chk10" name="lno" value="10">    
    	       	    <label for="area_chk10">
    	       	    	<span>전남</span>
    	       	    </label>
   	       	    </li>
   	       	    <li>
   	       	        <input type="radio" id="area_chk8" name="lno" value="8">    
   	       	        <label for="area_chk8">
   	       	        	<span>경북</span>
   	       	        </label>
   	       	     </li>
   	       	     <li>
   	       	         <input type="radio" id="area_chk9" name="lno" value="9">
   	       	         <label for="area_chk9">
   	       	         	<span>경남</span>
   	       	         </label>
   	       	     </li>
   	       	     <li>
   	       	         <input type="radio" id="area_chk16" name="lno" value="16">
   	       	         <label for="area_chk16">
   	       	         	<span>제주</span>
   	       	         </label>
   	       	     </li>
   	       	     <li>
   	       	         <input type="radio" id="area_chk12" name="lno" value="12">
   	       	         <label for="area_chk12">
   	       	         	<span>광주</span>
   	       	         </label>
   	       	    </li>
       	 	</ul>
       		<input type="submit" value="다음"  class="btn btn-outline-secondary"> 
       	 </div>
       	 </form>
			
</body>
</html>