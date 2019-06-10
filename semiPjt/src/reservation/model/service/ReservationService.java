package reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationImg;
import reservation.model.vo.ReservationPageData;

public class ReservationService {

	public int insertReservation(Reservation r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().insertReservation(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Reservation> selectOneReservation(int S_no){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> rList = new ReservationDao().selectOneReservation(conn,S_no);
		if(rList!=null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return rList;
	}

	public ReservationPageData selectList(int reqPage,int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 4;
		int totalCount = new ReservationDao().totalCount(conn,userNo);
		System.out.println(totalCount);
		System.out.println(userNo);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<ReservationImg> list = new ReservationDao().selectList(conn, start, end,userNo);
		if(list == null) {
			System.out.println("문제가 아니길 빌자");
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/reservationList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/reservationList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/reservationList?reqPage="+pageNo+"'>다음</a>";
	}
	
	ReservationPageData pd = new ReservationPageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
	public ArrayList<Reservation> reservationSelect(int S_no, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> resList = new ReservationDao().reservationSelect(conn,S_no,userNo);
		JDBCTemplate.close(conn);
		return resList;

	}
}
