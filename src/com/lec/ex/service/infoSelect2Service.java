package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.LocationDao;
import com.lec.ex.dao.ThemeDao;
import com.lec.ex.dto.LocationDto;
import com.lec.ex.dto.ThemeDto;

public class infoSelect2Service implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int tno = Integer.parseInt(request.getParameter("tno")); 
		ThemeDao tDao = ThemeDao.getInstance();
		ThemeDto theme = tDao.getList(tno);
		request.setAttribute("tlist", tDao.getList(tno));
		request.setAttribute("theme",theme);

	}

}
