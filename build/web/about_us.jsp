<%-- 
    Document   : about_us.jsp
    Created on : 17 Apr, 2020, 9:38:40 AM
    Author     : Anshu Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device=width, initial-scale=0.7">
        <title>About Us</title>
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
            .about_us_pic{

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
                    
                </ul>

            </div>
        </nav>

        <!--end of nav bar-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background jumbotron-fluid mt-0" style="height: 60%; ">
                <div class="row">
                    <div class="col-md-8 offset-md-1">
                        <div class="container-fluid">
                            <h3 class="display-3">Abou Us!</h3>
                            <br>
                            <h5><u>Developer Detail</u> :</h5>
                        </div>
                        <div class="container-fluid mt-4">
                            <div class="row ">
                                <div class="col-3">
                                    <h4>Name    :</h4>
                                    <br>
                                    <h4>Email   :</h4>
                                    <br>
                                    <h4>Contact :</h4> 
                                    <br>
                                    <br>
                                    <h4>Studying at :</h4>
                                    
                                </div>
                                <div class="col-5">
                                    <h4>Anshu Sony</h4>
                                    <br>
                                    <h4>anshusony12@gmail.com</h4>
                                    <br>
                                    <h4>+91-8279413753</h4>
                                    <br>
                                    <br>
                                    <h4>Delhi College of Tehnology & Management</h4>
                                    
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-md-3  m-0 p-0">
                        <div class="container-fluid">
                            <img style="height: 500px; width: 350px" src="images/about_us.png" class="img-fluid rounded float-right">
                        </div>  
                    </div>
                </div>
            </div>

        </div> 
    </div>
</body>
</html>
