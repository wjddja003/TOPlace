package review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo; //리뷰번호
	private int reviewSno; //공간번호
	private String reviewTitle; //제목
	private String reviewWriter; //작성자
	private String reviewContent; //글
	private String filename; 
	private Date reviewDate; //작성일
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, int reviewSno, String reviewTitle, String reviewWriter, String reviewContent,
			String filename, Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewSno = reviewSno;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.filename = filename;
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
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
