package review.model.vo;

import java.util.ArrayList;

public class ReviewPageData {
	private ArrayList<Review> list;
	private String pageNavi;
	private int totalCount;
	private double totalStar;
	
	public ReviewPageData(ArrayList<Review> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ReviewPageData(ArrayList<Review> list, String pageNavi, int totalCount,double totalStar) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
		this.totalStar = totalStar;
	}
	public double getTotalStar() {
		return totalStar;
	}
	public void setTotalStar(double totalStar) {
		this.totalStar = totalStar;
	}
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewPageData(ArrayList<Review> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
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
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
