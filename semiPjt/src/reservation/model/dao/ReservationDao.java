package reservation.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import reservation.model.vo.Reservation;

public class ReservationDao {
	private Properties prop = new Properties();
//	public ReservationDao() {
//		String fileName = Reservation.class.getResource("/sql/reservation/reservationQuery2.properties").getPath();
//		System.out.println(fileName);
//		try {
//			prop.load(new FileReader(fileName));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	public int insertReservation(Connection conn,Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into reservation values(r_no_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getS_no());
			pstmt.setInt(2, r.getUserNo());
			pstmt.setString(3, r.getReservationName());
			pstmt.setString(4, r.getReservationDay());
			pstmt.setString(5, r.getReservationBooker());
			pstmt.setString(6, r.getReservationTime());
			pstmt.setInt(7, r.getReservationPerson());
			pstmt.setString(8, r.getReservationOption());
			pstmt.setString(9, r.getPaymentId());
			pstmt.setInt(10, r.getPaymentPrice());
			pstmt.setString(11, r.getPaymentCard());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<Reservation> selectOneReservation(Connection conn,int S_no){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reservation> rList = null;
		String query = "select * from reservation where S_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			rset = pstmt.executeQuery();
			rList = new ArrayList<Reservation>();
			while(rset.next()) {
				Reservation r = new Reservation();
				r.setS_no(rset.getInt("S_no"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReservationName(rset.getString("reservation_name"));
				r.setReservationDay(rset.getString("reservation_day"));
				r.setReservationBooker(rset.getString("reservation_booker"));
				r.setReservationTime(rset.getString("reservation_time"));
				r.setReservationPerson(rset.getInt("reservation_person"));
				r.setReservationOption(rset.getString("reservation_option"));
				r.setPaymentId(rset.getString("payment_id"));
				r.setPaymentPrice(rset.getInt("payment_price"));
				r.setPaymentCard(rset.getString("payment_card"));
				rList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return rList;
	}
	public ArrayList<Reservation> reservationSelect(Connection conn, int S_no, int userNo){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reservation> resList = null;
		String query = "select * from reservation where S_no=? and user_No=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			resList = new ArrayList<Reservation>();
			while(rset.next()) {
				Reservation r = new Reservation();
				r.setS_no(rset.getInt("S_no"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReservationName(rset.getString("reservation_name"));
				r.setReservationDay(rset.getString("reservation_day"));
				r.setReservationBooker(rset.getString("reservation_booker"));
				r.setReservationTime(rset.getString("reservation_time"));
				r.setReservationPerson(rset.getInt("reservation_person"));
				r.setReservationOption(rset.getString("reservation_option"));
				r.setPaymentId(rset.getString("payment_id"));
				r.setPaymentPrice(rset.getInt("payment_price"));
				r.setPaymentCard(rset.getString("payment_card"));
				resList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return resList;		
	}
}
