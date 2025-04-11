package com.menu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.menu.model.CartItem;
import com.menu.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        String action = req.getParameter("action");
        int restaurantId = Integer.parseInt(req.getParameter("restaurantid"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));

        if ("add".equals(action)) {
            boolean found = false;
            for (CartItem item : cart) {
                if (item.getMenu().getName().equals(name)) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                Menu menu = new Menu(restaurantId, name, price, null);
                cart.add(new CartItem(menu, 1));
            }

        } else if ("remove".equals(action)) {
            cart.removeIf(item -> item.getMenu().getName().equals(name));

        } else if ("update".equals(action)) {
            int qty = Integer.parseInt(req.getParameter("quantity"));
            for (CartItem item : cart) {
                if (item.getMenu().getName().equals(name)) {
                    item.setQuantity(qty);
                    break;
                }
            }
        }

        session.setAttribute("cart", cart);
        resp.sendRedirect("cart.jsp");
    }
}
