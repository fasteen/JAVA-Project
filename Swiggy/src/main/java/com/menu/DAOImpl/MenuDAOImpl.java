package com.menu.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.menu.DAO.MenuDAO;
import com.menu.model.Menu;

public class MenuDAOImpl implements MenuDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/swiggy";
    private static final String USER = "root";
    private static final String PASS = "Fasteen@2001";
    private static final String SQL = "SELECT * FROM menu WHERE restaurantid = ?";

    @Override
    public List<Menu> getAllMenus(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement stmt = con.prepareStatement(SQL)) {

            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                byte[] image = rs.getBytes("image");

                Menu menu = new Menu(restaurantId, name, price, image);
                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }
}
