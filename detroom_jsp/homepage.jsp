<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | Homepage</title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
  </head>
  <body>
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
                        Giannis Nikou
                    </div>
                    <div id="type2">
                        <small>Student</small>
                    </div>        
                    <div class="dropdown-divider"></div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="leftcard h6">My Teams</div>
                            <a id="a2" href="<%=request.getContextPath() %>/Detroom/teamprofile.jsp">Det team</a>
                        </li>
                        <li class="list-group-item">
                          <a href="<%=request.getContextPath() %>/Detroom/userprofile.jsp" id="a1" class="leftcard h6">View Profile</a>
                      </li>    
                    </ul>
                </div>
            </div>

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
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" id="message" rows="3" placeholder="What are you thinking?"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
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
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Only Students</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Only Teachers</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Post /////-->

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2" id="img2" style="background-image: url('../images/miltos.jpg')"></div>
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="#">Miltos Tsichlis</a></div>
                                    <div class="h7 text-muted">Student</div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>10 min ago</div>
                            <h5 class="card-title" style="color: rgb(85, 81, 81);font-size: large;">Help required for algorithms project</h5>

                        <p class="card-text">
                            Whoever is intrested im looking for a partner for the algorithm project.
                        </p>
                    </div>
                    <div class="card-footer"> 
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>
                <!-- Post /////-->


                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2" id="img3" style="background-image: url('../images/dimitris.jpg')"></div>
                                <div class="ml-2">
                                    <div class="h6 m-0"><a class="publicationhead" href="#">Dimitris Vougioukos</a></div>
                                    <div class="h7 text-muted">Student</div>
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

</body>
</html>