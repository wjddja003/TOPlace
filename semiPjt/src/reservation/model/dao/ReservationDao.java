package reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationImg;

public class ReservationDao {

	public int insertReservation(Connection conn,Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into reservation values(r_no_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getS_no());
			pstmt.setInt(2, r.getUserNo());
			pstmt.setString(3, r.getReservationName());
			pstmt.setString(4, r.getReservationDay());
			pstmt.setString(5, r.getReservationBooker());
			pstmt.setString(6, r.getReservationPhone());
			pstmt.setString(7, r.getReservationPhone1());
			pstmt.setString(8, r.getReservationPhone2());
			pstmt.setString(9, r.getReservationTime());
			pstmt.setInt(10, r.getReservationPerson());
			pstmt.setString(11, r.getReservationOption());
			pstmt.setString(12, r.getReservationRequest());
			pstmt.setString(13, r.getPaymentId());
			pstmt.setInt(14, r.getPaymentPrice());
			pstmt.setString(15, r.getPaymentCard());
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

	public int totalCount(Connection conn,int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from reservation where user_no = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<ReservationImg> selectList(Connection conn, int start,int end,int userNo){
		ArrayList<ReservationImg> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, m.* from (select r.*,S_img1,s_placename from reservation r join place p on (r.s_no = p.S_no) where user_no = ? order by reservation_no desc) m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<ReservationImg>();
			while(rset.next()) {
				ReservationImg r = new ReservationImg();
			
				r.setReservationNo(rset.getInt("reservation_no"));
				r.setS_no(rset.getInt("s_no"));
				r.setUserNo(rset.getInt("user_no"));
				r.setReservationName(rset.getString("reservation_name"));
				r.setReservationDay(rset.getString("reservation_day"));
				r.setImg(rset.getString("s_img1"));
				r.setPaymentPrice(rset.getInt("payment_price"));
				r.setPlaceName(rset.getString("s_placename"));
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
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

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return resList;
	}
	

	}

