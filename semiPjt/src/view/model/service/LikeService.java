package view.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import view.model.dao.LikeDao;
import view.model.vo.Like;
import view.model.vo.LikeImg;
import view.model.vo.LikePageData;

public class LikeService {
	public int likeInsert(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LikeDao().likeInsert(l,conn);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}
	public int likeDelete(Like l) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LikeDao().likeDelete(l,conn);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}
	public Like selectLike(int S_no,int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		Like l = new LikeDao().selectLike(S_no,userNo,conn);
		JDBCTemplate.close(conn);
		return l;
	}
	public ArrayList<Like> likeSearch(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Like> list = new LikeDao().likeSearch(userNo,conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public LikePageData selectList(int reqPage,int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 4;
		int totalCount = new LikeDao().totalCount(conn,userNo);
		System.out.println(totalCount);
		System.out.println(userNo);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<LikeImg> list = new LikeDao().selectList(conn, start, end,userNo);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/likeList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/likeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
	if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/likeList?reqPage="+pageNo+"'>다음</a>";
	}
	
	LikePageData pd = new LikePageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
}
