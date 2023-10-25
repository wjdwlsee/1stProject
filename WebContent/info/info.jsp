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
<style>
*{background-image: url('../img/photo.png');}
h1{text-align: center;}
.select_area {
    width: 512px;
    margin: 0 auto;
    padding: 0 0 10px;
}

.select_area .stit {
    display: block;
    margin-top: -10px;
    font-weight: 800;
    font-size: 22px;
    letter-spacing: -1px;
    color: #333;
}

.select_area ul {
    padding: 18px 0 20px;
    margin-left: -10px;
}

.select_area ul:after {
    content: '';
    display: block;
    clear: both;
}

.select_area ul li {
    float: left;
    padding: 0 0 10px 10px;
}

.select_area input[type="radio"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}

.select_area input[type="radio"] + label {
    position: relative;
    display: inline-block;
    height: 45px;
    padding-left: 163px;
    vertical-align: middle;
    cursor: pointer;
}

.select_area input[type="radio"] + label span{
    position: absolute;
    left: 0;
    top: 0;
    display: block;
    width: 100%;
    font-size: 20px;
    height: 45px;
    letter-spacing: -1px;
    line-height: 45px;
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
    background: #fff;
}

.select_area input[type="radio"] + label:after, .select_area input[type="checkbox"] + label:after {
    display: none;
    content: '';
    position: absolute;
    left: 5px;
    top: 7px;
    width: 15px;
    height: 16px;
    border-radius: 100%;
}

.select_area input[type="radio"]:checked + label:before {
    background: #4880ed;
    box-shadow: 0px 10px 27px 0px rgba(76, 79, 86, 0.38);
}

.select_area input[type="radio"]:checked + label span  {
    color: #fff;
}

.select_area input[type="radio"]:focus + label  {
    outline: 1px dotted #000;
    outline: -webkit-focus-ring-color auto 5px;
}
#content { width:1000px;}
#content .section1 {
   
    overflow: hidden;
}

#content .section1 > div {
    border: 1px solid gray;
    box-sizing: border-box;
    float: left;
    width:400px;
    height: 400px;
    line-height: 400px;
    text-align: center;
}
</style>
</head>
<body>
		<form action="${conPath }/info.do" method="post">
			<input type="text" name="mid" value="${member.mid }">
				
			<h1>어디로 여행갈래 ?</h1>
		<div class="select_area">
			<ul id="areaul">
				<li>
					<input type="radio" id="area_chk1" name="lno" value="1">
					<label for="area_chk1">
						<span>서울</span>
					</label>
				</li>
				<li>
					<input type="radio" id="area_chk6" name="lno" value="6">
					<label for="area_chk6">
						<span>부산</span>
					</label>
				</li>
				<li>
				    <input type="radio" id="area_chk4" name="lno" value="4">
		        	<label for="area_chk4">
		        		<span>대구</span>
	        		</label>
        		</li>
        		<li>    
        			<input type="radio" id="area_chk2" name="lno" value="2">
       			    <label for="area_chk2">
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
   			    	<input type="radio" id="area_chk3" name="lno" value="3">
	    	  		<label for="area_chk3">
	    	  			<span>대전</span>
	    	  		</label>
    	  		</li>
    	  		<li>   
    	  			 <input type="radio" id="area_chk7" name="lno" value="7">   
    	  			 <label for="area_chk7">
    	  			 	<span>울산</span>
   	  			 	 </label>
  			 	 </li>
  			 	 <li>
  			 	     <input type="radio" id="area_chk8" name="lno" value="8">
  			 	         <label for="area_chk8">
  			 	         	<span>세종</span>
		 	         	</label>
		 	         	</li>
		 	         	<li>
		 	         	    <input type="radio" id="area_chk9" name="lno" value="9">
	 	         	        <label for="area_chk31">
	 	         	        	<span>경기</span>
 	         	        	</label>
         	        	</li>
         	        	<li>    
         	        		<input type="radio" id="area_chk10" name="lno" value="10">
        	        		<label for="area_chk32">
        	        			<span>강원</span>
       	        			</label>
     	        		</li>
        		       	<li>
       		     	       <input type="radio" id="area_chk11" name="lno" value="11">
   		     	           <label for="area_chk34">
    	           		   		<span>충남</span>
  		     	           </label>
  		     	       	</li>
     	        		<li>
     	        		    <input type="radio" id="area_chk12" name="lno" value="13">
  	        		        <label for="area_chk33">
 	        		        	<span>충북</span>
  	        		       	</label>
        		       	</li>
  		     	       	<li>
  		     	       	    <input type="radio" id="area_chk14" name="lno" value="14"> 
  		     	       	    <label for="area_chk37">
  		     	       	    	<span>전북</span>
  		     	       	    </label>
  		     	       	</li>
  		     	       	<li>
  		     	       	    <input type="radio" id="area_chk15" name="lno" value="15">    
  		     	       	    <label for="area_chk38">
  		     	       	    	<span>전남</span>
  		     	       	    </label>
  		     	       	    </li>
  		     	       	    <li>
  		     	       	        <input type="radio" id="area_chk16" name="lno" value="16">    
  		     	       	        <label for="area_chk35">
  		     	       	        	<span>경북</span>
  		     	       	        </label>
  		     	       	     </li>
  		     	       	     <li>
  		     	       	         <input type="radio" id="area_chk17" name="lno" value="17">
  		     	       	         <label for="area_chk36">
  		     	       	         	<span>경남</span>
  		     	       	         </label>
  		     	       	     </li>
  		     	       	     <li>
  		     	       	         <input type="radio" id="area_chk18" name="lno" value="18">
  		     	       	         <label for="area_chk39">
  		     	       	         	<span>제주</span>
  		     	       	         </label>
  		     	       	    </li>
     	       	 	</ul>
     	       		<input type="submit" value="다음" onclick="location='${conPath}/info/info2.jsp'"> 
     	       	 </div>
     	       	 </form>
				
</body>
</html>