package helpSy.model.vo;

import java.sql.Date;

public class Help {
	private int helpNo;
	private String helpCategory;
	private String helpTitle;
	private String helpWriter;
	private String helpContent;
	private Date helpDate;
	private String filename;
	private String filepath;
	public Help() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Help(int helpNo, String helpCategory, String helpTitle, String helpWriter, String helpContent, Date helpDate,
			String filename, String filepath) {
		super();
		this.helpNo = helpNo;
		this.helpCategory = helpCategory;
		this.helpTitle = helpTitle;
		this.helpWriter = helpWriter;
		this.helpContent = helpContent;
		this.helpDate = helpDate;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(int helpNo) {
		this.helpNo = helpNo;
	}
	public String getHelpCategory() {
		return helpCategory;
	}
	public void setHelpCategory(String helpCategory) {
		this.helpCategory = helpCategory;
	}
	public String getHelpTitle() {
		return helpTitle;
	}
	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}
	public String getHelpWriter() {
		return helpWriter;
	}
	public void setHelpWriter(String helpWriter) {
		this.helpWriter = helpWriter;
	}
	public String getHelpContent() {
		return helpContent;
	}
	public void setHelpContent(String helpContent) {
		this.helpContent = helpContent;
	}
	public Date getHelpDate() {
		return helpDate;
	}
	public void setHelpDate(Date helpDate) {
		this.helpDate = helpDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
