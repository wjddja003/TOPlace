package review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet(name = "ReviewUpdate", urlPatterns = { "/reviewUpdate" })
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류[enctype]");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/review";
		int maxSize = 1024*1024*10;
		
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Review r = new Review();
		r.setReviewNo(Integer.parseInt(mRequest.getParameter("review_no")));
		r.setReviewTitle(mRequest.getParameter("review_title"));
		r.setReviewWriter(mRequest.getParameter("review_writer"));
		r.setReviewContent(mRequest.getParameter("review_content"));
		r.setFilename(mRequest.getFilesystemName("filename"));
		
		String oldFilename = mRequest.getParameter("oldFilename");
		
		File f = mRequest.getFile("filename");
		if(f!=null && f.length() > 0) {
			if(oldFilename != null) {
				File deleteFile = new File(saveDirectory+"/"+oldFilename);
				boolean bool = deleteFile.delete();
				System.out.println(bool?"삭제완료":"삭제실패");
			}
		}else {
			File deleteFile = new File(saveDirectory+"/"+oldFilename);
			boolean bool = deleteFile.delete();
			System.out.println(bool?"삭제완료":"삭제실패");
		}
		int result = new ReviewService().reviewUpdate(r);
		if(result>0) {
			request.setAttribute("msg","수정성공");
			HttpSession session = request.getSession();
			session.setAttribute("rv", r);
		}else {
			request.setAttribute("msg", "수정실패");
		}
		request.setAttribute("loc","/");
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
