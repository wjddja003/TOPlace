package space.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import space.model.vo.Space;

public class SpaceDao {
	private Properties prop = new Properties();
	public SpaceDao() {
		String fileName = Space.class.getResource("/sql/space/spaceQuery.properties").getPath();
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
	public int insertSpace(Connection conn,Space s) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertSpace");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, s.getS_hostNum());
			pstmt.setString(2, s.getS_placeName());
			pstmt.setString(3, s.getS_kategorie1());
			pstmt.setString(4, s.getS_placeIntroduce1());
			pstmt.setString(5, s.getS_placeIntroduce2());
			pstmt.setString(6, s.getS_placeTag());
			pstmt.setString(7, s.getS_kategorie2());
			pstmt.setString(8, s.getS_placeWeb());
			pstmt.setString(9, s.getS_img1());
			pstmt.setString(10, s.getS_img2());
			pstmt.setInt(11, s.getAddrNum());
			pstmt.setString(12, s.getAddress());
			pstmt.setString(13, s.getS_email());
			pstmt.setString(14, s.getS_phone1());
			pstmt.setString(15, s.getS_phone2());
			pstmt.setString(16, s.getS_type());
			pstmt.setInt(17, s.getS_start());
			pstmt.setInt(18, s.getS_end());
			pstmt.setString(19, s.getS_holiday());
			pstmt.setInt(20, s.getS_people());
			pstmt.setString(21, s.getS_warning());
			pstmt.setInt(22, s.getS_price1());
			pstmt.setInt(23, s.getS_price2());
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
