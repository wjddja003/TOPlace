package toplace.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toplace.model.service.DeclareService;
import toplace.model.vo.Declare;

/**
 * Servlet implementation class InsertDeclareServlet
 */
@WebServlet(name = "InsertDeclare", urlPatterns = { "/insertDeclare" })
public class InsertDeclareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDeclareServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int s_no = Integer.parseInt(request.getParameter("S_no"));
		String s_placeName = request.getParameter("S_placeName");
		String declareType = request.getParameter("declareType");
		String userName = request.getParameter("userName");
		String declareContent = request.getParameter("declareContent");
		
		Declare d = new Declare(0, s_no, s_placeName, declareType, userName, declareContent);
		int result = new DeclareService().insertDeclare(d);
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.print(1);
		}else {
			out.print(0);
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
