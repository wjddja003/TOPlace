package helpSy.controller;

import java.io.IOException;

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
 * Servlet implementation class InsertHelpServlet
 */
@WebServlet(name = "InsertHelp", urlPatterns = { "/insertHelp" })
public class InsertHelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHelpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload\\notice";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"utf-8",new DefaultFileRenamePolicy());
		String type = mRequest.getParameter("type");
		String helpTitle = mRequest.getParameter("helpTitle");
		String helpContent = mRequest.getParameter("helpContent");
		String helpWriter = mRequest.getParameter("helpWriter");
		String filename = mRequest.getOriginalFileName("helpfilename");
		String filepath = mRequest.getFilesystemName("helpfilename");
		Help h = new Help(0, type, helpTitle, helpWriter, helpContent, null, filename, filepath);
		int result = new HelpService().insertHelp(h);
		System.out.println(result);
		if(result>0) {
			request.setAttribute("msg","도움말 등록 성공");
		}else {
			request.setAttribute("msg", "도움말 등록 실패");
		}
		request.setAttribute("loc", "/helpList");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
