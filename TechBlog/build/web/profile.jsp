<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("loginpage.jsp");
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"  />
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 95%, 77% 100%, 47% 96%, 20% 100%, 0 96%, 0% 35%, 0 0);
            }
            body{
                background: url(image/bg_prof.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>

        <!--heading logo--> 
        <link
            rel="shortcut icon"
            href="image/logo.png"
            type="image/x-icon"
            />
        <link
            rel="icon"
            href="image/logo.png"
            type="image/x-icon"
            />
    </head>
    <body>

        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" style="font-size: 2rem;" href="index.jsp" ><img src="image/logo.png" style="width: 40px;height:40px;margin-bottom: 10px">Well of Code</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Nafis</a>
                        </li>
                        <!--                        <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <span class="fa fa-ellipsis-v"></span> Category
                                                    </a>
                                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <li><a class="dropdown-item" href="#">Python</a></li>
                                                        <li><a class="dropdown-item" href="#">java</a></li>
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li><a class="dropdown-item" href="#">More</a></li>
                                                    </ul>
                                                </li>-->
                        <li class="nav-item">
                            <a class="nav-link active" href="contactUs.jsp"  ><span class="fa-solid fa-address-book"></span>Contact</a>
                        </li>                            

                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="modal" href="#" data-target="#add-post-modal"><span class="fa-solid fa-pen"></span>Do Post</a>
                        </li>

                    </ul>

                    <ul class="navbar-nav mr-right">

                        <li class="nav-item">
                            <a class="nav-link"  data-toggle="modal" data-target="#exampleModalCenter" href="#"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <!--navbar end-->

        <!--message for update-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%=m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row">

                    <!--first colomn for category-->

                    <div class="col-md-4">
                        <div class="list-group mt-5 " >
                            <a href="#" onclick="getPost(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Posts    
                            </a>
                            <!--categories start-->
                            <%
                                PostDao da = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = da.getAllCategories();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPost(<%= cc.getCid()%>, this)"  class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }
                            %>
                        </div>    
                    </div>

                    <!--second colomn for post-->

                    <div class="col-md-8">
                        <!--POST-->

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x  fa-spin"></i>
                            <h3 class="m-2">Loading....</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>

                </div>
            </div>


        </main>






        <!--profile update-->

        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLongTitle">Profile Update</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <img src="profile/<%= user.getProfile()%>" style="border-radius: 50% ;width:100px ">
                            <h5 class="modal-title md-3" id="exampleModalLongTitle"><%= user.getName()%></h5>
                        </div>
                        <!--details-->


                        <div id="profile-details">
                            <table class="table table-striped">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID :</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Date of birth :</th>
                                        <td><%= user.getDob()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Register Date :</th>
                                        <td><%= user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>


                        <!--profile edit-->


                        <div id="profile-edit" class="text-center" style="display: none;">
                            <h3 class="mt--2">Please Edit carefully</h3>

                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>

                                    <tr>
                                        <td>Email :</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                    </tr>

                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="name" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                    </tr>

                                    <tr>
                                        <td>Password :</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth :</td>
                                        <td><input type="Birthday" class="form-control" name="user_dob" value="<%=user.getDob()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <td><%=user.getGender().toUpperCase()%></td>
                                    </tr>

                                    <tr>
                                        <td>New Profile :</td>
                                        <td><input type="file" name="image" class="form-control"></td>
                                    </tr>

                                </table>

                                <div class="container">
                                    <button type="summit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end profile modal-->


        <!--post modal-->
        <!-- Modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--// form body-->
                        <form id="add-post-form" action="AddPostServlet" method="POST">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Categories---</option>


                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your Program (if any)"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select your pic</label> 
                                <br>
                                <input type="file" name="pPic" class="form-control">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>

                        <!--form body end-->


                    </div>

                </div>
            </div>
        </div>




        <!--end of post modal-->







        <!--javascript-->
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
                                $(document).ready(function () {

                                    let editStatus = false;

                                    $('#edit-profile-button').click(function () {
                                        if (editStatus === false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");

                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");

                                        }

                                    });

                                });
        </script>

        <script>
            $(document).ready(function () {

                $('#add-post-form').on("submit", function (event) {
                    //this code gets called when form is submited....
                    event.preventDefault();
                    console.log("you have submited");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //sucess
                            console.log(data);

                            if (data.trim() === 'done')
                            {
                                console.log("done");
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Sorry!", "Something went Wrong Try again!", "error");
                        },
                        processData: false,
                        contentType: false

                    });



                });
            });


        </script>

        <!--loading post using ajax-->

        <script>

            function getPost(catId, temp)
            {

                $('#post.container').hide();
                $('#loader').show();
                $(".c-link").removeClass('active');

                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR)
                    {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                });
            }

            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];

                getPost(0, allPostRef);

            });

        </script>



    </body>
</html>
