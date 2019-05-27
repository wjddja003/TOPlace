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
}
