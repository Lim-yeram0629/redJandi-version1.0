package com.jandiFactoring.redJandi.mypage.model.dto;

import java.sql.Date;

public class PurchaseClassDTO {

	private String email;
	private int classCode;
	private char status;
	private int payCode;
	private int classPurcCode;
	private java.sql.Date endDate;
	private String teacher;
	
	public PurchaseClassDTO() {}

	public PurchaseClassDTO(String email, int classCode, char status, int payCode, int classPurcCode, Date endDate,
			String teacher) {
		super();
		this.email = email;
		this.classCode = classCode;
		this.status = status;
		this.payCode = payCode;
		this.classPurcCode = classPurcCode;
		this.endDate = endDate;
		this.teacher = teacher;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getClassPurcCode() {
		return classPurcCode;
	}

	public void setClassPurcCode(int classPurcCode) {
		this.classPurcCode = classPurcCode;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	@Override
	public String toString() {
		return "PurchaseClassDTO [email=" + email + ", classCode=" + classCode + ", status=" + status + ", payCode="
				+ payCode + ", classPurcCode=" + classPurcCode + ", endDate=" + endDate + ", teacher=" + teacher + "]";
	}

	
	
	
	
}
