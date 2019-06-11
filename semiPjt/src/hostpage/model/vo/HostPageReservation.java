package hostpage.model.vo;

import java.util.ArrayList;

import reservation.model.vo.Reservation;
import space.model.vo.Space;

public class HostPageReservation {

	ArrayList<Space> list;
	ArrayList<Reservation> list2;
	public HostPageReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HostPageReservation(ArrayList<Space> list, ArrayList<Reservation> list2) {
		super();
		this.list = list;
		this.list2 = list2;
	}
	public ArrayList<Space> getList() {
		return list;
	}
	public void setList(ArrayList<Space> list) {
		this.list = list;
	}
	public ArrayList<Reservation> getList2() {
		return list2;
	}
	public void setList2(ArrayList<Reservation> list2) {
		this.list2 = list2;
	}
	

	
	
}
