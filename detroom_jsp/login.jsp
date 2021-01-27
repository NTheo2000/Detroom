<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>

<!doctype html>
<html lang="en">
  <head>
    <%@ include file="header1.jsp"%>
    <title>Detroom | Sign in or sign up</title>
    <link rel = "icon" href ="https://i.ibb.co/r3C9JQ6/img6.png"   type = "image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/logins.css">
    <style>
      .dropdown-item{
        background: none;
      }
    </style>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  </head>
  
  <body style=" background-image: url('images/opa2.jpg');">
   
    <div id="signUp" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" id="modal1">
              <div class="signup-form">
                <form method="POST" action="registerController.jsp">
                  <% if(request.getAttribute("message") != null) { %>		
                    <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message") %></div>
                  <% } %>
                    <h2>Sign up</h2>
                    <p class="hint-text">Create your account. It's quick and will make us happy.</p>
                    <div class="form-group">
                      <input type="text" class="form-control" name="name" placeholder="Name" required="required">        	
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" name="surname" placeholder="Surname" required="required">        	
                    </div>
                    <div class="form-group">
                      <input type="email" class="form-control" name="auebmail" placeholder="AUEB Email" required="required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" name="confirm_password" placeholder="Confirm password" required="required">
                  </div>
                   <div class="form-group" style="text-align: center;">
                    <div class="form-check form-check-inline" style="text-align: center;">
                      <input class="form-check-input" type="radio" name="usertype" id="inlineRadio1" value="Student" required>
                      <label class="form-check-label" for="inlineRadio1" style="font-weight: 600;color:rgb(105, 104, 104);">Student</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="usertype" id="inlineRadio2" value="Professor" required>
                      <label class="form-check-label" for="inlineRadio2" style="font-weight: 600;color:rgb(105, 104, 104);">Professor</label>
                    </div>
                   </div>
                  <div class="form-group">
                        <button type="submit" id="btn1"class="btn btn-primary btn-lg btn-block"data-toggle="modal" >Sign up for Detroom</button>
                    </div>
                    <div class="form-group">
                        <p class="hint-text">By clicking “Sign up for Detroom”, you will be a part of us. We’ll occasionally send you account related email.</p>
                    </div>
                </form>
              <div class="text-center" id="div1">Already to Detroom? <a href="login.jsp" id="a1">Sign in</a></div>
            </div>
            </div>
        </div>
    </div>
    <%if(request.getAttribute("message")!=null){%>
      <script>
        $(document).ready(function(){
        $("#signUp").modal("show");
      });
      </script>
    <%}%>
    <%@ include file="aboutmodal.jsp" %>
    <div id="registerModal" class="modal fade">
      <div class="modal-dialog modal-confirm">
        <div class="modal-content">
          <div class="modal-header justify-content-center">
          </div>
          <div class="modal-body text-center">
                    		
                      <div class="alert alert-success" role="alert"><%=(String)request.getAttribute("message2") %></div>
                      
          </div>
          <div class="modal-body text-center">
            <button class="btn btn-info" data-dismiss="modal"><span>Start Exploring</span></button>
          </div>
        </div>
      </div>
    </div>     
    <%if(request.getAttribute("message2")!=null){%>
      <script>
        $(document).ready(function(){
        $("#registerModal").modal("show");
      });
      </script>
    <%}%>

 <nav class="navbar navbar-expand-lg">
    <%@ include file="navigationmenu1.jsp" %>
    <a id="a2" class="btn btn-outline-primary" href="#" role="button" data-toggle="modal" data-target="#signUp">Sign up</a>
  </nav>

    <div id="div2" align="center">
      <div id="div3" class="card op-card5 border-primary mb-5 text-center">
            <form method="POST" action="<%=request.getContextPath() %>/loginController.jsp">
              <% if(request.getAttribute("message1") != null) { %>		
                <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message1") %></div>
              <% } %>
                <div id="form1" class="form-group">
                    <label id="label1" for="exampleInputEmail1" style="margin-right: 9cm;">Email</label>
                    <input  type="email" name="auebmail"class="form-control" required>
                    <small id="form4" class="form-text">We'll never share your email with anyone else.</small>
                </div>
                <div id="form2" class="form-group">
                    <label id="label2" for="exampleInputPassword1">Password <a href="" id="a3">Forgot password?</a></label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div id="form3" class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label id="label3" class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>
                <button id="btn3" type="submit" class="btn btn-primary btn-lg" id="button1">Sing in for Detroom</button>
                <small id="form5" class="form-text">By clicking “Sign in for Detroom”, you will be directed to <br>your home page in the system</small>
            </form>
        </div>
    </div>
    
    
    <%@ include file="scripts.jsp" %>
  </body>
</html>