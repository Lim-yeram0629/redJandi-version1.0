package com.jandiFactoring.redJandi.jandi.model.dto;

import java.sql.Date;

public class JandiDTO {
	
	private String email;
	private String nickName;
	private String career;
	private String intro;
	private String profile_path;
	private java.sql.Date enroll_date;
	private String account;
	private String bank;
	private String acc_name;
	private String title;
	
	public JandiDTO() {	}
	
	public JandiDTO(String email, String nickName, String career, String intro, String profile_path, Date enroll_date,
			String account, String bank, String acc_name, String title) {
		super();
		this.email = email;
		this.nickName = nickName;
		this.career = career;
		this.intro = intro;
		this.profile_path = profile_path;
		this.enroll_date = enroll_date;
		this.account = account;
		this.bank = bank;
		this.acc_name = acc_name;
		this.setTitle(title);
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

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getprofile_path() {
		return profile_path;
	}

	public void setprofile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public java.sql.Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(java.sql.Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "JandiDTO [email=" + email + ", nickName=" + nickName + ", career=" + career + ", intro=" + intro
				+ ", profile_path=" + profile_path + ", enroll_date=" + enroll_date + ", account=" + account + ", bank="
				+ bank + ", acc_name=" + acc_name + ", title=" + title + "]";
	}

	

}
