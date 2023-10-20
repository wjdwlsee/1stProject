package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.FreeBoardDao;
import com.lec.ex.dto.FreeBoardDto;

public class BoardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fid = Integer.parseInt(request.getParameter("fid"));
		FreeBoardDao boardDao = FreeBoardDao.getInstance();
		FreeBoardDto boardDto = boardDao.getBoardNotHitUp(fid);
		request.setAttribute("board", boardDto);

	}

}
