package view.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import view.model.dao.LikeDao;
import view.model.vo.Like;

public class LikeService {
	public int likeInsert(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LikeDao().likeInsert(l,conn);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}
	public int likeDelete(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LikeDao().likeDelete(l,conn);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}
	public Like selectLike(int S_no,int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		Like l = new LikeDao().selectLike(S_no,userNo,conn);
		JDBCTemplate.close(conn);
		return l;
	}
}
