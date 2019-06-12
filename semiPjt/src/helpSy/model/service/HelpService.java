package helpSy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import helpSy.model.dao.HelpDao;
import helpSy.model.vo.Help;
import helpSy.model.vo.HelpPageData;
import noticeSy.model.dao.NoticeDao;
import noticeSy.model.vo.Notice;



public class HelpService {
	public HelpPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCount = new HelpDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Help> list = new HelpDao().selectList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/helpList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/helpList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/helpList?reqPage="+pageNo+"'>다음</a>";
	}
	HelpPageData pd = new HelpPageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
	public HelpPageData searchKeyword(String type,String keyword,int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		ArrayList<Help> list = null;
		int totalCount = 0;
		int start = 0;
		int end = 0;
		int totalPage = 0;
		System.out.println(type);
		switch(type) {
		case "all" :
			totalCount = new HelpDao().totalCount(conn);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordTitle(conn,keyword,start,end);
			break;
		case "member" :
			totalCount = new HelpDao().tCount(conn,keyword);
			System.out.println(totalCount);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			System.out.println(totalPage);
			start = (reqPage-1)*numPerPage + 1;
			System.out.println(start);
			end = reqPage*numPerPage;
			System.out.println(end);
			list = new HelpDao().searchKeywordT(type,conn,keyword,start,end);
			System.out.println(list);
			break;
		case "pay" :
			totalCount = new HelpDao().tCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordT(type,conn,keyword,start,end);
			break;
		case "cancel" :
			totalCount = new HelpDao().tCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordT(type,conn,keyword,start,end);
			break;
		case "use" :
			totalCount = new HelpDao().tCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordT(type,conn,keyword,start,end);
			break;
		case "other" :
			totalCount = new HelpDao().tCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordT(type,conn,keyword,start,end);
			break;
		}

		String pageNavi = "";
		int pageNaviSize = 5;  
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchHKeyword?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>이전</a>";
		}
		
		int i=1;
		while(!(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/searchHKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";		
			}
			pageNo++;
		}
		
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/searchHKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>다음</a>";
		}
		
		HelpPageData pd = new HelpPageData(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return pd;
		
	}
	public int insertHelp(Help h) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HelpDao().insertHelp(conn,h);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteHelp(int helpNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HelpDao().deleteHelp(conn,helpNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Help selectOne(int helpNo) {
		Connection conn = JDBCTemplate.getConnection();
		Help n = new HelpDao().selectOne(conn,helpNo);
		JDBCTemplate.close(conn);
		return n;
	}
	public int updateHelp(Help h) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HelpDao().updateHelp(conn,h);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
