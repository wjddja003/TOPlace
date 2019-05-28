package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User u = new User();
		u.setUserId(request.getParameter("userId"));
		u.setUserPw(request.getParameter("userPw"));
		u.setUserName(request.getParameter("userName"));
		u.setUserBirthday(request.getParameter("year") + request.getParameter("month") + request.getParameter("day"));
		u.setUserPhone(request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2"));
		u.setUserEmail(request.getParameter("email"));
		u.setUserGender(request.getParameter("gender").toUpperCase());
		System.out.println(request.getParameter("gender"));
		u.setUserAddressNumber(Integer.parseInt(request.getParameter("addrNum")));
		u.setUserAddress(request.getParameter("address"));
		u.setUserSMS(request.getParameter("termsEmail"));
		int result = new UserService().join(u);
		if(result > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
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
