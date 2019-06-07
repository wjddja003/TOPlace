package reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

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
	public ArrayList<Reservation> reservationSelect(int S_no, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> resList = new ReservationDao().reservationSelect(conn,S_no,userNo);
		JDBCTemplate.close(conn);
		return resList;
	}
}
