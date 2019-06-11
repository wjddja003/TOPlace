package user.model.vo;

import java.util.ArrayList;

import toplace.model.vo.Declare;

public class SpacePage {
	private ArrayList<Declare> list;
	private String pageNavi;
	public SpacePage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpacePage(ArrayList<Declare> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Declare> getList() {
		return list;
	}
	public void setList(ArrayList<Declare> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
