package com.lec.ex.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;

public class MModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = MemberDao.FAIL;
		String mid = request.getParameter("mid");
		String oldMpw = request.getParameter("oldMpw");
		String mpw = request.getParameter("mpw");
		if(mpw.equals("")) {//정보수정시 새비밀번호를 입력하지 않은 겨우 현비밀번호
			mpw = oldMpw;
		}
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		// 정보수정시 사진첨부 안 하면, 기존의 사진(dbMphoto)으로
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");
		// DB에 정보 수정
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = new MemberDto(mid, mpw, mname, memail, mbirth, maddress, null);
		result = mDao.modifyMember(mDto);
		if(result == MemberDao.SUCCESS) { // 수정 성공시, 세션도 수정
			HttpSession session = request.getSession();
			session.setAttribute("member", mDto);
			request.setAttribute("modifyResult", "회원 정보 수정 성공");
		}else {
			request.setAttribute("modifyErrorMsg", "회원정보 수정 실패(정보가 길거나 mid check)");
		}
	}
}
