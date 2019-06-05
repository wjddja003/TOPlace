package view.model.vo;

public class Like {
	private int likeNo;
	private int sNo;
	private int userNo;
	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Like(int likeNo, int sNo, int userNo) {
		super();
		this.likeNo = likeNo;
		this.sNo = sNo;
		this.userNo = userNo;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}
