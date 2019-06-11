package toplace.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import toplace.model.vo.Declare;

public class DeclareDao {
	public int insertDeclare(Connection conn, Declare d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into declare values(declare_no_SEQ.nextval,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, d.getS_no());
			pstmt.setString(2, d.getUserName());
			pstmt.setString(3, d.getS_placeName());
			pstmt.setString(4, d.getDeclareType());
			pstmt.setString(5, d.getDeclareContent());
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
