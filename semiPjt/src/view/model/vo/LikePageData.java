package view.model.vo;

import java.util.ArrayList;

public class LikePageData {
	private ArrayList<LikeImg> list;
	private String pageNavi;
	public LikePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikePageData(ArrayList<LikeImg> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<LikeImg> getList() {
		return list;
	}
	public void setList(ArrayList<LikeImg> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
