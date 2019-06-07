package host.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import host.model.service.HostService;
import host.model.vo.Host;

/**
 * Servlet implementation class HostProfileUpdateServlet
 */
@WebServlet(name = "HostProfileUpdate", urlPatterns = { "/hostProfileUpdate" })
public class HostProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//2.파일 업로드 - > multipart 체크
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류[enctype]");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
			return;
		}
		// 파일 업로드 준비
		// 파일 업로드 경로 지정
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/hostProfile";
		int maxSize = 1024*1024*10;
		// Multipartrequest로 변환
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Host h = new Host();
		h.setHostNo(Integer.parseInt(mRequest.getParameter("hostNo")));
		h.setUserNo(Integer.parseInt(mRequest.getParameter("userNo")));
		h.setHostName(mRequest.getParameter("hostName"));
		h.setHostContent(mRequest.getParameter("hostContent"));
		h.setHostFile(mRequest.getFilesystemName("hostFile"));
		// 기존 파일 경로
		String oldFilename = mRequest.getParameter("oldFilename");
		//삭제 로직 확인용 변수
		File f = mRequest.getFile("hostFile");
		if(f!=null &&f.length() >0) { //첨부파일이 있는 경우
			if(oldFilename != null) {
				File deleteFile = new File(saveDirectory+"/"+oldFilename);
				boolean bool = deleteFile.delete();
				System.out.println(bool?"삭제완료":"삭제실패");
			}
		}else {//첨부파일이 없는 경우
			File deleteFile = new File(saveDirectory+"/"+oldFilename);
			boolean bool = deleteFile.delete();
			h.setHostFile(oldFilename);
			System.out.println(bool?"삭제완료":"삭제실패");
		}
		int result = new HostService().hostUpdate(h);
		if(result>0) {
			request.setAttribute("msg", "수정성공");
			HttpSession session = request.getSession();
			session.setAttribute("host", h);
		}else {
			request.setAttribute("msg", "수정실패");
		}
		request.setAttribute("loc", "/");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
