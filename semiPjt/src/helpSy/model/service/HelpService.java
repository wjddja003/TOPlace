package helpSy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import helpSy.model.dao.HelpDao;
import helpSy.model.vo.Help;
import helpSy.model.vo.HelpPageData;



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
		switch(type) {
		case "member" :
			totalCount = new HelpDao().mCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage + 1;
			end = reqPage*numPerPage;
			list = new HelpDao().searchKeywordM(conn,keyword,start,end);
			break;
		}
		totalCount = new HelpDao().titleCount(conn,keyword);
		totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		
		start = (reqPage-1)*numPerPage + 1;
		end = reqPage*numPerPage;
		list = new HelpDao().searchKeywordTitle(conn,keyword,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;  
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchKeyword?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>이전</a>";
		}
		
		int i=1;
		while(!(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";		
			}
			pageNo++;
		}
		
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>다음</a>";
		}
		
		HelpPageData pd = new HelpPageData(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return pd;
		
	}
}
