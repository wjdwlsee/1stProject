package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.FailedContext;

import com.lec.ex.dao.MemberDao;

public class MLogoutService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("logoutMsg", "로그아웃이 완료 되었습니다.");

	}

}
