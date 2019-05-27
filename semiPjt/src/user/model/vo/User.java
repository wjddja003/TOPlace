package user.model.vo;

public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userBirthday;
	private String userEmail;
	private String userGrade;
	private String userNickname;
	private int userTOS;
	private int userprivacy;
	private int userSMS;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int userNo, String userId, String userPw, String userName, String userPhone, String userBirthday,
			String userEmail, String userGrade, String userNickname, int userTOS, int userprivacy, int userSMS) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userBirthday = userBirthday;
		this.userEmail = userEmail;
		this.userGrade = userGrade;
		this.userNickname = userNickname;
		this.userTOS = userTOS;
		this.userprivacy = userprivacy;
		this.userSMS = userSMS;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getUserTOS() {
		return userTOS;
	}
	public void setUserTOS(int userTOS) {
		this.userTOS = userTOS;
	}
	public int getUserprivacy() {
		return userprivacy;
	}
	public void setUserprivacy(int userprivacy) {
		this.userprivacy = userprivacy;
	}
	public int getUserSMS() {
		return userSMS;
	}
	public void setUserSMS(int userSMS) {
		this.userSMS = userSMS;
	}
	
}
