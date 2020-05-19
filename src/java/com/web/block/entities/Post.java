/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.block.entities;

import java.sql.Timestamp;

/**
 *
 * @author Anshu Sony
 */
public class Post {
    private int pid;
    private String pTittle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int pid, String pTittle, String pContent,String pPic, String pCode, Timestamp pDate, int catId,int userId) {
        this.pid = pid;
        this.pTittle = pTittle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
        this.pPic=pPic;
    }

    public Post(String pTittle, String pContent, String pPic, String pCode, Timestamp pDate, int catId,int userId) {
        this.pTittle = pTittle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pDate = pDate;
        this.catId = catId;
        this.userId=userId;
        this.pPic=pPic;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTittle() {
        return pTittle;
    }

    public void setpTittle(String pTittle) {
        this.pTittle = pTittle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }
    
    
    
}
