<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
String description = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
int teamid = Integer.parseInt((String)request.getParameter("idteam"));

try{
    TeamDAO teamdao = new TeamDAO();
    Team team1 = teamdao.findTeam(teamid);
    if(name.length()==0){
        name = team1.getName();
    }
    if(description.length()==0){
        description = team1.getDescription();
    }
    Team team = new Team(team1.getIdTeam(),name,description,team1.getImagePath(),team1.getCreationDate());
    teamdao.editTeam(team);
    %>
    <jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/><%
}catch(Exception e){
    request.setAttribute( "message7", e.getMessage() );
    %>
    <jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/><%

}%>