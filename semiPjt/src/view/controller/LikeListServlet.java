package view.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import space.model.service.SpaceService;
import space.model.vo.Space;
import user.model.vo.User;
import view.model.service.LikeService;
import view.model.vo.LikeImg;
import view.model.vo.LikePageData;

/**
 * Servlet implementation class LikeListServlet
 */
@WebServlet(name = "LikeList", urlPatterns = { "/likeList" })
public class LikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeListServlet() {
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
			int userNo = u.getUserNo();
			int reqPage;
			try {
				reqPage = Integer.parseInt(request.getParameter("reqPage"));
			}catch (NumberFormatException e) {
				reqPage = 1;
			}
			LikePageData pd = new LikeService().selectList(reqPage,userNo);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/like/likeList.jsp");
			request.setAttribute("pd", pd);
			rd.forward(request,response);
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
