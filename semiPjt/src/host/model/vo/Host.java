package host.model.vo;

public class Host {
	private int hostNo; //호스트 번호
	private String hostName; //호스트닉네임
	private String hostFile; //호스트 이미지 파일
	private String hostContent; // 호스트 소개글
	private int userNo; //회원 번호
	public Host() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Host(int hostNo, String hostName, String hostFile, String hostContent, int userNo) {
		super();
		this.hostNo = hostNo;
		this.hostName = hostName;
		this.hostFile = hostFile;
		this.hostContent = hostContent;
		this.userNo = userNo;
	}
	public int getHostNo() {
		return hostNo;
	}
	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getHostFile() {
		return hostFile;
	}
	public void setHostFile(String hostFile) {
		this.hostFile = hostFile;
	}
	public String getHostContent() {
		return hostContent;
	}
	public void setHostContent(String hostContent) {
		this.hostContent = hostContent;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}
