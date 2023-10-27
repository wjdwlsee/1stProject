package com.lec.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.InfoDao;
import com.lec.ex.dao.LikelistDao;
import com.lec.ex.dto.InfoDto;
import com.lec.ex.dto.LikelistDto;

public class likeListAll implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//전체 출력, 리스트 insert(infoList -- 저장후)후 전체 출력
		//insert 는 infoBest submit 버튼으로만 가능 
		String mid = request.getParameter("mid");
		LikelistDao lDao = LikelistDao.getInstance();
		ArrayList<LikelistDto> likeList = lDao.infolist(mid);
		request.setAttribute("likeList", likeList);
		
	}

}
