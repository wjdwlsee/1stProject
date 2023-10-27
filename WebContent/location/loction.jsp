<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
		$(document).ready(function(){
			$.ajax({
				url : 'ex.json',
				dataType : 'json',
				success : function(jsonData){
					$('table#dataShow').html('<tr><th>no</th><th>name</th><th>url</th></tr>');
					$.each(jsonData, function(idx, item){
						let out = '<tr>';
						out += '<td>' + item.lno + '</td>';
						out += '<td>' + item.name + '</td>';
						out += '<td>' + url("item.url") + '</td>';
 						out += '</tr>';
 						// $('table#dataShow').html($('table#dataShow').html() + out);
 						$('table#dataShow').append(out);
					});
				},
			});
		});
	</script>
</head>
<body>
	<form>
		<div id= "section">
		 <table >
					<tr>
		     		<c:forEach items="${locations }" var="location">
		     		<img src = "../img/10043666.png" >
					<td>
						<h1> ${location.lname } </h1>	
							<script>
								let img = ['url(../img/10043666.png)', 'url(../img/10062641.png)', 'url(../img/1079108.png)'];
								let s = 0;
								 var timeId = setInterval(() => {
								      document.body.innerHTML = '<h1>'+${location.lname} + '</h1>';
								      document.body.Image = img[s%img.length];
								      s++;
								    }, 1000);
							</script>
							</td>
					</c:forEach>
					</tr>
		     	</table>
		</div>
	</form>
	<table id="dataShow"></table>
</body>
</html>