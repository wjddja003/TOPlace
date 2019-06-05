package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import qaSy.model.dao.QaDao;
import qaSy.model.vo.QaComment;
import qaSy.model.vo.QaPageData;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewPageData;
import review.model.vo.ReviewViewData;

public class ReviewService {
	public int insertReview(Review r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public ReviewPageData selectRList(int reqPage,String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 3;
		int totalCount = new ReviewDao().totalRCount(conn,userId);
		System.out.println(totalCount);
		System.out.println(userId);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Review> list = new ReviewDao().selectList(conn, start, end);
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
	
	ReviewPageData pd = new ReviewPageData(list,pageNavi);
	JDBCTemplate.close(conn);
	return pd;
	}
	public ReviewPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCount  = new ReviewDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Review> list = new ReviewDao().selectList(conn,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectOneSpace?S_no=2&reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/selectOneSpace?S_no=2&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/selectOneSpace?S_no=2&reqPage="+pageNo+"'>다음</a>";
		}
		ReviewPageData pd = new ReviewPageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	public ReviewViewData selectOne(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		Review r = new ReviewDao().selectOne(conn,reviewNo);
		ArrayList<ReviewComment> list = new ReviewDao().selectCommentList(conn,reviewNo);
		ReviewViewData rvd = new ReviewViewData(list,r);
		JDBCTemplate.close(conn);
		return rvd;
	}
	public int reviewUpdate(Review r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().reviewUpdate(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

}
