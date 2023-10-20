package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.FreeBoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fgroup = Integer.parseInt(request.getParameter("fgroup"));
		int fstep = Integer.parseInt(request.getParameter("fstep"));
		int findent = Integer.parseInt(request.getParameter("findent"));
		FreeBoardDao boardDao = FreeBoardDao.getInstance();
		int deleteCnt = boardDao.deleteBoard(fgroup, fstep, findent);
		if(deleteCnt >= FreeBoardDao.SUCCESS) {
			request.setAttribute("boaredResult", "글(답변글 포함) "+deleteCnt+"개 글 삭제 성공");
		}else {
			request.setAttribute("boaredResult", "글(답변글도 모두) 삭제 안 됨");
		}
	}

}
