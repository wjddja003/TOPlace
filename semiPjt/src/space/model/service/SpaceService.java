package space.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import space.model.dao.SpaceDao;
import space.model.vo.Space;

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
	/*
	public Space selectImg(int S_no) {
		Connection conn = JDBCTemplate.getConnection();
		Space s = new SpaceDao().selectImg(conn,S_no);
		JDBCTemplate.close(conn);
		return s;
	}
	*/
}
