package helpSy.model.vo;

import java.util.ArrayList;

public class HelpPageData {
	private ArrayList<Help> list;
	private String pageNavi;
	public HelpPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HelpPageData(ArrayList<Help> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Help> getList() {
		return list;
	}
	public void setList(ArrayList<Help> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
