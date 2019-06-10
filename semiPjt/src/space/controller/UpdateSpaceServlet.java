package space.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import space.model.service.SpaceService;
import space.model.vo.Space;

/**
 * Servlet implementation class UpdateSpaceServlet
 */
@WebServlet(name = "UpdateSpace", urlPatterns = { "/updateSpace" })
public class UpdateSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSpaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/"); //절대경로 읽어옴
		String saveDirectory = root+"upload\\space";
		System.out.println(saveDirectory);
		int maxSize = 110*1024*1024; //(10MB)x11
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		int S_no = Integer.parseInt(mRequest.getParameter("S_no")); //공간번호(DB에 삽입 쿼리 시, 시퀀스로 증가)
		System.out.println("공간 번호 : "+S_no);
		int S_hostNum = Integer.parseInt(mRequest.getParameter("S_hostNum")); //세션에서 가져 올 호스트명 or 멤버명
		System.out.println("호스트번호 : " + S_hostNum);
		String S_placeName = mRequest.getParameter("S_placeName");//공간명
		System.out.println("공간명 : "+S_placeName);
		String S_kategorie1 = mRequest.getParameter("S_kategorie1");//공간유형(카테고리1) (회의실,세미나실,다목적홀,작업실,레저시설,파티룸,공연장,연습실,카페,스터디룸,엠티장소,루프탑)
		System.out.println("공간유형 : " + S_kategorie1);
		String S_placeIntroduce1 = mRequest.getParameter("S_placeIntroduce1"); //공간 한줄 소개
		System.out.println("공간 한줄 소개 : " + S_placeIntroduce1);
		String S_placeIntroduce2 = mRequest.getParameter("S_placeIntroduce2"); //공간소개(시설안내)
		System.out.println("공간 소개 : " + S_placeIntroduce2);
		String S_placeTag = mRequest.getParameter("S_placeTag"); //공간태그
		System.out.println("공간 태그 : " + S_placeTag);
		String S_kategorie2 = mRequest.getParameter("S_kategorie2"); //편의시설(카테고리2)
		System.out.println("편의 시설 : " + S_kategorie2);
		String S_placeWeb = mRequest.getParameter("S_placeWeb"); //웹사이트
		System.out.println("웹사이트 : " + S_placeWeb);
		
		String[] img = mRequest.getParameter("S_img").split(",");
		String[] imgupdate = mRequest.getParameter("S_imgupdate").split(",");
		String[] imgdelete = mRequest.getParameter("S_imgdelete").split(",");
		
		String formname="";
		ArrayList<String> S_img = new ArrayList<String>();
		Enumeration forms = mRequest.getFileNames();
		while(forms.hasMoreElements()) {
			formname=(String)forms.nextElement();
			S_img.add(mRequest.getFilesystemName(formname));
		}
		 //대표이미지(이미지1)
		String S_img1;
		if(imgupdate[0].equals("true")) {
			S_img1 = S_img.get(10);
		}else {
			S_img1 = img[0];
		}
		System.out.println("대표이미지 : " + S_img1);
		
		String S_img2 = "";
		boolean img2check = false;
		for(int i=1;i<imgupdate.length;i++) {
			if(imgupdate[i].equals("true")) {
				img2check=true;
				break;
			}
		}
		if(img2check) {
			for(int i = 1; i<img.length;i++) {
				if(img[i].equals(imgdelete[i])) {
					continue;
				}
				S_img2 += img[i]+",";
			}
			for(int i = 9; i>= 0;i--) {
				if(S_img.get(i)!=null) {
					S_img2 += S_img.get(i)+",";
				}
			}
		}else {
			for(int i = 1; i<img.length;i++) {
				S_img2 += img[i]+",";
			}
			for(int i = 9; i>= 0;i--) {
				if(S_img.get(i)!=null) {
					S_img2 += S_img.get(i)+",";
				}
			}
		}
		if(!S_img2.equals("")) {
			S_img2 = S_img2.substring(0, S_img2.length()-1); //이미지(이미지2)
		}
		for(int i =0; i<imgdelete.length;i++) {
			if(imgdelete[i].equals("0")) {
				continue;
			}
			File file = new File(saveDirectory+"\\"+imgdelete[i]);
	         
	        if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }
	             
		}  
		System.out.println("이미지 : " + S_img2);
		
		int addrNum = Integer.parseInt(mRequest.getParameter("addrNum")); //지번
		System.out.println("우편번호 : " + addrNum);
		String address = mRequest.getParameter("address"); //주소
		System.out.println("상세주소 : " + address);
		
		String S_email = mRequest.getParameter("S_email"); //이메일
		System.out.println("이메일 : " + S_email);
		String S_phone1 = mRequest.getParameter("S_phone1"); //휴대폰
		System.out.println("휴대폰 : " + S_phone1);
		String S_phone2 = mRequest.getParameter("S_phone2"); //대표전화
		System.out.println("대표전화 : " + S_phone2);
		
		String S_type = mRequest.getParameter("S_type"); //예약유형
		System.out.println("예약유형 : " + S_type);
		int S_start = Integer.parseInt(mRequest.getParameter("S_start")); //이용시작시간
		System.out.println("이용시작시간 : " + S_start);
		int S_end = Integer.parseInt(mRequest.getParameter("S_end")); //이용종료시간
		System.out.println("이용종료시간 : " + S_end);
		String S_holiday = mRequest.getParameter("S_holiday"); //정기 휴무
		System.out.println("정기 휴무 : " + S_holiday);
		int S_people = Integer.parseInt(mRequest.getParameter("S_people")); //최대수용인원
		System.out.println("최대 수용 인원 : " + S_people);
		String S_warning = mRequest.getParameter("S_warning"); //예약 시 주의사항
		System.out.println("예약 시 주의사항 : " + S_warning);
		
		int S_price1 = Integer.parseInt(mRequest.getParameter("S_price1")); //시간당,종일 대여 가격
		System.out.println("시간당/종일 대여 가격 : " + S_price1);
		int S_price2 = Integer.parseInt(mRequest.getParameter("S_price2")); //1인당 추가 가격
		System.out.println("1인당 추가 가격 : " + S_price2);
		
		Space s = new Space(S_no, S_hostNum, S_placeName, S_kategorie1, S_placeIntroduce1, S_placeIntroduce2, S_placeTag, S_kategorie2, S_placeWeb, S_img1, S_img2, addrNum, address, S_email, S_phone1, S_phone2, S_type, S_start, S_end, S_holiday, S_people, S_warning, S_price1, S_price2, 0, 0);
		int result = new SpaceService().updateSpace(s);
		if(result>0) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
		}
		response.sendRedirect("/");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
