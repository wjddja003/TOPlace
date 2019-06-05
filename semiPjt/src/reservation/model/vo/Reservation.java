package reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;
	private int S_no;
	private int userNo;
	private String reservationName;
	private Date reservationDay;
	private String reservationTime;
	private String reservationPerson;
	private String paymentId;
	private int paymentPrice;
	private String paymentCard;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int reservationNo, int s_no, int userNo, String reservationName, Date reservationDay,
			String reservationTime, String reservationPerson, String paymentId, int paymentPrice, String paymentCard) {
		super();
		this.reservationNo = reservationNo;
		S_no = s_no;
		this.userNo = userNo;
		this.reservationName = reservationName;
		this.reservationDay = reservationDay;
		this.reservationTime = reservationTime;
		this.reservationPerson = reservationPerson;
		this.paymentId = paymentId;
		this.paymentPrice = paymentPrice;
		this.paymentCard = paymentCard;
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
	public Date getReservationDay() {
		return reservationDay;
	}
	public void setReservationDay(Date reservationDay) {
		this.reservationDay = reservationDay;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public String getReservationPerson() {
		return reservationPerson;
	}
	public void setReservationPerson(String reservationPerson) {
		this.reservationPerson = reservationPerson;
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
}
