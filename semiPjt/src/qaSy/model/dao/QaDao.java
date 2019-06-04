package qaSy.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import qaSy.model.vo.QaComment;

public class QaDao {
	private Properties prop = new Properties();
	public QaDao() {
		String fileName = QaComment.class.getResource("/sql/qa/qaQuery3.properties").getPath();
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
	public int insertQa(Connection conn, QaComment qc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("qaCommentInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qc.getQaCommentWriter());
			pstmt.setString(2, qc.getQaCommentContent());
			result = pstmt.executeUpdate();
			
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
