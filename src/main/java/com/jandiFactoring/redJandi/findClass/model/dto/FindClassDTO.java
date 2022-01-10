package com.jandiFactoring.redJandi.findClass.model.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("FindClassDTO")
public class FindClassDTO {
	
	private int classCode;
	private java.sql.Date createDate;
	private String tag;
	private String title;
	private int price;
	private String filePath;
    private String profilePath;
    private String nickName;
    private String categoryName;
    private double avgStar;
    private int rvCount;
    
    public FindClassDTO() {}

	public FindClassDTO(int classCode, Date createDate, String tag, String title, int price, String filePath,
			String profilePath, String nickName, String categoryName, double avgStar, int rvCount) {
		super();
		this.classCode = classCode;
		this.createDate = createDate;
		this.tag = tag;
		this.title = title;
		this.price = price;
		this.filePath = filePath;
		this.profilePath = profilePath;
		this.nickName = nickName;
		this.categoryName = categoryName;
		this.avgStar = avgStar;
		this.rvCount = rvCount;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public java.sql.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public double getAvgStar() {
		return avgStar;
	}

	public void setAvgStar(double avgStar) {
		this.avgStar = avgStar;
	}

	public int getRvCount() {
		return rvCount;
	}

	public void setRvCount(int rvCount) {
		this.rvCount = rvCount;
	}

	@Override
	public String toString() {
		return "FindClassDTO [classCode=" + classCode + ", createDate=" + createDate + ", tag=" + tag + ", title="
				+ title + ", price=" + price + ", filePath=" + filePath + ", profilePath=" + profilePath + ", nickName="
				+ nickName + ", categoryName=" + categoryName + ", avgStar=" + avgStar + ", rvCount=" + rvCount + "]";
	}


}
