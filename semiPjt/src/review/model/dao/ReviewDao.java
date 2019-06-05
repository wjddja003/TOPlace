package review.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import review.model.vo.Review;

public class ReviewDao {
	private Properties prop = new Properties();
	public ReviewDao() {
		String fileName = Review.class.getResource("/sql/review/reviewQuery.properties").getPath();
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
}
