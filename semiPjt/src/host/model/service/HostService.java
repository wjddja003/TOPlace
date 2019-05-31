package host.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import host.model.dao.HostDao;
import host.model.vo.Host;

public class HostService {
	public int hostJoin(Host h) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HostDao().hostJoin(h,conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
