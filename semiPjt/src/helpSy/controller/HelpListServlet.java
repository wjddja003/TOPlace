package helpSy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpSy.model.service.HelpService;
import helpSy.model.vo.HelpPageData;

/**
 * Servlet implementation class HelpServlet
 */
@WebServlet(name = "HelpList", urlPatterns = { "/helpList" })
public class HelpListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (NumberFormatException e) {
			reqPage = 1;
		}
		HelpPageData pd = new HelpService().selectList(reqPage);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/help/helpList.jsp");
		request.setAttribute("pd", pd);
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
