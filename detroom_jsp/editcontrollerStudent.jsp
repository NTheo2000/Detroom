<%@ page import="detroom_java.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%Student student = (Student)session.getAttribute("activeUser");
String location = new String(request.getParameter("location").getBytes("ISO-8859-1"), "UTF-8");
String birthday = (String)request.getParameter("birthday");
String facebook = (String)request.getParameter("facebook");
String linkedin = (String)request.getParameter("linkedin");
int entry_year;
int semester;
if(request.getParameter("entry_year").isEmpty()){
    entry_year = student.getEntry_year();
}else{
    entry_year = Integer.parseInt(request.getParameter("entry_year"));
}
if(request.getParameter("semester").isEmpty()){
    semester = student.getSemester();
}else{
    semester = Integer.parseInt(request.getParameter("semester"));
}
String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"), "UTF-8");
String mobile = (String)request.getParameter("mobile");
String email = (String)request.getParameter("email");
String password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");
String new_password = new String(request.getParameter("new_password").getBytes("ISO-8859-1"), "UTF-8");
String bio = new String(request.getParameter("bio").getBytes("ISO-8859-1"), "UTF-8");

if(location.length()==0){
    location = student.getLocation();
}
if(birthday.length()==0){
    birthday = student.getDateofbirth();
}
if(facebook.length()==0){
    facebook = student.getFacebook();
}
if(linkedin.length()==0){
    linkedin = student.getLinkedin();
}
if(subject.length()==0){
    subject = student.getFavorite_subject();
}
if(mobile.length()==0){
    mobile = student.getMobile();
}
if(email.length()==0){
    email = student.getEmail();
}
if(new_password.length()==0){
    new_password = student.getPassword();
}
if(bio.length()==0){
    bio = student.getBio();
}
try{
    Student student1= new Student(student.getName(), student.getSurname(), new_password,email,student.getPhoto(),student.getUserid(),student.getAuebmail(), mobile, location,bio,facebook,linkedin,birthday,semester,entry_year,subject);
    StudentDAO studentdao = new StudentDAO();
    studentdao.editStudent(student1);
    session.setAttribute("activeUser",student1);
    %>
    <jsp:forward page="userprofile.jsp"/><%
}catch(Exception e){
    request.setAttribute("message4", e.getMessage() );
    %>
    <jsp:forward page="userprofile.jsp"/><%

}%>

