package space.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import space.model.vo.Space;
import view.model.vo.Like;

public class SpaceDao {
	private Properties prop = new Properties();
	public SpaceDao() {
		String fileName = Space.class.getResource("/sql/space/spaceQuery2.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int hitUpdate(Connection conn,int S_no) {
		int result = 0;
		PreparedStatement pstmt =null;
		String query = "update place set s_hit = s_hit+1 where s_no =?";
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int likeDelete(Like l,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update place set s_like = s_like-1 where s_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, l.getsNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int likeUpdate(Like l,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update place set s_like = s_like+1 where s_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, l.getsNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int insertSpace(Connection conn,Space s) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertSpace");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, s.getS_hostNum());
			pstmt.setString(2, s.getS_placeName());
			pstmt.setString(3, s.getS_kategorie1());
			pstmt.setString(4, s.getS_placeIntroduce1());
			pstmt.setString(5, s.getS_placeIntroduce2());
			pstmt.setString(6, s.getS_placeTag());
			pstmt.setString(7, s.getS_kategorie2());
			pstmt.setString(8, s.getS_placeWeb());
			pstmt.setString(9, s.getS_img1());
			pstmt.setString(10, s.getS_img2());
			pstmt.setInt(11, s.getAddrNum());
			pstmt.setString(12, s.getAddress());
			pstmt.setString(13, s.getS_email());
			pstmt.setString(14, s.getS_phone1());
			pstmt.setString(15, s.getS_phone2());
			pstmt.setString(16, s.getS_type());
			pstmt.setInt(17, s.getS_start());
			pstmt.setInt(18, s.getS_end());
			pstmt.setString(19, s.getS_holiday());
			pstmt.setInt(20, s.getS_people());
			pstmt.setString(21, s.getS_warning());
			pstmt.setInt(22, s.getS_price1());
			pstmt.setInt(23, s.getS_price2());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public Space selectOneSpace(Connection conn,int S_no) {
		Space s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneSpace");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("S_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("addrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return s;
	}
	public int updateSpace(Connection conn,Space s) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateSpace");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, s.getS_placeName());
			pstmt.setString(2, s.getS_kategorie1());
			pstmt.setString(3, s.getS_placeIntroduce1());
			pstmt.setString(4, s.getS_placeIntroduce2());
			pstmt.setString(5, s.getS_placeTag());
			pstmt.setString(6, s.getS_kategorie2());
			pstmt.setString(7, s.getS_placeWeb());
			pstmt.setString(8, s.getS_img1());
			pstmt.setString(9, s.getS_img2());
			pstmt.setInt(10, s.getAddrNum());
			pstmt.setString(11, s.getAddress());
			pstmt.setString(12, s.getS_email());
			pstmt.setString(13, s.getS_phone1());
			pstmt.setString(14, s.getS_phone2());
			pstmt.setString(15, s.getS_type());
			pstmt.setInt(16, s.getS_start());
			pstmt.setInt(17, s.getS_end());
			pstmt.setString(18, s.getS_holiday());
			pstmt.setInt(19, s.getS_people());
			pstmt.setString(20, s.getS_warning());
			pstmt.setInt(21, s.getS_price1());
			pstmt.setInt(22, s.getS_price2());
			pstmt.setInt(23, s.getS_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int searchCount(Connection conn,int S_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update place set s_hit = s_hit+1 where S_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
