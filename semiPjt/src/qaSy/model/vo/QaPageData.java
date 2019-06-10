package qaSy.model.vo;

import java.util.ArrayList;

public class QaPageData {
	private ArrayList<QaComment> list;
	private String pageNavi;
	private ArrayList<QaComment> listAll;
	private int totalCount;
	public QaPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public QaPageData(ArrayList<QaComment> list, String pageNavi, ArrayList<QaComment> listAll, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.listAll = listAll;
		this.totalCount = totalCount;
	}

	public QaPageData(ArrayList<QaComment> list, String pageNavi, ArrayList<QaComment> listAll) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.listAll = listAll;
	}
	
	public QaPageData(ArrayList<QaComment> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<QaComment> getList() {
		return list;
	}
	public void setList(ArrayList<QaComment> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ArrayList<QaComment> getListAll() {
		return listAll;
	}
	public void setListAll(ArrayList<QaComment> listAll) {
		this.listAll = listAll;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
}