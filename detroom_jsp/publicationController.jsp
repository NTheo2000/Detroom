<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ import page="detroom_java.*"%>
<%@ import page="java.util.*"%>
<%@ import page="java.io.*"%>


<% 
  if (session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
  }
  User user = (User) session.getAttribute("user");
  int idTeam = Integer.parseInt(request.getParameter("idTeam"));
  String message = request.getParameter("message");
  String filepath = request.getParameter("filepath");
  String vision = request.getParameter("vision");
  if (message.equals("") && filepath.equals("")) {
      request.setAttribute(info,"You did not post anything!");
%>
<jsp:forward page="homepage.jsp"/>
<% 
  } else {
      if (vision == null) {
          request.setAttribute(info,"You have to select the vision of your publication!");
%>
<jsp:forward page="homepage.jsp"/>          
<%
      }
  }
%>
<%
  Calendar cal = new Calendar();
  Date current = cal.getTime();
  long time = current.getTime();
  if (message.length() > 0 && filepath.length() > 0){
      File file = new File(filepath);
      InputStrean stream = new FileInputStream(file);
      Publication pub = new Publication("me",idTeam,message,stream,new Timestamp(time),0,vision);
  } else (message.length() > 0){
    Publication pub = new Publication("me",idTeam,message,null,new Timestamp(time),0,vision);
  } else{
    File file = new File(filepath);
    InputStrean stream = new FileInputStream(file);
    Publication pub = new Publication("me",idTeam,null,stream,new Timestamp(time),0,vision);
  }
  try{
    PublicationDAO pubdao = new PublicationDAO();
    pubdao.post(pub);
  } catch(Exception e){
    request.setAttribute(info,e.getMessage());
%>
<jsp:forward page="homepage.jsp"/>

<%
  }
%>






