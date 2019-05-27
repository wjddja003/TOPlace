package user.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import noticeSy.model.vo.Notice;
import user.model.vo.User;

public class UserDao {
	private Properties prop = new Properties();
	public UserDao() {
		String fileName = Notice.class.getResource("/sql/user/userQuery.properties").getPath();
		System.out.println(fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public User login(String id , String pw , Connection conn) {
		PreparedStatement pstmt = null;
		User u = null;
		ResultSet rset = null;
		String query = prop.getProperty("login");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				u = new User();
				u.setUserId(rset.getString("user_id"));
				u.setUserPw(rset.getString("user_pw"));
				u.setUserName(rset.getString("user_name"));
				u.setUserPhone(rset.getString("user_phone"));
				u.setUserBirthday(rset.getString("user_birthday"));
				u.setUserEmail(rset.getString("user_email"));
				u.setUserGrade(rset.getString("user_grade"));
				u.setUserNickname(rset.getString("user_nickname"));
				u.setUserTOS(rset.getInt("user_tos"));
				u.setUserprivacy(rset.getInt("user_privacy"));
				u.setUserSMS(rset.getInt("user_sms"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return u;
		
	}
}
