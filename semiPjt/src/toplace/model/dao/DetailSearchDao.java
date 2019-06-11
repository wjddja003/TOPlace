package toplace.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import space.model.vo.Space;

public class DetailSearchDao {
	public ArrayList<Space> allSearch(Connection conn){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place";
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
				list.add(s);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
	public ArrayList<Space> placeTypeSearch(Connection conn,String typeArr){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place where S_kategorie1 like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, typeArr);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
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
	public ArrayList<Space> unknownTypeSearch(Connection conn, String type){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place where (S_placeName || S_placeintroduce1 || S_placetag || address) like '%"+type+"%'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
				list.add(s);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
	public ArrayList<Space> placeFilterSearch(Connection conn,String typeArr, String filterArr){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place where S_kategorie1 like ? and S_kategorie2 like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, typeArr);
			pstmt.setString(2, filterArr);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
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
	public ArrayList<Space> unknownFilterSearch(Connection conn, String type, String filterArr){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place where (S_placeName || S_placeintroduce1 || S_placetag || address) like '%"+type+"%' and S_kategorie2 like '"+filterArr+"'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
				list.add(s);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
	public ArrayList<Space> searchAddress(Connection conn){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from place";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setAddress(rset.getString("address"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_placeName(rset.getString("S_placeName"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	public ArrayList<Space> bestHitSearch(Connection conn){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from (select * from place order by s_hit desc) where rownum between 1 and 6";
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
				list.add(s);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
	public ArrayList<Space> bestLikeSearch(Connection conn){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = null;
		String query = "select * from (select * from place order by s_like desc) where rownum between 1 and 6";
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("s_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("AddrNum"));
				s.setAddress(rset.getString("address"));
				s.setS_email(rset.getString("S_email"));
				s.setS_phone1(rset.getString("S_phone1"));
				s.setS_phone2(rset.getString("S_phone2"));
				s.setS_type(rset.getString("S_type"));
				s.setS_start(rset.getInt("S_start"));
				s.setS_end(rset.getInt("S_end"));
				s.setS_holiday(rset.getString("S_holiday"));
				s.setS_people(rset.getInt("S_people"));
				s.setS_warning(rset.getString("S_warning"));
				s.setS_price1(rset.getInt("S_price1"));
				s.setS_price2(rset.getInt("S_price2"));
				s.setS_hit(rset.getInt("S_hit"));
				s.setS_like(rset.getInt("S_like"));
				
				list.add(s);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}
}
