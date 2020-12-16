<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | Giannis Nikou</title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
    <link rel="stylesheet" type="text/css" href="../css/teammodal.css">
    <link rel="stylesheet" type="text/css" href="../css/teams.css">
  </head>
    <body>
      <div class="modal fade" id="teammodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header border-bottom-0 text-center">
              <h5 class="modal-title w-100" id="exampleModalLabel">Create Team</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form action="#">
                <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                    <div class="input-group">
                      <input type="search" id="search" name="teammate" placeholder="Choose your teammates" aria-describedby="button-addon1" class="form-control border-0 bg-light">
                      <div class="input-group-append">
                        <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
            </form>
            <form action="#">
                <div class="form-group">
                  <label for="name">Name</label>
                  <input type="text" class="form-control bg-light rounded rounded-pill shadow-sm mb-4" id="name" name="teamname" placeholder="Team name" required>
                </div>
                <div class="form-group">
                  <label for="description1">Description</label><br>
                  <textarea class="form-control bg-light rounded rounded-pill shadow-sm mb-4" name="description" rows="3" id="description1" placeholder="Describe the team"></textarea>
                </div>
                <div class="modal-footer border-top-0 d-flex justify-content-center" >
                  <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <%@ include file="navigationmenu2.jsp" %>
    
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="card" style="background-color: #9bbad8;">
            <div class="card-body" style="margin-top: 100px;background-color: white;">
              <div class="row">
                <div class="col-lg-4">
                  <div class="border-bottom text-center pb-4">
                    <div class="mb-3">
                      <img id="img1" src="https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg" class="rounded-circle img-responsive bg-white p-1">
                      <h3>Giannis Nikou</h3>
                      <div class="d-flex align-items-center justify-content-center">
                        <h5 class="mb-0 mr-2 text-muted">Athens, Greece</h5>
                        <div class="br-wrapper br-theme-css-stars"><select id="profile-rating" name="rating" autocomplete="off" style="display: none;">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          </select><div class="br-widget"><a href="#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"></a><a href="#" data-rating-value="2" data-rating-text="2"></a><a href="#" data-rating-value="3" data-rating-text="3"></a><a href="#" data-rating-value="4" data-rating-text="4"></a><a href="#" data-rating-value="5" data-rating-text="5"></a></div></div>
                        </div>
                      </div>
                    <p class="w-75 mx-auto mb-3">Bio</p>
                    <a href="<%=request.getContextPath() %>/Detroom/edit.jsp" class="btn btn-primary">Edit profile</a>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#teammodal">
                      Create a team
                    </button>  
                  </div>
                  <div class="border-bottom py-4">
                    <p>Favorite Subjects</p>
                    <div>
                      <label class="badge badge-outline-dark"><a href="https://edu.dmst.aueb.gr/enrol/index.php?id=6">Programming II</a></label>
                      <label class="badge badge-outline-dark"><a href="https://edu.dmst.aueb.gr/course/view.php?id=5">Database Management Systems</a></label>
                      <label class="badge badge-outline-dark"><a href="https://edu.dmst.aueb.gr/course/view.php?id=49">Project Management</a></label>
                      <label class="badge badge-outline-dark"><a href="https://edu.dmst.aueb.gr/course/view.php?id=12">Information Systems Implementation and Architecture</a></label>
                      <label class="badge badge-outline-dark"><a href="https://edu.dmst.aueb.gr/course/view.php?id=67">Analysis and Design of Information Systems</a></label>  
                    </div>                                                               
                  </div>
                  <div class="border-bottom py-4">
                    <p>Teams</p>
                    <div>
                      <p class="clearfix">
                        <span class="float-left">
                          DetTeam
                        </span>
                        <span class="float-right text-muted">
                          <a href="<%=request.getContextPath() %>/Detroom/teamprofile.jsp">DetTeam</a>
                        </span>
                      </p>
                    </div>                                                               
                  </div>
                  <div class="py-4">
                    <p class="clearfix">
                      <span class="float-left">
                        Date of birth
                      </span>
                      <span class="float-right text-muted">
                        17/06/2000
                      </span>
                    </p>
                    <p class="clearfix">
                      <span class="float-left">
                        Entry Year
                      </span>
                      <span class="float-right text-muted">
                        2018
                      </span>
                    </p>
                    <p class="clearfix">
                      <span class="float-left">
                        Current Semester
                      </span>
                      <span class="float-right text-muted">
                        5
                      </span>
                    </p>
                    <p class="clearfix">
                      <span class="float-left">
                        Aueb Mail
                      </span>
                      <span class="float-right text-muted">
                        t8180140@aueb.gr
                      </span>
                    </p>
                    <p class="clearfix">
                      <span class="float-left">
                        <i class="fa fa-facebook" aria-hidden="true">acebook</i>
                      </span>
                      <span class="float-right text-muted">
                        <a href="https://www.facebook.com/miltos.tsihlis/">Γιάννης Νίκου</a>
                      </span>
                    </p>
                    <p class="clearfix">
                      <span class="float-left">
                        <i class="fa fa-linkedin" aria-hidden="true">Linkedin</i>
                      </span>
                      <span class="float-right text-muted">
                        <a href="https://www.linkedin.com/in/miltos-tsihlis-9b2261179">Giannis Nikou</a>
                      </span>
                    </p>
                  </div>
                </div>
                <div class="col-lg-8">
                  <div class="container-fluid gedf-wrapper">
                    <div class="row">
                        <div class="col-md-12 gedf-main" style="margin:0">

                            <!--- \\\\\\\Post-->
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
                                            <div class="mr-2" id="img2" style="background-image: url('https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg')"></div>
                                            <div class="ml-2">
                                                <div class="h6 m-0"><a class="publicationhead" href="#">Giannis Nikou</a></div>
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
                                            <div class="mr-2" id="img3" style="background-image: url('https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg')"></div>
                                            <div class="ml-2">
                                                <div class="h6 m-0"><a class="publicationhead" href="#">Giannis Nikou</a></div>
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
                                            <div class="mr-2" id="img4" style="background-image: url('https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg')"></div>
                                            <div class="ml-2">
                                                <div class="h6 m-0"><a class="publicationhead" href="#">Giannis Nikou</a></div>
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
                        <%@ include file="scripts.jsp" %>
    </body> 
    </html>