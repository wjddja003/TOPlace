package toplace.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.model.vo.Space;
import toplace.model.service.DetailSearchService;

/**
 * Servlet implementation class ViewsBestServlet
 */
@WebServlet(name = "ViewsBest", urlPatterns = { "/viewsBest" })
public class ViewsBestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewsBestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ArrayList<Space> hitList = new DetailSearchService().bestHitSearch();
		ArrayList<Space> likeList = new DetailSearchService().bestLikeSearch();
		request.setAttribute("hitList", hitList);
		request.setAttribute("likeList", likeList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/bestSearch.jsp");
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
