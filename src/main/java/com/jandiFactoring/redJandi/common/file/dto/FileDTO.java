package com.jandiFactoring.redJandi.common.file.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("FileDTO")
public class FileDTO implements Serializable{

	private int fileCode;
	private String filePath;
	private String orgFilePath;
	private String email;
	private java.sql.Date writeDate;
	private int mokchaCode;
	private int postCode;
	private String isDeleted;
	private String nickName;
	
	public FileDTO() {	}

	public FileDTO(int fileCode, String filePath, String email, String orgFilePath, java.sql.Date writeDate, int mokchaCode,
			int postCode, String isDeleted, String nickName) {
		super();
		this.fileCode = fileCode;
		this.filePath = filePath;
		this.email = email;
		this.orgFilePath = orgFilePath;
		this.writeDate = writeDate;
		this.mokchaCode = mokchaCode;
		this.postCode = postCode;
		this.isDeleted = isDeleted;
		this.setNickName(nickName);
	}
	
	public FileDTO(String email, String filePath, String orgFilePath) {
		this.email = email;
		this.filePath = filePath;
		this.orgFilePath = orgFilePath;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrgFilePath() {
		return orgFilePath;
	}

	public void setOrgFilePath(String orgFilePath) {
		this.orgFilePath = orgFilePath;
	}

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getFileCode() {
		return fileCode;
	}

	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getMokchaCode() {
		return mokchaCode;
	}

	public void setMokchaCode(int mokchaCode) {
		this.mokchaCode = mokchaCode;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "ClassFileDTO [filePath=" + filePath + ", email=" + email + ", orgFilePath=" + orgFilePath
				+ ", writeDate=" + writeDate + ", fileCode=" + fileCode + ", postCode=" + postCode + ", mokchaCode="
				+ mokchaCode + ", isDeleted=" + isDeleted + ", nickName=" + nickName + "]";
	}
}
