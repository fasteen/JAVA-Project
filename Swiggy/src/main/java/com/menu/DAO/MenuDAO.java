package com.menu.DAO;

import java.util.List;
import com.menu.model.Menu;

public interface MenuDAO {
    List<Menu> getAllMenus(int restaurantId);  // ✅ Fix method name
}
