/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import java.sql.*;
import java.util.ArrayList;

public class CommentDao {

    Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }

    public boolean makeComment(int pId, int uId, String Comment) {

        boolean f = false;

        try {

            String query = "insert into Comment(pId,uId,comment) values(?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);
            pt.setInt(2, uId);
            pt.setString(3, Comment);

            pt.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int getCount(int pId) {

        int count = 0;

        try {

            String query = "select count(*) from Comment where pId=?";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);

            ResultSet set = pt.executeQuery();

            if (set.next()) {
                count = set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public ArrayList<Comment> getComments(int pId) {

        ArrayList<Comment> commentList = new ArrayList<>();

        try {

            String query = "select * from Comment where pId=? order by id desc";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, pId);

            ResultSet set = pt.executeQuery();

            while (set.next()) {

                commentList.add(new Comment(set.getInt("id"), set.getInt("pId"), set.getInt("uId"), set.getString("comment"), set.getTimestamp("createdAt")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("comments: " + commentList.toString());
        return commentList;
    }

    public boolean deleteComment(int commentId) {

        boolean f = false;

        try {

            String query = "delete from Comment where id=?";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, commentId);
            pt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean isCommentedByUser(int commentId, int uId) {

        boolean f = false;

        try {

            String query = "select * from Comment where id=? and uId=?";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, commentId);
            pt.setInt(2, uId);
            ResultSet set = pt.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
