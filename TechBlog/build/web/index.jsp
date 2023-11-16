
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Well Of Code</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 95%, 77% 100%, 47% 96%, 20% 100%, 0 96%, 0% 35%, 0 0);
            }

        </style>

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
        <!--navbar-->
        <%@include file="normal_navbar.jsp"  %>

        <!--//banner-->

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background banner-background"style="margin-bottom: 20px;padding-bottom: 50px ">
                <div class="container" >

                    <h3 class="display-3 color-grey text-center" style="font-weight: 400;color:#c8e6c9;">Welcome to Well of Code</h3>
                    <p>Computer programming or coding is the composition of sequences of instructions, called programs, that computers can follow to perform tasks.</p>              
                    <p>Different programming languages enable programmers to write code that computers understand.</p>             

                    <a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span>Start ! its Free</a>
                    <a href="loginpage.jsp" class="btn btn-outline-light"><span class="	fa fa-user-circle fa-spin"></span>Login</a>

                </div>
            </div>
        </div>

        <!--card-->




        <div class="col-md-12">
            <!--POST-->

            <div class="container text-center" id="loader">
                <i class="fa fa-refresh fa-4x  fa-spin"></i>
                <h3 class="m-2">Loading....</h3>
            </div>

            <div class="container-fluid" id="post-container">
                <!--all the post divert to load_posts.jsp-->
            </div>

        </div>















        <%            Connection con = ConnectionProvider.getConnection();
        %>










        <!--javascript-->
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <!--        <script>
        
                    function getPost(catId, temp)
                    {
                        
                         $('#post.container').hide();
                         $('#loader').show();
                         $(".c-link").removeClass('active');
                         
                        $.ajax({
                        url:"post_index.jsp",
                        data: {cid:catId},
                        success: function(data, textStatus, jqXHR)
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
                     let allPostRef=$('.c-link')[0];
                     
                      getPost(0,allPostRef);
        
                    });
        
                </script>-->

        <script>

            function getPosts(catId, temp) {

                $("#loader").show();
                $("post-container").hide();
                $(".c-link").removeClass('active');

                $.ajax({
                    url: "post_index.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');

                    }
                });
            }

            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);


            });

        </script>

    </body>
</html>
