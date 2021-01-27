<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>
<%@ page import ="java.util.List"%>

<%
if (session.getAttribute("activeUser") == null) {
    response.sendRedirect("login.jsp");
    return;
}
String surname = request.getParameter("search");
String url = request.getParameter("url");
try{
    StudentDAO studentdao = new StudentDAO();
    List<Student> student1 = (List<Student>)studentdao.findStudentName(surname);
    request.setAttribute("studenthomeObj2020",student1);
    ProfessorDAO profdao = new ProfessorDAO();
    List<Professor> prof1 = (List<Professor>)profdao.findProfessorName(surname);
    request.setAttribute("profhomeObj2020",prof1);
    if (url.equals("profile.jsp")) {
        url += "?iduser=" + request.getParameter("id");
%>
    <jsp:forward page="<%=url%>"/>
<%
    } else if (url.equals("teamprofile.jsp")) {
        url += "?idteam=" + request.getParameter("id");
%>
    <jsp:forward page="<%=url%>"/>
<%
    } else {
%>
    <jsp:forward page="<%=url%>"/>
<% 
    } 
  } catch(Exception e) { 
%>  
  <jsp:forward page="homepage.jsp"/>
<% } %>