package user.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import user.model.dao.UserDao;
import user.model.vo.User;

public class UserService {
	public User login(String id, String pw) {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().login(id,pw,conn);
		JDBCTemplate.close(conn);
		return u;
	}
	public int join(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().join(u,conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public String checkId(String id) {
		Connection conn = JDBCTemplate.getConnection();
		String result = new UserDao().checkId(id,conn);
		JDBCTemplate.close(conn);
		return result;
	}
}
