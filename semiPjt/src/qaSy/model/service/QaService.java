package qaSy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import noticeSy.model.dao.NoticeDao;
import noticeSy.model.vo.Notice;
import noticeSy.model.vo.NoticePageData;
import qaSy.model.dao.QaDao;
import qaSy.model.vo.QaComment;
import qaSy.model.vo.QaPageData;

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
	public QaPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3;
		int totalCount = new QaDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<QaComment> list = new QaDao().selectList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/qaView?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/qaView?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/qaView?reqPage="+pageNo+"'>다음</a>";
	}
	ArrayList<QaComment> listAll = new QaDao().selectAll(conn);
	QaPageData pd = new QaPageData(list,pageNavi,listAll);
	JDBCTemplate.close(conn);
	return pd;
	}
	public int deleteQa(int qaCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QaDao().deleteQa(conn,qaCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public QaPageData selectQList(int reqPage,String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3;
		int totalCount = new QaDao().totalQCount(conn,userId);
		System.out.println(totalCount);
		System.out.println(userId);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<QaComment> list = new QaDao().selectQList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/qaView?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/qaView?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/qaView?reqPage="+pageNo+"'>다음</a>";
	}
	
	QaPageData pd = new QaPageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
	public QaComment selectOne(int qaCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		QaComment q = new QaDao().selectOne(conn,qaCommentNo);
		JDBCTemplate.close(conn);
		return q;
	}
	public int updateQaComment(QaComment q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QaDao().updateQaComment(conn,q);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public QaPageData qaSelectList(int reqPageQna, int S_no) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCountQna = new QaDao().totalCountQna(conn,S_no );
		int totalPage = (totalCountQna%numPerPage==0)?(totalCountQna/numPerPage):(totalCountQna/numPerPage)+1;
		int start = (reqPageQna-1)*numPerPage+1;
		int end = reqPageQna*numPerPage;
		ArrayList<QaComment> list = new QaDao().selectList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPageQna-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/qaView?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPageQna == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/qaView?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/qaView?reqPage="+pageNo+"'>다음</a>";
	}
	ArrayList<QaComment> listAll = new QaDao().selectAll(conn);
	QaPageData pd = new QaPageData(list,pageNavi,listAll);
	JDBCTemplate.close(conn);
	return pd;
	}
}
