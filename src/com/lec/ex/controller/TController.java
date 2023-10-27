package com.lec.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.service.* ;


@WebServlet("*.do")
public class TController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/main.do")) {
			viewPage = "main/main.jsp";
		}else if(command.equals("/loginView.do")) { // 로그인 화면
			viewPage = "member/login.jsp";
		}else if(command.equals("/login.do")) { // DB를 통해 로그인 확인 및 세션 처리
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/joinView.do")) { // 화면가입 화면
			viewPage = "member/join.jsp";
		}else if(command.equals("/midConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";
		}else if(command.equals("/memailConfirm.do")) {
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/memailConfirm.jsp";
		}else if(command.equals("/join.do")) { // 회원가입 DB처리후 로그인으로 가고 id엔 가입한 id가 출력
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}else if(command.equals("/logout.do")) { // 로그아웃 - 세션날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/modifyView.do")) { // 정보 수정 화면
			viewPage = "member/modify.jsp";
		}else if(command.equals("/modify.do")) {// 정보수정 DB처리후 세션도 수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/allView.do")) { // 전체 회원리스트
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "member/mAllView.jsp";
		}else if(command.equals("/withdrawal.do")) { // 회원탈퇴
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * * * admin 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		else if(command.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
		}else if(command.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * 파일첨부 게시판 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/boardList.do")) {
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "freeBoard/boardList.jsp";
		}else if(command.equals("/boardWriteView.do")) {
			viewPage = "freeBoard/boardWrite.jsp";
		}else if(command.equals("/boardWrite.do")) {
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardContent.do")) {
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "freeBoard/boardContent.jsp";
		}else if(command.equals("/boardModifyView.do")) {
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "freeBoard/boardModify.jsp";
		}else if(command.equals("/boradModify.do")) {
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardDelete.do")) {
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardReplyView.do")) {
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "freeBoard/boardReply.jsp";
		}else if(command.equals("/boardReply.do")) {
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			//***********info***********
			//**************************
		}else if(command.equals("/infoList.do")) {
			service = new infoListService();
			service.execute(request, response);
			viewPage = "info/infoList.jsp";
		}else if(command.equals("/infoWriteView.do")) {
			viewPage = "info/infoWrite.jsp";
		}else if(command.equals("/infoWrite.do")) {
			service = new infoWriteService();
			service.execute(request, response);
			viewPage = "infoList.do";
		}else if(command.equals("/infoContent.do")) {
			service = new infoContentService();
			service.execute(request, response);
			viewPage = "info/infoContent.jsp";
		}else if(command.equals("/infoModifyView.do")) {
			service = new infoModifyViewService();
			service.execute(request, response);
			viewPage = "info/infoModify.jsp";
		}else if(command.equals("/infoModify.do")) {
			service = new infoModifyService();
			service.execute(request, response);
			viewPage = "infoList.do";
		}else if(command.equals("/infoDelete.do")) {
			service = new infoDeleteService();
			service.execute(request, response);
			viewPage = "infoList.do";
		}else if(command.equals("/infoView.do")) {
			viewPage = "info/info.jsp";
		}else if(command.equals("/info.do")) {
			service = new infoSelect();
			service.execute(request, response);
			viewPage = "info/info2.jsp";
		}else if(command.equals("/info2.do")) {
			service = new infoSelect2();
			service.execute(request, response);
			viewPage = "infoBest.do";
		}else if(command.equals("/infoBest.do")) {
			service = new infoBest();
			service.execute(request, response);
			viewPage = "info/infoBest.jsp";
		}else if(command.equals("/location.do")) {
			service = new infoSelect();
			service.execute(request, response);
			viewPage = "location/location.jsp";
		//************************************
		//********likelist******************
		//************************************
		}else if(command.equals("/likeList.do")) {
			service = new likeListAll();
			service.execute(request, response);
			viewPage = "likeList/likeList.jsp";
		}else if(command.equals("/listInsert.do")) {
			service = new likeListInsert();
			service.execute(request, response);
			viewPage = "likeList/likeList.jsp";
		}else if(command.equals("/listContent.do")) {
			service = new likeListContent();
			service.execute(request, response);
			viewPage = "likeList/iistContent.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
