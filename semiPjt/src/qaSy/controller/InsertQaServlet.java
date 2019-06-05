package qaSy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qaSy.model.service.QaService;
import qaSy.model.vo.QaComment;

/**
 * Servlet implementation class InsertQaServlet
 */
@WebServlet(name = "InsertQa", urlPatterns = { "/insertQa" })
public class InsertQaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String qaCommentWriter = request.getParameter("qaCommentWriter");
		String qaCommentContent = request.getParameter("qaCommentContent");
		System.out.println(qaCommentWriter);
		System.out.println(qaCommentContent);
		QaComment qc = new QaComment(0, qaCommentWriter, qaCommentContent, 0, null,0);
		int result = new QaService().insertQa(qc);
		if(result>0) {
			request.setAttribute("msg","등록 성공");
		}else {
			request.setAttribute("msg","등록 실패");
		}
		
		request.setAttribute("loc", "/qaMngment");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
