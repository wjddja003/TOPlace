package host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import host.model.service.HostService;
import host.model.vo.Host;
import user.model.service.UserService;

/**
 * Servlet implementation class HostProfileServlet
 */
@WebServlet(name = "HostProfile", urlPatterns = { "/hostProfile" })
public class HostProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/"); //절대경로 읽어옴
		String saveDirectory = root+"upload\\hostProfile";
		System.out.println(saveDirectory);
		int maxSize = 110*1024*1024; //(10MB)x11
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		int userNo = Integer.parseInt(mRequest.getParameter("userNo"));
		Host h = new Host();
		h.setUserNo(userNo);
		h.setHostFile(mRequest.getFilesystemName("hostFile"));
		h.setHostName(mRequest.getParameter("hostName"));
		h.setHostContent(mRequest.getParameter("hostComtent"));
		int result = new HostService().hostJoin(h);
		if(result > 0) {
			System.out.println("등록 성공");
			int updateResult = new UserService().gradeUpdate(userNo); 
			if(updateResult > 0) {
				System.out.println("등급 업데이트 성공");
			}else {
				System.out.println("등급 업데이트 실패");
			}
		}else {
			System.out.println("등록 실패");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
