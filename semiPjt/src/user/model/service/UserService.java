package user.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import user.model.dao.UserDao;
import user.model.vo.User;

public class UserService {
	public int pwSearch(String buf,String id,String email) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().pwSearch(buf,id,email,conn);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public User idSearch(String name,String email) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().idSearch(name,email,conn);
		JDBCTemplate.close(conn);
		return u;
	}
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
	public String checkEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		String result = new UserDao().checkEmail(email,conn);
		JDBCTemplate.close(conn);
		return result;
	}
}
