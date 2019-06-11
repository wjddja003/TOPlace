package reservation.model.vo;

import java.util.ArrayList;

public class ReservationImg {
	private int reservationNo;
	private int S_no;
	private int userNo;
	private String reservationName;
	private String reservationDay;
	private String reservationBooker;
	private String reservationTime;
	private int reservationPerson;
	private String reservationOption;
	private String paymentId;
	private int paymentPrice;
	private String paymentCard;
	private ArrayList<String> rDay;
	private String img;
	private String placeName;
	public ReservationImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationImg(int reservationNo, int s_no, int userNo, String reservationName, String reservationDay,
			String reservationBooker, String reservationTime, int reservationPerson, String reservationOption,
			String paymentId, int paymentPrice, String paymentCard, ArrayList<String> rDay, String img,
			String placeName) {
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
		this.img = img;
		this.placeName = placeName;
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
	
}
