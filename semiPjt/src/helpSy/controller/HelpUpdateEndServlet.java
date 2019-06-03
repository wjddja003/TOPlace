package helpSy.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import helpSy.model.service.HelpService;
import helpSy.model.vo.Help;

/**
 * Servlet implementation class HelpUpdateEndServlet
 */
@WebServlet(name = "HelpUpdateEnd", urlPatterns = { "/helpUpdateEnd" })
public class HelpUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류[enctype]");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/notice";
		int maxSize = 1024*1024*10;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"utf-8",new DefaultFileRenamePolicy());
		int helpNo = Integer.parseInt(mRequest.getParameter("helpNo"));
		String helpCategory = mRequest.getParameter("type");
		String helpTitle = mRequest.getParameter("helpTitle");
		String helpContent = mRequest.getParameter("helpContent");
		String filename = mRequest.getOriginalFileName("filename");
		String filepath = mRequest.getFilesystemName("filename");
		String oldFilename = mRequest.getParameter("oldFilename");
		String oldFilepath = mRequest.getParameter("oldFilepath");
		String status = mRequest.getParameter("status");
		File f = mRequest.getFile("filename");
		if(f!=null && f.length()>0) {
			if(oldFilename != null) {
				File deleteFile = new File(saveDirectory+"/"+oldFilepath);
				boolean bool = deleteFile.delete();
				System.out.println(bool?"삭제성공":"삭제 실패");
			}
		}else {
			if(status.equals("stay")) {
				filename = oldFilename;
				filepath = oldFilepath;
			}else {
				File deleteFile = new File(saveDirectory+"/"+oldFilepath);
				boolean bool = deleteFile.delete();
				System.out.println(bool?"삭제성공":"삭제 실패");
			}
		}
		Help h = new Help(helpNo,helpCategory, helpTitle, null, helpContent, null, filename, filepath);
		int result = new HelpService().updateHelp(h);
		if(result>0) {
			request.setAttribute("msg", "공지사항 수정 완료");
		}else {
			request.setAttribute("msg", "공지사항 수정 실패");
		}
		request.setAttribute("loc", "/helpList?helpNo="+helpNo);
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
