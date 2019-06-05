package review.controller;

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
import review.model.service.ReviewService;
import review.model.vo.ReviewPageData;
import user.model.vo.User;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet(name = "ReviewList2", urlPatterns = { "/reviewList2" })
public class ReviewListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("User");
		if(u == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		}else {
			
			System.out.println(u.getUserId());
			String userId = u.getUserId();
			int reqPage;
			try {
				reqPage = Integer.parseInt(request.getParameter("reqPage"));
			}catch (NumberFormatException e) {
				reqPage = 1;
			}
			
			ReviewPageData pd = new ReviewService().selectRList(reqPage,userId);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp");
			request.setAttribute("pd", pd);
			rd.forward(request, response);
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
