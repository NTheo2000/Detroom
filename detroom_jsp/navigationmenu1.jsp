<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <a class="navbar-brand" href="<%=request.getContextPath() %>/Detroom/login.jsp">
      <div class="logo-image">
        <img src="https://i.ibb.co/r3C9JQ6/img6.png" alt="img6" height="80cm">
      </div>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath() %>/Detroom/login.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="#" data-toggle="modal" data-target="#centralModalInfo">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="https://www.aueb.gr/" target="blank">AUEB</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath() %>/Detroom/creators.jsp">Creators</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            What ΔΕΤ is?
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="https://www.dept.aueb.gr/el/dmst-overview" target="blank" style=" background: none;color:#2f8deb;font-weight: 500;">A look</a>
            <a class="dropdown-item" href="https://www.dept.aueb.gr/el/dmst_dep" target="blank" style=" background: none;color:#2f8deb;font-weight: 500;">Teachers</a>
            <a class="dropdown-item" href="https://www.dept.aueb.gr/el/contacts-dmst" target="blank" style=" background: none;color:#2f8deb;font-weight: 500;">Communication</a>
          </div>
        </li>
      </ul>
    </div>
