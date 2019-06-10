package hostpage.model.vo;

public class Hostpage {
 private String profile;
 private String space;
 private String review;
public Hostpage() {
	super();
	// TODO Auto-generated constructor stub
}
public Hostpage(String profile, String space, String review) {
	super();
	this.profile = profile;
	this.space = space;
	this.review = review;
}
public String getProfile() {
	return profile;
}
public void setProfile(String profile) {
	this.profile = profile;
}
public String getSpace() {
	return space;
}
public void setSpace(String space) {
	this.space = space;
}
public String getReview() {
	return review;
}
public void setReview(String review) {
	this.review = review;
}
 
}  