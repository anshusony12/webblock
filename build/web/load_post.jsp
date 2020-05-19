


<%@page import="com.web.block.entities.User"%>
<%@page import="com.web.block.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.web.block.entities.Post"%>
<%@page import="com.web.block.helper.ConnectionProvider"%>
<%@page import="com.web.block.dao.PostDao"%>
<div class="row">
    <%
        User uuu= (User)session.getAttribute("currentUser");
        Thread.sleep(500);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'>No any post in this category..</h3>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b> <%= p.getpTittle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer primary-background">
                <%
                    LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                    %>
                     <a href="#" onclick="doLike(<%= p.getPid() %>,<%= uuu.getId() %>)"class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up mr-1">&nbsp;<span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></i></a>
                   <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read more..</a>
            </div>
        </div>
    </div>   


    <%
        }


    %>
</div>