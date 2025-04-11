<%@ page import="java.util.*, com.menu.model.*, com.menu.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background-color: #c0c0c0;
    margin: 0;
    padding: 0;
}

        .cart-container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        h2 {
            background-color: #fc8019;
            color: white;
            margin: 0;
            padding: 20px;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #f1f1f1;
            color: #333;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #fafafa;
        }

        form {
            display: inline-block;
        }

        input[type="number"] {
            width: 60px;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 6px 12px;
            background-color: #fc8019;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #e76a10;
        }

        .total-row {
            font-weight: bold;
            background-color: #fef1e8;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            font-size: 18px;
            color: #888;
        }

        .checkout-button {
            text-align: center;
            margin-top: 25px;
        }

        .checkout-button form button {
            padding: 12px 24px;
            font-size: 16px;
            background-color: #fc8019;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .checkout-button form button:hover {
            background-color: #e76a10;
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
        
    </style>
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
<div class="cart-container">
    <h2>Your Cart</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Action</th>
        </tr>

        <%
            double grandTotal = 0;
            if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart) {
                    Menu m = item.getMenu();
                    double total = m.getPrice() * item.getQuantity();
                    grandTotal += total;
        %>
        <tr>
            <td><%= m.getName() %></td>
            <td>₹<%= m.getPrice() %></td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="restaurantid" value="<%= m.getRestaurantId() %>">
                    <input type="hidden" name="name" value="<%= m.getName() %>">
                    <input type="hidden" name="price" value="<%= m.getPrice() %>">
                    <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                    <button type="submit">Update</button>
                </form>
            </td>
            <td>₹<%= total %></td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="restaurantid" value="<%= m.getRestaurantId() %>">
                    <input type="hidden" name="name" value="<%= m.getName() %>">
                    <input type="hidden" name="price" value="<%= m.getPrice() %>">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
        <%
                }
        %>
        <tr class="total-row">
            <td colspan="3" align="right">Grand Total:</td>
            <td colspan="2">₹<%= grandTotal %></td>
        </tr>
        <%
            } else {
        %>
        <tr>
            <td colspan="5" class="empty-message">🛒 Your cart is empty</td>
        </tr>
        <%
            }
        %>
    </table>

    <%-- Checkout Button --%>
    <% if (cart != null && !cart.isEmpty()) { %>
        <div class="checkout-button">
            <form action="checkout.jsp" method="get">
                <button type="submit">Proceed to Checkout 🛒</button>
            </form>
        </div>
    <% } %>
    
    
</div>
</body>
</html>
