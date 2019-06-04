package hostpage.model.vo;

import java.util.ArrayList;

import space.model.vo.Space;

public class HostDataPage {
	
	private ArrayList<Space> list;
	private int count;
	public HostDataPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HostDataPage(ArrayList<Space> list, int count) {
		super();
		this.list = list;
		this.count = count;
	}
	public ArrayList<Space> getList() {
		return list;
	}
	public void setList(ArrayList<Space> list) {
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
