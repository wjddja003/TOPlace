package toplace.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import toplace.model.dao.DeclareDao;
import toplace.model.vo.Declare;

public class DeclareService {
	public int insertDeclare(Declare d) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DeclareDao().insertDeclare(conn, d);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
