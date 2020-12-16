<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
            <img class="rounded-circle" height="35px" src="https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg" alt=""> <i class="fa fa-caret-down"></i>
          </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath() %>/Detroom/userprofile.jsp"><i id="i1" class="fa fa-user-circle"></i>My profile</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<%=request.getContextPath() %>/Detroom/login.jsp"><i id="i3" class="fa fa-sign-out"></i>Log out</a>
            </div>
        </li>
        <li class="nav-item">
          <div class="ml-3">
              <div id="name1">
                  Giannis Nikou
              </div>
              <div id="type1">
                  <small>Student</small>
              </div>
          </div>
        </li>
      </ul>
    </div>
</nav>