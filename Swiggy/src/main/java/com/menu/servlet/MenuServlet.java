package com.menu.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.menu.DAOImpl.MenuDAOImpl;
import com.menu.model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int r1 = Integer.parseInt(req.getParameter("restaurantid"));
        
        MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
        List<Menu> allMenus = menuDAOImpl.getAllMenus(r1); // get all menus

        req.setAttribute("menuList", allMenus); // ✅ FIX: send the actual list to JSP

        RequestDispatcher rd = req.getRequestDispatcher("menuiteam.jsp");
        rd.forward(req, resp);
    }
}
