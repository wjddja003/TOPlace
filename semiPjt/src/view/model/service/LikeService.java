package view.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import view.model.dao.LikeDao;
import view.model.vo.Like;
import view.model.vo.LikeImg;
import view.model.vo.LikePageData;

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
	public ArrayList<Like> likeSearch(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Like> list = new LikeDao().likeSearch(userNo,conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public LikePageData selectList(int reqPage,int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<LikeImg> list = new LikeDao().selectList(conn,userNo);
		String pageNavi = "";
		
	
	LikePageData pd = new LikePageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
}
