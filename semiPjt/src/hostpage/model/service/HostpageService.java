package hostpage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import host.model.dao.HostDao;
import hostpage.model.dao.HostPageDao;
import hostpage.model.vo.HostDataPage;
import hostpage.model.vo.HostPageReservation;
import hostpage.model.vo.HostPaging;
import hostpage.model.vo.HostPagiongQA;
import hostpage.model.vo.Reservation2;
import qaSy.model.vo.QaComment;
import reservation.model.vo.Reservation;
import review.model.vo.Review;
import space.model.vo.Space;

public class HostpageService {

	public HostDataPage host(int shostNum) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Space> list = new HostPageDao().host(shostNum,conn);
		int count = new HostPageDao().count(shostNum,conn);
		HostDataPage hd = new HostDataPage(list, count);
		JDBCTemplate.close(conn);
		return hd;
	}

	public int delete(int s_no) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new HostPageDao().delete(s_no,conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public Space imgs(int s_no) {
		Connection conn = JDBCTemplate.getConnection();
		
		Space s = new HostPageDao().imgs(conn,s_no);
		
		
		
		JDBCTemplate.close(conn);
		return s;
	}

	public int more() {
	
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new HostDao().more(conn);
		
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Space> hostmore(int start, int s_hostNum) {
		
		Connection conn = JDBCTemplate.getConnection();
		int length= 3;
		ArrayList<Space> list = new HostPageDao().hostmore(conn,start,start+length-1,s_hostNum);
		JDBCTemplate.close(conn);
		return list;
	}
	

	public HostPaging userPaging(int reqPage, int shostNum) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3;   //게시물의 숫자
		int totalCount = new HostPageDao().totalCount(conn,shostNum);  //총개시물을 나ㅏ타낸다
		
		int totalpge = 0;
		
		if(totalCount%numPerPage==0){ //게시물 5개 나누고 밑에 하나씩 추가하는것들
			totalpge = (totalCount)/(numPerPage);
		}else {
			totalpge = (totalCount)/(numPerPage)+1;
		}
		int start = (reqPage-1)*numPerPage+1;   
		int end = reqPage*numPerPage; 
		ArrayList<Review> list = new HostPageDao().selectList(conn,start,end,shostNum);
		String pageNavi ="";
		int pageNaviSize = 5;    // <1 2 3 4 5 ?> 
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {											
			pageNavi += "<a class='pageBtn' href='/hostPage?reqPage="+(pageNo-1)+"&ShostNum="+shostNum+"'>이전</a>";
		}
		
		int i = 1; 
		while( !(i++>pageNaviSize || pageNo>totalpge)) {  
			if(reqPage == pageNo) { 
				 pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageBtn' href='/hostPage?reqPage="+pageNo+"&ShostNum="+shostNum+"'>"+pageNo+"</a>"; 
						//pageno 2개 = 하나는 볼것 하나는 값 전달할것
			}
			pageNo++;
		}
		if(pageNo <= totalpge) {
			pageNavi +="<a class='pageBtn' href='/hostPage?reqPage="+(pageNo)+"&ShostNum=+"+shostNum+"+'>다음</a>";
		}
		
		HostPaging hp = new HostPaging(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return hp;
	}

	public ArrayList<QaComment> Qalist(int shostNum) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QaComment> list = new HostPageDao().Qalist(conn,shostNum);
		
		JDBCTemplate.close(conn);
		
		return list;
	
	}

	public HostPagiongQA qalistPaging(int reqPage, int shostNum) {
		
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3;   //게시물의 숫자
		int totalCount = new HostPageDao().totalCount2(conn,shostNum);  //총개시물을 나ㅏ타낸다
		
		int totalpge = 0;
		
		if(totalCount%numPerPage==0){ //게시물 5개 나누고 밑에 하나씩 추가하는것들
			totalpge = (totalCount)/(numPerPage);
		}else {
			totalpge = (totalCount)/(numPerPage)+1;
		}
		int start = (reqPage-1)*numPerPage+1;   
		int end = reqPage*numPerPage; 
		ArrayList<QaComment> list = new HostPageDao().qalistPaging(conn,start,end,shostNum);
		String pageNavi ="";
		int pageNaviSize = 5;    // <1 2 3 4 5 ?> 
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {											
			pageNavi += "<a class='btn' href='/hostPage?reqPage="+(pageNo-1)+"&ShostNum="+shostNum+"'>이전</a>";
		}
		int i = 1; 
		while( !(i++>pageNaviSize || pageNo>totalpge)) {  
			if(reqPage == pageNo) { 
				 pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/hostPage?reqPage="+pageNo+"&ShostNum="+shostNum+"'>"+pageNo+"</a>"; 
						//pageno 2개 = 하나는 볼것 하나는 값 전달할것
			}
			pageNo++;
		}
		if(pageNo <= totalpge) {
			pageNavi +="<a class='btn' href='/hostPage?reqPage="+(pageNo)+"&ShostNum=+"+shostNum+"+'>다음</a>";
		}
		
		HostPagiongQA hqa = new HostPagiongQA(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return hqa;
	}

	public ArrayList<Reservation2> hostreservationList(int hostNum) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation2> list = new HostPageDao().hostreservationList(conn,hostNum);
		
	
		JDBCTemplate.close(conn);
		return list;
	}

	

	

}
