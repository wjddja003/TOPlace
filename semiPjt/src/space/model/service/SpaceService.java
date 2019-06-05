package space.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import space.model.dao.SpaceDao;
import space.model.vo.Space;
import view.model.vo.Like;

public class SpaceService {
	public int insertSpace(Space s) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SpaceDao().insertSpace(conn,s);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Space selectOneSpace(int S_no) {
		Connection conn = JDBCTemplate.getConnection();
		Space s = new SpaceDao().selectOneSpace(conn,S_no);
		int result = new SpaceDao().hitUpdate(conn,S_no);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		s.setS_kategorieList1(s.getS_kategorie1());
		s.setS_kategorieList(s.getS_kategorie2());
		JDBCTemplate.close(conn);
		return s;
	}
	public int updateSpace(Space s) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SpaceDao().updateSpace(conn,s);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int likeUpdate(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int likeUpdate = new SpaceDao().likeUpdate(l,conn);
		if(likeUpdate > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return likeUpdate;
	}
	public int likeDelete(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int likeDelete = new SpaceDao().likeDelete(l,conn);
		if(likeDelete > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return likeDelete;
	}
	/*
	public Space selectImg(int S_no) {
		Connection conn = JDBCTemplate.getConnection();
		Space s = new SpaceDao().selectImg(conn,S_no);
		JDBCTemplate.close(conn);
		return s;
	}
	*/
=======

>>>>>>> 3f03f4b04c647ffbf9f519ed1c3eb995b9aede87
}
