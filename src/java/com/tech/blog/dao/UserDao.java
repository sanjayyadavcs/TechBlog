
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ProfileHelper;
import java.sql.*;
public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean staus = false;
        
        try{
            
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            
            staus = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return staus;
    }
    
    
    
    public User getUserByEmailAndPassword(String email,String password){
        
        User user = null;
        
        try{
            
            String query = "select * from user where email = ? and password = ?";
            
           PreparedStatement pstmt = this.con.prepareStatement(query);
           pstmt.setString(1, email);
           pstmt.setString(2, password);
           
           ResultSet set = pstmt.executeQuery();
           
           if(set.next()){
               
              user = new User();
              user.setId(set.getInt("id"));
              user.setName(set.getString("name"));
              user.setEmail(set.getString("email"));
              user.setPassword(set.getString("password"));
              user.setGender(set.getString("gender"));
              user.setAbout(set.getString("about"));
              user.setDate(set.getTimestamp("rdate"));
              user.setProfile(set.getString("profile"));
           } 
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return user;
    }
    
    
    
    public User getUserByUserId(int id){
        
        User user = null;
        
        try{
            
            String query = "select * from user where id = ?";
            
           PreparedStatement pstmt = this.con.prepareStatement(query);
           pstmt.setInt(1, id);
           
           ResultSet set = pstmt.executeQuery();
           
           if(set.next()){
              user = new User();
              user.setId(set.getInt("id"));
              user.setName(set.getString("name"));
              user.setEmail(set.getString("email"));
              user.setPassword(set.getString("password"));
              user.setGender(set.getString("gender"));
              user.setAbout(set.getString("about"));
              user.setDate(set.getTimestamp("rdate"));
              user.setProfile(set.getString("profile"));
           } 
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return user;
    }
    
    
    
    public boolean updateUser(User user){
        boolean isSccess = false;
        try{
            
            String query = "update user set name=?, gender=?,about=?,profile=? where id = ?";
            
            PreparedStatement pstm = this.con.prepareStatement(query);
            
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getGender());
            pstm.setString(3, user.getAbout());
            pstm.setString(4, user.getProfile());
            pstm.setInt(5, user.getId());
            pstm.executeUpdate();
            isSccess = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return isSccess;
    }
    
    
    
    
}
