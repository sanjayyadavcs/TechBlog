
package com.tech.blog.entities;


public class Post {
    
    private int id;
    private int userId;
    private String title;
    private String content;
    private String code;
    private String image;
    private String createdAt;
    private int categoryId;

    public Post() {
    }

    public Post(int id, int userId, String title, String content, String code, String image, String createdAt, int categoryId) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.createdAt = createdAt;
        this.categoryId = categoryId;
    }

    public Post(int userId, String title, String content, String code, String image, String createdAt, int categoryId) {
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.createdAt = createdAt;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    
    
    
    
}
