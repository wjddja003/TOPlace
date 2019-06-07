package review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int reviewSno;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private String filename;
	private int reviewStar;
	private Date reviewDate;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, int reviewSno, String reviewTitle, String reviewWriter, String reviewContent,
			String filename, int reviewStar, Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewSno = reviewSno;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.filename = filename;
		this.reviewStar = reviewStar;
		this.reviewDate = reviewDate;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewSno() {
		return reviewSno;
	}
	public void setReviewSno(int reviewSno) {
		this.reviewSno = reviewSno;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
