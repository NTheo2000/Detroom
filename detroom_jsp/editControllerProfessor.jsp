<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%Professor professor = (Professor)session.getAttribute("activeUser");
String location = new String(request.getParameter("location").getBytes("ISO-8859-1"), "UTF-8");
String birthday = (String)request.getParameter("birthday");
String facebook = (String)request.getParameter("facebook");
String linkedin = (String)request.getParameter("linkedin");
String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"), "UTF-8");
String mobile = (String)request.getParameter("mobile");
String email = (String)request.getParameter("email");
String password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");
String new_password = new String(request.getParameter("new_password").getBytes("ISO-8859-1"), "UTF-8");
String bio = new String(request.getParameter("bio").getBytes("ISO-8859-1"), "UTF-8");


if(request.getParameter("location").isEmpty()){
    location = professor.getLocation();
}
if(request.getParameter("birthday").isEmpty()){
    birthday = professor.getDateofbirth();
}
if(request.getParameter("facebook").isEmpty()){
    facebook = professor.getFacebook();
}
if(request.getParameter("linkedin").isEmpty()){
    linkedin = professor.getLinkedin();
}
if(request.getParameter("subject").isEmpty()){
    subject = professor.getSubject();
}
if(request.getParameter("mobile").isEmpty()){
    mobile = professor.getMobile();
}
if(request.getParameter("email").isEmpty()){
    email = professor.getEmail();
}
if(request.getParameter("new_password").isEmpty()){
    new_password = professor.getPassword();
}
if(request.getParameter("bio").isEmpty()){
    bio = professor.getBio();
}
try{
    Professor professor1 = new Professor(professor.getName(), professor.getSurname(), new_password,email, professor.getPhoto(),professor.getUserid(),professor.getAuebmail(), mobile, location,bio,facebook,linkedin,birthday,subject);
    ProfessorDAO professordao = new ProfessorDAO();
    professordao.editProfessor(professor1);
    session.setAttribute("activeUser",professor1);
        %>
    <jsp:forward page="userprofile.jsp"/><%
}catch(Exception e){
    request.setAttribute( "message5", e.getMessage() );
    %>
    <jsp:forward page="userprofile.jsp"/><%

}%>


