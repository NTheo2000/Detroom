<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>
<%@ page import="java.lang.Integer"%>

<%
if (session.getAttribute("activeUser") == null) {
    response.sendRedirect("login.jsp");
    return;
}
int idteam = Integer.parseInt(request.getParameter("idteam"));
String iduser = request.getParameter("addmember");
TeamDAO teamdao = new TeamDAO();
try {
    String message = teamdao.addMember(idteam, iduser);
    request.setAttribute("message", message);
    request.setAttribute("id", iduser);
%>
<jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/>
<%
} catch(Exception e){
    request.setAttribute("message", e.getMessage());
    request.setAttribute("id", iduser);
%>
<jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/>
<%}%>