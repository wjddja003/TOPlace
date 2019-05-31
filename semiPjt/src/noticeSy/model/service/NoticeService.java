package noticeSy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import noticeSy.model.dao.NoticeDao;
import noticeSy.model.vo.Notice;
import noticeSy.model.vo.NoticePageData;

public class NoticeService {
	public NoticePageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCount = new NoticeDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Notice> list = new NoticeDao().selectList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/noticeList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/noticeList?reqPage="+pageNo+"'>다음</a>";
	}
	NoticePageData pd = new NoticePageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
	public int insertNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().insertNotice(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public NoticePageData searchKeyword(String keyword,int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		ArrayList<Notice> list = null;
		int totalCount = 0;
		int start = 0;
		int end = 0;
		int totalPage = 0;
		
		totalCount = new NoticeDao().titleCount(conn,keyword);
		totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		
		start = (reqPage-1)*numPerPage + 1;
		end = reqPage*numPerPage;
		list = new NoticeDao().searchKeywordTitle(conn,keyword,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;  
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchKeyword?reqPage="+(pageNo-1)+"&keyword="+keyword+"'>이전</a>";
		}
		
		int i=1;
		while(!(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a>";		
			}
			pageNo++;
		}
		
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>다음</a>";
		}
		
		NoticePageData pd = new NoticePageData(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return pd;
		
	}
	public int deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().updateNotice(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Notice selectOne(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().selectOne(conn,noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}
}
