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
	System.out.println(pageNavi);
	NoticePageData pd = new NoticePageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
}
