package view.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import common.JDBCTemplate;
import view.model.vo.Like;

public class LikeDao {
	public Like selectLike(int S_no,int userNo, Connection conn) {
		PreparedStatement pstmt =null;
		Like l = null;
		ResultSet rset = null;
		String query = "select * from like_db where s_no=? and user_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				l = new Like();
				l.setLikeNo(rset.getInt("like_no"));
				l.setsNo(rset.getInt("s_no"));
				l.setUserNo(rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return l;
	}
	public int likeInsert(Like l,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into like_db values(like_no_SEQ.nextval,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, l.getsNo());
			pstmt.setInt(2, l.getUserNo());
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
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from like_db where user_no = ? and s_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, l.getUserNo());
			pstmt.setInt(2, l.getsNo());
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
