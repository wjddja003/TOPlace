package toplace.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import space.model.vo.Space;

public class DetailSearchDao {
	public ArrayList<Space> placeTypeSearch(Connection conn,String typeArr,int index){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place where S_kategorie1 = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, typeArr);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_img1(rset.getString("S_img1"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	
	public ArrayList<Space> searchAddress(Connection conn){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setAddress(rset.getString("address"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_placeName(rset.getString("S_placeName"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
}
