package helpSy.model.dao;

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
import helpSy.model.vo.Help;
import noticeSy.model.vo.Notice;

public class HelpDao {
	private Properties prop = new Properties();
	public HelpDao() {
		String fileName = Help.class.getResource("/sql/help/help2.properties").getPath();
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
	public ArrayList<Help> selectList(Connection conn, int start,int end){
		PreparedStatement pstmt = null;
		ArrayList<Help> list = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Help>();
			
			while(rset.next()) {
				Help h = new Help();
				h.setHelpNo(rset.getInt("help_no"));
				h.setHelpCategory(rset.getString("help_category"));
				h.setHelpTitle(rset.getString("help_title"));
				h.setHelpWriter(rset.getString("help_writer"));
				h.setHelpContent(rset.getString("help_content"));
				h.setHelpDate(rset.getDate("help_date"));
				h.setFilename(rset.getString("filename"));
				h.setFilepath(rset.getString("filepath"));
				list.add(h);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("totalCount");
		int result = 0;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	public int titleCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("titleCount");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
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
	public ArrayList<Help> searchKeywordTitle(Connection conn,String keyword,int start,int end){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("search");
		ArrayList<Help> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Help>();
			while(rset.next()) {
				Help h = new Help();
				h.setHelpNo(rset.getInt("help_no"));
				h.setHelpCategory(rset.getString("help_category"));
				h.setHelpTitle(rset.getString("help_title"));
				h.setHelpWriter(rset.getString("help_writer"));
				h.setHelpContent(rset.getString("help_content"));
				h.setHelpDate(rset.getDate("help_date"));
				h.setFilename(rset.getString("filename"));
				h.setFilepath(rset.getString("filepath"));
				list.add(h);
				
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
}
