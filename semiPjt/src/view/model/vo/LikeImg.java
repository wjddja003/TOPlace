package view.model.vo;

public class LikeImg {
	private int likeNo;
	private int sNo;
	private int userNo;
	private String img;
	private String placeName;
	private int price;
	private String placeTag;
	private String address;
	private String type;
	private String S_kategorie2;
	public LikeImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeImg(int likeNo, int sNo, int userNo, String img, String placeName, int price, String placeTag,
			String address, String type, String s_kategorie2) {
		super();
		this.likeNo = likeNo;
		this.sNo = sNo;
		this.userNo = userNo;
		this.img = img;
		this.placeName = placeName;
		this.price = price;
		this.placeTag = placeTag;
		this.address = address;
		this.type = type;
		S_kategorie2 = s_kategorie2;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlaceTag() {
		return placeTag;
	}
	public void setPlaceTag(String placeTag) {
		this.placeTag = placeTag;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getS_kategorie2() {
		return S_kategorie2;
	}
	public void setS_kategorie2(String s_kategorie2) {
		S_kategorie2 = s_kategorie2;
	}
	

}
