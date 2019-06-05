package view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.model.service.SpaceService;
import view.model.service.LikeService;
import view.model.vo.Like;

/**
 * Servlet implementation class LikeInsertAjaxServlet
 */
@WebServlet(name = "LikeInsertAjax", urlPatterns = { "/likeInsertAjax" })
public class LikeInsertAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeInsertAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Like l = new Like();
		l.setsNo(Integer.parseInt(request.getParameter("S_no")));
		l.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		int result = new LikeService().likeInsert(l);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print(1);
			System.out.println("좋아요 추가 완료");
			int likeUpdate = new SpaceService().likeUpdate(l);
			if( likeUpdate > 0) {
				System.out.println("좋아요 count++ 업데이트 완료");
			}else {
				System.out.println("좋아요 count++ 업데이트 실패");
			}
		}else{
			out.print(0);
			System.out.println("좋아요 추가 실패");
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
