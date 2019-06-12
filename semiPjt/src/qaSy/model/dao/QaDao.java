package qaSy.model.dao;

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
import qaSy.model.vo.QaComment;

public class QaDao {
	private Properties prop = new Properties();
	public QaDao() {
		String fileName = QaComment.class.getResource("/sql/qa/qaQuery9.properties").getPath();
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
	public ArrayList<QaComment> adminSelectAll(Connection conn,int start,int end){
		ArrayList<QaComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, q.* from (select q.*,s_placename from qa_comment q join place p on (q.qa_ref = p.S_no) where qa_comment_ref is null order by qa_comment_date desc) q) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_Comment_writer"));
				q.setQaCommentContent(rset.getString("qa_Comment_content"));
				q.setQaCommentDate(rset.getDate("qa_Comment_date"));
				q.setPlaceName(rset.getString("s_placename"));
				q.setQaRef(rset.getInt("qa_ref"));
				list.add(q);
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
	public int commentInsertQa(Connection conn,QaComment qc){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into qa_comment values(seq_qa_comment_no.nextval,?,?,?,default,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qc.getQaCommentWriter());
			pstmt.setString(2, qc.getQaCommentContent());
			pstmt.setInt(3, qc.getQaRef());
			pstmt.setInt(4, qc.getQaCommentRef());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<QaComment> selectAll(Connection conn){
		ArrayList<QaComment> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from qa_comment";
		try {
			stmt= conn.createStatement();
			rset= stmt.executeQuery(query);
			list = new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_Comment_writer"));
				q.setQaCommentContent(rset.getString("qa_Comment_content"));
				q.setQaRef(rset.getInt("qa_ref"));
				q.setQaCommentDate(rset.getDate("qa_Comment_date"));
				q.setQaCommentRef(rset.getInt("qa_comment_ref"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}
	
	public int insertQa(Connection conn, QaComment qc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into qa_comment values(seq_qa_comment_no.nextval,?,?,?,default,null)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qc.getQaCommentWriter());
			pstmt.setString(2, qc.getQaCommentContent());
			pstmt.setInt(3, qc.getQaRef());
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
	public int totalQCount(Connection conn,String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from qa_Comment where qa_comment_writer = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int totalCountQna(Connection conn, int S_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from qa_comment where qa_ref=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
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
	public ArrayList<QaComment> selectList(Connection conn, int start,int end,int S_no){
		ArrayList<QaComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, q.* from (select * from qa_comment where qa_ref = ? order by qa_comment_date desc) q) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, S_no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_Comment_writer"));
				q.setQaCommentContent(rset.getString("qa_Comment_content"));
				q.setQaRef(rset.getInt("qa_ref"));
				q.setQaCommentDate(rset.getDate("qa_Comment_date"));
				q.setQaCommentRef(rset.getInt("qa_comment_ref"));
				list.add(q);
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
	public ArrayList<QaComment> qaSelectList(Connection conn, int start, int end){
		ArrayList<QaComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, q.* from (select * from qa_comment where qa_comment_ref is null order by qa_comment_date desc) q) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_Comment_writer"));
				q.setQaCommentContent(rset.getString("qa_Comment_content"));
				q.setQaCommentDate(rset.getDate("qa_Comment_date"));
				list.add(q);
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
	public ArrayList<QaComment> selectQList(Connection conn, int start,int end,String userId){
		ArrayList<QaComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select rownum as rnum, q.* from (select q.*,s_placename from qa_comment q join place p on (q.qa_ref = p.S_no) where qa_COMMENT_WRITER = ? and qa_comment_ref is null order by qa_comment_date desc) q) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_Comment_writer"));
				q.setQaCommentContent(rset.getString("qa_Comment_content"));
				q.setQaCommentDate(rset.getDate("qa_Comment_date"));
				q.setPlaceName(rset.getString("s_placename"));
				q.setQaRef(rset.getInt("qa_ref"));
				list.add(q);
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
	public int deleteQa(Connection conn, int qaCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteQa");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public QaComment selectOne(Connection conn, int qaCommentNo) {
		QaComment q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from qa_comment where qa_comment_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaCommentNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_comment_no"));
				q.setQaCommentWriter(rset.getString("qa_comment_writer"));
				q.setQaCommentContent(rset.getString("qa_comment_content"));
				q.setQaCommentDate(rset.getDate("qa_comment_date"));
				q.setQaCommentRef(rset.getInt("qa_comment_ref"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return q;
	}
	public int updateQaComment(Connection conn, QaComment q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update qa_comment set qa_comment_content=? where qa_comment_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQaCommentContent());
			pstmt.setInt(2, q.getQaCommentNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
	}
	return result;
}
	
}