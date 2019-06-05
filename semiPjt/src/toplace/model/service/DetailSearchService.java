package toplace.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import space.model.vo.Space;
import toplace.model.dao.DetailSearchDao;

public class DetailSearchService {
	public ArrayList<Space> detailSearch(String typeArr,int index){
		Connection conn=JDBCTemplate.getConnection();
		
		ArrayList<Space> list = new DetailSearchDao().detailSearch(conn,typeArr,index);
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
}
