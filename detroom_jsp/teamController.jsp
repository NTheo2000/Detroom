<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>
<%@ page import="java.sql.Timestamp"%>
<% 
if (session.getAttribute("activeUser") == null) {
  response.sendRedirect("login.jsp");
  return;
}
User activeUser = (User) session.getAttribute("activeUser");
String teamname = new String(request.getParameter("teamname").getBytes("ISO-8859-1"), "UTF-8");
String description = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
String info = null;
String info2 = null;
if (teamname.length() < 3){
    info = "Your name should be 3 characters at least.";
}
if (description.length() < 5){
    info2 = "Your team description should be 5 characters at least.";
}
if (info != null && info2 != null){
    request.setAttribute("infor", info);
    request.setAttribute("infor2", info2);
%>
   <jsp:forward page="userprofile.jsp"/> 
<%
} else if (info != null){
    request.setAttribute("infor", info);
%>
<jsp:forward page="userprofile.jsp"/>
<%
} else if (info2 != null){
    request.setAttribute("infor2", info2);
%>
<jsp:forward page="userprofile.jsp"/>
<%
} else {
    try{
        Team team = new Team(teamname, description, "images/default-avatar.png", new Timestamp(System.currentTimeMillis()));
        TeamDAO teamdao = new TeamDAO();
        String message = teamdao.createTeam(team, activeUser.getUserid());
        request.setAttribute("message", message);
    } catch(Exception e){
        request.setAttribute("message", e.getMessage());
    } 
%>
<jsp:forward page="userprofile.jsp"/>
<%}%>


