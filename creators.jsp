<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <%@ include file="header1.jsp"%>  
    <title>Creators</title>
    <link rel="stylesheet" href="../css/creators.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body style=" background-image: url('../images/opa2.jpg');">
    
    <%@ include file="aboutmodal.jsp" %>

  <nav class="navbar navbar-expand-lg">
    <%@ include file="navigationmenu1.jsp" %>
  </nav>
  
  <div class="col-xs-1" align="center"> 
    <div class="card op-card5 mb-5 text-center w-50" >
      <div class="card-body">
        <div class="media">
          <div class="media-left">
            <a href="#">
              <img class="img1 img-lg rounded-circle mb-3 thumbnail" src="../images/dimitris.jpg" width="200" height="150">
            </a>
          </div>
          <div class="media-body">
            <h3 class="media-heading">Δημήτρης Βουγιούκος</h3>
            <h5><span class="glyphicon glyphicon-envelope"></span>t8180014@aueb.gr</h5>
          </div>
        </div>
        <div class="media">
          <div class="media-left"> 
            <a href="#">
              <img class="img1 img-lg rounded-circle mb-3 thumbnail" src="../images/miltos.jpg" width="200" height="150">
            </a>
          </div>
          <div class="media-body">
            <h3 class="media-heading">Μίλτος Τσιχλής</h3>
            <h5><span class="glyphicon glyphicon-envelope"></span>t8180140@aueb.gr</h5>
          </div>
        </div>
        <div class="media">
          <div class="media-left">
            <a href="#">
              <img class="img1 img-lg rounded-circle mb-3 thumbnail" src="../images/nikolas.png"
              width="200" height="150">
            </a>
          </div>
          <div class="media-body">
            <h3 class="media-heading">Νικόλαος Θεοφανόπουλος</h3>
            <h5><span class="glyphicon glyphicon-envelope"></span> t8180027@aueb.gr</h5>
          </div>
        </div> 
        </div>
        </div>
        </div>
        <%@ include file="scripts.jsp" %>
        </body>
        </html> 