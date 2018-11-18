package com.siyuruoli.model;
/**
 * 生日
 * @author biao
 *
 */
public class Birthday {

	private Integer birthdayId;
	private Integer userId;
	private String year;
	private String month;
	private String day;
	
	public Integer getBirthdayId() {
		return birthdayId;
	}
	public void setBirthdayId(Integer birthdayId) {
		this.birthdayId = birthdayId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "Birthday [birthdayId=" + birthdayId + ", userId=" + userId + ", year=" + year + ", month=" + month
				+ ", day=" + day + "]";
	}
	
	
}
