package com.web.model;

import java.util.Arrays;

public class Swiggy {
	private int restaurantid;
	private String name;
	private String location;
	private String city;
	private byte[] dp;  // Change from byte to byte[]

	public Swiggy() {}

	

	public Swiggy(int restaurantid, String name, String location, String city, byte[] dp) {
		super();
		this.restaurantid = restaurantid;
		this.name = name;
		this.location = location;
		this.city = city;
		this.dp = dp;
	}




	public int getRestaurantid() {
		return restaurantid;
	}



	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public byte[] getDp() {
		return dp;
	}



	public void setDp(byte[] dp) {
		this.dp = dp;
	}



	@Override
	public String toString() {
		return "Swiggy [restaurantid=" + restaurantid + ", name=" + name + ", location=" + location + ", city=" + city
				+ ", dp=" + Arrays.toString(dp) + "]";
	}



	
}
