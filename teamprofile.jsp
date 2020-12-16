<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <title>Detroom | Det Team</title>
    <%@ include file="header1.jsp" %>
    <%@ include file="header2.jsp" %>
    <link rel="stylesheet" type="text/css" href="../css/teams.css">
  <body>
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
                      <img id="img1" src="https://lh3.googleusercontent.com/-JM2xsdjz2Bw/AAAAAAAAAAI/AAAAAAAAAAA/DVECr-jVlk4/photo.jpg" class="rounded-circle img-responsive bg-white p-1"> 
                      <h3>Det Team</h3>
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
                    <p class="w-75 mx-auto mb-3">Bio</p>
                    <a href="<%=request.getContextPath() %>/Detroom/edit.jsp" class="btn btn-primary">Edit profile</a>
                  </div>
                  <div class="border-bottom py-4">
                    <p>Team members</p>
                    <div>
                      <label class="badge badge-outline-dark"><a href="<%=request.getContextPath() %>/Detroom/userprofile.jsp">Miltos Tsichlis</a></label>
                      <label class="badge badge-outline-dark"><a href="<%=request.getContextPath() %>/Detroom/userprofile.jsp">Nikolas Theofanopoulos</a></label>
                      <label class="badge badge-outline-dark"><a href="<%=request.getContextPath() %>/Detroom/userprofile.jsp">Dimitris Vougioukos</a></label>
                    </div>                                                               
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
                  
                    <%@ include file="scripts.jsp" %>  
    </body> 
    </html>