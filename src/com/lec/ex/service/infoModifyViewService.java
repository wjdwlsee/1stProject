package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.InfoDao;
import com.lec.ex.dto.InfoDto;
import com.lec.ex.service.Service;

public class infoModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int iid = Integer.parseInt(request.getParameter("iid"));
		InfoDao iDao = InfoDao.getInstance();
		InfoDto iDto = iDao.getInfoNotHitUp(iid);
		request.setAttribute("info", iDto);
	}

}
