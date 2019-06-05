package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.ReviewViewData;

/**
 * Servlet implementation class ReviewViewServlet
 */
@WebServlet(name = "ReviewView", urlPatterns = { "/reviewView" })
public class ReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			ReviewViewData rvd = new ReviewService().selectOne(reviewNo);
			String view="";
			if(rvd.getR() != null) {
				request.setAttribute("rvd", rvd);
				view = "/views/viewpage.jsp";
			}else {
				request.setAttribute("msg", "공지사항이 없습니다.");
				request.setAttribute("loc","/reviewList");
				view ="/WEB-INF/views/common/msg.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(view);
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
