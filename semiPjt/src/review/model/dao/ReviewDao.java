package review.model.dao;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import review.model.vo.Review;
import review.model.vo.ReviewComment;

public class ReviewDao {
	private Properties prop = new Properties();
	public ReviewDao() {
		String fileName = Review.class.getResource("/sql/review/reviewQuery2.properties").getPath();
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
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReview");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,r.getReviewSno());
			pstmt.setString(2, r.getReviewTitle());
			pstmt.setString(3, r.getReviewWriter());
			pstmt.setString(4, r.getReviewContent());
			pstmt.setString(5, r.getFilename());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<Review> selectList(Connection conn, int start, int end){
		ArrayList<Review> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Review>();
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewSno(rset.getInt("review_sno"));
				r.setReviewTitle(rset.getString("review_title"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setReviewContent(rset.getString("review_content"));
				r.setFilename(rset.getString("filename"));
				r.setReviewDate(rset.getDate("review_date"));
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
	public int totalRCount(Connection conn,String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from review where review_writer = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
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
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("totalCount");
		int result = 0;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;		
	}
	public Review selectOne(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		Review r = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewSno(rset.getInt("review_sno"));
				r.setReviewTitle(rset.getString("review_title"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setReviewContent(rset.getString("review_content"));
				r.setFilename(rset.getString("filename"));
				r.setReviewDate(rset.getDate("review_Date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
		
	}
	public ArrayList<ReviewComment> selectCommentList(Connection conn, int reviewNo){
		PreparedStatement pstmt = null;
		ArrayList<ReviewComment> list = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCommentList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			list = new ArrayList<ReviewComment>();
			while(rset.next()) {
				ReviewComment rc = new ReviewComment();
				rc.setReviewCommentNo(rset.getInt("review_comment_no"));
				rc.setReviewCommentLevel(rset.getInt("review_comment_level"));
				rc.setReviewCommentWriter(rset.getString("review_comment_writer"));
				rc.setReviewCommentContent(rset.getString("review_comment_content"));
				rc.setReviewRef(rset.getInt("review_ref"));
				rc.setReviewCommentRef(rset.getInt("review_comment_ref"));
				rc.setReviewCommentDate(rset.getDate("review_comment_date"));
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
	public int reviewUpdate(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("reviewUpdate");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewWriter());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setString(4, r.getFilename());
			pstmt.setInt(5, r.getReviewNo());
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