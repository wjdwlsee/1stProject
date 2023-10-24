package com.lec.ex.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.FreeBoardDao;
import com.lec.ex.dao.InfoDao;
import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.FreeBoardDto;
import com.lec.ex.dto.InfoDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class infoModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("infoFileUp");
		int maxSize = 1024*1024*10; // 최대업로드 사이즈는 10M
		String ffileName = "", dbFileName = null;
		int result = InfoDao.FAIL;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			ffileName = mRequest.getFilesystemName(param);
			dbFileName = mRequest.getParameter("dbFileName");
			if(ffileName==null) {
				ffileName = dbFileName;
			}
			// mId, fTitle, fContent,  fileName, fIp
			int iid = Integer.parseInt(mRequest.getParameter("iid"));
			String ititle = mRequest.getParameter("ititle");
			String icontent = mRequest.getParameter("icontent");
			int lno = Integer.parseInt(mRequest.getParameter("lno"));
			int tno = Integer.parseInt(mRequest.getParameter("tno"));
			String ifilename = mRequest.getParameter("ifilename");
			String ifilename2 = mRequest.getParameter("ifilename2");
			InfoDao iDao = InfoDao.getInstance();
			InfoDto dto = new InfoDto(iid, null, ititle, icontent, lno, null, tno, null, ifilename, ifilename2, null, 0, 0, null);
			
			result = iDao.modifyInfo(dto);
			if(result == InfoDao.SUCCESS) { 
				request.setAttribute("infoModiResult", "글수정 성공");
			}else {
				request.setAttribute("infoModiResult", "글수정 실패");
			}
			//★mRequest에서 넘어온 pageNum(mRequest를 사용하면 request의 파라미터들이 다 null이 됨)을 request에 set : modify,reply★
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("infoModiResult", "글수정 실패");
		}
		// 서버에 올라간 fileboardUp 파일을 소스폴더에 filecopy (파일 수정을 안 했거나, 예외가 떨어질 경우 복사 안 함)
		if(dbFileName!=null && !ffileName.equals(dbFileName) && result==MemberDao.SUCCESS) { 
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+ffileName);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/Webpro/source/08_1stProject/Tirp/WebContent/infoFileUp/"+ffileName);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} // try
		}// 파일 복사 if
	}
}

