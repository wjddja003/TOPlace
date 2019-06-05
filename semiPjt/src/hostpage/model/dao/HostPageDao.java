package hostpage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import hostpage.model.vo.Hostpage;
import qaSy.model.vo.QaComment;
import review.model.vo.Review;
import space.model.vo.Space;
import user.model.vo.User;

public class HostPageDao {

	public ArrayList<Space> host(int shostNum, Connection conn) {
		
		ArrayList<Space> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt= null;
		
		String query = "select * from place where s_hostNum=?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, shostNum);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("S_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("addrNum"));
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
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int count(int shostNum, Connection conn) {
		PreparedStatement pstmt= null;
		ResultSet rest = null;
		int result = 0;
		String query = "select count(*) cnt from place where S_hostNum=?";
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,shostNum);
			rest = pstmt.executeQuery();		
			if(rest.next()) {			
				result = rest.getInt("cnt");		
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rest);	
		}	
		return result;
	}

	public int delete(int s_no, Connection conn) {
		PreparedStatement pstmt= null;
		
		int result = 0;
		String query = "delete from place where S_No=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,s_no);
			result = pstmt.executeUpdate();	
					System.out.println(s_no);
					System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Space imgs(Connection conn, int s_no) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Space s = null;
		String query = "select S_img1,S_img2 from place where S_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,s_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s = new Space();
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return s;
	}

	public ArrayList<Space> hostmore(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		String query = "select * from (select rownum as rnum, p.* from (select * from place order by s_no desc)p) where rnum between ? and ?";
		
		ArrayList<Space> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Space>();
			
			while(rset.next()) {
				Space s = new Space();
				s.setS_no(rset.getInt("S_no"));
				s.setS_hostNum(rset.getInt("S_hostNum"));
				s.setS_placeName(rset.getString("S_placeName"));
				s.setS_kategorie1(rset.getString("S_kategorie1"));
				s.setS_placeIntroduce1(rset.getString("S_placeIntroduce1"));
				s.setS_placeIntroduce2(rset.getString("S_placeIntroduce2"));
				s.setS_placeTag(rset.getString("S_placeTag"));
				s.setS_kategorie2(rset.getString("S_kategorie2"));
				s.setS_placeWeb(rset.getString("S_placeWeb"));
				s.setS_img1(rset.getString("S_img1"));
				s.setS_img2(rset.getString("S_img2"));
				s.setAddrNum(rset.getInt("addrNum"));
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
		}
		finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}

	public int totalCount(Connection conn, int shostNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		String query =  "select count(*) cnt from review where review_sno in (select s_no from place where s_hostNum=?)";
		int result = 0;
		
		try {
		  pstmt = conn.prepareStatement(query);
		  pstmt.setInt(1, shostNum);
		  rest = pstmt.executeQuery();
			if(rest.next()) {
				result = rest.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(rest);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Review> selectList(Connection conn, int start, int end, int shostNum) {
		
		ArrayList<Review> list = null; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select ROWNUM as rnum, m.* from (select * from review where review_sno in (select s_no from place where s_hostNum=0))m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset= pstmt.executeQuery();
			list = new ArrayList<Review>();			
			while(rset.next()){
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewSno(rset.getInt("review_sno"));
				r.setReviewTitle(rset.getString("review_title"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setReviewContent(rset.getString("review_content"));
				r.setFilename(rset.getString("filename"));
				r.setReviewDate(rset.getDate("review_date"));
				list.add(r);
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

	public ArrayList<QaComment> Qalist(Connection conn, int shostNum ) {
		ArrayList<QaComment> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt= null;
		String query = "select * from  qa_COMMENT where qa_Ref in (select s_no from place where s_hostNum=?)";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, shostNum);
			rset  = pstmt.executeQuery();
			list= new ArrayList<QaComment>();
			while(rset.next()) {
				QaComment q = new QaComment();
				q.setQaCommentNo(rset.getInt("qa_COMMENT_NO"));
				q.setQaCommentWriter(rset.getString("qa_COMMENT_WRITER"));
				q.setQaCommentContent(rset.getString("qa_COMMENT_CONTENT"));
				q.setQaRef(rset.getInt("qa_REF"));
				q.setQaCommentDate(rset.getDate("qa_COMMENT_DATE"));
				list.add(q);
				System.out.println(list.get(0).getQaCommentNo());
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
