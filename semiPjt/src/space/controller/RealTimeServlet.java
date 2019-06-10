package space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import space.model.service.SpaceService;
import space.model.vo.Space;

/**
 * Servlet implementation class RealTimeServlet
 */
@WebServlet(name = "RealTime", urlPatterns = { "/realTime" })
public class RealTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<Space> sList = new SpaceService().ranking();
		request.setAttribute("sList", sList); // 타입을 json으로 바꿔줘야됨
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// DTO 타입의 어레이리스트를 json 형태로 바꿔주는 구문(라이브러리 필수, zip->jar 확장자명 꼭 확인)
		String gson = new Gson().toJson(sList);

		try {
			// ajax로 리턴해주는 부분
			response.getWriter().write(gson);
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
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
