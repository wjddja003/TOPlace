package qaSy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qaSy.model.service.QaService;
import qaSy.model.vo.QaComment;

/**
 * Servlet implementation class QaCommentUpdateEndServlet
 */
@WebServlet(name = "QaCommentUpdateEnd", urlPatterns = { "/qaCommentUpdateEnd" })
public class QaCommentUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaCommentUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		QaComment q = new QaComment();
		q.setQaCommentNo(Integer.parseInt(request.getParameter("qaCommentNo")));
		q.setQaCommentContent(request.getParameter("qaCommentContent"));
		int result = new QaService().updateQaComment(q);
		if(result>0) {
			request.setAttribute("msg", "수정 완료");
		}else {
			request.setAttribute("msg", "수정 실패");
		}
		request.setAttribute("loc", "/qaView");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
