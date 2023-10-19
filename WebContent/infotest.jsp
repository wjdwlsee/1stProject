<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.ex.dto.InfoDto"%>
<%@page import="com.lec.ex.dao.InfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	InfoDao iDao = InfoDao.getInstance();
	out.println("<h3>dto가져오기</h3>");
	ArrayList<InfoDto> dtos = iDao.infolist(1, 10);
	for(InfoDto dto :dtos){
		out.println(dto + "<br>");
	}
	out.println("<h3>2. 글갯수 : " + iDao.getinfoCnt() + "</h3>");
	out.println("<h3>3. 원글쓰기");
	InfoDto dto = new InfoDto(10, "GAN", "메롱", "", 1 ,null, 1 ,null, "K","", null, 0, 1, "199.5.2.1");
	int result = iDao.writeinfo(dto);
	out.print(result==InfoDao.SUCCESS ? ":성공</h3>" : ":실패</h3>");
	out.print("<h3>6. 조회수 안 올리고, 글번호로 dto가져오기</h3>");
	out.print("2번 글:" + iDao.getInfoNotHitUp(2) + "<br>");
	iDao.hitUp(2);
	out.print("<h3>7. 글수정");
	dto = iDao.getInfoNotHitUp(18);
	dto.setItitle("wpahr");
	//dto.setIcontent("독특한 본문 수정함\n수정완료");
	//result = iDao.modifyInfo(dto);
	out.print(result == InfoDao.SUCCESS ? " 성공</h3>" : " 실패</h3>");
	out.print("<h3>8. 글 삭제</h3>");
	result = iDao.deleteInfo(10);
	out.print(result == InfoDao.SUCCESS? "글삭제 성공<br>":"비번오류로 글삭제 실패<br>");


%>
</body>
</html>