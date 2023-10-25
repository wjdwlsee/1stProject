<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
			<input type="text" name="mid" value="${member.mid }">
			<input type="text" name="areaChk" value="${lno.lno }">	
			<h1>어디로 여행갈래 ?</h1>
		<div class="select_area">
			<ul id="areaul">
				<li>
					<input type="radio" id="area_chk1" name="areaChk" value="1">
					<label for="area_chk1">
						<span>서울</span>
					</label>
				</li>
				<li>
					<input type="radio" id="area_chk6" name="areaChk" value="6">
					<label for="area_chk6">
						<span>부산</span>
					</label>
				</li>
				<li>
				    <input type="radio" id="area_chk4" name="areaChk" value="4">
		        	<label for="area_chk4">
		        		<span>대구</span>
	        		</label>
        		</li>
        		<li>    
        			<input type="radio" id="area_chk2" name="areaChk" value="2">
       			    <label for="area_chk2">
       			    	<span>인천</span>
    			    </label>
   			    </li>
   			    <li>   
   			    	<input type="radio" id="area_chk5" name="areaChk" value="5">
   			    	<label for="area_chk5">
   			    		<span>광주</span>
   			    	</label>
   			    </li>
   			    <li>    
   			    	<input type="radio" id="area_chk3" name="areaChk" value="3">
	    	  		<label for="area_chk3">
	    	  			<span>대전</span>
	    	  		</label>
    	  		</li>
    	  		<li>   
    	  			 <input type="radio" id="area_chk7" name="areaChk" value="7">   
    	  			 <label for="area_chk7">
    	  			 	<span>울산</span>
   	  			 	 </label>
  			 	 </li>
  			 	 <li>
  			 	     <input type="radio" id="area_chk8" name="areaChk" value="8">
  			 	         <label for="area_chk8">
  			 	         	<span>세종</span>
		 	         	</label>
		 	         	</li>
		 	         	<li>
		 	         	    <input type="radio" id="area_chk9" name="areaChk" value="9">
	 	         	        <label for="area_chk31">
	 	         	        	<span>경기</span>
 	         	        	</label>
         	        	</li>
         	        	<li>    
         	        		<input type="radio" id="area_chk10" name="areaChk" value="10">
        	        		<label for="area_chk32">
        	        			<span>강원</span>
       	        			</label>
     	        		</li>
        		       	<li>
       		     	       <input type="radio" id="area_chk11" name="areaChk" value="11">
   		     	           <label for="area_chk34">
    	           		   		<span>충남</span>
  		     	           </label>
  		     	       	</li>
     	        		<li>
     	        		    <input type="radio" id="area_chk12" name="areaChk" value="13">
  	        		        <label for="area_chk33">
 	        		        	<span>충북</span>
  	        		       	</label>
        		       	</li>
  		     	       	<li>
  		     	       	    <input type="radio" id="area_chk14" name="areaChk" value="14"> 
  		     	       	    <label for="area_chk37">
  		     	       	    	<span>전북</span>
  		     	       	    </label>
  		     	       	</li>
  		     	       	<li>
  		     	       	    <input type="radio" id="area_chk15" name="areaChk" value="15">    
  		     	       	    <label for="area_chk38">
  		     	       	    	<span>전남</span>
  		     	       	    </label>
  		     	       	    </li>
  		     	       	    <li>
  		     	       	        <input type="radio" id="area_chk16" name="areaChk" value="16">    
  		     	       	        <label for="area_chk35">
  		     	       	        	<span>경북</span>
  		     	       	        </label>
  		     	       	     </li>
  		     	       	     <li>
  		     	       	         <input type="radio" id="area_chk17" name="areaChk" value="17">
  		     	       	         <label for="area_chk36">
  		     	       	         	<span>경남</span>
  		     	       	         </label>
  		     	       	     </li>
  		     	       	     <li>
  		     	       	         <input type="radio" id="area_chk18" name="areaChk" value="18">
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