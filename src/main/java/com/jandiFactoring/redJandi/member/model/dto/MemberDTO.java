package com.jandiFactoring.redJandi.member.model.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value = "MemberDTO")
public class MemberDTO {
	
	private String email;
	private String nickName;
	private String password;
	private String phone;
	private char isJandi;
	private int warning;
	private char isBlack;
	private java.sql.Date enrollDate;
	private char isExit;
	private String name;
	private java.sql.Date blackEndDate;
	
	public MemberDTO() {
	}

	public MemberDTO(String email, String nickName, String password, String phone, char isJandi, int warning,
			char isBlack, Date enrollDate, char isExit, String name, Date blackEndDate) {
		super();
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.phone = phone;
		this.isJandi = isJandi;
		this.warning = warning;
		this.isBlack = isBlack;
		this.enrollDate = enrollDate;
		this.isExit = isExit;
		this.name = name;
		this.blackEndDate = blackEndDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getIsJandi() {
		return isJandi;
	}

	public void setIsJandi(char isJandi) {
		this.isJandi = isJandi;
	}

	public int getWarning() {
		return warning;
	}

	public void setWarning(int warning) {
		this.warning = warning;
	}

	public char getIsBlack() {
		return isBlack;
	}

	public void setIsBlack(char isBlack) {
		this.isBlack = isBlack;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getIsExit() {
		return isExit;
	}

	public void setIsExit(char isExit) {
		this.isExit = isExit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public java.sql.Date getBlackEndDate() {
		return blackEndDate;
	}
	
	public void setBlackEndDate(java.sql.Date blackEndDate) {
		this.blackEndDate = blackEndDate;
	}

	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", nickName=" + nickName + ", password=" + password + ", phone=" + phone
				+ ", isJandi=" + isJandi + ", warning=" + warning + ", isBlack=" + isBlack + ", enrollDate="
				+ enrollDate + ", isExit=" + isExit + ", name=" + name + ", blackEndDate=" + blackEndDate + "]";
	}

	

}
