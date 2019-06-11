package reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helpSy.model.service.HelpService;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class InsertReservationServlet
 */
@WebServlet(name = "insertReservation", urlPatterns = { "/insertReservation" })
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int S_no = Integer.parseInt(request.getParameter("S_no"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String reservationName = request.getParameter("reservationName");
		String reservationDay = request.getParameter("reservationDay");
		String reservationBooker = request.getParameter("reservationBooker");
		String reservationPhone = request.getParameter("reservationPhone");
		String reservationPhone1 = request.getParameter("reservationPhone1");
		String reservationPhone2 = request.getParameter("reservationPhone2");
		String reservationTime = request.getParameter("reservationTime");
		reservationTime = reservationTime.replace("undefined","");
		int reservationPerson = Integer.parseInt(request.getParameter("reservationPerson"));
		String reservationOption = request.getParameter("reservationOption");
		String reservationRequest = request.getParameter("reservationRequest");
		String paymentId = request.getParameter("paymentId");
		int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));
		String paymentCard = request.getParameter("paymentCard");
		
		Reservation r = new Reservation(0, S_no, userNo, reservationName, reservationDay, reservationBooker, reservationPhone, reservationPhone1, reservationPhone2, reservationTime, reservationPerson, reservationOption, reservationRequest, paymentId, paymentPrice, paymentCard);
		int result = new ReservationService().insertReservation(r);
		System.out.println(result);
		if(result>0) {
			request.setAttribute("msg","예약 성공");
		}else {
			request.setAttribute("msg", "예약 실패");
		}
		request.setAttribute("loc", "/");
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
