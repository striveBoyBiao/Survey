package com.siyuruoli.model;
/**
 * 地址
 * @author biao
 *
 */
public class Address {

	private Integer addressId;
	private Integer userId;
	private String province;
	private String city;
	
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
		return "Address [addressId=" + addressId + ", userId=" + userId + ", province=" + province + ", city=" + city
				+ "]";
	}
	
	
}
