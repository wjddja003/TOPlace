package user.model.vo;

import java.util.Date;

public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userGender;
	private String userPhone;
	private String userBirthday;
	private String userEmail;
	private String userGrade;
	private int userAddressNumber;
	private String userAddress;
	private String userTOS;
	private String userprivacy;
	private String userSMS;
	private Date enrollDate;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int userNo, String userId, String userPw, String userName, String userGender, String userPhone,
			String userBirthday, String userEmail, String userGrade, int userAddressNumber, String userAddress,
			String userTOS, String userprivacy, String userSMS, Date enrollDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userBirthday = userBirthday;
		this.userEmail = userEmail;
		this.userGrade = userGrade;
		this.userAddressNumber = userAddressNumber;
		this.userAddress = userAddress;
		this.userTOS = userTOS;
		this.userprivacy = userprivacy;
		this.userSMS = userSMS;
		this.enrollDate = enrollDate;
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
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
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
	public int getUserAddressNumber() {
		return userAddressNumber;
	}
	public void setUserAddressNumber(int userAddressNumber) {
		this.userAddressNumber = userAddressNumber;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserTOS() {
		return userTOS;
	}
	public void setUserTOS(String userTOS) {
		this.userTOS = userTOS;
	}
	public String getUserprivacy() {
		return userprivacy;
	}
	public void setUserprivacy(String userprivacy) {
		this.userprivacy = userprivacy;
	}
	public String getUserSMS() {
		return userSMS;
	}
	public void setUserSMS(String userSMS) {
		this.userSMS = userSMS;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
}
