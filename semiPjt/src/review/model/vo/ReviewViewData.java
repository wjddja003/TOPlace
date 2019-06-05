package review.model.vo;

import java.util.ArrayList;

public class ReviewViewData {
	private ArrayList<ReviewComment> list;
	private Review r;
	public ReviewViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewViewData(ArrayList<ReviewComment> list, Review r) {
		super();
		this.list = list;
		this.r = r;
	}
	public ArrayList<ReviewComment> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewComment> list) {
		this.list = list;
	}
	public Review getR() {
		return r;
	}
	public void setR(Review r) {
		this.r = r;
	}
	
	
}
