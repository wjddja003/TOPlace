package reservation.model.vo;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class Reservation {
	private int reservationNo;
	private int S_no;
	private int userNo;
	private String reservationName;
	private String reservationDay;
	private String reservationBooker;
	private String reservationPhone;
	private String reservationPhone1;
	private String reservationPhone2;
	private String reservationTime;
	private int reservationPerson;
	private String reservationOption;
	private String reservationRequest;
	private String paymentId;
	private int paymentPrice;
	private String paymentCard;
	private ArrayList<String> rDay;

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(int reservationNo, int s_no, int userNo, String reservationName, String reservationDay,
			String reservationBooker, String reservationPhone, String reservationPhone1, String reservationPhone2,
			String reservationTime, int reservationPerson, String reservationOption, String reservationRequest,
			String paymentId, int paymentPrice, String paymentCard) {
		super();
		this.reservationNo = reservationNo;
		S_no = s_no;
		this.userNo = userNo;
		this.reservationName = reservationName;
		this.reservationDay = reservationDay;
		this.reservationBooker = reservationBooker;
		this.reservationPhone = reservationPhone;
		this.reservationPhone1 = reservationPhone1;
		this.reservationPhone2 = reservationPhone2;
		this.reservationTime = reservationTime;
		this.reservationPerson = reservationPerson;
		this.reservationOption = reservationOption;
		this.reservationRequest = reservationRequest;
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

	public String getReservationRequest() {
		return reservationRequest;
	}

	public void setReservationRequest(String reservationRequest) {
		this.reservationRequest = reservationRequest;
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
	public ArrayList<String> getRDay() {
		StringTokenizer st = new StringTokenizer(reservationDay, ",");
	      
	      rDay = new ArrayList<String>();
	      while(st.hasMoreTokens()) {
	         rDay.add(st.nextToken());
	      }
	     System.out.println(reservationDay);
		return rDay;
	}
	public void setRDay(ArrayList<String> rDay) {
		this.rDay = rDay;
	}
}
