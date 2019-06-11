package hostpage.model.vo;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class Reservation2 {
	private int reservationNo;
	private int S_no;
	private int userNo;
	private String reservationName;
	private String reservationDay; //예약날짜
	private String reservationBooker;
	private String reservationTime; //예약시간 
	private int reservationPerson; //인원 
	private String reservationOption; //추가인원 
	private String paymentId;
	private int paymentPrice;
	private String paymentCard;
	private ArrayList<String> rDay;
	private String s_img1;
	private String reservationPhone; // 010
	private String reservationPhone1; // ????앞
	private String reservationPhone2; //폰번호 3개 ????뒤 
	private String reservationRequest; //요청사항
	public Reservation2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation2(int reservationNo, int s_no, int userNo, String reservationName, String reservationDay,
			String reservationBooker, String reservationTime, int reservationPerson, String reservationOption,
			String paymentId, int paymentPrice, String paymentCard, ArrayList<String> rDay, String s_img1,
			String reservationPhone, String reservationPhone1, String reservationPhone2, String reservationRequest) {
		super();
		this.reservationNo = reservationNo;
		S_no = s_no;
		this.userNo = userNo;
		this.reservationName = reservationName;
		this.reservationDay = reservationDay;
		this.reservationBooker = reservationBooker;
		this.reservationTime = reservationTime;
		this.reservationPerson = reservationPerson;
		this.reservationOption = reservationOption;
		this.paymentId = paymentId;
		this.paymentPrice = paymentPrice;
		this.paymentCard = paymentCard;
		this.rDay = rDay;
		this.s_img1 = s_img1;
		this.reservationPhone = reservationPhone;
		this.reservationPhone1 = reservationPhone1;
		this.reservationPhone2 = reservationPhone2;
		this.reservationRequest = reservationRequest;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getS_no() {
		return S_no;
	}
	public void setS_no(int s_no) {
		S_no = s_no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getReservationName() {
		return reservationName;
	}
	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}
	public String getReservationDay() {
		return reservationDay;
	}
	public void setReservationDay(String reservationDay) {
		this.reservationDay = reservationDay;
	}
	public String getReservationBooker() {
		return reservationBooker;
	}
	public void setReservationBooker(String reservationBooker) {
		this.reservationBooker = reservationBooker;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public int getReservationPerson() {
		return reservationPerson;
	}
	public void setReservationPerson(int reservationPerson) {
		this.reservationPerson = reservationPerson;
	}
	public String getReservationOption() {
		return reservationOption;
	}
	public void setReservationOption(String reservationOption) {
		this.reservationOption = reservationOption;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentCard() {
		return paymentCard;
	}
	public void setPaymentCard(String paymentCard) {
		this.paymentCard = paymentCard;
	}
	public ArrayList<String> getrDay() {
		return rDay;
	}
	public void setrDay(ArrayList<String> rDay) {
		this.rDay = rDay;
	}
	public String getS_img1() {
		return s_img1;
	}
	public void setS_img1(String s_img1) {
		this.s_img1 = s_img1;
	}
	public String getReservationPhone() {
		return reservationPhone;
	}
	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}
	public String getReservationPhone1() {
		return reservationPhone1;
	}
	public void setReservationPhone1(String reservationPhone1) {
		this.reservationPhone1 = reservationPhone1;
	}
	public String getReservationPhone2() {
		return reservationPhone2;
	}
	public void setReservationPhone2(String reservationPhone2) {
		this.reservationPhone2 = reservationPhone2;
	}
	public String getReservationRequest() {
		return reservationRequest;
	}
	public void setReservationRequest(String reservationRequest) {
		this.reservationRequest = reservationRequest;
	}
	
	
}
