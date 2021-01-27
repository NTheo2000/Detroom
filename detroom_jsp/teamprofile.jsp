<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="detroom_java.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.*"%>

<% 
if (session.getAttribute("activeUser") == null) {
  response.sendRedirect("login.jsp");
  return;
}
User activeUser = (User) session.getAttribute("activeUser");
String typeUser = (String) session.getAttribute("userType");
int idteam = Integer.parseInt(request.getParameter("idteam"));
TeamDAO teamdao = new TeamDAO();
Team activeTeam = teamdao.findTeam(idteam);
%>
<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | <%=activeTeam.getName()%></title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
    <link rel="stylesheet" type="text/css" href="css/teams.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
      .modal-confirm {		
        color: #636363;
        width: 325px;
        margin: 80px auto 0;
      }
      .modal-confirm .modal-content {
        padding: 20px;
        border-radius: 5px;
        border: none;
      }
      .modal-confirm .modal-header {
        border-bottom: none;   
            position: relative;
      }
      .modal-confirm h4 {
        font-size: 26px;
        margin: 25px 0 -15px;
      }
      .modal-confirm .form-control, .modal-confirm .btn {
        min-height: 40px;
        border-radius: 3px; 
      }
      .modal-confirm .close {
            position: absolute;
        top: -5px;
        right: -5px;
      }	
      .modal-confirm .modal-footer {
        border: none;
        text-align: center;
        border-radius: 5px;
        font-size: 13px;
      }	
      .modal-confirm .icon-box {
        color: #fff;		
        position: absolute;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: -70px;
        width: 95px;
        height: 95px;
        border-radius: 50%;
        z-index: 9;
        background: #b45f52;
        padding: 15px;
        text-align: center;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
      }
      .modal-confirm .icon-box i {
        font-size: 56px;
        position: relative;
        top: 4px;
      }
        .modal-confirm .btn {
            color: #fff;
            border-radius: 4px;
        background: #b45f52;
        text-decoration: none;
        transition: all 0.4s;
            line-height: normal;
            border: none;
        }
      .modal-confirm .btn:hover, .modal-confirm .btn:focus {
        background: #a54435;
        outline: none;
      }
      .trigger-btn {
        display: inline-block;
        margin: 100px auto;
      }
      .it input.form-control
  {
    
    border:none;
    margin-bottom:0px;
    border-radius: 0px;
    border-bottom: 1px solid;
    box-shadow: none;
  }
  .it .form-control:focus
  {
    border-color: #ff4d0d;
    box-shadow: none;
    outline: none;
  }
  .fileUpload {
      position: relative;
      overflow: hidden;
  }
  .fileUpload input.upload {
      position: absolute;
      top: 0;
      right: 0;
      margin: 0;
      padding: 0;
      font-size: 20px;
      cursor: pointer;
      opacity: 0;
      filter: alpha(opacity=0);
  }
  nav {
  width: 100%;
  margin: 0;
}

/* applied after scroll height reached */
.fixed-nav nav {
  position: fixed;
  top:0;
  z-index: 1
}
.image {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

.image:hover {opacity: 0.7;}

/* The Modal (background) */
.photo {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
.modal-content2 {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation - Zoom in the Modal */
.modal-content2, #caption {
  animation-name: zoom;
  animation-duration: 0.6s;
}

@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content2 {
    width: 100%;
  }
}
      </style>
  </head>
  <body>
    <%@ include file="editTeam.jsp" %>

    <div id="myModal2" class="modal photo">
      <span class="close">&times;</span>
      <img class="modal-content2" id="img01">
      <div id="caption"></div>
    </div>


  <%
    if (session.getAttribute("studentObj") != null){
  %>
  <script>
    $(document).ready(function(){
    $("#addmodal").modal("show");
     });
  </script>
  <%}%>
  <div class="modal fade" data-keyboard="false" data-backdrop="static" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header border-bottom-0 text-center">
          <h5 class="modal-title w-100" id="exampleModalLabel">Add members</h5>
          <button type="button" class="close" data-dismiss="addmodal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="searchbarController.jsp?idteam=<%=idteam%>" method="POST">
            <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                <div class="input-group">
                  <input type="text" id="search" name="search" placeholder="Choose your teammates" aria-describedby="button-addon1" class="form-control border-0 bg-light">
                  <div class="input-group-append">
                    <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
                  </div>
                </div>
            </div>
          </form>
          <form method="POST" action="<%=request.getContextPath() %>/addController.jsp?idteam=<%=idteam%>">  
              <%	if (session.getAttribute("studentObj") != null || session.getAttribute("profObj") != null) { %>
                <% try { %>               
                <%List <Student> student2 = (List<Student>)session.getAttribute("studentObj"); %>
                  <% for( int i=0; i< student2.size(); i++) { 
                      String iduser = student2.get(i).getUserid();
                      if (iduser.equals(activeUser.getUserid())) {
                  %>
                    <a href="<%=request.getContextPath() %>/userprofile.jsp" ><img class="rounded-circle"  height="35px" src="<%=student2.get(i).getPhoto()%>" alt=""> <%=student2.get(i).getName()%> <%=student2.get(i).getSurname()%></a>
                  <%
                      } else { 
                  %>
                    <a href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser%>" ><img class="rounded-circle"  height="35px" src="<%=student2.get(i).getPhoto()%>" alt=""> <%=student2.get(i).getName()%> <%=student2.get(i).getSurname()%></a>
                  <%
                      }
                  %>
                  <% 
                      boolean exist = teamdao.findMember(idteam, iduser);
                      if (request.getAttribute("message") != null){
                       String message = (String)request.getAttribute("message");
                       String id = (String)request.getAttribute("id");
                       if (id.equals(iduser)){
                        if (message.equals("Success")) {
                  %>
                  <i class="fa fa-check"></i><br>
                  <%
                        } else if (message.equals("Unsuccess")){
                  %>
                  <i class="fa fa-times"></i><br>
                 <% 
                        }
                       } else if (!exist) { 
                 %>
                 <button type="submit" name="addmember" class="btn btn-link btn-s" value="<%=iduser%>"><i class="fa fa-plus"></i></button><br>
                 <%
                       } else {
                 %>
                 <i class="fa fa-check"></i><br>
                 <%
                       } 
                      } else if (!exist){
                 %>
                 <button type="submit" name="addmember" class="btn btn-link btn-s" value="<%=iduser%>"><i class="fa fa-plus"></i></button><br>
                 <%
                    } else {
                 %>
                 <i class="fa fa-check"></i><br>
                <%
                  }
                }
                %>
                <%List <Professor> prof2 = (List<Professor>)session.getAttribute("profObj"); %>
                  <% for( int i=0; i< prof2.size(); i++) {
                      String iduser2 = prof2.get(i).getUserid();
                      if (iduser2.equals(activeUser.getUserid())) {
                  %>
                    <a href="<%=request.getContextPath() %>/userprofile.jsp"><img class="rounded-circle" height="35px" src="<%=prof2.get(i).getPhoto()%>" alt=""> <%=prof2.get(i).getName()%> <%=prof2.get(i).getSurname()%></a>
                  <%
                      } else {
                  %>
                  <a href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser2%>"><img class="rounded-circle" height="35px" src="<%=prof2.get(i).getPhoto()%>" alt=""> <%=prof2.get(i).getName()%> <%=prof2.get(i).getSurname()%></a>
                  <%
                      }
                  %>
                  <% 
                    boolean exist = teamdao.findMember(idteam, iduser2);
                    if (request.getAttribute("message") != null){
                     String message = (String)request.getAttribute("message");
                     String id = (String)request.getAttribute("id");
                     if (id.equals(iduser2)){
                      if (message.equals("Success")) {
                  %>
                  <i class="fa fa-check"></i><br>
                  <%
                      } else if (message.equals("Unsuccess")) {
                  %>
                  <i class="fa fa-times"></i><br>
                  <%
                      }
                     } else if (!exist) {
                  %>
                    <button type="submit" name="addmember"class="btn btn-link btn-s" value="<%=iduser2%>"><i class="fa fa-plus"></i></button><br>
                  <% 
                     } else {
                  %>
                  <i class="fa fa-check"></i><br>
                  <%
                     } 
                    } else if (!exist) { 
                  %>
                      <button type="submit" name="addmember"class="btn btn-link btn-s" value="<%=iduser2%>"><i class="fa fa-plus"></i></button><br>
                  <%
                    } else {
                  %>
                  <i class="fa fa-check"></i><br>
                  <%
                    }           
                  } 
                  %>
                <% if(student2.isEmpty() && prof2.isEmpty()) { %>
                  <h5>No user was found</h5> 
                <%} %>
                <% } catch(Exception e) {                         
                } }%>                
          </form>
        </div>
      </div>
    </div>
  </div>

  <script>
  $(document).on('click', '[data-dismiss="addmodal"]', function(){
    window.location.href="<%=request.getContextPath() %>/removeAttribute.jsp?idteam=<%=idteam%>";
  });
  </script>

<% if (request.getAttribute("info") != null) { 
  String info = (String) request.getAttribute("info");    
    if (!info.equals("Suc")) {
%>
<div id="myModal" class="modal fade">
<div class="modal-dialog modal-confirm">
<div class="modal-content">
  <div class="modal-header">
    <div class="icon-box">
      <i class="material-icons">&#xE5CD;</i>
    </div>				
    <h4 class="modal-title" style="margin-left: 2.5cm;">Result</h4>	
  </div>
  <div class="modal-body">
    <p class="text-center"><%=info%></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>
  </div>
</div>
</div>
</div>     

 <script>
       $(document).ready(function(){
       $("#myModal").modal("show");
     });
 </script>
<%
    }
}
%>

<nav  id="navigation" class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark" style="padding-top: 0;padding-bottom: 0;">
  <a class="navbar-brand" href="<%=request.getContextPath() %>/homepage.jsp"><img src="https://i.ibb.co/r3C9JQ6/img6.png" alt="img6" height="60cm"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding-left: 60px;">
    <form method="POST" action="<%=request.getContextPath() %>/searchbarhomeController.jsp?url=teamprofile.jsp&id=<%=idteam%>">
        <div class="p-1 bg-light shadow-sm" style="border-radius: 25px;">
            <div class="input-group">
              <input type="text" style="border-radius: 25px;" name="search" placeholder="Search by surname" style aria-describedby="button-addon1" class="form-control border-0 bg-light">
              <div class="input-group-append">
                <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </div>
    </form>
    <ul class="navbar-nav mr-auto" id="ul1" style="padding-left: 40px;">
      <li class="<%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("homepage.jsp") ? "nav-item active": "nav-item" %>">
        <a class="nav-link" href="<%=request.getContextPath() %>/homepage.jsp">
          <i class="fa fa-home"></i>
          Home
          </a>
      </li>
      <li class="<%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("userprofile.jsp") ? "nav-item active": "nav-item" %>">
        <a class="nav-link" href="<%=request.getContextPath() %>/userprofile.jsp">
          <i class="fa fa-user-circle"></i>
          Profile
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-bell"></i>
          Notifications  
        </a>
      </li>
    </ul>
    <ul class="navbar-nav" id="ul2">
      <li class="nav-item dropdown">
        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img class="rounded-circle" height="35px" src="<%=activeUser.getPhoto()%>" alt=""> <i class="fa fa-caret-down"></i>
        </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="<%=request.getContextPath() %>/userprofile.jsp"><i id="i1" class="fa fa-user-circle"></i>My profile</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="<%=request.getContextPath() %>/logout.jsp"><i id="i3" class="fa fa-sign-out"></i>Log out</a>
          </div>
      </li>
      <li class="nav-item">
        <div class="ml-3">
            <div id="name1">
              <%= activeUser.getName()%> <%=activeUser.getSurname()%>
            </div>
            <div id="type1">
                <small><%=typeUser%></small>
            </div>
        </div>
      </li>
    </ul>
  </div>
</nav>

<%	if (request.getAttribute("studenthomeObj2020") != null) { %>

  <% try { %>
    <div class="card" id="closeablecard" style="width: 18rem; position:absolute; z-index:90; left:4cm;">
      <div class="card-header container-fluid" >
      
      <button data-dismiss="alert" data-target="#closeablecard" type="button" class="close" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
      <h5>Search results</h5>
      </div>
      <div class="card-body">
    
        <%List <Student> student2 = (List<Student>)request.getAttribute("studenthomeObj2020"); %>
          <% for( int i = 0; i < student2.size(); i++) { 
              String iduser = student2.get(i).getUserid();
              if (iduser.equals(activeUser.getUserid())) {
          %>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex justify-content-between align-items-center">
              <div class="mr-2" id="img3" style="background-image: url('<%=student2.get(i).getPhoto()%>')"></div>    
              <div class="ml-2">
                <div class="h6 m-0"><a href="<%=request.getContextPath() %>/userprofile.jsp" ><%=student2.get(i).getName()%> <%=student2.get(i).getSurname()%></a></div>  
              </div>
            </div>
          </div>
          <div class="dropdown-divider"></div>
          <%
              } else {
          %>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex justify-content-between align-items-center">
              <div class="mr-2" id="img3" style="background-image: url('<%=student2.get(i).getPhoto()%>')"></div>    
              <div class="ml-2">
                <div class="h6 m-0"><a href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser%>" ><%=student2.get(i).getName()%> <%=student2.get(i).getSurname()%></a></div>  
              </div>
            </div>
          </div>
          <div class="dropdown-divider"></div>
        <%
             }
            } 
        %>
        <%List <Professor> prof2 = (List<Professor>)request.getAttribute("profhomeObj2020"); %>
          <% for( int i = 0; i < prof2.size(); i++) { 
              String iduser2 = prof2.get(i).getUserid();
              if (iduser2.equals(activeUser.getUserid())) {  
          %>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex justify-content-between align-items-center">
              <div class="mr-2" id="img3" style="background-image: url('<%=prof2.get(i).getPhoto()%>')"></div>    
              <div class="ml-2">
                <div class="h6 m-0"><a href="<%=request.getContextPath() %>/userprofile.jsp" ><%=prof2.get(i).getName()%> <%=prof2.get(i).getSurname()%></a></div>  
              </div>
            </div>
          </div>
          <div class="dropdown-divider"></div>
          <%
              } else {
          %>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex justify-content-between align-items-center">
              <div class="mr-2" id="img3" style="background-image: url('<%=prof2.get(i).getPhoto()%>')"></div>    
              <div class="ml-2">
                <div class="h6 m-0"><a href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser2%>" ><%=prof2.get(i).getName()%> <%=prof2.get(i).getSurname()%></a></div>  
              </div>
            </div>
          </div>
          <div class="dropdown-divider"></div>
        <% 
              }
            } 
        %>
  <% if(student2.isEmpty() && prof2.isEmpty()) { %>
    <h5>No user with this surname</h5> 
  <%} %>
  </div>
  </div>
  
  <% } catch(Exception e) {
    
    
  } }%>

    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="card" style="background-color: #9bbad8;">
            <div class="card-body" style="margin-top: 100px;background-color: white;">
              <div class="row">
                <div class="col-lg-4">
                  <div class="border-bottom text-center pb-4">
                    <div class="mb-3">
                      <form action="<%=request.getContextPath() %>/photoController.jsp?url=teamprofile.jsp&idteam=<%=idteam%>" method="POST" enctype="multipart/form-data">              
                        <div class="circle">
                          <img id="img1" src="<%=activeTeam.getImagePath()%>" class="rounded-circle img-responsive bg-white p-1 image" style="width: 150px;height: 150px;"> 
                        </div>
                        <label for="file-input" style="color: #666666;cursor: pointer">
                          <i class="fa fa-camera upload-button"></i>
                        </label>
                        <div class="p-image" >
                           <input class="file-upload" id="file-input" name="photo" type="file" accept="image/*" onchange="this.form.submit()" style="display: none;"/>
                        </div>
                      </form>
                      <h3><%=activeTeam.getName()%></h3>
                      <div class="d-flex align-items-center justify-content-center">
                        <div class="br-wrapper br-theme-css-stars"><select id="profile-rating" name="rating" autocomplete="off" style="display: none;">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          </select><div class="br-widget"><a href="#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"></a><a href="#" data-rating-value="2" data-rating-text="2"></a><a href="#" data-rating-value="3" data-rating-text="3"></a><a href="#" data-rating-value="4" data-rating-text="4"></a><a href="#" data-rating-value="5" data-rating-text="5"></a></div></div>
                        </div>
                      </div>
                    <p class="w-75 mx-auto mb-3"><%=activeTeam.getDescription()%></p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editTeam">Edit profile</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addmodal">
                      Add members
                    </button>
                  </div>
                  <div class="border-bottom py-4">
                    <p>Team members</p>
                    <%
                      List<User> members = teamdao.findMembers(idteam);
                      if (members.size() == 0){
                    %> 
                    <div>
                      <label class="badge badge-outline-dark">None</label>
                    </div> 
                    <%
                      } else {
                    %>        
                    <div>
                      <%
                        for (int i = 0; i < members.size(); i++){
                          String iduser = members.get(i).getUserid();
                          if (activeUser.getUserid().equals(iduser)){
                      %>
                      <label class="badge badge-outline-dark"><a href="<%=request.getContextPath() %>/userprofile.jsp"><%=members.get(i).getName()%> <%=members.get(i).getSurname()%></a></label>
                      <%
                          } else {
                      %>
                      <label class="badge badge-outline-dark"><a href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser%>"><%=members.get(i).getName()%> <%=members.get(i).getSurname()%></a></label>
                      <%
                          }
                        }
                      %>
                    </div> 
                    <%}%>                                              
                  </div>
                  
                </div>
                <div class="col-lg-8">
                  <div class="container-fluid gedf-wrapper">
                    <div class="row">
                      <div class="col-md-12 gedf-main">
                        <div class="card gedf-card"> 
                          <div class="card-header">
                              <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                  <li class="nav-item">
                                      <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make a publication</a>
                                  </li>
                              </ul>
                          </div>
                          <form method="POST" name="frm" action="publicationController.jsp?teamid=<%=idteam%>&url=teamprofile.jsp" enctype="multipart/form-data">
                                <div class="card-body">
                                     <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Share your thoughts</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="message"></textarea>
                                      </div>
                                      <div class="form-group">
                                        <div class="input-group">
                                          <span class="fileUpload btn btn-primary">
                                            <span class="upl" id="upload">Upload File</span>
                                            <input type="file" name="filepath" class="upload up" id="up" onchange="readURL(this);">
                                          </span>
                                          <div class="input-group-btn">
                                            <input type="text" style="background-color:white;" class="form-control" readonly>
                                          </div>
                                        </div>
                                        <script>
                                          $(document).on('change','.up', function(){
                                            var names = [];
                                            var length = $(this).get(0).files.length;
                                              for (var i = 0; i < $(this).get(0).files.length; ++i) {
                                                  names.push($(this).get(0).files[i].name);
                                              }
                                              // $("input[name=file]").val(names);
                                            if(length>2){
                                              var fileName = names.join(', ');
                                              $(this).closest('.form-group').find('.form-control').attr("value",length+" files selected");
                                            }
                                            else{
                                              $(this).closest('.form-group').find('.form-control').attr("value",names);
                                            }
                                        });
                                        </script>
                                        </div>
                                      <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="vision" id="inlineRadio1" value="public">
                                          <label class="form-check-label" for="inlineRadio1"><i class="fa fa-globe"></i> Public</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="vision" id="inlineRadio2" value="student">
                                          <label class="form-check-label" for="inlineRadio2"><i class="fa fa-users"></i> Only Students</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="vision" id="inlineRadio3" value="professor">
                                          <label class="form-check-label" for="inlineRadio3"><i class="fa fa-users"></i> Only Professors</label>
                                      </div>
                                      <div class="form-group">
                                          <button type="submit" name="submit" class="btn btn-primary mb-2">Share</button>
                                      </div>
                                    </div>
                                  </form>
                              
                      </div>
                      <%
                      PublicationDAO pubdao = new PublicationDAO();
                      List<Publication> pubs = pubdao.findPublications(idteam, typeUser, activeUser.getUserid());
                      if (pubs == null){
                      %>
                         <div class="card gedf-card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="mr-2" id="img2" style="background-image: url('images/default-avatar.png')"></div>
                                    <div class="ml-2">
                                        <div class="h6 m-0"><a class="publicationhead" href="#">Wrong</a></div>
                                        <div class="h7 text-muted"></div>
                                    </div>
                                </div>
                            </div>
            
                        </div>
                        <div class="card-body">
                            <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i></div>
                                <h5 class="card-title" style="color: rgb(85, 81, 81);font-size: large;">There are not publications</h5>
            
                        </div>
                        <div class="card-footer"> 
                            <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                            <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                            <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                        </div>
                    </div>
                    <%
                      } else {
                        User publicationUser = null;
                        String componets;
                        String componets2;
                        for (int i = 0; i < pubs.size(); i++){
                          String iduser = pubs.get(i).getIdUser();
                          StudentDAO studentdao = new StudentDAO();
                          ProfessorDAO professordao = new ProfessorDAO();
                          Professor publicationUser2 = professordao.findProfessorID(iduser);
                          Student publicationUser3 = studentdao.findStudentID(iduser);
                          if (publicationUser2 == null) {
                            publicationUser = publicationUser3;
                          } else {
                            publicationUser = publicationUser2;
                          }
                    %>
                    <div class="card gedf-card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="mr-2" id="img3" style="background-image: url('<%=publicationUser.getPhoto()%>')"></div>
                                    <div class="ml-2">
                                        <%
                                          if (!iduser.equals(activeUser.getUserid())){
                                        %>
                                        <div class="h6 m-0"><a class="publicationhead" href="<%=request.getContextPath() %>/profile.jsp?iduser=<%=iduser%>" ><%=publicationUser.getName()%> <%=publicationUser.getSurname()%></a></div>  
                                        <% 
                                          } else {
                                        %>
                                        <div class="h6 m-0"><a class="publicationhead" href="<%=request.getContextPath() %>/userprofile.jsp"><%=publicationUser.getName()%> <%=publicationUser.getSurname()%></a></div>
                                        <%}%>
                                        <div class="h7 text-muted"></div>
                                    </div>
                                </div>
                            </div>
            
                        </div>
                        
                          <%
                          Timestamp current = new Timestamp(System.currentTimeMillis());
                          long milliseconds = current.getTime() - pubs.get(i).getCreationDate().getTime();
                          int seconds = (int) milliseconds / 1000;
                          int hours = seconds / 3600;
                          int minutes = (seconds % 3600) / 60;
                          String timeTab = "";
                          int days = 0;
                          if (hours < 1){
                              timeTab = String.valueOf(minutes) + " minutes ago";
                          } else if (hours < 24) {
                              timeTab = String.valueOf(hours) + " hours ago";
                          } else {
                              days = hours / 24;
                              timeTab = String.valueOf(days) + " days ago";
                          }         
                          %>
                            <%
                                
                                if (pubs.get(i).getContent() != null && pubs.get(i).getUploadFilePath() != null) {
                                  componets = pubs.get(i).getUploadFilePath().substring(pubs.get(i).getUploadFilePath().length()-3,pubs.get(i).getUploadFilePath().length());
                                  componets2 = pubs.get(i).getUploadFilePath().substring(17);
                            %>
                                  <%
                                    if (!(componets.equals("tif") || componets.equals("gif") || componets.equals("jpg") || componets.equals("peg") || componets.equals("png") || componets.equals("TIF") || componets.equals("GIF") || componets.equals("JPG") || componets.equals("PEG") || componets.equals("PNG"))) {
                                  %>    
                                      <div class="card-body">
                                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> <%=timeTab%></div>
                                        <div class="card-text">
                                          <h6><%=pubs.get(i).getContent()%></h6>
                                        </div>
                                        <a href="<%=pubs.get(i).getUploadFilePath()%>" download><i class="fa fa-file-text-o" aria-hidden="true"></i> <%=componets2%></a>
                                      </div>
                                  <%
                                    } else {
                                  %>
                                      <div class="card-body">
                                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> <%=timeTab%></div>
                                        <div class="card-text">
                                          <h6><%=pubs.get(i).getContent()%></h6>
                                        </div>
                                      </div>
                                      <img  class="card-img-top image"  src="<%=pubs.get(i).getUploadFilePath()%>">
                                  <%}%>
                            <%
                                } else if (pubs.get(i).getContent() != null) {    
                            %>
                                   <div class="card-body">
                                    <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> <%=timeTab%></div> 
                                   <div class="card-text" >
                                       <h6><%=pubs.get(i).getContent()%></h6>
                                    </div>
                                   </div>
                            <%
                                } else { 
                                  componets = pubs.get(i).getUploadFilePath().substring(pubs.get(i).getUploadFilePath().length()-3,pubs.get(i).getUploadFilePath().length());
                                  componets2 = pubs.get(i).getUploadFilePath().substring(17);                    
                            %>
                                  <%
                                    if (!(componets.equals("tif") || componets.equals("gif") || componets.equals("jpg") || componets.equals("peg") || componets.equals("png") || componets.equals("TIF") || componets.equals("GIF") || componets.equals("JPG") || componets.equals("PEG") || componets.equals("PNG"))) {
                                  %>    
                                      <div class="card-body">
                                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> <%=timeTab%></div>
                                        <a href="<%=pubs.get(i).getUploadFilePath()%>" download><i class="fa fa-file-text-o" aria-hidden="true"></i> <%=componets2%></a>
                                      </div>
                                  <%
                                    } else {
                                  %>
                                      <div class="card-body">
                                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> <%=timeTab%></div>
                                      </div>
                                      <img  class="card-img-top image"  src="<%=pubs.get(i).getUploadFilePath()%>">
                                  <%}%>                                                                                                   
                            <%
                                }
                            %>
                     
                        <div class="card-footer">
                            <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                            <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                            <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                        </div>
                    </div>
                  
                    <%
                     }
                    }
                    %>
                    </div>  
                    <script>
                      const nav = document.querySelector('#navigation');
                  const navTop = nav.offsetTop;
                  
                  function stickyNavigation() {
                    console.log('navTop = ' + navTop);
                    console.log('scrollY = ' + window.scrollY);
                  
                    if (window.scrollY >= navTop) {
                      // nav offsetHeight = height of nav
                      document.body.style.paddingTop = nav.offsetHeight + 'px';
                      document.body.classList.add('fixed-nav');
                    } else {
                      document.body.style.paddingTop = 0;
                      document.body.classList.remove('fixed-nav');
                    }
                  }
                  
                  window.addEventListener('scroll', stickyNavigation);
                      </script>

                       <script>
                        var modal = document.getElementById('myModal2');
                        var images = document.getElementsByClassName('image');
                        var modalImg = document.getElementById("img01");
                        var captionText = document.getElementById("caption");
                        for (var i = 0; i < images.length; i++) {
                          var img = images[i];
                          img.onclick = function(evt) {
                            modal.style.display = "block";
                            modalImg.src = this.src;
                            captionText.innerHTML = this.alt;
                          }
                        }
                        var span = document.getElementsByClassName("close")[0];
                        span.onclick = function() {
                          modal.style.display = "none";
                        }
                            </script>
                    <%@ include file="scripts.jsp" %>  
    </body> 
    </html>