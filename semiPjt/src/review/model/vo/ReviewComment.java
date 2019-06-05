package review.model.vo;

import java.sql.Date;

public class ReviewComment {
	private int reviewCommentNo;
	private int reviewCommentLevel;
	private String reviewCommentWriter;
	private String reviewCommentContent;
	private int reviewRef;
	private int reviewCommentRef;
	private Date reviewCommentDate;
	public ReviewComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewComment(int reviewCommentNo, int reviewCommentLevel, String reviewCommentWriter,
			String reviewCommentContent, int reviewRef, int reviewCommentRef, Date reviewCommentDate) {
		super();
		this.reviewCommentNo = reviewCommentNo;
		this.reviewCommentLevel = reviewCommentLevel;
		this.reviewCommentWriter = reviewCommentWriter;
		this.reviewCommentContent = reviewCommentContent;
		this.reviewRef = reviewRef;
		this.reviewCommentRef = reviewCommentRef;
		this.reviewCommentDate = reviewCommentDate;
	}
	public int getReviewCommentNo() {
		return reviewCommentNo;
	}
	public void setReviewCommentNo(int reviewCommentNo) {
		this.reviewCommentNo = reviewCommentNo;
	}
	public int getReviewCommentLevel() {
		return reviewCommentLevel;
	}
	public void setReviewCommentLevel(int reviewCommentLevel) {
		this.reviewCommentLevel = reviewCommentLevel;
	}
	public String getReviewCommentWriter() {
		return reviewCommentWriter;
	}
	public void setReviewCommentWriter(String reviewCommentWriter) {
		this.reviewCommentWriter = reviewCommentWriter;
	}
	public String getReviewCommentContent() {
		return reviewCommentContent;
	}
	public void setReviewCommentContent(String reviewCommentContent) {
		this.reviewCommentContent = reviewCommentContent;
	}
	public int getReviewRef() {
		return reviewRef;
	}
	public void setReviewRef(int reviewRef) {
		this.reviewRef = reviewRef;
	}
	public int getReviewCommentRef() {
		return reviewCommentRef;
	}
	public void setReviewCommentRef(int reviewCommentRef) {
		this.reviewCommentRef = reviewCommentRef;
	}
	public Date getReviewCommentDate() {
		return reviewCommentDate;
	}
	public void setReviewCommentDate(Date reviewCommentDate) {
		this.reviewCommentDate = reviewCommentDate;
	}
	
}
