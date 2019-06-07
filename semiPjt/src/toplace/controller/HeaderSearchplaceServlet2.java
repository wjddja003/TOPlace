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
 * Servlet implementation class HeaderSearchplaceServlet2
 */
@WebServlet(name = "HeaderSearchplace2", urlPatterns = { "/headerSearchplace2" })
public class HeaderSearchplaceServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeaderSearchplaceServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		int inputType = Integer.parseInt(request.getParameter("inputType"));
		String type = request.getParameter("type");
		ArrayList<Space> list = new DetailSearchService().detailSearch(inputType,index,type);	
		request.setAttribute("type", type);
		request.setAttribute("index", index);
		request.setAttribute("inputType", inputType);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/views/apiTest4.jsp");
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
