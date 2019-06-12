package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.model.service.ReviewService;
import review.model.vo.ReviewPageData;
import user.model.vo.User;

/**
 * Servlet implementation class AdminReviewPageServlet
 */
@WebServlet(name = "AdminReviewPage", urlPatterns = { "/adminReviewPage" })
public class AdminReviewPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewPageServlet() {
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
		ReviewPageData pd = new ReviewService().adminSelectAll(reqPage);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/adminReviewPage.jsp");
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
