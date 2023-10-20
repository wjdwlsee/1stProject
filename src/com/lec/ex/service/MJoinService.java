package com.lec.ex.service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = MemberDao.FAIL;
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");
		MemberDao mDao = MemberDao.getInstance();
		result = mDao.midConfirm(mid);
		MemberDto newMember = new MemberDto(mid, mpw, mname, memail, mbirth, maddress, null);
		if(result == MemberDao.SUCCESS) { // 가입성공
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			request.setAttribute("joinResult", "회원가입이 완료되었습니다");
		}else { // 가입실패
			request.setAttribute("joinErrorMsg", "정보가 너무 길어서 회원가입 실패");
		}
	}
}

