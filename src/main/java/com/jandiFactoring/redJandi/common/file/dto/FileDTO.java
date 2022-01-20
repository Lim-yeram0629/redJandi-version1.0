package com.jandiFactoring.redJandi.common.file.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("FileDTO")
public class FileDTO implements Serializable{

	private int file_code;
	private String file_path;
	private String org_file_path;
	private String email;
	private java.sql.Date upload_date;
	private int mokcha_code;
	private int post_code;
	private String is_deleted;
	private String nickName;
	private List<FileDTO> files;
	
	public FileDTO() {	}

	public FileDTO(int file_code, String file_path, String org_file_path, String email, Date upload_date,
			int mokcha_code, int post_code, String is_deleted, String nickName) {
		super();
		this.file_code = file_code;
		this.file_path = file_path;
		this.org_file_path = org_file_path;
		this.email = email;
		this.upload_date = upload_date;
		this.mokcha_code = mokcha_code;
		this.post_code = post_code;
		this.is_deleted = is_deleted;
		this.nickName = nickName;
	}

	public int getFile_code() {
		return file_code;
	}

	public void setFile_code(int file_code) {
		this.file_code = file_code;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getOrg_file_path() {
		return org_file_path;
	}

	public void setOrg_file_path(String org_file_path) {
		this.org_file_path = org_file_path;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public java.sql.Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(java.sql.Date upload_date) {
		this.upload_date = upload_date;
	}

	public int getMokcha_code() {
		return mokcha_code;
	}

	public void setMokcha_code(int mokcha_code) {
		this.mokcha_code = mokcha_code;
	}

	public int getPost_code() {
		return post_code;
	}

	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}

	public String getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "FileDTO [file_code=" + file_code + ", file_path=" + file_path + ", org_file_path=" + org_file_path
				+ ", email=" + email + ", upload_date=" + upload_date + ", mokcha_code=" + mokcha_code + ", post_code="
				+ post_code + ", is_deleted=" + is_deleted + ", nickName=" + nickName + "]";
	}

	public List<FileDTO> getFiles() {
		return files;
	}

	public void setFiles(List<FileDTO> files) {
		this.files = files;
	}
	

}