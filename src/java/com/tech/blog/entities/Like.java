
package com.tech.blog.entities;


public class Like {
    
    private int id;
    private int pId;
    private int uId;

    public Like() {
    }

    public Like(int id, int pId, int uId) {
        this.id = id;
        this.pId = pId;
        this.uId = uId;
    }

    public Like(int pId, int uId) {
        this.pId = pId;
        this.uId = uId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }
    
    
    
    
    
    
}
