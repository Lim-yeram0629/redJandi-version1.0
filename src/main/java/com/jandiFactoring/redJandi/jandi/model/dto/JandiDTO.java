package com.jandiFactoring.redJandi.jandi.model.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("JandiDTO")
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
	
	public JandiDTO() {	}
	
	public JandiDTO(String email, String nickName, String career, String intro, String profile_path, Date enroll_date,
			String account, String bank, String acc_name) {
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

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
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

	@Override
	public String toString() {
		return "JandiDTO [email=" + email + ", nickName=" + nickName + ", career=" + career + ", intro=" + intro
				+ ", profile_path=" + profile_path + ", enroll_date=" + enroll_date + ", account=" + account + ", bank="
				+ bank + ", acc_name=" + acc_name + "]";
	}
	
}
