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
		String fileName = Help.class.getResource("/sql/help/help4.properties").getPath();
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
	public int tCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("typeCount");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, keyword);
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

	public ArrayList<Help> searchKeywordT(String type,Connection conn, String keyword,int start, int end ){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchNum");
		ArrayList<Help> list = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
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
	public int insertHelp(Connection conn, Help h) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertHelp");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, h.getHelpCategory());
			pstmt.setString(2, h.getHelpTitle());
			pstmt.setString(3, h.getHelpWriter());
			pstmt.setString(4, h.getHelpContent());
			pstmt.setString(5, h.getFilename());
			pstmt.setString(6, h.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public int deleteHelp(Connection conn, int helpNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteHelp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, helpNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public Help selectOne(Connection conn, int helpNo) {
		Help h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, helpNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				h = new Help();
				h.setHelpNo(rset.getInt("help_no"));
				h.setHelpCategory(rset.getString("help_category"));
				h.setHelpTitle(rset.getString("help_title"));
				h.setHelpContent(rset.getString("help_content"));
				h.setHelpDate(rset.getDate("help_date"));
				h.setFilename(rset.getString("filename"));
				h.setFilepath(rset.getString("filepath"));
			}
					
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return h;
		
	}
	public int updateHelp(Connection conn, Help h) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateHelp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, h.getHelpCategory());
			pstmt.setString(2, h.getHelpTitle());
			pstmt.setString(3, h.getHelpContent());
			pstmt.setString(4, h.getFilename());
			pstmt.setString(5, h.getFilepath());
			pstmt.setInt(6, h.getHelpNo());
			System.out.println(h.getHelpCategory());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
}
