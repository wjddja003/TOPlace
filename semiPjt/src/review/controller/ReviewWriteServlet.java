package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.model.vo.Space;
import user.model.vo.User;

/**
 * Servlet implementation class ReviewWriteServlet
 */
@WebServlet(name = "ReviewWrite", urlPatterns = { "/reviewWrite" })
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int S_no = Integer.parseInt(request.getParameter("S_no"));
		String userId = request.getParameter("userId");
		Space s = new Space();
		User u = new User();
		u.setUserId(userId);
		s.setS_no(S_no);
		request.setAttribute("s", s);
		request.setAttribute("u",u);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/review/reviewWrite.jsp");
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
