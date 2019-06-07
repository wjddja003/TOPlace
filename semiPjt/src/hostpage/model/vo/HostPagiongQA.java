package hostpage.model.vo;

import java.util.ArrayList;

import qaSy.model.vo.QaComment;

public class HostPagiongQA {

	ArrayList<QaComment> Qalist;
	private String pageNavi;
	public HostPagiongQA() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HostPagiongQA(ArrayList<QaComment> qalist, String pageNavi) {
		super();
		Qalist = qalist;
		this.pageNavi = pageNavi;
	}
	public ArrayList<QaComment> getQalist() {
		return Qalist;
	}
	public void setQalist(ArrayList<QaComment> qalist) {
		Qalist = qalist;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
  