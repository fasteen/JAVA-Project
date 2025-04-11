package com.web.servlet;

import java.io.IOException;
import java.util.List;

import com.web.DAOImpl.SwiggyDAOImpl;
import com.web.model.Swiggy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/")
public class SwiggyServlet extends HttpServlet { 
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SwiggyDAOImpl rdo = new SwiggyDAOImpl();
		
		List<Swiggy> getallSwiggy = rdo.getallSwiggy();
		
		req.setAttribute("swiggy", getallSwiggy);
		
		RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
		
		rd.forward(req, resp);
		
	}

}
