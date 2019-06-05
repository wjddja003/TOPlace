package space.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.model.service.ReviewService;
import review.model.vo.ReviewPageData;
import space.model.service.SpaceService;
import space.model.vo.Space;
import user.model.vo.User;
import view.model.service.LikeService;
import view.model.vo.Like;

/**
 * Servlet implementation class SelectOneSpaceServlet
 */
@WebServlet(name = "SelectOneSpace", urlPatterns = { "/selectOneSpace" })
public class SelectOneSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneSpaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("User");  // 세션 값 받아오기
		int userNo = u.getUserNo();		
		int S_no = Integer.parseInt(request.getParameter("S_no"));
		System.out.println(S_no);
		Space s = new SpaceService().selectOneSpace(S_no);
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		ReviewPageData pd = new ReviewService().selectList(reqPage);
		Like l = new LikeService().selectLike(S_no,userNo); // 좋아요 체크 확인
		if(s!=null) {
			System.out.println("가져오기 성공");
			request.setAttribute("s",s);
			request.setAttribute("l",l);
			request.setAttribute("pd",pd);
			RequestDispatcher rd = request.getRequestDispatcher("/views/viewpage.jsp");
			rd.forward(request, response);
		}else {
			System.out.println("가져오기 실패");
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
