package user.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import noticeSy.model.vo.Notice;
import toplace.model.vo.Declare;
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
	public int adminUserDelete(int userNo,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from user_db where user_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public int adminDeclareDelete(int sNo,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from declare where s_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public int spaceDeclareDelete(int sNo,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from place where s_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from user_db";
		int result = 0;
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	public int totalDeclareCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from declare";
		int result = 0;
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	public ArrayList<User> adminSelectAll(Connection conn,int start, int end){
		ArrayList<User> list= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, m.* from (select * from user_db order by enroll_date desc) m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<User>();
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("user_no"));
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
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Declare> adminDeclareAll(Connection conn,int start, int end){
		ArrayList<Declare> list= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, m.* from (select * from declare order by declare_no desc) m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Declare>();
			while(rset.next()) {
				Declare d = new Declare();
				d.setDeclareNo(rset.getInt("declare_no"));
				d.setS_no(rset.getInt("s_no"));
				d.setS_placeName(rset.getString("s_placeName"));
				d.setDeclareType(rset.getString("declare_type"));
				d.setUserName(rset.getString("user_name"));
				d.setDeclareContent(rset.getString("declare_content"));
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int gradeUpdate(int userNo,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update user_db set grade='호스트' where user_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		} 
		return result;
		
	}
	public int pwSearch(String buf ,String id,String email,Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update user_db set user_pw = ? where user_id=? and email=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, buf);
		pstmt.setString(2, id);
		pstmt.setString(3, email);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public User idSearch(String name,String email,Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User u = null;
		String query = "select * from user_db where user_name=? and email=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		rset= pstmt.executeQuery();
		if(rset.next()) {
			u = new User();
			u.setUserId(rset.getString("user_name"));
			u.setEnrollDate(rset.getDate("enroll_date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return u;
	}
	public String checkEmail(String email,Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";
		String query = "select * from user_db where email=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getString("email");
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
				u.setUserNo(rset.getInt("user_no"));
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
