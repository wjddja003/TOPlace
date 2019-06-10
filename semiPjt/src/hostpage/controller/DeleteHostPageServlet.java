package hostpage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import host.model.vo.Host;
import hostpage.model.service.HostpageService;
import space.model.vo.Space;

/**
 * Servlet implementation class DeleteHostPageServlet
 */
@WebServlet(name = "DeleteHostPage", urlPatterns = { "/deleteHostPage" })
public class DeleteHostPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHostPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		Space s = new HostpageService().imgs(s_no);
		String root = getServletContext().getRealPath("/");      //절대경로를 읽어오는 메소드(webcontent까지 읽어옴)
		
		ArrayList<String> list = s.getDelImg();
		list.add(s.getS_img1());
		
		for(int i = 0; i<list.size();i++) {
			File file = new File(root+"upload/space/"+list.get(i));
			
			if( file.exists() ){
		        if(file.delete()){
		              System.out.println("파일삭제 성공");
		       }else{
		              System.out.println("파일삭제 실패");
		            }
		    }else{
		     		 System.out.println("파일이 존재하지 않습니다.");
		        }
		}

		int result = new HostpageService().delete(s_no);
		HttpSession session = request.getSession();
		Host h = (Host)session.getAttribute("host");
		
		if(result>0) {
			request.setAttribute("result", result);
			RequestDispatcher rd = request.getRequestDispatcher("/hostPage?ShostNum="+h.getHostNo());
			rd.forward(request, response);
			
			
			
		}else {
			System.out.println("실패");
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
