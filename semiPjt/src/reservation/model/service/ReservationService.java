package reservation.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;

public class ReservationService {
	public int insertReservation(Reservation r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().insertSpace(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
