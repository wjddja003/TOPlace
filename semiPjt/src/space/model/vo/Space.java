package space.model.vo;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Space {
	private int S_no;//공간번호
	private int S_hostNum;
	private String S_placeName;
	private String S_kategorie1;
	private String S_placeIntroduce1;
	private String S_placeIntroduce2;
	private String S_placeTag;
	private String S_kategorie2;
	private String S_placeWeb;
	private String S_img1;
	private String S_img2;
	private int addrNum;
	private String address;
	private String S_email;
	private String S_phone1;
	private String S_phone2;
	private String S_type;
	private int S_start;
	private int S_end;
	private String S_holiday;
	private int S_people;
	private String S_warning;
	private int S_price1;
	private int S_price2;
	private int S_hit;
	private int S_like;
	private String[] S_kategorieList;
	public Space() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Space(int s_no, int s_hostNum, String s_placeName, String s_kategorie1, String s_placeIntroduce1,
			String s_placeIntroduce2, String s_placeTag, String s_kategorie2, String s_placeWeb, String s_img1,
			String s_img2, int addrNum, String address, String s_email, String s_phone1, String s_phone2, String s_type,
			int s_start, int s_end, String s_holiday, int s_people, String s_warning, int s_price1, int s_price2,
			int s_hit, int s_like) {
		super();
		S_no = s_no;
		S_hostNum = s_hostNum;
		S_placeName = s_placeName;
		S_kategorie1 = s_kategorie1;
		S_placeIntroduce1 = s_placeIntroduce1;
		S_placeIntroduce2 = s_placeIntroduce2;
		S_placeTag = s_placeTag;
		S_kategorie2 = s_kategorie2;
		S_placeWeb = s_placeWeb;
		S_img1 = s_img1;
		S_img2 = s_img2;
		this.addrNum = addrNum;
		this.address = address;
		S_email = s_email;
		S_phone1 = s_phone1;
		S_phone2 = s_phone2;
		S_type = s_type;
		S_start = s_start;
		S_end = s_end;
		S_holiday = s_holiday;
		S_people = s_people;
		S_warning = s_warning;
		S_price1 = s_price1;
		S_price2 = s_price2;
		S_hit = s_hit;
		S_like = s_like;
	}
	public int getS_no() {
		return S_no;
	}
	public void setS_no(int s_no) {
		S_no = s_no;
	}
	public int getS_hostNum() {
		return S_hostNum;
	}
	public void setS_hostNum(int s_hostNum) {
		S_hostNum = s_hostNum;
	}
	public String getS_placeName() {
		return S_placeName;
	}
	public void setS_placeName(String s_placeName) {
		S_placeName = s_placeName;
	}
	public String getS_kategorie1() {
		return S_kategorie1;
	}
	public void setS_kategorie1(String s_kategorie1) {
		S_kategorie1 = s_kategorie1;
	}
	public String getS_placeIntroduce1() {
		return S_placeIntroduce1;
	}
	public void setS_placeIntroduce1(String s_placeIntroduce1) {
		S_placeIntroduce1 = s_placeIntroduce1;
	}
	public String getS_placeIntroduce2() {
		return S_placeIntroduce2;
	}
	public void setS_placeIntroduce2(String s_placeIntroduce2) {
		S_placeIntroduce2 = s_placeIntroduce2;
	}
	public String getS_placeTag() {
		return S_placeTag;
	}
	public void setS_placeTag(String s_placeTag) {
		S_placeTag = s_placeTag;
	}
	public String getS_kategorie2() {
		return S_kategorie2;
	}
	public void setS_kategorie2(String s_kategorie2) {
		S_kategorie2 = s_kategorie2;
	}
	public String getS_placeWeb() {
		return S_placeWeb;
	}
	public void setS_placeWeb(String s_placeWeb) {
		S_placeWeb = s_placeWeb;
	}
	public String getS_img1() {
		return S_img1;
	}
	public void setS_img1(String s_img1) {
		S_img1 = s_img1;
	}
	public String getS_img2() {
		return S_img2;
	}
	public void setS_img2(String s_img2) {
		S_img2 = s_img2;
	}
	public int getAddrNum() {
		return addrNum;
	}
	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getS_email() {
		return S_email;
	}
	public void setS_email(String s_email) {
		S_email = s_email;
	}
	public String getS_phone1() {
		return S_phone1;
	}
	public void setS_phone1(String s_phone1) {
		S_phone1 = s_phone1;
	}
	public String getS_phone2() {
		return S_phone2;
	}
	public void setS_phone2(String s_phone2) {
		S_phone2 = s_phone2;
	}
	public String getS_type() {
		return S_type;
	}
	public void setS_type(String s_type) {
		S_type = s_type;
	}
	public int getS_start() {
		return S_start;
	}
	public void setS_start(int s_start) {
		S_start = s_start;
	}
	public int getS_end() {
		return S_end;
	}
	public void setS_end(int s_end) {
		S_end = s_end;
	}
	public String getS_holiday() {
		return S_holiday;
	}
	public void setS_holiday(String s_holiday) {
		S_holiday = s_holiday;
	}
	public int getS_people() {
		return S_people;
	}
	public void setS_people(int s_people) {
		S_people = s_people;
	}
	public String getS_warning() {
		return S_warning;
	}
	public void setS_warning(String s_warning) {
		S_warning = s_warning;
	}
	public int getS_price1() {
		return S_price1;
	}
	public void setS_price1(int s_price1) {
		S_price1 = s_price1;
	}
	public int getS_price2() {
		return S_price2;
	}
	public void setS_price2(int s_price2) {
		S_price2 = s_price2;
	}
	public int getS_hit() {
		return S_hit;
	}
	public void setS_hit(int s_hit) {
		S_hit = s_hit;
	}
	public int getS_like() {
		return S_like;
	}
	public void setS_like(int s_like) {
		S_like = s_like;
	}
	public String[] getS_kategorieList(){
		
		
		return S_kategorieList;
	}
	public void setS_kategorieList(String str) {
		StringTokenizer st = new StringTokenizer(str,","); 
		String[] list = new String[21];
		int i = 0;
		while(st.hasMoreTokens()) { 
			list[i] = st.nextToken();
			i++;
		}
		S_kategorieList =list; 
	}
	public String[] getS_kategorieName() {
		String[] list = {"TV/프로젝터","인터넷/WIFI","복사/인쇄기","화이트보드","음향/마이크","취사시설","음식물반입가능","주류반입가능","샤워시설","주차","금연","반려동물 동반 가능","PC/노트북","의자/테이블","내부화장실","탈의실","테라스/루프탑","공용라운지","전신거울","바베큐시설","도어락"};
		return list;
	}
	
	public ArrayList<String> getDelImg() {
	      StringTokenizer st = new StringTokenizer(S_img2, ",");
	      
	      ArrayList<String> list = new ArrayList<String>();
	      while(st.hasMoreTokens()) {
	         list.add(st.nextToken());
	      }
	      return list;
	   }
	
}
