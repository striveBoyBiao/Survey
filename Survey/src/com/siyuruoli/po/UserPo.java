package com.siyuruoli.po;
/**
 * 用户PO
 * @author biao
 *
 */
public class UserPo {
	private Integer userId;
	private String userNickName;
	private String userAccount;
	private String userPassword;
	private String sex;
	private String userImgPath;
	private String userPhone;
	private String userSalary;
	private String education;
	private String signature;
	private String likeMusic;
	private String wish;
	private String userType;
	private String isDestroy;
	//生日
	private String year;
	private String month;
	private String day;
	//住所
	private String province;
	private String city;
	//职业
	private String occupation;
	private String industry;
	private String department;
	
	
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUserImgPath() {
		return userImgPath;
	}
	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserSalary() {
		return userSalary;
	}
	public void setUserSalary(String userSalary) {
		this.userSalary = userSalary;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getLikeMusic() {
		return likeMusic;
	}
	public void setLikeMusic(String likeMusic) {
		this.likeMusic = likeMusic;
	}
	public String getWish() {
		return wish;
	}
	public void setWish(String wish) {
		this.wish = wish;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getIsDestroy() {
		return isDestroy;
	}
	public void setIsDestroy(String isDestroy) {
		this.isDestroy = isDestroy;
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
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "UserPo [userId=" + userId + ", userNickName=" + userNickName + ", userAccount=" + userAccount
				+ ", userPassword=" + userPassword + ", sex=" + sex + ", userImgPath=" + userImgPath + ", userPhone="
				+ userPhone + ", userSalary=" + userSalary + ", education=" + education + ", signature=" + signature
				+ ", likeMusic=" + likeMusic + ", wish=" + wish + ", userType=" + userType + ", isDestroy=" + isDestroy
				+ ", year=" + year + ", month=" + month + ", day=" + day + ", province=" + province + ", city=" + city
				+ "]";
	}
	
	

}
