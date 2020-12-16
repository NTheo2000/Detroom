<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ import page="java.util.List"%>
<%@ import page="detroom_java.*"%>


<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | Homepage</title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
  </head>
  <body>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              ...
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
   <% if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
      } else {
        User user = session.getAttribute("user");
   %>

   <%@ include file="navigationmenu2.jsp" %>

   <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div id="card1" class="card text-center" style="width: 21%;">
                    <div id="header1" class="card-header"></div>
                    <div class="mr-2">
                      <img id="img1" src="https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg" class="rounded-circle img-responsive bg-white p-1">
                    </div><br>
                    <div id="name2">
                        <%= user.getName()%> <%=user.getSurname()%>
                    </div>
                    <div id="type2">
                        <%
                          StudentDAO studentdao = new StudentDAO();
                        %>
                        <small><%=studentdao.authenticate(user.getIdUser()) ? "Student" : "Professor"%></small>
                    </div>        
                    <div class="dropdown-divider"></div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="leftcard h6">My Teams</div>
                            <%
                              TeamDao teamdao = new TeamDAO();
                              List<Team> teams = teamdao.findTeams(user.getIdUser());
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
                 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                   <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <%=info%>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                   </div>
                  </div>
                </div>

                <script>
                      $(document).ready(function(){
                      $("#exampleModal").modal("show");
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
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Files</a>
                            </li>
                        </ul>
                    </div>
                    <form action="<%=request.getContextPath() %>/Detroom/publicationController.jsp?idTeam=0" method="POST" enctype="multipart/form-data">
                      <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" name="message" id="message" rows="4" placeholder="What are you thinking?"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" name="filepath" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Upload file</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">Share</button>
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item">
                                        <label for="public" style="cursor: pointer;"><i class="fa fa-globe"></i> Public</label>
                                        <input type="radio" name="vision" id="public" value="public" style="visibility:hidden;" required>
                                    </a>
                                    <a class="dropdown-item">
                                        <label for="student" style="cursor: pointer;"><i class="fa fa-users"></i> Only Students</label>
                                        <input type="radio" name="vision" id="student" value="students" style="visibility:hidden;" required>
                                    </a>
                                    <a class="dropdown-item">
                                        <label for="professor" style="cursor: pointer;"><i class="fa fa-users"></i> Only Professors</label>
                                        <input type="radio" name="vision" id="professor" value="professors" style="visibility:hidden;" required>
                                    </a>
                                </div>
                            </div>
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
                %>
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2" id="img3" style="background-image: url('../images/dimitris.jpg')"></div> <-- using user object form userdao -->
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="#">Dimitris Vougioukos</a></div>  <-- using user object form userdao -->
                                    <div class="h7 text-muted"><%=studentdao.authenticate(pubs.get(i).getIdUser()) ? "Student" : "Teacher" %></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> 13 min ago</div>
                            <h5 class="card-title" style="color: rgb(85, 81, 81);font-size: large;">Missed Mathematics II Lecture</h5>
                        <p class="card-text">
                            Could someone please tell me what part of the curriculum Mr. Mourtos covered today?
                        </p>

                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>

                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2" id="img4" style="background-image: url('../images/nikolas.png')"></div>
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="#">Nikolas Theofanopoulos</a></div>
                                    <div class="h7 text-muted">Student</div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> 40 min ago </div>
                            <h5 class="card-title" style="color: rgb(85, 81, 81);font-size: large;">Lost my economics book</h5>
                        <p class="card-text">
                            I forgot my economics book in A31 yesterday. If you find it, please contact me.                
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>
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