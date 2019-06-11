package qaSy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qaSy.model.service.QaService;

/**
 * Servlet implementation class QaViewpageDeleteServlet
 */
@WebServlet(name = "QaViewpageDelete", urlPatterns = { "/qaViewpageDelete" })
public class QaViewpageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaViewpageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int s_no = Integer.parseInt(request.getParameter("S_no"));
		int qaCommentNo = Integer.parseInt(request.getParameter("qaCommentNo"));
		int result = new QaService().deleteQa(qaCommentNo);
		response.sendRedirect("/selectOneSpace?S_no="+s_no);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
