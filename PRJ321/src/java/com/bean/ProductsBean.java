/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Product;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class ProductsBean implements Serializable {

    private int category;

    public ProductsBean() {
        category = 9;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    private ArrayList<String> productImages;

    public List<Product> getProducts() throws Exception {
        List<Product> products = new ArrayList<Product>();
        String query = "SELECT TOP 1000 [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[Amount]\n"
                + "      ,[Details]\n"
                + "      ,[CategoryID]\n"
                + "  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "  where CategoryID = " + category;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("productName");
            Double price = rs.getDouble("UnitPrice");
            int id = rs.getInt("ProductID");
            int quantity = rs.getInt("Amount");
            String detail = rs.getString("Details");
            int categoryId = rs.getInt("CategoryId");
            products.add(new Product(id, quantity, categoryId, name, detail, price));
        }

        return products;
    }
    
}