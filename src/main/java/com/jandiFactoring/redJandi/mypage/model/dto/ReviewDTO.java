package com.jandiFactoring.redJandi.mypage.model.dto;

import java.sql.Date;

public class ReviewDTO {

	private int rvCode;
	private java.sql.Date writeDate;
	private int star;
	private String contents;
	private String isDelete;
	private int classCode;
	private String email;
	
	
	
	public ReviewDTO() {}



	public ReviewDTO(int rvCode, Date writeDate, int star, String contents, String isDelete, int classCode,
			String email) {
		super();
		this.rvCode = rvCode;
		this.writeDate = writeDate;
		this.star = star;
		this.contents = contents;
		this.isDelete = isDelete;
		this.classCode = classCode;
		this.email = email;
	}



	public int getRvCode() {
		return rvCode;
	}



	public void setRvCode(int rvCode) {
		this.rvCode = rvCode;
	}



	public java.sql.Date getWriteDate() {
		return writeDate;
	}



	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}



	public int getStar() {
		return star;
	}



	public void setStar(int star) {
		this.star = star;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public String getIsDelete() {
		return isDelete;
	}



	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}



	public int getClassCode() {
		return classCode;
	}



	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "ReviewDTO [rvCode=" + rvCode + ", writeDate=" + writeDate + ", star=" + star + ", contents=" + contents
				+ ", isDelete=" + isDelete + ", classCode=" + classCode + ", email=" + email + "]";
	}

	
}
