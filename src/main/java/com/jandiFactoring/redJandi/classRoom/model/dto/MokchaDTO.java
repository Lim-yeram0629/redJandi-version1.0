package com.jandiFactoring.redJandi.classRoom.model.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("MokchaDTO")
public class MokchaDTO {

	private int mokcha_code;
	private String mokcha_name;
	private java.sql.Date write_date;
	private String contents;
	private int class_code;
	private String is_deleted;
	
	public MokchaDTO() {}
	
	public MokchaDTO(int mokcha_code, String mokcha_name, Date write_date, String contents, int class_code,
			String is_deleted) {
		super();
		this.mokcha_code = mokcha_code;
		this.mokcha_name = mokcha_name;
		this.write_date = write_date;
		this.contents = contents;
		this.class_code = class_code;
		this.is_deleted = is_deleted;
	}

	public int getMokcha_code() {
		return mokcha_code;
	}

	public void setMokcha_code(int mokcha_code) {
		this.mokcha_code = mokcha_code;
	}

	public String getMokcha_name() {
		return mokcha_name;
	}

	public void setMokcha_name(String mokcha_name) {
		this.mokcha_name = mokcha_name;
	}

	public java.sql.Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(java.sql.Date write_date) {
		this.write_date = write_date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getClass_code() {
		return class_code;
	}

	public void setClass_code(int class_code) {
		this.class_code = class_code;
	}

	public String getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}

	@Override
	public String toString() {
		return "MokchaDTO [mokcha_code=" + mokcha_code + ", mokcha_name=" + mokcha_name + ", write_date=" + write_date
				+ ", contents=" + contents + ", class_code=" + class_code + ", is_deleted=" + is_deleted + "]";
	}

	
	
}
