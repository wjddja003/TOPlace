package toplace.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import space.model.vo.Space;

public class DetailSearchDao {
	public ArrayList<Space> detailSearch(Connection conn,String typeArr,int index){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from place where S_kategorie1 like ?";
		ArrayList<Space> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, typeArr);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_img1(rset.getString("S_img1"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
}
