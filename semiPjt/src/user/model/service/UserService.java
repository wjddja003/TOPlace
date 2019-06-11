package user.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import toplace.model.vo.Declare;
import user.model.dao.UserDao;
import user.model.vo.SpacePage;
import user.model.vo.User;
import user.model.vo.UserPage;

public class UserService {
	public int adminUserDelete(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().adminUserDelete(userNo,conn);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int adminDeclareDelete(int sNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().adminDeclareDelete(sNo,conn);
		int result2 = new UserDao().spaceDeclareDelete(sNo,conn);
		if(result > 0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result2;
	}
	public UserPage adminSelectAll(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new UserDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<User> list = new UserDao().adminSelectAll(conn,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/adminUserPage?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/adminUserPage?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/adminUserPage?reqPage="+pageNo+"'>다음</a>";
		}
		UserPage up = new UserPage(list, pageNavi);
		JDBCTemplate.close(conn);
		return up;
	}
	public SpacePage adminDeclareAll(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new UserDao().totalDeclareCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Declare> list = new UserDao().adminDeclareAll(conn,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/adminSpacePage?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/adminSpacePage?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/adminSpacePage?reqPage="+pageNo+"'>다음</a>";
		}
		SpacePage sp = new SpacePage(list, pageNavi);
		JDBCTemplate.close(conn);
		return sp;
	}
	public int pwSearch(String buf,String id,String email) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().pwSearch(buf,id,email,conn);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public User idSearch(String name,String email) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().idSearch(name,email,conn);
		JDBCTemplate.close(conn);
		return u;
	}
	public User login(String id, String pw) {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().login(id,pw,conn);
		JDBCTemplate.close(conn);
		return u;
	}
	public int join(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().join(u,conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public String checkId(String id) {
		Connection conn = JDBCTemplate.getConnection();
		String result = new UserDao().checkId(id,conn);
		JDBCTemplate.close(conn);
		return result;
	}
	public String checkEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		String result = new UserDao().checkEmail(email,conn);
		JDBCTemplate.close(conn);
		return result;
	}
	public int gradeUpdate(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().gradeUpdate(userNo,conn);
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
