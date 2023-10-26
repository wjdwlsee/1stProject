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
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="stylesheet" href ="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" >	
<style >
*{background-image: url('../img/photo.png');
  font-family: 'Gaegu', sans-serif;
font-family: 'Hi Melody', sans-serif;
  
 }
h1{text-align: center; margin-top: 50px;}
.select_area {
    width: 1100px;
    margin: 0 auto;
    padding: 0 0 10px;
}

.select_area  {
    display: block;
    margin-top: -10px;
    font-weight: 800;
    font-size: 22px;
    letter-spacing: -1px;
    color: #333;
}

.select_area ul {
    padding: 100px auto;
    
}

.select_area ul:after {
    content: '';
    display: block;
    clear: both;
}
li {
 list-style-type: none;

 }

.select_area ul li {
    float: left;
    padding: 70px;
    margin-left:30px; 
}
.select_area ul li:nth-child(2){
	padding-left:26px ;
}

.select_area input[type="radio"] {
    position: absolute;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}
.select_area input[type="submit"] {
overflow: hidden;


}
.select_area input[type="button"] {
  float: left;
margin-left: 500px;
}

.select_area input[type="radio"] + label {
    position: relative;
    display: inline-block;
    height: 45px;
    padding-left: 160px;
    vertical-align: middle;
}

.select_area input[type="radio"] + label span{
    position: absolute;
    left: 0;
    top: 0;
    display: block;
    width: 100%;
    font-size: 20px;
    height: 60px;
    line-height: 60px;
    margin:-30px;
    padding-right:25px;
    text-align: center;
    color: #000;
}

.select_area input[type="radio"] + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 163px;
    height: 45px;
    border-radius: 50px;
  
}

.select_area input[type="radio"] + label:after,  label:after {
    display: none;
    content: '';
    position: absolute;
    left: 5px;
    top: 7px;
    width: 100px;
    height: 16px;
   
}



.select_area input[type="radio"]:checked + label span  {
    color :#afc9f8;
     margin:-13px;
     padding-right:70px; 
}


</style>
</head>
<body>
	<form action="${conPath}/infoBest.do " method="get">
			<input type="text" name="lno" value="${param.lno }">
			<%-- <input type="text" name="tno" value="${param.tno }"> --%>
			<h1>무슨 테마가 좋아 ?</h1>
		<div class="select_area">
			<ul id="areaul">
				<li>
				    <input type="radio" id="theme_chk3" name="tno" value="3">
		        	<label for="theme_chk3">
		        		<img src="${conPath }/img/857681.png" >
		        		<span>맛집 </span>
	        		</label>
        		</li>
				<li>
					<input type="radio" id="theme_chk2" name="tno" value="2">
					<label for="theme_chk2">
						<img src="${conPath }/img/1079159.png" >
						<span>까페</span>
					</label>
				</li>
				<li>
					<input type="radio" id="theme_chk1" name="tno" value="1">
					<label for="theme_chk1">
					<img src="${conPath }/img/10062641.png">
						<span>어드벤처 </span>
					</label>
				</li>
        		<li>    
        			<input type="radio" id="theme_chk4" name="tno" value="4">
       			    <label for="theme_chk4">
       			    	<img src="${conPath }/img/3128032.png" width="100" height="100">
       			    	<span>문화/역사</span>
    			    </label>
   			    </li>
   			    <li>   
   			    	<input type="radio" id="theme_chk5" name="tno" value="5">
   			    	<label for="theme_chk5">
   			    		<img src="${conPath }/img/2903251.png" width="100" height="100">
   			    		<span> 산 </span>
   			    	</label>
   			    </li>
   			    <li>    
   			    	<input type="radio" id="theme_chk6" name="tno" value="6">
	    	  		<label for="theme_chk6">
	    	  			<img src="${conPath }/img/2394757.png" width="100" height="100">
	    	  			<span>축제</span>
	    	  		</label>
    	  		</li>
    	  		<li>   
    	  			 <input type="radio" id="theme_chk7" name="tno" value="7">   
    	  			 <label for="theme_chk7">
   	  			 		<img src="${conPath }/img/1086426.png" width="100" height="100">
    	  			 	<span>바다</span>
   	  			 	 </label>
  			 	 </li>
  			 	 <li>
  			 	     <input type="radio" id="theme_chk8" name="tno" value="8">
  			 	         <label for="theme_chk8">
  			 	         	<img src="${conPath }/img/2082468.png" width="100" height="100">
  			 	         	<span>캠핑</span>
		 	         	</label>
		 	         	</li>
		 	         
     	       	 	</ul>
     	       		<input type="submit" value="다음" class="btn btn-outline-secondary" > 
     	       		<input type="button" value="이전" class="btn btn-outline-secondary" onclick="history.back()">   
     	       	 </div>
     	       	 </form>
</body>
</html>