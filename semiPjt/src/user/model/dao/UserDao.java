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
	public String checkId(String id, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";
		String query = "select * from user_db where user_id=?";
		System.out.println(id);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getString("user_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int join(User u, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("join");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPw());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getUserPhone());
			pstmt.setString(5, u.getUserBirthday());
			pstmt.setString(6, u.getUserEmail());
			pstmt.setString(7, u.getUserGender());
			pstmt.setInt(8, u.getUserAddressNumber());
			pstmt.setString(9, u.getUserAddress());
			pstmt.setString(10, u.getUserSMS());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
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
				u.setUserPhone(rset.getString("phone"));
				u.setUserBirthday(rset.getString("birthday"));
				u.setUserEmail(rset.getString("email"));
				u.setUserGender(rset.getString("gender"));
				u.setUserAddressNumber(rset.getInt("addressNumber"));
				u.setUserAddress(rset.getString("address"));
				u.setUserGrade(rset.getString("grade"));
				u.setUserTOS(rset.getString("tos"));
				u.setUserprivacy(rset.getString("privacy"));
				u.setUserSMS(rset.getString("sms"));
				u.setEnrollDate(rset.getDate("enroll_date"));
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
