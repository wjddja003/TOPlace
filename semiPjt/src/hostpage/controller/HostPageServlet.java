package hostpage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import host.model.service.HostService;
import hostpage.model.service.HostpageService;
import hostpage.model.vo.HostDataPage;
import hostpage.model.vo.HostPaging;
import space.model.vo.Space;


/**
 * Servlet implementation class HostPageServlet
 */
@WebServlet(name = "HostPage", urlPatterns = { "/hostPage" })
public class HostPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		request.setCharacterEncoding("UTF-8");
		//2	
		int ShostNum = Integer.parseInt(request.getParameter("ShostNum"));
		int totalCount = new HostpageService().more();
		HostDataPage hd  = new HostpageService().host(ShostNum);
		HostPaging hp = new HostpageService().userPaging(ShostNum);
		request.setAttribute("hd", hd);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("hp", hp);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hostpage.jsp");
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
