package com.tech.blog.dao;

import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public boolean createPost(int userId, String title, String content, String code, String image, int categoryId) {
        boolean flag = false;

        try {

            String query = "insert into Post(userId,title,content,code,image,categoryId) values(?,?,?,?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, userId);
            pst.setString(2, title);
            pst.setString(3, content);
            pst.setString(4, code);
            pst.setString(5, image);
            pst.setInt(6, categoryId);

            pst.executeUpdate();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public ArrayList<Post> getPosts() {
        ArrayList<Post> posts = new ArrayList<>();
        try {

            String query = "select * from Post order by id desc";

            Statement stmt = this.con.createStatement();

            ResultSet result = stmt.executeQuery(query);

            while (result.next()) {
                int id = result.getInt("id");
                int userId = result.getInt("userId");
                String title = result.getString("title");
                String content = result.getString("content");
                String code = result.getString("code");
                String image = result.getString("image");
                String cretedAt = result.getString("cretedAt");
                String categoryId = result.getString("categoryId");
                posts.add(new Post(id,userId,title, content, code, image, cretedAt, Integer.parseInt(categoryId)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    
    public Post getPostById(int PId) {
        Post post = new Post();
        try {
            
            String query = "select * from Post where id = ?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, PId);
            
            ResultSet result = stmt.executeQuery();
            
            while (result.next()) {
                int id = result.getInt("id");
                int userId = result.getInt("userId");
                String title = result.getString("title");
                String content = result.getString("content");
                String code = result.getString("code");
                String image = result.getString("image");
                String cretedAt = result.getString("cretedAt");
                String categoryId = result.getString("categoryId");
                
                post = new Post(id,userId,title, content, code, image, cretedAt, Integer.parseInt(categoryId));
                
                System.out.println(title);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }

    
    
    public ArrayList<Post> getRelatedPost(int catId,int postId) {
        ArrayList<Post> posts = new ArrayList<>();
        try {

            String query = "select * from Post where categoryId = ? and id != ?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, catId);
            stmt.setInt(2, postId);
            System.out.println(catId);
            System.out.println(postId);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                int id = result.getInt("id");
                int userId = result.getInt("userId");
                String title = result.getString("title");
                String content = result.getString("content");
                String code = result.getString("code");
                String image = result.getString("image");
                String cretedAt = result.getString("cretedAt");
                String categoryId = result.getString("categoryId");
                posts.add(new Post(id,userId,title, content, code, image, cretedAt, Integer.parseInt(categoryId)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    
    
    
    public ArrayList<Post> getPostByCatId(int catId) {
        ArrayList<Post> posts = new ArrayList<>();
        try {

            String query = "select * from Post where categoryId = ?";

            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setInt(1, catId);
            System.out.println(catId);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                int id = result.getInt("id");
                int userId = result.getInt("userId");
                String title = result.getString("title");
                String content = result.getString("content");
                String code = result.getString("code");
                String image = result.getString("image");
                String cretedAt = result.getString("cretedAt");
                String categoryId = result.getString("categoryId");
                posts.add(new Post(id,userId,title, content, code, image, cretedAt, Integer.parseInt(categoryId)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    
}
