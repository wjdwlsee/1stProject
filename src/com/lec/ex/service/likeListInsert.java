package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.FreeBoardDao;
import com.lec.ex.dao.LikelistDao;
import com.lec.ex.dto.LikelistDto;
import com.lec.ex.dto.MemberDto;

public class likeListInsert implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int result = LikelistDao.FAIL;
		HttpSession httpSession = request.getSession();
		MemberDto member = (MemberDto)httpSession.getAttribute("member");
		LikelistDao likeListDao = LikelistDao.getInstance();
		if(member!=null) {
			String mid = member.getMid();
			int iid = Integer.parseInt(request.getParameter("iid"));
			String ititle = request.getParameter("ititle");
			String icontent = request.getParameter("icontent");
			String ifilename = request.getParameter("ifilename");
			LikelistDto likelists = new LikelistDto(0, ititle, icontent, ifilename, mid, iid);
			if(result == likeListDao.SUCCESS) {
				request.setAttribute("likeListResult", "저장 성공");
			}else {
				request.setAttribute("likeListResult", "저장실패");
			}
		}
	}
}
