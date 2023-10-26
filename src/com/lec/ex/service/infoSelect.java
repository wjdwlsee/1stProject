package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.lec.ex.dao.LocationDao;
import com.lec.ex.dto.LocationDto;
import com.lec.ex.dto.MemberDto;

public class infoSelect implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int lno = Integer.parseInt(request.getParameter("lno")); 
		LocationDao lDao = LocationDao.getInstance();
		request.setAttribute("llist", lDao.listLocation());
		LocationDto location = lDao.getList(lno);
		request.setAttribute("location",location);
	}

}
