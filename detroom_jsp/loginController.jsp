<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
String auebmail = request.getParameter("auebmail");
String password = request.getParameter("password");

try{
    StudentDAO studentdao = new StudentDAO();
    Student student = studentdao.authenticateStudent(auebmail, password);
    session.setAttribute("activeUser",studentdao.findStudent(auebmail));
    session.setAttribute("userType","Student");

%>
    <jsp:forward page="homepage.jsp"/>
<%
}catch(Exception e){
    try{
        ProfessorDAO professordao = new ProfessorDAO();
        Professor professor = professordao.authenticateProfessor(auebmail, password);
        session.setAttribute("activeUser",professordao.findProfessor(auebmail));
        session.setAttribute("userType","Professor");

%>
    <jsp:forward page="homepage.jsp"/>
<%    
    }catch(Exception e1){
        request.setAttribute("message1", e1.getMessage() );
%>
        <jsp:forward page="login.jsp"/>
<% 
    }
    request.setAttribute("message1", e.getMessage() );
%>
    <jsp:forward page="login.jsp"/>
<% 
    }
%>
