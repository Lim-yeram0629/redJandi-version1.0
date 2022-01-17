package com.jandiFactoring.redJandi.classRoom.model.dto;

import java.sql.Date;

public class ClassPurchaseDTO {

	private String email;
	private int classCode;
	private String status;
	private int payCode;
	private int classPurcCode;
	private Date endDate;
	
	public ClassPurchaseDTO() {}

	public ClassPurchaseDTO(String email, int classCode, String status, int payCode, int classPurcCode, Date endDate) {
		super();
		this.email = email;
		this.classCode = classCode;
		this.status = status;
		this.payCode = payCode;
		this.classPurcCode = classPurcCode;
		this.endDate = endDate;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
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

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "ClassPurchaseDTO [email=" + email + ", classCode=" + classCode + ", status=" + status + ", payCode="
				+ payCode + ", classPurcCode=" + classPurcCode + ", endDate=" + endDate + "]";
	}


	
}
