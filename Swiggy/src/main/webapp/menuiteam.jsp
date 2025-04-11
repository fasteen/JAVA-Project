<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.menu.model.Menu, java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
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
    
    <div class ="maincontainer"><%
    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

    if (menuList != null && !menuList.isEmpty()) {
        for (Menu menu : menuList) {
            byte[] imageData = menu.getImage(); // Assuming image is stored as Byte[] in DB
            String imgSrc;

            if (imageData != null && imageData.length > 0) {
                // Convert Byte[] to byte[]
                byte[] bytes = new byte[imageData.length];
                for (int i = 0; i < imageData.length; i++) {
                    bytes[i] = imageData[i];
                }

                String base64Image = Base64.getEncoder().encodeToString(bytes);
                imgSrc = "data:image/jpeg;base64," + base64Image;
            } else {
                imgSrc = "images/default.jpg"; // fallback image
            }
%>
            <div class="menu-item">
              <img class="menu-image" src="<%= imgSrc %>" alt="MenuImage" />
              
                <h3><%= menu.getName() %></h3>
                <p>Price: ₹<%= menu.getPrice() %></p>
                <form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="restaurantid" value="<%= menu.getRestaurantId() %>">
            <input type="hidden" name="name" value="<%= menu.getName() %>">
            <input type="hidden" name="price" value="<%= menu.getPrice() %>">
            <button type="submit">ADD To Cart</button>
        </form>
            </div>
<%
        }
    } else {
%>
        <p>No menu items found.</p>
<%
    }
%></div>



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

.menu-item {
    width: auto;
    background: white;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    text-align: left;
    height: auto;
    transition: transform 0.3s, box-shadow 0.3s;
    border-radius: 10px;
}

.menu-item:hover {
    transform: scale(1.05);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
    cursor: pointer;
}

.MenuImage{
  width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
    align-content: left;

}

button{
 background-color: #ff4500;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;

}


</style>

</body>
</html>
