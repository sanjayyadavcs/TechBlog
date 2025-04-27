/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import java.sql.*;
import java.util.*;
public class CategoryDao {
    
    Connection con;

    public CategoryDao(Connection con) {
        this.con = con;
    }
    
    public List<Category> getCategories(){
        List<Category> categories = new ArrayList<>();
        try{
            
            String query = "select * from Category";
            
            Statement stmt = this.con.createStatement();
            
            ResultSet result = stmt.executeQuery(query);
            
            while(result.next()){
                int id = result.getInt("id");
                String title = result.getString("title");
                String desc = result.getString("description");
                categories.add(new Category(id,title,desc));
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return categories;
    }
    
}
