package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.FreeBoardDao;
import com.lec.ex.dto.FreeBoardDto;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fid = Integer.parseInt(request.getParameter("fid"));
		FreeBoardDao bDao = FreeBoardDao.getInstance();
		bDao.hitUp(fid);
		FreeBoardDto board = bDao.getBoardNotHitUp(fid);
		request.setAttribute("board", board);
	}

}
