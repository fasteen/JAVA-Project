package com.menu.model;

import java.util.Arrays;

public class Menu {
    
    private int restaurantId;  // ✅ Corrected variable name
    private String name;
    private double price;  // ✅ Changed price from String to double
    private byte[] image;
    
    public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(int restaurantId, String name, double price, byte[] image) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.price = price;
		this.image = image;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Menu [restaurantId=" + restaurantId + ", name=" + name + ", price=" + price + ", image="
				+ Arrays.toString(image) + "]";
	}
    
    
    
  
    
}
