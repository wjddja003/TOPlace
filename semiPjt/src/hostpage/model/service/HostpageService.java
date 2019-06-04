package hostpage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import host.model.dao.HostDao;
import hostpage.model.dao.HostPageDao;
import hostpage.model.vo.HostDataPage;
import space.model.vo.Space;

public class HostpageService {

	public HostDataPage host(int shostNum) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Space> list = new HostPageDao().host(conn);
		int count = new HostPageDao().count(shostNum,conn);
		HostDataPage hd = new HostDataPage(list, count);
		JDBCTemplate.close(conn);
		return hd;
	}

	public int delete(int s_no) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new HostPageDao().delete(s_no,conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public Space imgs(int s_no) {
		Connection conn = JDBCTemplate.getConnection();
		
		Space s = new HostPageDao().imgs(conn,s_no);
		
		
		
		JDBCTemplate.close(conn);
		return s;
	}

	public int more() {
	
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new HostDao().more(conn);
		
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Space> hostmore(int start) {
		
		Connection conn = JDBCTemplate.getConnection();
		int length= 3;
		ArrayList<Space> list = new HostPageDao().hostmore(conn,start,start+length-1);
		JDBCTemplate.close(conn);
		return list;
	}

	

	

}
