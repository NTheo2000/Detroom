<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ import page="java.util.List"%>
<%@ import page="detroom_java.*"%>
<%@ page import="java.sql.Timestamp"%>

<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | Homepage</title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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



    </style>
  </head>
  <body>
   <% if (session.getAttribute("activeUser") == null) {
        response.sendRedirect("login.jsp");
        return;
      } else {
        String typeUser = session.getAttribute("typeUser");
        User activeUser = session.getAttribute("activeUser");
   %>

   <nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark" style="padding-top: 0px;padding-bottom: 0px;position:sticky;top:0;z-index:1;">
    <a class="navbar-brand" href="<%=request.getContextPath() %>/Detroom/homepage.jsp"><img src="https://i.ibb.co/r3C9JQ6/img6.png" alt="img6" height="60cm"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding-left: 60px;">
      <form action="#">
          <div class="p-1 bg-light shadow-sm" style="border-radius: 25px;">
              <div class="input-group">
                <input type="search" style="border-radius: 25px;" name="searchobject" placeholder="Search" style aria-describedby="button-addon1" class="form-control border-0 bg-light">
                <div class="input-group-append">
                  <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
                </div>
              </div>
            </div>
      </form>
      <ul class="navbar-nav mr-auto" id="ul1" style="padding-left: 40px;">
        <li class="<%=request.getRequestURI().replace(request.getContextPath() + "/Detroom/", "").equals("homepage.jsp") ? "nav-item active": "nav-item" %>">
          <a class="nav-link" href="<%=request.getContextPath() %>/Detroom/homepage.jsp">
            <i class="fa fa-home"></i>
            Home
            </a>
        </li>
        <li class="<%=request.getRequestURI().replace(request.getContextPath() + "/Detroom/", "").equals("userprofile.jsp") ? "nav-item active": "nav-item" %>">
          <a class="nav-link" href="<%=request.getContextPath() %>/Detroom/userprofile.jsp">
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
            <img class="rounded-circle" height="35px" src="../<%=activeUser.getPhoto()%>" alt=""> <i class="fa fa-caret-down"></i>
          </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath() %>/Detroom/userprofile.jsp"><i id="i1" class="fa fa-user-circle"></i>My profile</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<%=request.getContextPath() %>/Detroom/logout.jsp"><i id="i3" class="fa fa-sign-out"></i>Log out</a>
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

   <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div id="card1" class="card text-center" style="width: 21%;">
                    <div id="header1" class="card-header"></div>
                    <div class="mr-2">
                      <img id="img1" src="../<%=activeUser.getPhoto()%>" class="rounded-circle img-responsive bg-white p-1">
                    </div><br>
                    <div id="name2">
                        <%= activeUser.getName()%> <%=activeUser.getSurname()%>
                    </div>
                    <div id="type2">
                        <small><%=typeUser%></small>
                    </div>        
                    <div class="dropdown-divider"></div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="leftcard h6">My Teams</div>
                            <%
                              TeamDao teamdao = new TeamDAO();
                              List<Team> teams = teamdao.findTeams(activeUser.getUserid());
                              if (teams = null){
                            %>
                            ---
                            <%
                              } else {
                                  for(int i = 0; i < teams.size(); i++){
                            %>
                            <a id="a2" href="<%=request.getContextPath() %>/Detroom/teamprofile.jsp?team = <%=teams.get(i)%>">teams.get(i).getName()</a>
                            <%
                                  }
                              }
                            %>
                        </li>
                        <li class="list-group-item">
                          <a href="<%=request.getContextPath() %>/Detroom/userprofile.jsp" id="a1" class="leftcard h6">View Profile</a>
                      </li>    
                    </ul>
                </div>
            </div>
            
            <% if (request.getAttribute("info") != null) { 
                String info = (String) request.getAttribute("info");    
           %>
           <div id="myModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
              <div class="modal-content">
                <div class="modal-header">
                  <div class="icon-box">
                    <i class="material-icons">&#xE5CD;</i>
                  </div>				
                  <h4 class="modal-title" style="margin-left: 2.5cm;">Sorry!</h4>	
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
           <%}%>

            <div class="col-md-6 gedf-main">
                <div class="card gedf-card"> 
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make a publication</a>
                            </li>
                        </ul>
                    </div>
                    <form method="POST" name="frm" action="<%=request.getContextPath() %>/Detroom/publicationController.jsp" enctype="multipart/form-data">
                          <div class="card-body">
                               <div class="form-group">
                                  <label for="exampleFormControlTextarea1">Example textarea</label>
                                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" name="message"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Example file input</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="filepath">
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
                                    <label class="form-check-label" for="inlineRadio3"><i class="fa fa-users"></i> Only Students</label>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="submit" class="btn btn-primary mb-2">Share</button>
                                </div>
                              </div>
                            </form>
                        
                </div>
                <!-- Post /////-->
                <%
                  PublicationDAO pubdao = new PublicationDAO();
                  List<Publication> pubs = pubdao.findPublications(0,studentdao.authenticate(user.getIdUser()) ? "student" : "teacher");
                  if (pubs == null){
                %>
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="#">Not found</a></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>10 min ago</div>
                            <h5 class="card-title" style="color: rgb(85, 81, 81);font-size: large;">There is not publication.</h5>
                    </div>
                    <div class="card-footer"> 
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>
                <%
                  } else {
                    for (int i = 0; i < pubs.size(); i++){
                        String iduser = pubs.get(i).getIdUser();
                        StudentDAO studentdao = new StudentDAO();
                        User publicationUser = studentdao.findStudentID(iduser);
                        if (publicationUser == null){
                            ProfessorDAO professordao = new ProfessorDAO();
                            publicationUser = professordao.findProfessorID(idUser);
                            Professor publicationUser1 = (Professor) publicationUser;
                        } else {
                            Student publicationUser1 = (Student) publicationUser;
                        }
                %>
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2" id="img3" style="background-image: url('../<%=publicationUser1.getPhoto()%>')"></div> <-- using user object form userdao -->
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="<%=request.getContextPath() %>/Detroom/userprofile.jsp?userprofile=publicationUser1"><%=publicationUser1.getName()%> <%=publicationUser1.getSurname()%></a></div>  <-- using user object form userdao -->
                                    <div class="h7 text-muted"><%=publicationUser1.getType()%></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
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
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i><%=timeTab%></div>
                        <%
                            if (pubs.get(i).getContent() != null && pubs.get(i).getUploadFilePath() != null) {
                        %>
                                <div class="card-image">
                                    <img src="../<%=pubs.get(i).getUploadFilePath()%>">
                                </div>
                                <div class="card-content">
                                    <%=pubs.get(i).getContent()%>
                                </div>
                        <%
                            } else if (pubs.get(i).getContent() != null) {    
                        %>
                                <div class="card-content">
                                    <%=pubs.get(i).getContent()%>
                                </div>
                        <%
                            } else {                        
                        %>
                                <div class="card-image">
                                    <img src="../<%=pubs.get(i).getUploadFilePath()%>">
                                </div>
                        <%
                            }
                        %>
                    </div>
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
            <div>
             <div class="col-md-3" style="position: fixed;">
                <div id="card2" class="card gedf-card" style="position:sticky;"> 
                    <div class="card-body">
                        <a href="https://www.dept.aueb.gr/el/dmst/news/2%CE%B7-%CE%B8%CE%AD%CF%83%CE%B7-%CF%83%CF%84%CE%BF%CE%BD-hr-case-competition-2020" target="blank" style="color:rgb(85, 81, 81);"><img class="card-img" src="https://www.dept.aueb.gr/sites/default/files/dmst/news-events/DMST-AUEB-HR.png" alt="Card image">
                        <h6 class="card-title rightcards" style="font-size: medium;">Second place on HR Case Competion 2020</h5></a>                       
                    </div>
                </div>
                <div id="card3" class="card gedf-card" style="position: fixed;width: 23%;">
                        <div class="card-body">
                            <a href="https://www.dept.aueb.gr/en/dmst" target="blank" style="color:rgb(85, 81, 81);"><img class="card-img" src="https://www.dept.aueb.gr/schools_department_photos/dmst.png" alt="Card image">
                            <h6 class="card-title rightcards" style="font-size: medium;">Department news</h5></a>                           
                        </div>
                </div>
             </div>
            </div>
        </div>
     </div>

     <%@ include file="scripts.jsp" %>

    <%}%>
</body>
</html>