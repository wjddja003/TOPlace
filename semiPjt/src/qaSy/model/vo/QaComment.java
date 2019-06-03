package qaSy.model.vo;

import java.sql.Date;

public class QaComment {
	private int qaCommentNo;
	private String qaCommentWriter;
	private String qaCommentContent;
	private int qaRef;
	private Date qaCommentDate;
	public QaComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QaComment(int qaCommentNo, String qaCommentWriter, String qaCommentContent, int qaRef, Date qaCommentDate) {
		super();
		this.qaCommentNo = qaCommentNo;
		this.qaCommentWriter = qaCommentWriter;
		this.qaCommentContent = qaCommentContent;
		this.qaRef = qaRef;
		this.qaCommentDate = qaCommentDate;
	}
	public int getQaCommentNo() {
		return qaCommentNo;
	}
	public void setQaCommentNo(int qaCommentNo) {
		this.qaCommentNo = qaCommentNo;
	}
	public String getQaCommentWriter() {
		return qaCommentWriter;
	}
	public void setQaCommentWriter(String qaCommentWriter) {
		this.qaCommentWriter = qaCommentWriter;
	}
	public String getQaCommentContent() {
		return qaCommentContent;
	}
	public void setQaCommentContent(String qaCommentContent) {
		this.qaCommentContent = qaCommentContent;
	}
	public int getQaRef() {
		return qaRef;
	}
	public void setQaRef(int qaRef) {
		this.qaRef = qaRef;
	}
	public Date getQaCommentDate() {
		return qaCommentDate;
	}
	public void setQaCommentDate(Date qaCommentDate) {
		this.qaCommentDate = qaCommentDate;
	}
}
