package space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertSpaceServlet
 */
@WebServlet(name = "InsertSpace", urlPatterns = { "/insertSpace" })
public class InsertSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSpaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/"); //절대경로 읽어옴
		String saveDirectory = root+"upload/space";
		System.out.println(saveDirectory);
		int maxSize = 100*1024*1024; //(10MB)
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		String S_placeName = mRequest.getParameter("S_placeName");
		System.out.println(S_placeName);
		//String S_img1 = mRequest.getFilesystemName("S_img1");
		//System.out.println(S_img1);
		String formname="";
		ArrayList<String> S_img2 = new ArrayList<String>();
		Enumeration forms = mRequest.getFileNames();
		while(forms.hasMoreElements()) {
			formname=(String)forms.nextElement();
			S_img2.add(mRequest.getFilesystemName(formname));
		}
		System.out.println(S_img2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
