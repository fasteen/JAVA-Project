<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
       body {
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

        .container {
            max-width: 400px;
            background: white;
            margin: auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #ff5722;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        textarea, select, input[type="submit"] {
            width: 100%;
            margin-top: 8px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #ff5722;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #e64a19;
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
      

    <div class="container">
        <h2>Place Your Order</h2>
        <form action="OrderServlet" method="post">
            <label for="address">Delivery Address</label>
            <textarea name="address" id="address" required></textarea>

            <label for="payment">Payment Method</label>
            <select name="payment" id="payment" required>
                <option value="">--Select Payment--</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
                <option value="UPI">UPI</option>
                <option value="Credit Card">Credit Card</option>
            </select>

            <input type="submit" value="Place Order">
        </form>
    </div>

</body>
</html>
