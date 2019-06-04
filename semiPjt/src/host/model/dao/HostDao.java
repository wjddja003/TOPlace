package host.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import host.model.vo.Host;



public class HostDao {
	private Properties prop = new Properties();
	public HostDao() {
		String fileName = Host.class.getResource("/sql/host/hostQuery.properties").getPath();
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
	public int hostUpdate(Host h , Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update host_db set host_name=?,host_content=?,host_file=? where host_no=?";
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, h.getHostName());
			pstmt.setString(2, h.getHostContent());
			pstmt.setString(3, h.getHostFile());
			pstmt.setInt(4, h.getHostNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public Host selectOne(int userNo, Connection conn) {
		PreparedStatement pstmt = null;
		Host h = null;
		ResultSet rset = null;
		String query = "select * from host_db where user_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				h = new Host();
				h.setHostNo(rset.getInt("host_no"));
				h.setHostName(rset.getString("host_name"));
				h.setHostContent(rset.getString("host_content"));
				h.setHostFile(rset.getString("host_file"));
				h.setUserNo(rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return h;
	}
	public int hostJoin(Host h, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println(h.getHostContent());
		String query = "insert into host_db values(host_no_seq.nextval,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, h.getUserNo());
			pstmt.setString(2, h.getHostName());
			pstmt.setString(3, h.getHostContent());
			pstmt.setString(4, h.getHostFile());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
