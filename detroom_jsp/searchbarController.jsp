<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="detroom_java.*"%>
<%@ page import ="java.util.List"%>

<%
String idteam = request.getParameter("idteam");
String surname = request.getParameter("search"); 
%>
<% try{
    StudentDAO studentdao = new StudentDAO();
    List<Student> student1 = studentdao.findStudentName(surname);
    session.setAttribute("studentObj",student1);
    ProfessorDAO profdao = new ProfessorDAO();
    List<Professor> prof1 = profdao.findProfessorName(surname);
    session.setAttribute("profObj",prof1); 
%>
    <jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/>
<% } catch(Exception e) { %>
    <jsp:forward page="teamprofile.jsp?idteam=<%=idteam%>"/>
<% } %>
 



