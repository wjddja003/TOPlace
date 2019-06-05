package qaSy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qaSy.model.service.QaService;
import qaSy.model.vo.QaComment;

/**
 * Servlet implementation class QaCommentUpdateServlet
 */
@WebServlet(name = "QaCommentUpdate", urlPatterns = { "/qaCommentUpdate" })
public class QaCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int qaCommentNo = Integer.parseInt(request.getParameter("qaCommentNo"));
		
		QaComment q = new QaService().selectOne(qaCommentNo);
		request.setAttribute("qaComment", q);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/qna/qaCommentUpdate.jsp");
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