package qaSy.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qaSy.model.service.QaService;
import qaSy.model.vo.QaPageData;
import user.model.vo.User;

/**
 * Servlet implementation class AdminQaPageServlet
 */
@WebServlet(name = "AdminQaPage", urlPatterns = { "/adminQaPage" })
public class AdminQaPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQaPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (NumberFormatException e) {
			reqPage = 1;
		}
		QaPageData pd = new QaService().adminSelectAll(reqPage);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/adminQaPage.jsp");
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
