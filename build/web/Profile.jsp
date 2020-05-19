
<%@page import="com.web.block.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.block.helper.ConnectionProvider"%>
<%@page import="com.web.block.dao.PostDao"%>
<%@page import="com.web.block.entities.Message"%>
<%@page import="com.web.block.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device=width, initial-scale=0.7">
        <title>Profile</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 98%, 31% 91%, 0 97%, 0 0);
            }
              body{
                background: url(images/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--nav bar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-american-sign-language-interpreting">&nbsp;</span>Web Block</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="fa fa-bell-o">&nbsp;</span>LearnCode with AnshuSony <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o">&nbsp;</span>Catagories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item " href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk">&nbsp;</span>Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile_modal"> <span class=" fa fa-user-circle-o">&nbsp;</span><%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class=" fa fa-user-plus">&nbsp;</span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--end of nav bar-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
            }
            session.removeAttribute("msg");

        %>

        <!--main body of the page--> 
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first column-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)"class="c-link list-group-item list-group-item-action active ">
                                All Posts
                            </a>
                            <!--categories-->
                            <%
                               PostDao d=new PostDao(ConnectionProvider.getConnection());
                               ArrayList<Category> list1=d.getAllCategoris();
                               
                               for(Category cc:list1){
                                   %>
                                   
                                   <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)"class="c-link list-group-item list-group-item-action "><%=cc.getName()%></a>
                                   
                                   <%
                               }
                                                              
                            %>
                            

                        </div>
                    </div>
                    <!--second column-->
                    <div class="col-md-8 " >
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin text-white"></i>
                            <h3 class="mt- text-white">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                            
                        </div>

                    </div>
                </div>
            </div>

        </main>

        <!--end of the main body of the page-->


        <!-- Modal -->
        <div class="modal fade" id="profile_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Web Block</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center text-bold">
                        <div class="container">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%=user.getName()%></h5>
                            <!--details-->
                            <table class="table" id="profile-details">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID :</th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%=user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td><%=user.getGender()%></td>

                                    </tr>
                                    <tr>                                  
                                        <th scope="row">Status :</th>
                                        <td><%=user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on :</th>
                                        <td><%=user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                            <div id="profile-edit" style="display: none;" >
                                <h5>Please Edit Carefully</h5>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Name :</th>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"</td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><input type="email" name="user_email" class="form-control" value="<%=user.getEmail()%>"></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Password :</th>
                                            <td><input type="password" name="user_password" class="form-control" value="<%=user.getPassword()%>"></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=user.getGender().toUpperCase()%></td>

                                        </tr>
                                        <tr>                                  
                                            <th scope="row">About :</th>
                                            <td>
                                                <textarea rows="3" type="text" name="user_about" class="form-control" >
                                                    <%=user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>                                  
                                            <th scope="row">New Profile:</th>
                                            <td>
                                                <input class="form-control" type="file" name="user_profile">
                                            </td>
                                        </tr>

                                    </table>
                                    <div class="container text-center text-bold">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary  text-white" data-dismiss="modal">Close</button>
                        <button id="edit" type="button" class="btn btn-primary primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--add post modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Provide post details..</h5>

                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategoris();
                                        for (Category c : list) {
                                    %> 
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }

                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTittle" type="text" class="form-control" placeholder="Enter post title">
                            </div>
                            <div class="form-group">
                                <textarea  name="pContent" style="height: 200px" class="form-control" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" style="height: 200px" class="form-control" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-grop">
                                <label>Select your pic...</label>
                                <br>
                                <input name="pic" type="file">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success mt-3">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>



        <!--end of post modal-->

        <!--java-script-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $("#edit").click(function () {
                    if (editStatus == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                })
            });
        </script>
        <!--now add post by js-->
        <script>
            $(document).ready(function (e) {
//                alert("loaded");
                $("#add-post-form").on("submit", function (event) {
//                    this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked button submit");

                    let form = new FormData(this);
//                      now requesting to server....
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
//                            success....
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved Successfully!", "success");

                            } else {
                                swal("Error!", "Something went wrong!", "error");

                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                        error....
                            swal("Error!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })

        </script>
        <!--laoding post using ajax-->
        <script>
            function getPosts(catId,temp){
                    $("#loader").show();
                    $("#post-container").hide();
                    $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_post.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                        
                    }
                    
                }) 
                
                
            }
        
            $(document).ready(function(e){
                let allPostRef=$('.c-link')[0]
                getPosts(0,allPostRef)
               
            })
           
        </script>
    </body>
</html>
