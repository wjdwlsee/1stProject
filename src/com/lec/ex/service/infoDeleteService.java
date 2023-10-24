package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.InfoDao;
import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.InfoDto;

public class infoDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int iid = 0;
		InfoDto sessionInfo = (InfoDto) session.getAttribute("info");
		if(sessionInfo != null) {
			iid = sessionInfo.getIid();
		}
		InfoDao iDao = InfoDao.getInstance();
		int result = iDao.deleteInfo(iid);
		session.invalidate(); // 세션 삭제
		if(result==InfoDao.SUCCESS) {
			request.setAttribute("infodeleteResult", "삭제가 완료되었습니다.");
		}else {
			request.setAttribute("infodeleteResult", "로그인이 되어 있지 않습니다");
		}
		
	}

}
