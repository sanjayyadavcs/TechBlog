
package com.tech.blog.dao;

import java.sql.*;
public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean makeLike(int pId,int uId){
        
        boolean f = false;
        
        try{
            
            String query = "insert into Liked(pId,uId) values(?,?)";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);
            pt.setInt(2, uId);
            
            pt.executeUpdate();
            
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public int getLikes(int pId){
        
        int count = 0;
        
        try{
            
            String query = "select count(*) from liked where pId=?";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);
          
            
            ResultSet set = pt.executeQuery();
            
            if(set.next()){
                count=set.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
    }
    
    
    
    public boolean isPostLikedByUser(int pId,int uId){
        
        boolean f = false;
        
        try{
            
            String query = "select * from Liked where pid=? and uId = ?";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);
            pt.setInt(2, uId);
            
            ResultSet set = pt.executeQuery();
            if(set.next()){
                f=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
        public boolean removeLike(int pId,int uId){
        
        boolean f = false;
        
        try{
            
            String query = "delete from Liked where pid=? and uId=?";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);
            pt.setInt(2, uId);
            pt.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
