package host.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	public int hostJoin(Host h, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("hostJoin");
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
	public int more(Connection conn) {
		

		Statement stmt = null;
		ResultSet rest = null;
		
		int result = 0;
		
		String query = "select count(*) cnt from place";
		
			try {
				stmt = conn.createStatement();
				rest = stmt.executeQuery(query);
				
				
				if(rest.next()){
					result = rest.getInt("cnt");
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(stmt);
				JDBCTemplate.close(rest);
			}
			
		
		
		
		return result;
	}
}
