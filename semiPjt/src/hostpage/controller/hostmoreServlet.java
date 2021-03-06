package hostpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import host.model.vo.Host;
import hostpage.model.service.HostpageService;
import space.model.vo.Space;

/**
 * Servlet implementation class hostmoreServlet
 */
@WebServlet(name = "Hostmore", urlPatterns = { "/hostmore" })
public class hostmoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hostmoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Host h = (Host)session.getAttribute("host");
		int S_hostNum = h.getHostNo();
		int start = Integer.parseInt(request.getParameter("start"));
		ArrayList<Space> list = new HostpageService().hostmore(start,S_hostNum);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
