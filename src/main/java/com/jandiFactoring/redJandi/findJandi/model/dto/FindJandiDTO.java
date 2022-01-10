package com.jandiFactoring.redJandi.findJandi.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("FindJandiDTO")
public class FindJandiDTO {

	private String email;
	private String nickname;
	private String profile_path;
	private int sumviews;
	
	public FindJandiDTO() {
		super();
	}

	public FindJandiDTO(String email, String nickname, String profile_path, int sumviews) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.profile_path = profile_path;
		this.sumviews = sumviews;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	

	@Override
	public String toString() {
		return "FindJandiDTO [email=" + email + ", nickname=" + nickname + ", profile_path=" + profile_path
				+ ", sumviews=" + sumviews + "]";
	}

	public int getSumviews() {
		return sumviews;
	}

	public void setSumviews(int sumviews) {
		this.sumviews = sumviews;
	}
	
	
}
