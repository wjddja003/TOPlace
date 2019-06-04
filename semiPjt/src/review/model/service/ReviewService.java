package review.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import review.model.vo.ReviewPageData;

public class ReviewService {
	public int insertReview(Review r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
