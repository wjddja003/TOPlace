package review.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet(name = "InsertReview", urlPatterns = { "/insertReview" })
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업로드 실패");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/review";
		
		int maxSize = 10*1024*1024;
		
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"utf-8",new DefaultFileRenamePolicy());
		int reviewSno = Integer.parseInt(mRequest.getParameter("reviewSno"));
		String reviewTitle = mRequest.getParameter("reviewTitle");
		String reviewContent = mRequest.getParameter("reviewContent");
		String reviewWriter = mRequest.getParameter("reviewWriter");
		int reviewStar = Integer.parseInt(mRequest.getParameter("reviewStar"));
		String filename = mRequest.getFilesystemName("filename");
		Review r = new Review(0,reviewSno,reviewTitle,reviewWriter,reviewContent,filename,reviewStar,null);
		int result = new ReviewService().insertReview(r);
		if(result>0) {
			request.setAttribute("msg", "리뷰등록 성공");
			System.out.println("insert into review values(seq_review_no.nexval,"+reviewSno+",'"+reviewTitle+"','"+reviewWriter+"','"+reviewContent+"','"+filename+"',sysdate);");
		}else {
			request.setAttribute("msg","리뷰등록실패");
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
