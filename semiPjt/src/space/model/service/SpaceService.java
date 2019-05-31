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
		JDBCTemplate.close(conn);
		return s;
	}
}