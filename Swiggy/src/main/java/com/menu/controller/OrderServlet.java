package com.menu.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.menu.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String address = request.getParameter("address");
        String payment = request.getParameter("payment");

        Order order = new Order(address, payment);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/swiggy", "root", "Fasteen@2001");

            String sql = "INSERT INTO orders (id, address, paymentmethod, status, ordertime) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, order.getId());
            stmt.setString(2, order.getAddress());
            stmt.setString(3, order.getPaymentMethod());
            stmt.setString(4, order.getStatus());
            stmt.setTimestamp(5, order.getOrderTime());

            int rows = stmt.executeUpdate();
            conn.close();

            response.setContentType("text/html");
            if (rows > 0) {
                response.getWriter().println("<h3>Order placed successfully!</h3>");
                response.getWriter().println("Order ID: <b>" + order.getId() + "</b><br>");
                response.getWriter().println("Time: " + order.getOrderTime());
            } else {
                response.getWriter().println("Failed to place order.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
