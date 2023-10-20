<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.ex.dao.FreeBoardDao"%>
<%@page import="com.lec.ex.dto.FreeBoardDto"%>
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
		FreeBoardDao bDao = FreeBoardDao.getInstance();
		out.println("<h3>1. 글 목록 </h3>");
		ArrayList<FreeBoardDto> dtos = bDao.listBoard(11, 15);
		for(FreeBoardDto dto : dtos){
			out.println(dto + "<br>");
		}
		out.println("<h3>2. 글갯수 : " + bDao.getBoardTotCnt() + "</h3>");
		out.println("<h3>3. 원글쓰기");
		FreeBoardDto dto = new FreeBoardDto(0,"son","손흥민", "ㅇㅇ","","",null,0,1,0,0,"192.1.1.1");
		int result = bDao.writeBoard(dto);
		out.print(result== FreeBoardDao.SUCCESS ? ":성공</h3>" : ":실패</h3>");
		out.print("<h3>6. 조회수 안 올리고, 글번호로 dto가져오기</h3>");
		out.print("2번 글:" + bDao.getBoardNotHitUp(3) + "<br>");
		out.print("<h3>4와 5. 조회수 올리고, 글번호로 dto가져오기</h3>");
		bDao.hitUp(190);
		out.print("2번글 상세보기 : " + bDao.getBoardNotHitUp(3) + "조회수 올리고 상세보기");
		out.print("<h3>7. 글수정");
		//dto = bDao.getBoardNotHitUp(216); // 2번 글 정보
		dto.setMname("독특자");
		dto.setFcontent("독특한 제목");
		result = bDao.modifyBoard(dto);
		out.print(result == FreeBoardDao.SUCCESS ? " 성공</h3>" : " 실패</h3>");
		out.print("<h3>8. 글 삭제</h3>");
		result = bDao.deleteBoard(1);
		out.print(result == FreeBoardDao.SUCCESS? "글삭제 성공<br>":"비번오류로 글삭제 실패<br>");
		result = bDao.deleteBoard(1);
		out.print(result == FreeBoardDao.SUCCESS? "글삭제 성공<br>":"비번오류로 글삭제 실패<br>");
	%>
</body>
</html>