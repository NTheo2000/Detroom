<%@ page import="detroom_java.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
String surname = new String(request.getParameter("surname").getBytes("ISO-8859-1"), "UTF-8");
String auebmail = (String)request.getParameter("auebmail");
String password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");
String confirm_password = new String(request.getParameter("confirm_password").getBytes("ISO-8859-1"), "UTF-8");
String type = (String)request.getParameter("usertype");
String userid = auebmail;
int index = userid.indexOf("@");
userid = userid.substring(0,index);
%>
<%
try{
    if(name.length()<=2){
        throw new Exception("Name is not valid. You must have 3 or more characters");
    }
    if(surname.length()<=2){
        throw new Exception("Surame is not valid. You must have 3 or more characters");
    }
    if (auebmail.length() == 0 ) {
        throw new Exception("No email inserted");
    }
    
    if(!password.equals(confirm_password)){
        throw new Exception("Password and confirm password do not match");
    }
    if(type.equals("Student")){
        Student student = new Student (name,surname,auebmail,password,userid);
        StudentDAO studentdao = new StudentDAO();
        studentdao.registerStudent(student);
        request.setAttribute( "message2", "Registration Completed " + name );
        
    }else if(type.equals("Professor")){
        Professor professor = new Professor(name,surname,auebmail,password,userid);
        ProfessorDAO professordao = new ProfessorDAO();
        professordao.registerProfessor(professor);
        request.setAttribute( "message2", "Registration Completed professor " + surname );

    }else{
        throw new Exception("Registration not completed try again");
    }
%> 
    <jsp:forward page="login.jsp"/><%


}catch(Exception e){
    request.setAttribute( "message", e.getMessage() );
    %>
    <jsp:forward page="login.jsp"/><%

}%>
