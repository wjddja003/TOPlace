package hostpage.model.vo;

import java.util.ArrayList;

import review.model.vo.Review;
import user.model.vo.User;

public class HostPaging {
	
	private ArrayList<Review> list;
	private String pageNavi;
	public HostPaging() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Review> getList() {
		return list;
	}
	public void setList(ArrayList<Review> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public HostPaging(ArrayList<Review> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}sadsadsafsafsaf
}
  