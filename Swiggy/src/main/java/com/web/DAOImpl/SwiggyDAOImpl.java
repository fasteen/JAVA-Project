package com.web.DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.DAO.SwiggyDAO;
import com.web.model.Swiggy;

public class SwiggyDAOImpl implements SwiggyDAO {
	
	private static final String URL = "jdbc:mysql://localhost:3306/swiggy";
	private static final String USER = "root";
	private static final String PASS = "Fasteen@2001"; // Move this to a config file

	private static final String SELECT_QUERY = "SELECT * FROM swiggy.restaurant";

	@Override
	public List<Swiggy> getallSwiggy() {
	    ArrayList<Swiggy> restaurant = new ArrayList<>();
	    String query = "SELECT * FROM swiggy.restaurant";
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(URL, USER, PASS);
	        PreparedStatement stmt = con.prepareStatement(query);
	        ResultSet rs = stmt.executeQuery();
	        
	        while (rs.next()) {
	        	int restaurantid = rs.getInt("restaurantid");
	            String name = rs.getString("name");
	            String location = rs.getString("location");
	            String city = rs.getString("city");
	            
	            byte[] dp = rs.getBytes("dp");  // Retrieve image as byte[]

	            restaurant.add(new Swiggy(restaurantid, location, city,name,dp)); // Pass byte[]
	        }
	        
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return restaurant;
	}

}
