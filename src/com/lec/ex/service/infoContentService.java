package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.FreeBoardDao;
import com.lec.ex.dao.InfoDao;
import com.lec.ex.dto.InfoDto;
import com.lec.ex.service.Service;

public class infoContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int iid = Integer.parseInt(request.getParameter("iid"));
		InfoDao iDao = InfoDao.getInstance();
		iDao.hitUp(iid);
		InfoDto info = iDao.getInfoNotHitUp(iid);
		request.setAttribute("info", info);

	}

}
