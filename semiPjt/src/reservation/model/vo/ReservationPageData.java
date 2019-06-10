package reservation.model.vo;

import java.util.ArrayList;

public class ReservationPageData {
	private ArrayList<ReservationImg> list;
	private String pageNavi;
	public ReservationPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationPageData(ArrayList<ReservationImg> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<ReservationImg> getList() {
		return list;
	}
	public void setList(ArrayList<ReservationImg> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
