package com.lec.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.InfoDao;
import com.lec.ex.dto.InfoDto;

public class infoBestService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int lno = Integer.parseInt(request.getParameter("lno")); 
		int tno = Integer.parseInt(request.getParameter("tno")); 
		InfoDao iDao = InfoDao.getInstance();
		ArrayList<InfoDto> infoBestList = iDao.getBestlist(lno, tno);
		request.setAttribute("infoBestList",infoBestList);

	}

}
