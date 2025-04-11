<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.web.model.Swiggy, java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant List</title>
    <link rel="stylesheet" type="text/css" href="Webapp/css/index.css">
</head>
<body>

    <header>
        <h1>swiggy</h1>
        <input class="" type="text" placeholder="Search">
        <div class="navbar-links">
            <a href="secondpage.html"><i data-lucide="home"></i>Home</a>
            <a href="service.html">Services</a>
            <a href="contact.html">Contact</a>
        </div>
    </header><br>
      
    <!-- Restaurant List Section -->
    <div class="maincontainer">
       <% 
       List<Swiggy> restaurants = (List<Swiggy>) request.getAttribute("swiggy");
    if (restaurants != null) {  // ✅ Check if restaurant list is not empty
        for (Swiggy s : restaurants) {  // ✅ Loop through each restaurant object
            byte[] imageData = s.getDp(); // ✅ Get the image data (byte array)
            
            String imgSrc; // ✅ Variable to store image source
            if (imageData != null && imageData.length > 0) {  // ✅ If image data is available
                String base64Image = Base64.getEncoder().encodeToString(imageData); // ✅ Convert to Base64
                imgSrc = "data:image/jpeg;base64," + base64Image; // ✅ Set as Base64 image URL
            } else { 
                imgSrc = "images/default.jpg"; // ✅ Use default image if no image found
            }
%>            
          <a href="menu?restaurantid=<%=s.getRestaurantid()%>"> <div class="s1"> <!-- ✅ Restaurant card -->
                <img class="restaurant-image" alt="Restaurant Image" src="<%= imgSrc %>"> <!-- ✅ Display image -->
                <h3>Restaurant: <%= s.getName() %></h3> <!-- ✅ Display restaurant name -->
                <h4>City: <%= s.getCity() %></h4> <!-- ✅ Display city name -->
                <h5>Location: <%= s.getLocation() %></h5> <!-- ✅ Display location -->
                <button>Place Order</button> <!-- ✅ Order button -->
            </div></a>
           
<%        
        } 
    } else {  // ✅ If no restaurants are found
%>
        <p>No restaurants found.</p> <!-- ✅ Display message -->
<% 
    } 
%>
       
    </div>
    
    <style>body {
    font-family: Arial, sans-serif;
    background-color: #c0c0c0;
    margin: 0;
    padding: 0;
}

header {
    background-color: black;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    margin: 0;
    flex-grow: 1;
    text-align: left;
}

input {
    width: 30%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.navbar-links {
    margin-right: 20px;
}

.navbar-links a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
    font-size: 16px;
}

.maincontainer {
	
   display: grid;
   grid-template-columns: repeat(5, 1fr); 
   
    gap: 40px;
    margin: 50px 10px;
    justify-content: row;
}

.s1 {
    width: auto;
    background: white;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    text-align: left;
    height: auto;
    transition: transform 0.3s, box-shadow 0.3s;
    border-radius: 10px;
}

.maincontainer a{
   color: ef0e04;
    text-decoration: none;
    margin: 0 10px;
    font-size: 16px;

}


.s1:hover {
    transform: scale(1.05);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
    cursor: pointer;
}

.restaurant-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
}

button {
    background-color: #ff4500;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
}

button:hover {
    background-color: #e63e00;
}
    </style>
    
     
    
</body>
</html>
