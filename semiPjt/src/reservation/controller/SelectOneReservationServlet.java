package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import space.model.service.SpaceService;
import space.model.vo.Space;
import user.model.vo.User;

/**
 * Servlet implementation class SelectOneReservationServlet
 */
@WebServlet(name = "SelectOneReservation", urlPatterns = { "/selectOneReservation" })
public class SelectOneReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneReservationServlet() {
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
		if(u == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		}else {
			int S_no = Integer.parseInt(request.getParameter("S_no"));
			System.out.println(S_no);
			Space s = new SpaceService().selectOneSpace(S_no);
			
			if(s!=null) {
				System.out.println("가져오기 성공");
				request.setAttribute("s",s);
				
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservation.jsp");
				rd.forward(request, response);
			}else {
				System.out.println("가져오기 실패");
			}
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
