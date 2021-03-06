package qaSy.model.controller;

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
import user.model.vo.User;

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

	    HttpSession session = request.getSession();
	    User u = (User)session.getAttribute("User");
	    String qaCommentWriter = u.getUserId();
		String qaCommentContent = request.getParameter("qaCommentContent");
		System.out.println(qaCommentWriter);
		System.out.println(qaCommentContent);
		
		int ref = Integer.parseInt(request.getParameter("S_no"));
		System.out.println(ref);
		QaComment qc = new QaComment(0, qaCommentWriter, qaCommentContent, ref, null, 0);
		int result = new QaService().insertQa(qc);
		if(result>0) {
			request.setAttribute("msg","등록 성공");
		}else {
			request.setAttribute("msg","등록 실패");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/qna/qaWrite.jsp");
		request.setAttribute("loc", "/selectOneSpace?S_no="+ref);
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
