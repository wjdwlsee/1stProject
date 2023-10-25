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

import com.lec.ex.dao.AdminDao;
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
		String[] filenames = {"",""};
		int result = InfoDao.FAIL;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			int idx = 0;
			while(params.hasMoreElements()){
				String param = params.nextElement(); // 파라미터 이름
				filenames[idx] = mRequest.getFilesystemName(param); // 해당 파라미터 이름으로 저장된 파일이름
				System.out.println(idx + "번째 파라미터 : " + param + 
						", 서버에 저장된 파일 이름:" + filenames[idx]);
				idx++;
			}
			String dbFileName1 = mRequest.getParameter("dbFileName1");
			String dbFileName2 = mRequest.getParameter("dbFileName2");
			int iid = Integer.parseInt(mRequest.getParameter("iid"));
			String aid = mRequest.getParameter("aid");
			String ititle = mRequest.getParameter("ititle");
			String icontent = mRequest.getParameter("icontent");
			int lno = Integer.parseInt(mRequest.getParameter("lno"));
			int tno = Integer.parseInt(mRequest.getParameter("tno"));
			String ifilename = mRequest.getParameter("ifilename");
			ifilename = ifilename==null?dbFileName1:ifilename;
			String ifilename2 = mRequest.getParameter("ifilename2");
			ifilename2 = ifilename2==null?dbFileName2 : ifilename2;
			String mbirthStr = mRequest.getParameter("mbirth");
			InfoDao iDao = InfoDao.getInstance();
			InfoDto dto = new InfoDto(iid, aid, ititle, icontent, lno, null, tno, null, ifilename, ifilename2, null, 0, 0, null);
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
		File serverFile = new File(path + "/" + filenames);
		if(serverFile.exists()  &&  result==AdminDao.LOGIN_SUCCESS) { 
			for(String filename : filenames) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/Webpro/source/08_1stProject/Tirp/WebContent/infoFileUp/"+filename );
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
}
