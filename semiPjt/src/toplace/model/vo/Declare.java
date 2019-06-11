package toplace.model.vo;

public class Declare {
	private int declareNo;
	private int S_no;
	private String S_placeName;
	private String declareType;
	private String userName;
	private String declareContent;
	public Declare(int declareNo, int s_no, String s_placeName, String declareType, String userName,
			String declareContent) {
		super();
		this.declareNo = declareNo;
		S_no = s_no;
		S_placeName = s_placeName;
		this.declareType = declareType;
		this.userName = userName;
		this.declareContent = declareContent;
	}
	public Declare() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getDeclareNo() {
		return declareNo;
	}
	public void setDeclareNo(int declareNo) {
		this.declareNo = declareNo;
	}
	public int getS_no() {
		return S_no;
	}
	public void setS_no(int s_no) {
		S_no = s_no;
	}
	public String getS_placeName() {
		return S_placeName;
	}
	public void setS_placeName(String s_placeName) {
		S_placeName = s_placeName;
	}
	public String getDeclareType() {
		return declareType;
	}
	public void setDeclareType(String declareType) {
		this.declareType = declareType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDeclareContent() {
		return declareContent;
	}
	public void setDeclareContent(String declareContent) {
		this.declareContent = declareContent;
	}
	
}
