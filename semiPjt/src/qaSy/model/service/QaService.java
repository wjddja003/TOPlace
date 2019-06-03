package qaSy.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import qaSy.model.dao.QaDao;
import qaSy.model.vo.QaComment;

public class QaService {
	public int insertQa(QaComment qc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QaDao().insertQa(conn,qc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
