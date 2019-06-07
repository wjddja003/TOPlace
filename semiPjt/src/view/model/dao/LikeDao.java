package view.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import view.model.vo.Like;
import view.model.vo.LikeImg;

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
	public int totalCount(Connection conn,int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from like_db where user_no = ?";
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
	public ArrayList<LikeImg> selectList(Connection conn,int start,int end,int userNo){
		ArrayList<LikeImg> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, m.* from (select l.*,S_img1,s_placeName,s_Price1,s_placeTag,address,s_type from like_db l join place p on (l.s_no = p.S_no) where user_no = ? order by like_no desc) m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<LikeImg>();
			while(rset.next()) {
				LikeImg l = new LikeImg();
				l.setLikeNo(rset.getInt("like_no"));
				l.setsNo(rset.getInt("s_no"));
				l.setUserNo(rset.getInt("user_no"));
				l.setImg(rset.getString("s_img1"));
				l.setPlaceName(rset.getString("s_placename"));
				l.setPrice(rset.getInt("s_price1"));
				l.setPlaceTag(rset.getString("s_placetag"));
				l.setAddress(rset.getString("address"));
				l.setType(rset.getString("s_type"));
				list.add(l);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
