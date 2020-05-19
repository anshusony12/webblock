/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.block.dao;

import com.web.block.entities.Category;
import com.web.block.entities.Post;
import com.web.block.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategoris() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTittle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, p.getpTittle());
            pst.setString(2, p.getpContent());
            pst.setString(3, p.getpCode());
            pst.setString(4, p.getpPic());
            pst.setInt(5, p.getCatId());
            pst.setInt(6, p.getUserId());
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //get all the posts
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        //fetch all the Posts
        try {
            PreparedStatement pst = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTittle = set.getString("pTittle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                Post post = new Post(pid, pTittle, pContent, pPic, pCode, pDate, catId, userId);
                list.add(post);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all the Posts by Id
        try {
            PreparedStatement pst = con.prepareStatement("select * from posts where catId=?");
            pst.setInt(1, catId);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTittle = set.getString("pTittle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");

                int userId = set.getInt("userId");

                Post post = new Post(pid, pTittle, pContent, pPic, pCode, pDate, catId, userId);
                list.add(post);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, postId);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTittle = set.getString("pTittle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId = set.getInt("userId");

               post = new Post(pid, pTittle, pContent, pPic, pCode, pDate, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
   

}
